/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_vic.c
 * @brief    the main function for the timer driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <drv_timer.h>
#include <stdio.h>
#include <soc.h>
#include <csi_core.h>

#define TEST_MODE_FREE_RUNING   0
#define TEST_MODE_USER_DEFINED  1

#define TIMER0         0
#define TIMER0_IRQn    TIM0_IRQn

#define TIMER1         1
#define TIMER1_IRQn    TIM1_IRQn

#ifdef __riscv
#define HI_PRIO   3
#define LO_PRIO   2
#else
#define HI_PRIO   2
#define LO_PRIO   3
#endif

#define EXAMPLE_LOOP_CNT    1
#define TIMEOUT    1000000

static volatile uint8_t time_user_defined_flag = 0;
static volatile uint8_t test_mode;
static volatile uint8_t endless_loop_cnt = 0;

static void timer0_event_cb_fun(int32_t idx, timer_event_e event)
{
    printf("I am timer %d's callback in an endless loop.\n", idx);

    while (1) {
        if (endless_loop_cnt >= 1) {
            return;
        }
    }
}

static void timer1_event_cb_fun(int32_t idx, timer_event_e event)
{
    if (!endless_loop_cnt) {
        endless_loop_cnt ++;
        printf("I am timer %d's with higher interrupt priority than timer %d.\n", idx, TIMER0);
        printf("Example run successfully!\n");
    }
}

int example_vic(void)
{
    int32_t ret;
    timer_handle_t timer_handle;

    time_user_defined_flag = 0;

    timer_handle = csi_timer_initialize(TIMER0, timer0_event_cb_fun);

    if (timer_handle == NULL) {
        printf("csi_timer_initialize error\n");
        return -1;
    }

    ret = csi_timer_config(timer_handle, TEST_MODE_USER_DEFINED);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_set_timeout(timer_handle, TIMEOUT);

    if (ret < 0) {
        return -1;
    }

    printf("set timer %d 's interrrupt priority with %d (lower priority).\n", TIMER0, LO_PRIO);
    csi_vic_set_prio(TIMER0_IRQn, LO_PRIO);

    timer_handle_t timer_handle1;

    timer_handle1 = csi_timer_initialize(TIMER1, timer1_event_cb_fun);

    if (timer_handle1 == NULL) {
        printf("csi_timer_initialize error\n");
        return -1;
    }

    ret = csi_timer_config(timer_handle1, TEST_MODE_USER_DEFINED);

    if (ret < 0) {
        return -1;
    }

    ret = csi_timer_set_timeout(timer_handle1, TIMEOUT);

    if (ret < 0) {
        return -1;
    }

    printf("initialize timer %d, set it's interrupt priority : %d (higher priority).\n", TIMER1, HI_PRIO);
    csi_vic_set_prio(TIMER1_IRQn, HI_PRIO);

    printf("start reload timer %d with lower interrupt priority, and it will enter an endless loop callback\n", TIMER0);
    ret = csi_timer_start(timer_handle);

    if (ret < 0) {
        return -1;
    }

    printf("start reload mode timer %d with higher interrupt priority.\n", TIMER1);
    ret = csi_timer_start(timer_handle1);

    if (ret < 0) {
        return -1;
    }

    while (endless_loop_cnt  <= EXAMPLE_LOOP_CNT) {
        if (endless_loop_cnt  == EXAMPLE_LOOP_CNT) {
            ret = csi_timer_stop(timer_handle);
            ret = csi_timer_stop(timer_handle1);
            ret = csi_timer_uninitialize(timer_handle);
            ret = csi_timer_uninitialize(timer_handle1);
            endless_loop_cnt ++;
        }
    }

    return 0;
}

int main(void)
{
    return example_vic();
}
