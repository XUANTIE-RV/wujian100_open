/* cpu_pwr_lib.c - CPU power manager common library */

/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
modification history
--------------------
14jan2018, init vesion
*/

#ifndef __cpu_pwr_lib_h__
#define __cpu_pwr_lib_h__

#ifdef __cplusplus
extern "C" {
#endif

#include "k_api.h"
#include "k_cpuset.h"
#include "pwr_state.h"
#include "dl_list.h"

#ifndef container_of
#define container_of(ptr, type, member) \
        ((type *)((char *)(ptr) - offsetof(type,member)))
#endif /* container_of */

/* Maximum number of CPUs */

#ifdef RHINO_CONFIG_SMP
#define CPUS_NUM_MAX     4
#else
#define CPUS_NUM_MAX     1
#endif /* RHINO_CONFIG_SMP */

extern void   cpu_pwrmgmt_init(void);
extern void   cpu_pwr_down (void);
extern void   cpu_pwr_up (void);
extern void    cpu_pwr_enabled (int enabled);

#if RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT
extern void (*_func_cpu_pwr_idle_enter_hook) (void);
extern void (*_func_cpu_pwr_int_enter_hook)  (void);
extern void (*_func_cpu_pwr_int_exit_hook)  (void);
#endif /* RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT */

extern void   (*_func_cpu_tickless_up) (void);
extern void   (*_func_cpu_tickless_down) (void);
extern kstat_t (*_func_tickless_ignore_list_add) (klist_t *p_tick_node);

#ifdef __cplusplus
}
#endif

#endif /* __cpu_pwr_lib_h__ */
