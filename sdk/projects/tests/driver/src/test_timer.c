/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "drv_timer.h"
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "soc.h"
#include "test_driver_config.h"

static timer_handle_t pcsi_timer;

//atic uint8_t time_free_runing_flag = 0;
static volatile uint8_t time_reload_flag = 0;

static void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
    (void)idx;
    (void)event;
    time_reload_flag = 1;
}

static void test_free_running_fun(timer_handle_t csi_timer)
{
    uint32_t timeout = 0x3ffffff;
    uint32_t value;

    ASSERT_PTR_EQ(csi_timer_config(csi_timer, TIMER_MODE_FREE_RUNNING), 0);
    ASSERT_PTR_EQ(csi_timer_start(csi_timer), 0);

    while (timeout) {
        timeout--;
        csi_timer_get_current_value(csi_timer, &value);

        if (value <  0xffffff00) {
            break;
        }
    }

    ASSERT_TRUE(timeout != 0);
    ASSERT_PTR_EQ(csi_timer_stop(csi_timer), 0);

}
static void test_reload_fun(timer_handle_t csi_timer)
{
    uint32_t timeout = 0x3fffffff;
    ASSERT_PTR_EQ(csi_timer_config(csi_timer, TIMER_MODE_RELOAD), 0);
    ASSERT_PTR_EQ(csi_timer_set_timeout(csi_timer, 1000000), 0);
    ASSERT_PTR_EQ(csi_timer_start(csi_timer), 0);

    while (timeout) {
        timeout--;

        if (time_reload_flag == 1) {
            break;
        }
    }

    ASSERT_TRUE(time_reload_flag == 1);
    time_reload_flag = 0;

    ASSERT_PTR_EQ(csi_timer_stop(csi_timer), 0);
}

static void test_timer_free_running(void)
{
    uint32_t i;

    for (i = 0; i < CONFIG_TIMER_NUM; i++) {
        pcsi_timer = csi_timer_initialize(i, timer_event_cb_fun);
        test_free_running_fun(pcsi_timer);
        test_reload_fun(pcsi_timer);
        ASSERT_PTR_EQ(csi_timer_uninitialize(pcsi_timer), 0);

    }
}

static void test_timer_user_defined(void)
{
    uint32_t i;

    for (i = 0; i < CONFIG_TIMER_NUM; i++) {
        pcsi_timer = csi_timer_initialize(i, timer_event_cb_fun);
        test_reload_fun(pcsi_timer);
        ASSERT_PTR_EQ(csi_timer_uninitialize(pcsi_timer), 0);

    }
}

typedef struct {
    timer_mode_e mode;
    uint32_t expect_out;
} timer_test_t;

static timer_test_t timer_cases[] = {
    { -1, CSI_DRV_ERRNO_TIMER_BASE | DRV_ERROR_PARAMETER},
    {TIMER_MODE_RELOAD + 1, CSI_DRV_ERRNO_TIMER_BASE | DRV_ERROR_PARAMETER},
};
static void test_timer_interfaces(void)
{
    uint32_t i, j;
    uint32_t value;
    uint32_t ret;

    for (i = 0; i < CONFIG_TIMER_NUM; i++) {
        pcsi_timer = csi_timer_initialize(i, timer_event_cb_fun);

        for (j = 0; j < sizeof(timer_cases) / sizeof(timer_test_t); j++) {
            ASSERT_TRUE(csi_timer_config(pcsi_timer, timer_cases[j].mode) == timer_cases[j].expect_out);
        }
    }

    ret = csi_timer_set_timeout(NULL, 1000000);
    ASSERT_TRUE(ret != 0);

    ret = csi_timer_start(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_timer_stop(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_timer_suspend(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_timer_resume(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_timer_get_current_value(NULL, &value);
    ASSERT_TRUE(ret != 0);
}

int test_timer(void)
{
    dtest_suite_info_t test_suite_info = {
        "test_timer", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_timer_free_running", test_timer_free_running, TIMER_TEST_FREE_RUNNING },
        { "test_timer_user_defined", test_timer_user_defined, TIMER_TEST_USER_DEFINED },
        { "test_timer_interfaces", test_timer_interfaces, TIMER_TEST_INTERFACE_EN},
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
