#include "k_api.h"
#include "cpu_pwr_config.h"

//#if RHINO_CONFIG_CPU_PWR_MGMT

#include "cpu_pwr_hal_lib.h"
#include "pwr_debug.h"
#include "soc.h"

#if RHINO_CONFIG_CPU_TICKLESS
#include "cpu_tickless.h"
#endif /*RHINO_CONFIG_CPU_TICKLESS*/

#ifdef CONFIG_TEE_CA
#include "drv_tee.h"
#endif

/* forward declarations */

extern cpu_pwr_t   *p_cpu_pwr_root_node;

#if RHINO_CONFIG_CPU_TICKLESS
extern one_shot_timer_t tim_one_shot;  /* wakeup source for C1 */
#endif /* RHINO_CONFIG_CPU_TICKLESS */

static cpu_pwr_t cpu_pwr_node_package_0;
static cpu_pwr_t cpu_pwr_node_core_0;
static kstat_t board_cpu_c_state_set
(
    uint32_t cpuCState,
    int   master
)
{
    switch (cpuCState) {
        case CPU_CSTATE_C0:

            //printf("enter C0\n");
            if (master) {
            }

            break;

        case CPU_CSTATE_C1:

            /*
             * put CPU into C1 state
             * to put CPU into C1 state.
             */
            //printf("enter C1\n");
#ifdef CONFIG_CHIP_CH2201
            *(volatile unsigned int *)(0xe000e1c0) = 0xffffffff; // reload wakeup_IRQ
            //*(volatile unsigned int *)(0xe000e280) = 0xffffffff; // clear pend IRQ
            csi_vic_set_wakeup_irq(RTC_IRQn);
            csi_vic_set_wakeup_irq(UART2_IRQn);
            csi_vic_set_wakeup_irq(UART1_IRQn);
            csi_vic_set_wakeup_irq(UART0_IRQn);
            csi_vic_set_wakeup_irq(CORET_IRQn);
            csi_vic_set_wakeup_irq(GPIOA_IRQn);
            csi_vic_set_wakeup_irq(GPIOB_IRQn);
            csi_vic_set_wakeup_irq(TIMA0_IRQn);

#ifdef CONFIG_TEE_CA
            csi_tee_enter_lpm(0, 0, TEE_LPM_MODE_WAIT);
#else
            __WFI();
#endif
#endif
            break;

        default:

            PWR_DBG(DBG_ERR, "invalid C state: C%d\n", cpuCState);
            break;
    }

    return RHINO_SUCCESS;
}

kstat_t board_cpu_pwr_topo_create(void)
{
    cpu_pwr_t    *pCpuNode    = NULL;
    cpu_pwr_t    *pParentL1   = NULL; /* parent of level 1 */
    cpu_pwr_t    *pParentL2   = NULL; /* parent of level 2 */
    kstat_t       retVal      = RHINO_SUCCESS;
    uint32_t      cpuIndex    = 0; /* 0 for UP */

    if (p_cpu_pwr_root_node == NULL) {
        return RHINO_PWR_MGMT_ERR;
    }

    pParentL1 = p_cpu_pwr_root_node;

    pCpuNode = &cpu_pwr_node_package_0;
    retVal = cpu_pwr_node_init_static(CPU_PWR_TOPO_LEVEL_1, "package", 0, pCpuNode);

    if (retVal != RHINO_SUCCESS) {
        return RHINO_PWR_MGMT_ERR;
    }

    /* add this node as a child of p_cpu_pwr_root_node */

    cpu_pwr_child_add(pParentL1, pCpuNode);
    pParentL2 = pCpuNode;

    pCpuNode = &cpu_pwr_node_core_0;
    retVal = cpu_pwr_node_init_static(CPU_PWR_TOPO_LEVEL_2, "core", 0, pCpuNode);

    if (retVal != RHINO_SUCCESS) {
        return RHINO_PWR_MGMT_ERR;
    }

    cpu_pwr_child_add(pParentL2, pCpuNode);

    /* record this node as leaf node in the topology */

    retVal = cpu_pwr_leaf_node_record(pCpuNode, cpuIndex);

    if (retVal == RHINO_PWR_MGMT_ERR) {
        return RHINO_PWR_MGMT_ERR;
    }

    retVal = cpu_pwr_c_method_set_by_level(CPU_PWR_TOPO_LEVEL_2,
                                           board_cpu_c_state_set);

    if (retVal == RHINO_PWR_MGMT_ERR) {
        return RHINO_PWR_MGMT_ERR;
    }

    retVal = cpu_pwr_c_state_capability_set_by_level(CPU_PWR_TOPO_LEVEL_2,
             CPU_STATE_BIT(CPU_CSTATE_C0)
             | CPU_STATE_BIT(CPU_CSTATE_C1)
                                                    );

    if (retVal == RHINO_PWR_MGMT_ERR) {
        return RHINO_PWR_MGMT_ERR;
    }


    cpu_pwr_c_state_latency_save(cpuIndex, CPU_CSTATE_C0, 0);
    cpu_pwr_c_state_latency_save(cpuIndex, CPU_CSTATE_C1, 0);

    tickless_one_shot_timer_save(CPU_CSTATE_C1, &tim_one_shot);

#if RHINO_CONFIG_CPU_TICKLESS

    tickless_c_states_add(CPU_STATE_BIT(CPU_CSTATE_C0)
                          | CPU_STATE_BIT(CPU_CSTATE_C1)
                         );

#endif /* RHINO_CONFIG_CPU_TICKLESS */

    return retVal;
}

//#endif /* RHINO_CONFIG_CPU_PWR_MGMT */
