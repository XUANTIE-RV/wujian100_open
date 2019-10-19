/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     timer_create_del.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>

#include "timer_test.h"

#define TIMER0_ROUND 1
#define TIMER0_MAGIC 0x12345678

static k_task_handle_t  task_0_test;
static k_timer_handle_t timer_0_test;
static k_sem_handle_t   sem_0_test;
static uint32_t g_sem_count = 0;

static void timer_0_func(void *arg)
{
    TIMER_VAL_CHK((size_t)arg == TIMER0_MAGIC);

    if (g_sem_count == 0) {
        g_sem_count ++;
    }

    if (g_sem_count == 1) {
        csi_kernel_sem_post(sem_0_test);
        g_sem_count ++;
    }
}

static void timer_func(void *arg)
{
    TIMER_VAL_CHK((size_t)arg == TIMER0_MAGIC);
}

static void timer_create_param_test(void)
{
    k_status_t ret;
    k_timer_handle_t timer_test;
    timer_test = csi_kernel_timer_new(NULL, KTIMER_TYPE_ONCE, NULL);
    TIMER_VAL_CHK(timer_test == NULL);

    timer_test = csi_kernel_timer_new(timer_func, KTIMER_TYPE_ONCE, NULL);
    TIMER_VAL_CHK(timer_test != NULL);
    ret = csi_kernel_timer_del(timer_test);
    TIMER_VAL_CHK(ret == K_OK);

    timer_test = csi_kernel_timer_new(timer_func, KTIMER_TYPE_PERIODIC, NULL);
    TIMER_VAL_CHK(timer_test != NULL);
    ret = csi_kernel_timer_del(timer_test);
    TIMER_VAL_CHK(ret == K_OK);

    timer_test = csi_kernel_timer_new(timer_func, KTIMER_TYPE_PERIODIC, (void *)TIMER0_MAGIC);
    TIMER_VAL_CHK(timer_test != NULL);
    ret = csi_kernel_timer_del(timer_test);
    TIMER_VAL_CHK(ret == K_OK);
}

static void timer_del_param_test(void)
{
    k_status_t ret;

    k_timer_handle_t timer = csi_kernel_timer_new(timer_func, KTIMER_TYPE_PERIODIC, (void *)TIMER0_MAGIC);
    TIMER_VAL_CHK(timer != NULL);

    ret = csi_kernel_timer_del(NULL);
    TIMER_VAL_CHK(ret == -EINVAL);

    ret = csi_kernel_timer_del(timer);
    TIMER_VAL_CHK(ret == K_OK);
}

static void task_timer0_entry(void *arg)
{
    k_status_t ret = 0;

    while (1) {
        /* check csi_kernel_timer_create */
        timer_create_param_test();

        /* check csi_kernel_timer_del */
        timer_del_param_test();

        sem_0_test = csi_kernel_sem_new(10, 0);
        TIMER_VAL_CHK(sem_0_test != NULL);

        timer_0_test = csi_kernel_timer_new(timer_0_func, KTIMER_TYPE_PERIODIC, (void *)TIMER0_MAGIC);
        TIMER_VAL_CHK(timer_0_test != NULL);

        ret = csi_kernel_timer_del(timer_0_test);
        TIMER_VAL_CHK(ret == K_OK);

        timer_0_test = csi_kernel_timer_new(timer_0_func, KTIMER_TYPE_PERIODIC, (void *)TIMER0_MAGIC);
        TIMER_VAL_CHK(timer_0_test != NULL);

        ret = csi_kernel_timer_start(timer_0_test, TIMER0_ROUND);
        TIMER_VAL_CHK(ret == K_OK);

        ret = csi_kernel_sem_wait(sem_0_test, WAIT_FOREVER);
        TIMER_VAL_CHK(ret == K_OK);

        ret = csi_kernel_timer_stop(timer_0_test);
        TIMER_VAL_CHK(ret == K_OK);

        ret = csi_kernel_timer_del(timer_0_test);

        if (ret == K_OK) {
            test_case_success++;
            PRINT_RESULT("timer create&del", PASS);
        } else {
            test_case_fail++;
            PRINT_RESULT("timer create&del", FAIL);
        }

        csi_kernel_sem_del(sem_0_test);

        next_test_case_notify();
        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

k_status_t task_timer_create_del_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_timer0_entry, "task_timer0_test", 0, 10, 0, NULL, TEST_CASE_TASK_SIZE, &task_0_test);
    TIMER_VAL_CHK(ret == K_OK);

    next_test_case_wait();
    return 0;
}

