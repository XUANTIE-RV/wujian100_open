/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_wdt.c
 * @brief    the main function for the WDT driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_wdt.h"
#include "stdio.h"
#include "soc.h"
#include <csi_config.h>

extern void mdelay(uint32_t ms);

#define TEST_WDT_RESET 0
#if defined(CONFIG_CHIP_SC5654A)
#define WDT_TIMEOUT    1000
#else
#define WDT_TIMEOUT    (0x10000 << 7)/ (drv_get_apb_freq() / 1000)
#endif
static void wdt_event_cb_fun(int32_t idx, wdt_event_e event)
{

}

static int32_t wdt_fun_feedog(wdt_handle_t wdt_handle)
{
    int32_t ret;
    ret = csi_wdt_start(wdt_handle);
    uint32_t i;

    if (ret < 0) {
        return -1;
    }

    for (i = 0; i < 10; i++) {
        mdelay(WDT_TIMEOUT - 10);
        ret = csi_wdt_restart(wdt_handle);

        if (ret < 0) {
            return -1;
        }
    }

    printf("wdt_fun_feedog OK \n");
    return 0;
}

#if defined(TEST_WDT_RESET)
static int32_t wdt_fun_sysreset(wdt_handle_t wdt_handle)
{
    int32_t ret;

    ret = csi_wdt_restart(wdt_handle);    // restart the counter to its initial value

    if (ret < 0) {
        return -1;
    }

#if defined(CONFIG_CHIP_SC5654A)
    mdelay(WDT_TIMEOUT * 2 + 100);
#else
    mdelay(WDT_TIMEOUT + 10);
#endif
    printf("system should be restarted, and not be here!\n");
    return -1;
}
#endif

static int32_t test_wdt(void)
{
    int32_t ret;
    wdt_handle_t wdt_handle = NULL;

    wdt_handle = csi_wdt_initialize(0, wdt_event_cb_fun);

    if (wdt_handle == NULL) {
        printf("csi_wdt_initialize error\n");
        return -1;
    }

    ret = csi_wdt_set_timeout(wdt_handle, WDT_TIMEOUT);

    if (ret < 0) {
        printf("csi_wdt_set_timeout error\n");
        return -1;
    }

    ret = wdt_fun_feedog(wdt_handle);

    if (ret < 0) {
        printf("wdt_fun_feedog error\n");
        return -1;
    }

#if defined(TEST_WDT_RESET)
    ret = wdt_fun_sysreset(wdt_handle);

    if (ret < 0) {
        printf("wdt_fun_sysreset error\n");
        return -1;
    }

#endif

    ret = csi_wdt_stop(wdt_handle);

    if (ret < 0) {
        printf("csi_wdt_stop error\n");
        return -1;
    }

    ret = csi_wdt_uninitialize(wdt_handle);

    if (ret < 0) {
        printf("csi_wdt_uninitialize error\n");
        return -1;
    }

    return 0;

}

int example_wdt(void)
{
    int ret;
    ret = test_wdt();

    if (ret < 0) {
        printf("test_wdt failed\n");
        return -1;
    }

    printf("test_wdt successfully\n");
    return 0;
}

int main(void)
{
    return example_wdt();
}
