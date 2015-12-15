#include "loc_time.h"

static msec_t start_time;

static msec_t get_monotonic_time() {
	struct timespec time_var;
	msec_t ret;

	clock_gettime(CLOCK_MONOTONIC, &time_var);
	ret = time_var.tv_sec * 1000 + time_var.tv_nsec / (1000 * 1000);
	return ret;
}

msec_t get_program_time()
{
	return get_monotonic_time() - start_time;
}

void init_time()
{
	start_time = get_monotonic_time();
}