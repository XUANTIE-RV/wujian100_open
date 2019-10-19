/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
 * According user manual of STM32L496-DISCOVERY
 * TIM2 and TIM5 are 32-bit timer, other timer is 16-bit.
 * This file will use TIM5 to supply one-shot start/stop service
 * for CPU tickless module.
 * verifyied on STM32L496-DISCOVERY with C1/C2 mode.
 * C1: sleep mode.
 * C2: low power sleep mode.
 */

#include "k_api.h"
#include "cpu_pwr_config.h"

//#if (RHINO_CONFIG_CPU_PWR_MGMT > 0)
//#if (RHINO_CONFIG_CPU_TICKLESS > 0)

#include "cpu_tickless.h"
#include "drv_timer.h"
#include "soc.h"

//#define TIM_DBG

#ifndef CONFIG_LPM_TICKLESS_SYSTIM
#define CONFIG_LPM_TICKLESS_SYSTIM 0
#endif

extern int aos_lpm_register_device(uint8_t level, void *func, void *param);

timer_handle_t wakeup_timer;

static uint32_t     init_flag               = 0;

static kspinlock_t  tim_spin;

static kstat_t  tim_timer_init(void);
static uint32_t tim_one_shot_max_seconds(void);
static kstat_t  tim_one_shot_start(uint64_t         planUs);
static kstat_t  tim_one_shot_stop(uint64_t *pPassedUs);

one_shot_timer_t tim_one_shot = {
    tim_timer_init,
    tim_one_shot_max_seconds,
    tim_one_shot_start,
    tim_one_shot_stop,
};

void timer_event_cb(int32_t idx, timer_event_e event)
{
#ifdef TIM_DBG
    printf("time out\n");
#endif
}

kstat_t tim_timer_init(void)
{
    if (init_flag == 1) {
        return RHINO_SUCCESS;
    }

    krhino_spin_init(&tim_spin);
    wakeup_timer = csi_timer_initialize(CONFIG_LPM_TICKLESS_SYSTIM, timer_event_cb);
    csi_timer_config(wakeup_timer, TIMER_MODE_FREE_RUNNING);

#ifdef CONFIG_LPM
    aos_lpm_register_device(0, csi_timer_power_control, wakeup_timer);
#endif

    init_flag = 1;
    return RHINO_SUCCESS;
}

/* return the max period(in second) that could trigger interrupt */

uint32_t tim_one_shot_max_seconds(void)
{
    /* the max 32 bit value / count frequency */

    return 0xffffffff / drv_get_timer_freq(CONFIG_LPM_TICKLESS_SYSTIM);
}

/*******************************************************************************
*
* tim_one_shot_start - enable the timer in oneshot mode
*
* This function enables the timer in oneshot mode, the interrupt will be fired
* after servral microseconds which is indicated by planUs.
*
* RETURNS: RHINO_SUCCESS or RHINO_PWR_MGMT_ERR if timer is not enabled
*
* ERRNO
*/

kstat_t tim_one_shot_start
(
    uint64_t  planUs      /* IN */
)
{

    krhino_spin_lock_irq_save(&tim_spin);
#ifdef TIM_DBG
    printf("tim_one_shot_start %d\n", planUs);
#endif
    csi_timer_set_timeout(wakeup_timer, planUs);
    csi_timer_start(wakeup_timer);
    krhino_spin_unlock_irq_restore(&tim_spin);
    return RHINO_SUCCESS;

}

/*******************************************************************************
*
* tim_one_shot_stop - cancel the timer which was in oneshot mode
*
* This function is called to cancel the timer which was in oneshot mode.
* the time has passed(microseconds) will be return in pPassedUs.
*
* RETURNS: RHINO_SUCCESS or RHINO_PWR_MGMT_ERR if timer is not disabled
*
* ERRNO: N/A
*/

kstat_t tim_one_shot_stop
(
    uint64_t *pPassedUs   /* OUT  */
)
{
    uint32_t load_val = 0;
    uint32_t current_val = 0;
    *pPassedUs = 0;
    krhino_spin_lock_irq_save(&tim_spin);

    csi_timer_get_load_value(wakeup_timer, &load_val);
    csi_timer_get_current_value(wakeup_timer, &current_val);

    *pPassedUs = (load_val - current_val) ? (load_val - current_val) : 0;

    *pPassedUs = *pPassedUs * 1000000 / drv_get_timer_freq(CONFIG_LPM_TICKLESS_SYSTIM);
#ifdef TIM_DBG
    printf("tim_one_shot_stop, pPassedUs %u, load_val %u, current_val %u\n", *pPassedUs, load_val, current_val);
#endif
    csi_timer_stop(wakeup_timer);
    krhino_spin_unlock_irq_restore(&tim_spin);
    return RHINO_SUCCESS;
}

//#endif /* RHINO_CONFIG_CPU_TICKLESS */
//#endif /* RHINO_CONFIG_CPU_PWR_MGMT */

