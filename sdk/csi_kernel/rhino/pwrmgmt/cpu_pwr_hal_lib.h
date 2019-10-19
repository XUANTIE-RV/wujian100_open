/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
modification history
--------------------
14jan2018, init vesion
*/

#ifndef __cpu_pwr_hal_lib_h__
#define __cpu_pwr_hal_lib_h__

#ifdef __cplusplus
extern "C" {
#endif

#include "k_cpuset.h"
#include "pwr_state.h"
#include "dl_list.h"
#include "k_err.h"

/* defines */

#define CPU_PWR_TOPO_LEVEL_ROOT 0
#define CPU_PWR_TOPO_LEVEL_1    1
#define CPU_PWR_TOPO_LEVEL_2    2
#define CPU_PWR_TOPO_LEVEL_3    3
#define CPU_PWR_TOPO_LEVEL_4    4
#define CPU_PWR_TOPO_LEVEL_5    5

#define CPU_PWR_NODE_NAME_LEN   64
#define CPU_PWR_ROOT_NODE_NAME  "cpu_pwr_root"

#define CPU_STATE_BIT(n)        (1 << (n))
#define CPU_FREQ_UNKNOW         (-1)
#define CPU_VOLT_UNKNOW         (-1)
#define CPU_LATENCY_UNKNOW      (-1)

typedef struct
    {
    uint32_t  state;
    uint32_t  value;
    } state_val_pair_t;

struct cpu_pwr;

typedef kstat_t (*FUNC_CPU_PSTATE_SET) (struct cpu_pwr * p_cpu_node, uint32_t cpu_state);
typedef kstat_t (*FUNC_CPU_CSTATE_SET) (uint32_t cpu_state, int master);
typedef kstat_t (*FUNC_CPU_STATE_GET)  (struct cpu_pwr * p_cpu_node, uint32_t * pCpuState);

typedef struct cpu_pwr
    {
    uint32_t            supportBitsetC;
    int                 stateNumC;
    state_val_pair_t  * pPairLatency;
    atomic_val_t        stateUpdatingC; 
    cpu_cstate_t        currentCState;
    cpu_cstate_t        desireCState;
    FUNC_CPU_CSTATE_SET cpuCStateSetFunc;

#if RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT
    uint32_t            supportBitsetP;
    int                 stateNumP;
    state_val_pair_t  * pPairFreq;
    state_val_pair_t  * pPairVolt;
    atomic_val_t        stateUpdatingP;
    cpu_pstate_t        currentPState;
    cpu_pstate_t        desirePState;
    FUNC_CPU_PSTATE_SET cpuPStateSetFunc;

#endif /* RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT */

#ifdef RHINO_CONFIG_SMP
    cpuset_t            childLiveCpuSet;
    uint32_t            childIndexMask;
#endif /* RHINO_CONFIG_SMP */

    char              * name;
    uint32_t            unit;
    uint32_t            level;
    DL_NODE             node;
    DL_LIST             childList; 
    struct cpu_pwr    * pParent;     
    } cpu_pwr_t;

extern void         cpu_pwr_hal_lib_init (void);
extern void         cpu_pwr_child_add (cpu_pwr_t * p_cpu_parent, cpu_pwr_t * pCpuChild);
extern kstat_t      cpu_pwr_node_init_static (uint32_t,char   *,uint32_t,cpu_pwr_t *);
extern kstat_t      cpu_pwr_node_init_dyn (uint32_t,char*,uint32_t,cpu_pwr_t **);
extern cpu_pwr_t *  cpu_pwr_node_find_by_name (char * pName,uint32_t index);
extern kstat_t      cpu_pwr_leaf_node_record (cpu_pwr_t * p_cpu_node, uint32_t cpuIndex);
extern kstat_t      cpu_pwr_c_method_set_by_level (uint32_t level, FUNC_CPU_CSTATE_SET cpuCStateSetFunc);
extern kstat_t      cpu_pwr_c_state_capability_set (uint32_t cpuIndex, uint32_t supportBitsetC);
extern kstat_t      cpu_pwr_c_state_capability_set_by_level (uint32_t level, uint32_t supportBitsetC);
extern kstat_t      cpu_pwr_c_state_latency_save (uint32_t cpuIndex, cpu_cstate_t cpu_state, uint32_t latency);
extern uint32_t     cpu_pwr_c_state_latency_get (uint32_t cpuIndex, cpu_cstate_t CState);
extern void         cpu_pwr_child_index_mask_set (uint32_t, uint32_t);

#if RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT

extern kstat_t      cpu_pwr_p_method_set_by_level (uint32_t level, FUNC_CPU_PSTATE_SET cpuPStateSetFunc);
extern kstat_t      cpu_pwr_cur_p_state_update_directly (uint32_t cpuIndex, cpu_pstate_t cpuPState);
extern kstat_t      cpu_pwr_p_state_capability_set (uint32_t cpuIndex, uint32_t supportBitsetP);
extern kstat_t      cpu_pwr_p_state_capability_set_by_level (uint32_t level, uint32_t supportBitsetP);
extern kstat_t      cpu_pwr_freq_save (uint32_t cpuIndex, cpu_pstate_t cpu_state, uint32_t cpuFreq);
extern kstat_t      cpu_pwr_volt_save (uint32_t cpuIndex, cpu_pstate_t cpu_state, uint32_t cpuVolt);
extern uint32_t     cpu_pwr_freq_get_by_p_state (cpu_pwr_t * p_cpu_node, cpu_pstate_t PState);
extern uint32_t     cpu_pwr_volt_get_by_p_state (cpu_pwr_t * p_cpu_node, cpu_pstate_t PState);

#endif /*RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT*/

#ifdef __cplusplus
}
#endif

#endif /* __cpu_pwr_hal_lib_h__ */

