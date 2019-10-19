/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
modification history
--------------------
14jan2018, init vesion
*/

#ifndef __cpu_tickless_h__
#define __cpu_tickless_h__

#ifdef __cplusplus
extern "C" {
#endif

#include "k_api.h"
#include "pwr_state.h"

typedef kstat_t (*FUNC_ONE_SHOT_INIT) (void);
typedef uint32_t (*FUNC_ONE_SHOT_SECONDS_MAX) (void);
typedef kstat_t (*FUNC_ONE_SHOT_START) (uint64_t  planUse);
typedef kstat_t (*FUNC_ONE_SHOT_STOP) (uint64_t * pPassedUs);

typedef struct
    {
    FUNC_ONE_SHOT_INIT          one_shot_init;
    FUNC_ONE_SHOT_SECONDS_MAX   one_shot_seconds_max;
    FUNC_ONE_SHOT_START         one_shot_start;
    FUNC_ONE_SHOT_STOP          one_shot_stop;
}one_shot_timer_t;

extern kstat_t tickless_init (void);
extern void    tickless_c_states_add(uint32_t c_state_set);
extern void    tickless_one_shot_timer_save
                    (cpu_cstate_t c_state, one_shot_timer_t * p_timer);


#ifdef __cplusplus
}
#endif

#endif /* __cpu_tickless_h__ */

