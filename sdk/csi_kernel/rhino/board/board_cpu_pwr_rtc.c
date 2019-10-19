/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
 * This file supplied RTC one-shot start/stop services for CPU tickless
 * module, verifyied on STM32L496-DISCOVERY with C3/C4 mode.
 * C3: stop mode.
 * C4: standby mode.
 */

#include "k_api.h"
#include "cpu_pwr_config.h"

//#if (RHINO_CONFIG_CPU_PWR_MGMT > 0)
//#if (RHINO_CONFIG_CPU_TICKLESS > 0)

#include "cpu_tickless.h"
#include "drv_rtc.h"
#define RTC_ONE_SHOT_DBG

extern void SystemClock_Config(void);

#define RTC_WAKEUP_SOURCE_FREQ_2000HZ
//#define RTC_WAKEUP_SOURCE_FREQ_1HZ

/* According reference manual of STM32496G, RTC_WUTR is 16bit */
#define RTC_WAKE_UP_RGE_MAX     0xffff
//static uint32_t          one_shot_enabled       = 0;
//static uint32_t          one_shot_start_value   = 0;
static uint32_t          one_shot_max_period    = 0;/* seconds */
//static kspinlock_t       rtc_spin;
//static RTC_HandleTypeDef RtcHandle;
#ifdef RTC_ONE_SHOT_DBG
//static int               rtc_wakeup_irq_count   = 0;
#endif /* RTC_ONE_SHOT_DBG */

static kstat_t  rtc_init(void);
static uint32_t rtc_one_shot_max_seconds(void);
static kstat_t  rtc_one_shot_start(uint64_t planUs);
static kstat_t  rtc_one_shot_stop(uint64_t *pPassedUs);

one_shot_timer_t rtc_one_shot = {
    rtc_init,
    rtc_one_shot_max_seconds,
    rtc_one_shot_start,
    rtc_one_shot_stop,
};

static uint32_t rtc_one_shot_max_seconds(void)
{
    return one_shot_max_period;
}

static kstat_t rtc_init(void)
{


    return RHINO_SUCCESS;
}

/*******************************************************************************
*
* rtc_one_shot_start - enable the timer in oneshot mode
*
* This function enables the timer in oneshot mode, the interrupt will be fired
* after servral microseconds which is indicated by planUs.
*
* RETURNS: RHINO_SUCCESS or RHINO_PWR_MGMT_ERR if timer is not enabled
*
* ERRNO
*/

static kstat_t rtc_one_shot_start(uint64_t planUs)
{


    return RHINO_SUCCESS;
}

/*******************************************************************************
*
* one_shot_planed_cnt - cancel the timer which was in oneshot mode
*
* This function is called to cancel the timer which was in oneshot mode.
* the time has passed(microseconds) will be return in pPassedUs.
*
* RETURNS: RHINO_SUCCESS or RHINO_PWR_MGMT_ERR if timer is not disabled
*
* ERRNO: N/A
*/

static kstat_t rtc_one_shot_stop
(
    uint64_t *pPassedUs   /* OUT  */
)
{

    return RHINO_SUCCESS;
}

/*******************************************************************************
*
* RTC_WKUP_IRQHandler - ISR handle of RTC wakeup interrupt
*
* This function will replace weak one which is defined in
* startup_stm32l496xx_keil.s
*
* RETURNS: N/A
*
* ERRNO: N/A
*/

void RTC_WKUP_IRQHandler(void)
{

}

#ifdef RTC_ONE_SHOT_DBG
void rtc_info_show(void)
{

}


#endif /* RTC_ONE_SHOT_DBG */

//#endif /* RHINO_CONFIG_CPU_TICKLESS */
//#endif /* RHINO_CONFIG_CPU_PWR_MGMT */
