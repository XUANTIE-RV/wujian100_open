/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "drv_wdt.h"
#include <csi_config.h>
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "test_driver_config.h"

static wdt_handle_t wdt_handle = NULL;
static volatile uint8_t wdt_fun_sysreset_flag = 0;
static volatile uint8_t wdt_fun_feedog_flag = 0;

extern void mdelay(uint32_t ms);

#if defined(CONFIG_CHIP_SC5654A)
#define WDT_TIMEOUT    1000
#else
#define WDT_TIMEOUT    (0x10000 << 7)/ (drv_get_apb_freq() / 1000)
#endif

static void wdt_event_cb_fun(int32_t idx, wdt_event_e event)
{
}

static void wdt_fun_feedog()
{
    int32_t ret;
    int32_t i;

    wdt_handle = csi_wdt_initialize(0, wdt_event_cb_fun);
    ASSERT_TRUE(wdt_handle != NULL);

    ret = csi_wdt_set_timeout(wdt_handle, WDT_TIMEOUT);
    ASSERT_TRUE(ret == 0);

    ret = csi_wdt_start(wdt_handle);
    ASSERT_TRUE(ret == 0);

    for (i = 0; i < 10; i++) {
        mdelay(WDT_TIMEOUT - 10);
        csi_wdt_restart(wdt_handle);
    }

    wdt_fun_feedog_flag = 1;
    ASSERT_TRUE(wdt_fun_feedog_flag == 1);

    ret = csi_wdt_stop(wdt_handle);
    ASSERT_TRUE(ret != 0);
    ret = csi_wdt_uninitialize(wdt_handle);
    ASSERT_TRUE(ret == 0);

}

static void wdt_fun_sysreset()
{
    int32_t ret;

    wdt_handle = csi_wdt_initialize(0, wdt_event_cb_fun);
    ASSERT_TRUE(wdt_handle != NULL);


    ret = csi_wdt_set_timeout(wdt_handle, WDT_TIMEOUT);
    ASSERT_TRUE(ret == 0);

    ret = csi_wdt_start(wdt_handle);
    ASSERT_TRUE(ret == 0);

#if defined(CONFIG_CHIP_SC5654A)
    mdelay(WDT_TIMEOUT * 2 + 100);
#else
    mdelay(WDT_TIMEOUT + 10);
#endif
    csi_wdt_restart(wdt_handle);

    wdt_fun_sysreset_flag = 1;
    ASSERT_TRUE(wdt_fun_sysreset_flag != 1);

    ret = csi_wdt_stop(wdt_handle);
    ASSERT_TRUE(ret != 0);
    ret = csi_wdt_uninitialize(wdt_handle);
}

static void wdt_test_interfaces()
{
    int32_t ret;
    uint32_t value;

    wdt_handle = csi_wdt_initialize(0, wdt_event_cb_fun);
    ASSERT_TRUE(wdt_handle != NULL);

    ret = csi_wdt_read_current_value(NULL, &value);
    ASSERT_TRUE(ret != 0);

    ret = csi_wdt_set_timeout(NULL, WDT_TIMEOUT);
    ASSERT_TRUE(ret != 0);

    ret = csi_wdt_start(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_wdt_restart(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_wdt_stop(NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_wdt_uninitialize(NULL);
    ASSERT_TRUE(ret != 0);
}

int test_wdt()
{
    dtest_suite_info_t test_suite_info = {
        "test_wdt", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "wdt_fun_sysreset", wdt_fun_sysreset, WDT_FUN_SYSRESET_EN },
        { "wdt_fun_feedog", wdt_fun_feedog, WDT_FUN_FEEDOG_EN},
        { "wdt_test_interfaces", wdt_test_interfaces, WDT_TEST_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
