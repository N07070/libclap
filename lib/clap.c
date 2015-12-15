#include "clap_in.h"

static void exit_alsa();
static void cl_print(const char *msg, ...);
static void cl_process(struct clap_cfg *cfg);
static void *thread_func(void *ptr);
static int init_alsa(struct clap_cfg *cfg, char *s_card);

void clap_free(struct clap_cfg *cfg)
{
	if (cfg == NULL)
		return;
	
	cfg->exiting = 1;
	pthread_join(cfg->thread, NULL);
	
	exit_alsa(cfg);
	
	free(cfg->out_fft_buffer);
	free(cfg->en_buffer);
	free(cfg->avg_en_buffer);
	free(cfg->sample_buffer);
	free(cfg->in_fft_buffer);
	
	if (cfg->kiss_cfg != NULL)
		kiss_fft_free(cfg->kiss_cfg);
	
	free(cfg);
}

struct clap_cfg *clap_init(char *s_card, clap_func_t __clap_func, int __sens)
{
	struct clap_cfg *cfg = malloc(sizeof(struct clap_cfg));
	if (cfg == NULL)
		goto fail;
	
	/* init/free logic requires whole struct to be zeroed to work properly */
	memset(cfg, 0, sizeof(struct clap_cfg));
	
	/* important flag so set it explicitly just in case */
	cfg->exiting = 0;
	
	/* storing capture params in struct fields,
	 * more efficient way would be using macros across
	 * whole code but this way allows lib to be rearranged
	 * easily, e.g. when changing its interface */
	cfg->sample_cnt = SAMPLE_CNT;
	cfg->chunk_cnt = CHUNK_CNT;
	cfg->subband_cnt = SUBBANDS_CNT;
	cfg->subband_size = cfg->sample_cnt / cfg->subband_cnt;
	cfg->clap_func = __clap_func;
	cfg->process_func = process_gather_mode;
	cfg->processed_cnt = 0;
	
	if (__sens <= 0)
		goto fail;
	cfg->sens = __sens;
	
	cfg->out_fft_buffer = malloc(cfg->sample_cnt * sizeof(kiss_fft_cpx));
	if (cfg->out_fft_buffer == NULL)
		goto fail;
	
	cfg->en_buffer = malloc(cfg->chunk_cnt * cfg->subband_cnt * sizeof(amp_t));
	if (cfg->en_buffer == NULL)
		goto fail;
	
	cfg->avg_en_buffer = malloc(cfg->subband_cnt * sizeof(amp_t));
	if (cfg->avg_en_buffer == NULL)
		goto fail;
	
	cfg->in_fft_buffer = malloc(cfg->sample_cnt * sizeof(kiss_fft_cpx));
	if (cfg->in_fft_buffer == NULL)
		goto fail;
	memset(cfg->in_fft_buffer, 0, cfg->sample_cnt * sizeof(kiss_fft_cpx));
	
	cfg->sample_buffer = malloc(cfg->sample_cnt * sizeof(int16_t));
	if (cfg->sample_buffer == NULL)
		goto fail;
	
	cfg->kiss_cfg = kiss_fft_alloc(cfg->sample_cnt, 0, NULL, NULL);
	if (cfg->kiss_cfg == NULL)
		goto fail;
	
	if (init_alsa(cfg, s_card) < 0) 
		goto fail;
	
	/* running thread */
	if (pthread_create(&cfg->thread, NULL, thread_func, (void*)cfg) != 0) {
		cl_print("could not create thread");
		goto fail;
	}
	
	return cfg;
fail:
	clap_free(cfg);
	
	return NULL;
}

static int init_alsa(struct clap_cfg *cfg, char *s_card)
{
	int err;
	snd_pcm_hw_params_t *hw_params = NULL;
	
	if ((err = snd_pcm_open(&cfg->scard_handle, s_card, SND_PCM_STREAM_CAPTURE, 0)) < 0) {
		cl_print("cannot open audio device %s (%s)", 
			 s_card,
			 snd_strerror(err));
		goto fail;
	}
		   
	if ((err = snd_pcm_hw_params_malloc(&hw_params)) < 0) {
		cl_print("cannot allocate hardware parameter structure (%s)",
			 snd_strerror(err));
		goto fail;
	}
				 
	if ((err = snd_pcm_hw_params_any(cfg->scard_handle, hw_params)) < 0) {
		cl_print("cannot initialize hardware parameter structure (%s)",
			 snd_strerror(err));
		goto fail;
	}
	
	if ((err = snd_pcm_hw_params_set_access(cfg->scard_handle, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {
		cl_print("cannot set access type (%s)",
			 snd_strerror(err));
		goto fail;
	}
	
	if ((err = snd_pcm_hw_params_set_format(cfg->scard_handle, hw_params, SND_PCM_FORMAT_S16_LE)) < 0) {
		cl_print("cannot set sample format (%s)",
			 snd_strerror(err));
		goto fail;
	}
	
	unsigned int tmp_fq = FREQ;
	if ((err = snd_pcm_hw_params_set_rate_near(cfg->scard_handle, hw_params, &tmp_fq, 0)) < 0) {
		cl_print("cannot set sample rate (%s)",
			 snd_strerror(err));
		goto fail;
	}
	if (tmp_fq != FREQ) {
		cl_print("correct sampling frequency could not be set, wanted %u, got %u", FREQ, tmp_fq);
		goto fail;
	}
	
	if ((err = snd_pcm_hw_params_set_channels(cfg->scard_handle, hw_params, 1)) < 0) {
		cl_print("cannot set channel count (%s)",
			 snd_strerror(err));
		goto fail;
	}

	if ((err = snd_pcm_hw_params(cfg->scard_handle, hw_params)) < 0) {
		cl_print("cannot set parameters (%s)",
			 snd_strerror(err));
		goto fail;
	}

	if ((err = snd_pcm_prepare(cfg->scard_handle)) < 0) {
		cl_print("cannot prepare audio interface for use (%s)",
			 snd_strerror(err));
		goto fail;
	}
	
	snd_pcm_hw_params_free(hw_params);
	
	return 0;
	
fail:
	snd_pcm_hw_params_free(hw_params);
	return -1;
}

void exit_alsa(struct clap_cfg *cfg)
{
	if (cfg->scard_handle)
		snd_pcm_close(cfg->scard_handle);
}

static void *thread_func(void *ptr)
{
	struct clap_cfg *cfg = (struct clap_cfg*)ptr;
	int err, i;
	
	while (!cfg->exiting) {
		if ((err = snd_pcm_readi(cfg->scard_handle, cfg->sample_buffer, cfg->sample_cnt)) != cfg->sample_cnt) {
			cl_print("read from audio interface failed (%s)",
				 snd_strerror(err));
			goto exit;
		}
		
		for (i = 0; i < cfg->sample_cnt; i++)
			cfg->in_fft_buffer[i].r = cfg->sample_buffer[i];
		
		cl_process(cfg);
	}
	
exit:
	pthread_exit(NULL);
}

static void cl_print(const char *msg, ...)
{
	char fmt[256];
	va_list arglist;

	va_start(arglist, msg);
	
	sprintf(fmt, "clap: %s\n", msg);
	vfprintf(stdout, fmt, arglist);

	va_end(arglist);
}

static void calc_subbands_energy(struct clap_cfg *cfg)
{
	int i, j, offset;
	amp_t *dest_buffer = cfg->en_buffer + cfg->curr_chunk * cfg->subband_cnt;
	
	
	for (i = 0; i < cfg->subband_cnt; i++) {
		dest_buffer[i] = 0;
		offset = cfg->subband_size * i;
		for (j = 0; j < cfg->subband_size; j++) {
			EN_BUFFER(cfg, i, cfg->curr_chunk) += (amp_t)cfg->out_fft_buffer[offset + j].r * (amp_t)cfg->out_fft_buffer[offset + j].r + (amp_t)cfg->out_fft_buffer[offset + j].i * (amp_t)cfg->out_fft_buffer[offset + j].i;
		}

		dest_buffer[i] *= cfg->subband_cnt;
		dest_buffer[i] /= cfg->sample_cnt;
		/* down scaling */
		dest_buffer[i] /= 2;
	}
	
	
	cfg->curr_chunk = (++cfg->curr_chunk) & (cfg->chunk_cnt - 1);
}

static void calc_avg_energy(struct clap_cfg *cfg)
{
	int i, j;
	for (i = 0; i < cfg->subband_cnt; i++) {
		cfg->avg_en_buffer[i] = 0;
		for (j = 0; j < cfg->chunk_cnt; j++) {
			//cfg->avg_en_buffer[i] += cfg->en_buffer[i + j * cfg->subband_cnt];
			cfg->avg_en_buffer[i] += EN_BUFFER(cfg, i, j);
		}
		
		cfg->avg_en_buffer[i] /= cfg->chunk_cnt;
	}
}

static void process_normal_mode(struct clap_cfg *cfg)
{
	calc_avg_energy(cfg);
	
	/* Saving curr_chunk counter before it is altered by
	 * calc_subbands_energy function */
	int chunk_saved = cfg->curr_chunk;
	calc_subbands_energy(cfg);
	
	//amp_t *newest_chunk = cfg->en_buffer + cfg->subband_cnt * chunk_saved;
	int i;
	int b_cnt = 0;

	for (i = 0; i < cfg->subband_cnt; i++)
		if (cfg->sens * cfg->avg_en_buffer[i] < EN_BUFFER(cfg, i, chunk_saved)) {
			//printf("beat found on subband %i\n", i);
			b_cnt++;
		}
	
	if (b_cnt >= SUBBANDS_FOR_CLAP) {
		cfg->clap_func();
	}
}

static void process_gather_mode(struct clap_cfg *cfg)
{
	calc_subbands_energy(cfg);
	
	/* calc_subbands_energy function increases curr_chunk counter 
	 * modulo chunk_cnt. Counter wraparound indicates that all chunks
	 * in the first pass have already been gathered */
	if (cfg->curr_chunk == 0) {
		cfg->process_func = process_normal_mode;
	}
}

static void cl_process(struct clap_cfg *cfg)
{
	kiss_fft(cfg->kiss_cfg, cfg->in_fft_buffer, cfg->out_fft_buffer);
	
	(cfg->process_func)(cfg);
	cfg->processed_cnt++;
}
