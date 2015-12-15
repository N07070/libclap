#ifndef __loc_time_h__
#define __loc_time_h__

//#include <stdc-predef.h>
#include <stdint.h>
#include <time.h>

typedef uint64_t msec_t;

void init_time();
msec_t get_program_time();

#endif