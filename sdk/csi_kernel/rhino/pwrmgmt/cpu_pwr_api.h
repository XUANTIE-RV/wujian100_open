/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
modification history
--------------------
14jan2018, init vesion
*/

/*
DESCRIPTION
This file provides APIs for management CPU power.
*/

#ifndef __cpu_pwr_api_h__
#define __cpu_pwr_api_h__

#ifdef __cplusplus
extern "C" {
#endif

#include "k_api.h"
#include "cpu_pwr_hal_lib.h"

/*
 * CPU power management operates in one of three possible modes:
 *
 * CPU_IDLE_MODE_RUN:
 * In this CPU mode of operation, idle CPU power management is disabled.
 *
 * CPU_IDLE_MODE_SLEEP:
 * the CPUs sleep when idle, but system clock interupts wakes up the CPU
 * at every tick.
 *
 * CPU_IDLE_MODE_TICKLESS: CPUs sleep when idle, potentially for multiple
 * ticks at a time.
 */

typedef enum cpu_idle_mode
    {
    CPU_IDLE_MODE_RUN       = 0,
    CPU_IDLE_MODE_SLEEP     = 1,
    CPU_IDLE_MODE_TICKLESS  = 2    
    } CPU_IDLE_MODE;

#if RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT
extern kstat_t cpu_pwr_p_state_set (uint32_t cpuIndex, cpu_pstate_t  cpuPState);
extern kstat_t cpu_pwr_p_state_get (uint32_t cpuIndex, cpu_pstate_t * pCpuPState);
extern kstat_t cpu_pwr_p_state_capability_get (uint32_t cpuIndex, uint32_t * pSupportBitsetP);
#endif /* RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT */

extern kstat_t cpu_pwr_c_state_set (cpu_cstate_t);
extern kstat_t cpu_pwr_c_state_get (uint32_t cpuIndex, cpu_cstate_t * pCpuCState);
extern kstat_t cpu_pwr_c_state_capability_get (uint32_t cpuIndex, uint32_t * pSupportBitsetC);

extern kstat_t cpu_pwr_idle_mode_set (CPU_IDLE_MODE mode);
extern kstat_t cpu_pwr_idle_mode_get (CPU_IDLE_MODE * pMode);

#if RHINO_CONFIG_CPU_TICKLESS
extern kstat_t tickless_task_ignore (ktask_t * p_tcb);
#endif

#ifdef __cplusplus
}
#endif

#endif /* __cpu_pwr_api_h__ */

