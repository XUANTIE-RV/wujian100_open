/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_timer.c
 * @brief    the main function for the timer driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_timer.h"
#include "stdio.h"
#include "soc.h"

#define TEST_MODE_FREE_RUNING   0
#define TEST_MODE_USER_DEFINED  1
static volatile uint8_t time_free_runing_flag = 0;
static volatile uint8_t time_user_defined_flag = 0;
static volatile uint8_t test_mode;

static void timer_event_cb_fun(int32_t idx, timer_event_e event)
{
    switch (test_mode) {
        case TEST_MODE_FREE_RUNING:
            time_free_runing_flag = 1;
            printf("enter cb for mode free_runing \n");
            break;

        case TEST_MODE_USER_DEFINED:
            time_user_defined_flag = 1;
            printf("enter cb for mode user_defined\n");
            break;
    }

}

static int32_t test_free_running_fun(timer_handle_t timer_handle)
{
    uint32_t timeout = 0x3ffffff;
    uint32_t value;
    int32_t ret;
    time_free_runing_flag = 0;

    test_mode = TEST_MODE_FREE_RUNING;
    ret = csi_timer_config(timer_handle, TIMER_MODE_FREE_RUNNING);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_start(timer_handle);

    if (ret < 0) {
        printf("csi_timer_start error\n");
        return -1;
    }

    while (timeout) {
        timeout--;

        csi_timer_get_current_value(timer_handle, &value);

        if (value < 0xffffff00) {
            break;
        }
    }

    if (timeout == 0) {
        printf("time out \n");
        return -1;
    }

    ret = csi_timer_stop(timer_handle);

    if (ret < 0) {
        return -1;
    }

    return 0;
}
static int32_t test_user_defined_fun(timer_handle_t timer_handle)
{
    uint32_t timeout = 0x3fffffff;
    int32_t ret;
    time_user_defined_flag = 0;

    test_mode = TEST_MODE_USER_DEFINED;

    ret = csi_timer_config(timer_handle, TIMER_MODE_RELOAD);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_set_timeout(timer_handle, 10000000);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_start(timer_handle);

    if (ret < 0) {
        return -1;
    }

    while (timeout) {
        timeout--;

        if (time_user_defined_flag == 1) {
            break;
        }
    }

    if (time_user_defined_flag == 0) {
        printf("time out \n");
        return -1;
    }

    ret = csi_timer_stop(timer_handle);

    if (ret < 0) {
        return -1;
    }

    return 0;
}

static int32_t test_timer(uint8_t timer_num)
{
    int32_t ret;
    timer_handle_t timer_handle;

    timer_handle = csi_timer_initialize(timer_num, timer_event_cb_fun);

    if (timer_handle == NULL) {
        printf("csi_timer_initialize error\n");
        return -1;
    }

    ret = test_free_running_fun(timer_handle);

    if (ret < 0) {
        printf("test_free_running_fun error\n");
        return -1;
    }

    printf("timer free_running test passed\n");

    ret = test_user_defined_fun(timer_handle);

    if (ret < 0) {
        printf("test_reload_fun error\n");
        return -1;
    }

    printf("time out after 10s passed\n");

    ret = csi_timer_uninitialize(timer_handle);

    if (ret < 0) {
        printf("csi_timer_uninitialize error\n");
        return -1;
    }

    return 0;
}

int example_timer(uint8_t timer_num)
{
    int ret;
    ret = test_timer(timer_num);

    if (ret < 0) {
        printf("test timer%d failed\n", timer_num);
        return -1;
    }

    printf("test timer%d successfully\n", timer_num);
    return 0;
}

int main(void)
{
    return example_timer(0);
}
