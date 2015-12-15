#ifndef __clap_in_h__
#define __clap_in_h__

//#include <stdc-predef.h>
#include <stdio.h>
#include <pthread.h>
#include <alsa/asoundlib.h>


#include "clap.h"
#include "kiss_fft/kiss_fft.h"

/* SAMPLE_CNT must be divisible by SUBBANDS_CNT */
#define SAMPLE_CNT		1024
#define SUBBANDS_CNT		32
#define SUBBANDS_FOR_CLAP	20

/* CHUNK_CNT must be power of 2 because modulo operation
 * is carried out using bitwise addition */
#define CHUNK_CNT		8
#define FREQ			44100

#define EN_BUFFER(ccfg, subband, chunk)	*((ccfg)->en_buffer + (chunk)*(ccfg)->subband_cnt + (subband))

typedef void (*process_func_t)(struct clap_cfg*);
typedef uint32_t amp_t;



struct clap_cfg {
	pthread_t thread;
	/* flag instructing thread to exit - must be volatile */
	volatile int exiting;
	int sample_cnt;
	/* must be power of 2 */
	int chunk_cnt;
	int subband_size;
	int subband_cnt;
	int curr_chunk;
	uint32_t processed_cnt;
	process_func_t process_func;
	clap_func_t clap_func;
	kiss_fft_cfg kiss_cfg;
	kiss_fft_cpx *out_fft_buffer;
	kiss_fft_cpx *in_fft_buffer;
	int16_t *sample_buffer;
	amp_t *en_buffer;
	amp_t *avg_en_buffer;
	int sens;
	snd_pcm_t *scard_handle;
};


static void process_normal_mode(struct clap_cfg *cfg);
static void process_gather_mode(struct clap_cfg *cfg);

#endif