
//#include <stdc-predef.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>

#include <wiringPi.h>
#include <clap.h>

#include "loc_time.h"

#define MAX_CLAP_INTV		700
#define MIN_CLAP_INTV		200
#define ACTION_CLAP_CNT		2
#define DEFAULT_SENS		10


/* variable used in signal handler, must be volatile */ 
volatile int exiting = 0;
int pin_num = 0;

void sig_handler(int sig)
{
	exiting = 1;
}

int init_wirepi()
{
	if (wiringPiSetup() == -1)
		goto fail;
	
	pinMode(pin_num, OUTPUT);
	/* set pin to low at very beginning */
	digitalWrite(pin_num, 0);
	
	return 0;
fail:
	return -1;
}

void process_clap()
{
	static int clap_cnt = 0;
	static msec_t last_clap_time = 0;
	
	/* init_wirepi function sets physical pin state to 0
	 * at the very beginning. Following initialization
	 * reflects that */
	static int pin_state = 0;
	
	
	printf("CLAP\n");
	msec_t now = get_program_time();
	msec_t intv = now - last_clap_time;
	
	if (MIN_CLAP_INTV < intv && intv < MAX_CLAP_INTV) {
		clap_cnt++;
		if (clap_cnt == ACTION_CLAP_CNT) {
			digitalWrite(pin_num, pin_state = (~pin_state) & 1);
		}
	} else {
		clap_cnt = 1;
	}
	
	last_clap_time = now;
}

void print_usage()
{
	fprintf(stderr, "Usage:\n" "pinclap -d <device> -p <pin nubmer> [-s <sensitivity>]\n");
}

int main(int argc, char *argv[])
{	
	struct clap_cfg *ccfg = NULL;
	struct sigaction sig_a;
	sigset_t mask;
	sigset_t o_mask;
	char *s_card = NULL;
	int sens = 0;
	int option;
	
	/* parsing command line options */
	while ((option = getopt(argc, argv,"d:s:p:")) != -1) {
		switch (option) {
		case 'd' : s_card = optarg;
			break;
		case 's' : sens = atoi(optarg); 
			break;
		case 'p' : pin_num = atoi(optarg); 
			break;
		default:
			print_usage();
			goto exit;
		}
	}

	if (s_card == NULL) {
		print_usage();
		goto exit;
	}
	
	if (pin_num == 0) {
		print_usage();
		goto exit;
	}
	
	if (sens == 0) {
		fprintf(stderr, "no or incorrect sensitivity value specified, default taken: %i\n", DEFAULT_SENS);
		sens = DEFAULT_SENS;
	}
	
	
	/* SININT and SIGTERM will cause application to exit */
	memset(&sig_a, 0, sizeof(sig_a));
	sig_a.sa_handler = sig_handler;
	if (sigaction(SIGINT, &sig_a, NULL) != 0) {
		fprintf(stderr, "could not set signal handler\n");
		goto exit;
	}
	if (sigaction(SIGTERM, &sig_a, NULL) != 0) {
		fprintf(stderr, "could not set signal handler\n");
		goto exit;
	}

	/* signals must be blocked to prevent race-conditions */
	sigemptyset(&mask);
	sigaddset(&mask, SIGTERM);
	sigaddset(&mask, SIGINT);
	if (sigprocmask(SIG_BLOCK, &mask, &o_mask) < 0) {
		fprintf(stderr, "could not set signal mask\n");
		goto exit;
	}
	
	init_time();
	
	if (init_wirepi() < 0) {
		fprintf(stderr, "could not init wirepi library\n");
		goto exit;
	}
	

	ccfg = clap_init(s_card, process_clap, sens);
	if (ccfg == NULL) {
		fprintf(stderr, "could not init clap module\n");
		goto exit;
	}
	
	while (!exiting) {
		sigsuspend(&o_mask);
	}
	
	printf("\nterminating...\n");
	
exit:
	clap_free(ccfg);
	exit(0);
}