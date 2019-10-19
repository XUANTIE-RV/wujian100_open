/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_rtc.c
 * @brief    the main function for the RTC driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_rtc.h"
#include "stdio.h"
#include "soc.h"
#include <csi_config.h>

static volatile uint8_t cb_rtc_flag;

extern void mdelay(uint32_t ms);

#define RTC_TIME_SECS 5
#define RTC_TIMEOUT_SECS 15
#define RTC_TIMEOUT2_SECS   10

void rtc_event_cb_fun(int32_t idx, rtc_event_e event)
{
    if (event == RTC_EVENT_TIMER_INTRERRUPT) {
        cb_rtc_flag = 1;
        printf("enter rtc cb\n");
    }
}

static int32_t test_rtc_time(rtc_handle_t rtc_handle)
{
    struct tm current_time, last_time;
    int32_t ret;
    int32_t secs = 0;

    current_time.tm_sec     = 55;
    current_time.tm_min     = 59;
    current_time.tm_hour    = 23;
    current_time.tm_mday    = 28;
    current_time.tm_mon     = 1;
    current_time.tm_year    = 100;


    ret = csi_rtc_set_time(rtc_handle, &current_time);

    if (ret < 0) {
        printf("csi_rtc_set_time error\n");
        return -1;
    }

    mdelay(RTC_TIME_SECS * 1000);
    ret = csi_rtc_get_time(rtc_handle, &last_time);

    if (ret < 0) {
        printf("csi_rtc_get_time error\n");
        return -1;
    }

    if (current_time.tm_sec != last_time.tm_sec) {
        secs += (last_time.tm_sec - current_time.tm_sec);
    }

    if (current_time.tm_min != last_time.tm_min) {
        secs += (last_time.tm_min - current_time.tm_min) * 60;
    }

    if (current_time.tm_hour != last_time.tm_hour) {
        secs += (last_time.tm_hour - current_time.tm_hour) * 60 * 60;
    }

    if (current_time.tm_mday != last_time.tm_mday) {
        secs += (last_time.tm_mday - current_time.tm_mday) * 60 * 60 * 24;
    }

    if ((secs <= (RTC_TIME_SECS + 5)) && (secs >= (RTC_TIME_SECS - 5))) {
        last_time.tm_year = last_time.tm_year + 1900;
        last_time.tm_mon = last_time.tm_mon + 1;
        printf("The time is %d-%d-%d %d:%d:%d\n", last_time.tm_year, last_time.tm_mon, last_time.tm_mday, last_time.tm_hour, last_time.tm_min, last_time.tm_sec);
    } else {
        printf("get rtc timer error\n");
        return -1;
    }

    printf("get rtc timer OK\n");
    return 0;
}

static int32_t test_rtc_timeout(rtc_handle_t rtc_handle)
{
    int32_t ret;
    struct tm set_time, last_time;
    set_time.tm_sec     = RTC_TIMEOUT_SECS % 60;
    set_time.tm_min     = RTC_TIMEOUT_SECS / 60;
    set_time.tm_hour    = 00;
    set_time.tm_mday    = 29;
    set_time.tm_mon     = 1;
    set_time.tm_year    = 100;
    uint32_t secs = 0;

    cb_rtc_flag = 0;


    ret = csi_rtc_set_alarm(rtc_handle, &set_time);

    if (ret < 0) {
        printf("csi_rtc_set_timeout error\n");
        return -1;
    }

    printf("test rtc timeout %ds\n", RTC_TIMEOUT_SECS);

    ret = csi_rtc_enable_alarm(rtc_handle, 1);

    if (ret < 0) {
        printf("csi_rtc_enable_alarm error\n");
        return -1;
    }

    mdelay(RTC_TIMEOUT_SECS * 1000  + 10000);

    if (cb_rtc_flag == 1) {
        printf("test rtc timeout function OK\n");

        ret = csi_rtc_get_time(rtc_handle, &last_time);

        if (ret < 0) {
            printf("csi_rtc_get_time error\n");
            return -1;
        }

        if (set_time.tm_sec != last_time.tm_sec) {
            secs += (last_time.tm_sec - set_time.tm_sec);
        }

        if (set_time.tm_min != last_time.tm_min) {
            secs += (last_time.tm_min - set_time.tm_min) * 60;
        }

        if (set_time.tm_hour != last_time.tm_hour) {
            secs += (last_time.tm_hour - set_time.tm_hour) * 60 * 60;
        }

        if (set_time.tm_mday != last_time.tm_mday) {
            secs += (last_time.tm_mday - set_time.tm_mday) * 60 * 60 * 24;
        }

        last_time.tm_year = last_time.tm_year + 1900;
        last_time.tm_mon = last_time.tm_mon + 1;
        printf("The time is %d-%d-%d %d:%d:%d\n", last_time.tm_year, last_time.tm_mon, last_time.tm_mday, last_time.tm_hour, last_time.tm_min, last_time.tm_sec);
        ret = csi_rtc_enable_alarm(rtc_handle, 0);

        if (ret < 0) {
            printf("csi_rtc_enable_alarm error\n");
            return -1;
        }

        return 0;
    } else {
        return -1;
    }

}

static int32_t test_rtc_timeout2(rtc_handle_t rtc_handle)
{
    int32_t ret;
    struct tm set_time, last_time;
    set_time.tm_sec     = 0;
    set_time.tm_min     = 0;
    set_time.tm_hour    = 00;
    set_time.tm_mday    = 29;
    set_time.tm_mon     = 1;
    set_time.tm_year    = 100;
    uint32_t secs = 0;

    cb_rtc_flag = 0;

    ret = csi_rtc_start(rtc_handle);

    if (ret < 0) {
        printf("csi_rtc_start error\n");
        return -1;
    }


    ret = csi_rtc_set_time(rtc_handle, &set_time);

    if (ret < 0) {
        printf("csi_rtc_set_time error\n");
        return -1;
    }

    set_time.tm_sec     = 10;
    ret = csi_rtc_set_alarm(rtc_handle, &set_time);

    if (ret < 0) {
        printf("csi_rtc_set_alarm error\n");
        return -1;
    }

    printf("test rtc timeout %ds\n", RTC_TIMEOUT2_SECS);

    ret = csi_rtc_enable_alarm(rtc_handle, 1);

    if (ret < 0) {
        printf("csi_rtc_enable_alarm error\n");
        return -1;
    }

    mdelay(RTC_TIMEOUT2_SECS * 1000  + 5000);

    if (cb_rtc_flag == 1) {

        ret = csi_rtc_get_time(rtc_handle, &last_time);

        if (ret < 0) {
            printf("csi_rtc_get_time error\n");
            return -1;
        }

        if (set_time.tm_sec != last_time.tm_sec) {
            secs += (last_time.tm_sec - set_time.tm_sec);
        }

        if (set_time.tm_min != last_time.tm_min) {
            secs += (last_time.tm_min - set_time.tm_min) * 60;
        }

        if (set_time.tm_hour != last_time.tm_hour) {
            secs += (last_time.tm_hour - set_time.tm_hour) * 60 * 60;
        }

        if (set_time.tm_mday != last_time.tm_mday) {
            secs += (last_time.tm_mday - set_time.tm_mday) * 60 * 60 * 24;
        }

        last_time.tm_year = last_time.tm_year + 1900;
        last_time.tm_mon = last_time.tm_mon + 1;
        printf("The time is %d-%d-%d %d:%d:%d\n", last_time.tm_year, last_time.tm_mon, last_time.tm_mday, last_time.tm_hour, last_time.tm_min, last_time.tm_sec);
        ret = csi_rtc_enable_alarm(rtc_handle, 0);

        if (ret < 0) {
            printf("csi_rtc_enable_alarm error\n");
            return -1;
        }

        set_time.tm_sec     = 21;
        ret = csi_rtc_set_alarm(rtc_handle, &set_time);

        if (ret < 0) {
            printf("csi_rtc_set_alarm error\n");
            return -1;
        }

        printf("test rtc timeout2 function OK\n");
        return 0;
    } else {
        return -1;
    }

}

static int32_t test_rtc(void)
{
    int32_t ret;
    rtc_handle_t rtc_handle = NULL;
    printf("start test_rtc\n");
    rtc_handle = csi_rtc_initialize(0, rtc_event_cb_fun);

    if (rtc_handle == NULL) {
        printf("csi_rtc_initialize error\n");
        return -1;
    }

    ret = csi_rtc_start(rtc_handle);

    if (ret < 0) {
        printf("csi_rtc_start error\n");
        return -1;
    }

    ret = test_rtc_time(rtc_handle);

    if (ret < 0) {
        printf("test_rtc_time error\n");
        return -1;
    }

    ret = test_rtc_timeout(rtc_handle);

    if (ret < 0) {
        printf("test_rtc_timeout error\n");
        return -1;
    }

    ret = csi_rtc_stop(rtc_handle);

    if (ret < 0) {
        printf("csi_rtc_stop error\n");
        return -1;
    }

    ret = test_rtc_timeout2(rtc_handle);

    if (ret < 0) {
        printf("test_rtc_timeout2 error\n");
        return -1;
    }

    ret = csi_rtc_stop(rtc_handle);

    if (ret < 0) {
        printf("csi_rtc_stop error\n");
        return -1;
    }

    ret = csi_rtc_uninitialize(rtc_handle);

    if (ret < 0) {
        printf("csi_rtc_uninitialize error\n");
        return -1;
    }

    return 0;

}
int example_rtc(void)
{
    int ret;

    ret = test_rtc();

    if (ret < 0) {
        printf("test rtc failed\n");
        return -1;
    }

    printf("test rtc successfully\n");
    return 0;
}

int main(void)
{
    return example_rtc();
}
