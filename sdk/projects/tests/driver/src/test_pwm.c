/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include <drv_pwm.h>
#include <soc.h>
#include <dtest.h>
#include <pin.h>
#include <test_driver_config.h>
extern void mdelay(uint32_t ms);

static void test_pin_pwm_init(void)
{
    drv_pinmux_config(TEST_PWM_CH0, TEST_PWM_CH0_FUNC);
}

static void pwm_test_fun(void)
{
    int32_t ret;
    pwm_handle_t pwm_handle;

    test_pin_pwm_init();

    pwm_handle = csi_pwm_initialize(TEST_PWM_IDX);
    ASSERT_TRUE(pwm_handle != NULL);

    ret = csi_pwm_config(pwm_handle, TEST_PWM_CH, 2500, 2000);
    ASSERT_TRUE(ret == 0);
    csi_pwm_start(pwm_handle, TEST_PWM_CH);
    mdelay(200);
    csi_pwm_stop(pwm_handle, TEST_PWM_CH);
    csi_pwm_uninitialize(pwm_handle);
}

static void pwm_test_interfaces(void)
{
    int32_t ret;
    pwm_handle_t pwm_handle;

    test_pin_pwm_init();

    pwm_handle = csi_pwm_initialize(TEST_PWM_IDX);
    ASSERT_TRUE(pwm_handle != NULL);

    ret = csi_pwm_config(NULL, TEST_PWM_CH, 400, 200);
    ASSERT_TRUE(ret != 0);

    ret = csi_pwm_config(NULL, TEST_PWM_CH, 3000, 2500);
    ASSERT_TRUE(ret != 0);

    csi_pwm_uninitialize(pwm_handle);
}

int test_pwm()
{
    dtest_suite_info_t test_suite_info = {
        "test_pwm", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "pwm_test_fun", pwm_test_fun, PWM_TEST_FUN_EN },
        { "pwm_test_interfaces", pwm_test_interfaces, PWM_TEST_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
