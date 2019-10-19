/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


#include "drv_rtc.h"
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "test_driver_config.h"

static rtc_handle_t pcsi_rtc;
static volatile uint8_t cb_rtc_flag;

extern void mdelay(uint32_t ms);

#ifdef RTC_QUICK_TEST
#define RTC_TIMEOUT_SECS 2
#define RTC_TIME_SECS 2
#else
#define RTC_TIMEOUT_SECS 20
#define RTC_TIME_SECS 10
#endif

struct tm rtc_time[] = {
    {40, 40, 12, 15, 6, 69},
    {40, 40, 12, 15, 6, 200},
    {40, 40, 12, 15, 13, 100},
    {40, 40, 12, 31, 5, 100},
    {40, 40, 25, 15, 6, 100},
    {40, 61, 12, 15, 6, 100},
    {61, 40, 12, 15, 6, 100},
};

typedef struct {
    struct tm *time;
    uint32_t expect_out;
} rtc_test_t;

static rtc_test_t rtc_cases[] = {
    {&rtc_time[0], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[1], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[2], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[3], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[4], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[5], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
    {&rtc_time[6], CSI_DRV_ERRNO_RTC_BASE | RTC_ERROR_TIME},
};

static void rtc_event_cb_fun(int32_t idx, rtc_event_e event)
{
    if (event == RTC_EVENT_TIMER_INTRERRUPT) {
        cb_rtc_flag = 1;
    }
}
static void test_rtc_timeout(void)
{
    struct tm current_time, time_out;
    int32_t ret;

    cb_rtc_flag = 0;
    current_time.tm_sec     = 58;
    current_time.tm_min     = 59;
    current_time.tm_hour    = 23;
    current_time.tm_mday    = 28;
    current_time.tm_mon     = 1;
    current_time.tm_year    = 100;

    pcsi_rtc = csi_rtc_initialize(0, rtc_event_cb_fun);
    ASSERT_TRUE(pcsi_rtc != NULL);

    ret = csi_rtc_start(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);

    ret = csi_rtc_set_time(pcsi_rtc, &current_time);
    ASSERT_TRUE(ret  == 0);

#ifdef RTC_QUICK_TEST
    time_out.tm_sec     = 0;
#else
    time_out.tm_sec     = 18;
#endif
    time_out.tm_min     = 0;
    time_out.tm_hour    = 0;
    time_out.tm_mday    = 29;
    time_out.tm_mon     = 1;
    time_out.tm_year    = 100;

    ret = csi_rtc_set_alarm(pcsi_rtc, &time_out);
    ASSERT_TRUE(ret  == 0);
    ret = csi_rtc_enable_alarm(pcsi_rtc, 1);
    ASSERT_TRUE(ret  == 0);

    mdelay(RTC_TIMEOUT_SECS * 1000 + 1000);

    ASSERT_TRUE(cb_rtc_flag == 1);

    ret = csi_rtc_enable_alarm(pcsi_rtc, 0);

    ASSERT_TRUE(ret  == 0);

    ret = csi_rtc_stop(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);

    ret = csi_rtc_uninitialize(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);
}
static void test_rtc_leap_year(void)
{
    struct tm current_time, last_time;
    int32_t ret;
    int32_t secs = 0;
    uint8_t secs_equ_flag = 0;
#ifdef RTC_QUICK_TEST
    current_time.tm_sec     = 58;
#else
    current_time.tm_sec     = 55;
#endif
    current_time.tm_min     = 59;
    current_time.tm_hour    = 23;
    current_time.tm_mday    = 28;
    current_time.tm_mon     = 1;
    current_time.tm_year    = 100;

    pcsi_rtc = csi_rtc_initialize(0, rtc_event_cb_fun);
    ASSERT_TRUE(pcsi_rtc != NULL);

    ret = csi_rtc_start(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);

    ret = csi_rtc_set_time(pcsi_rtc, &current_time);
    ASSERT_TRUE(ret  == 0);

    mdelay(RTC_TIME_SECS * 1000 + 100);
    ret = csi_rtc_get_time(pcsi_rtc, &last_time);
    ASSERT_TRUE(ret  == 0);

    if (current_time.tm_mday != last_time.tm_mday) {
        secs += (last_time.tm_mday - current_time.tm_mday) * 60 * 60 * 24;
    }

    if (current_time.tm_hour != last_time.tm_hour) {
        secs += (last_time.tm_hour - current_time.tm_hour) * 60 * 60;
    }

    if (current_time.tm_min != last_time.tm_min) {
        secs += (last_time.tm_min - current_time.tm_min) * 60;
    }

    if (current_time.tm_sec != last_time.tm_sec) {
        secs += (last_time.tm_sec - current_time.tm_sec);
    }

    if (((secs - 2) <= RTC_TIME_SECS) && ((secs + 2) >= RTC_TIME_SECS)) {
        secs_equ_flag = 1;
    }

    ASSERT_TRUE(secs_equ_flag == 1);

    ret = csi_rtc_stop(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);

    ret = csi_rtc_uninitialize(pcsi_rtc);
    ASSERT_TRUE(ret  == 0);

}
static void test_rtc_interfaces(void)
{
    struct tm current_time, last_time, time_out;
    int32_t ret;
    uint32_t i;
    pcsi_rtc = csi_rtc_initialize(0, rtc_event_cb_fun);
    ASSERT_TRUE(pcsi_rtc != NULL);

    ret = csi_rtc_start(NULL);
    ASSERT_TRUE(ret != 0);

    for (i = 0; i < sizeof(rtc_cases) / (sizeof(rtc_test_t)); i++) {
        ret = csi_rtc_set_time(pcsi_rtc, rtc_cases[i].time);
        ASSERT_TRUE(ret == rtc_cases[i].expect_out);

        ret = csi_rtc_set_alarm(pcsi_rtc, rtc_cases[i].time);
        ASSERT_TRUE(ret == rtc_cases[i].expect_out);
    }

    ret = csi_rtc_set_time(NULL, &current_time);
    ASSERT_TRUE(ret != 0);

    ret = csi_rtc_set_alarm(NULL, &time_out);
    ASSERT_TRUE(ret != 0);

    ret = csi_rtc_get_time(NULL, &last_time);
    ASSERT_TRUE(ret  != 0);

    ret = csi_rtc_stop(NULL);
    ASSERT_TRUE(ret  != 0);

    ret = csi_rtc_uninitialize(NULL);
    ASSERT_TRUE(ret  != 0);
}

int test_rtc()
{
    dtest_suite_info_t test_suite_info = {
        "test_rtc", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_rtc_interfaces", test_rtc_interfaces, RTC_TEST_INTERFACE_EN },
        { "test_rtc_timeout", test_rtc_timeout, RTC_TEST_TIMEOUT_EN },
        { "test_rtc_leap_year", test_rtc_leap_year, RTC_TEST_LEAP_YEAR_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
