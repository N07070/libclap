#ifndef __clap_h__
#define __clap_h__

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

struct clap_cfg;

typedef void (*clap_func_t)();

struct clap_cfg *clap_init(char *s_card, void (*__clap_func)(void), int __sens);
void clap_free(struct clap_cfg *cfg);

#ifdef __cplusplus
}
#endif

#endif