/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     msg_queue_del.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>

#include "msg_queue_test.h"

#define TEST_BUFQUEUE_MSG0_SIZE 8
#define TEST_BUFQUEUE_BUF0_SIZE 16
#define TEST_BUFQUEUE_MSG_MAX   8

static k_task_handle_t     task_0_test;
static k_task_handle_t     task_1_test;
static char        g_test_recv_msg0[TEST_BUFQUEUE_MSG0_SIZE];
static k_msgq_handle_t g_test_bufqueue0;

static void buf_queue_del_param_test(void)
{
    k_status_t ret;

    ret = csi_kernel_msgq_del(NULL);
    BUFQUEUE_VAL_CHK(ret == -EINVAL);

#ifndef CONFIG_KERNEL_FREERTOS
    k_sem_handle_t sem;
    sem = csi_kernel_sem_new(1, 0);
    ret = csi_kernel_msgq_del(sem);
    BUFQUEUE_VAL_CHK(ret < 0);
    csi_kernel_sem_del(sem);
#endif
}

static void task_queue0_entry(void *arg)
{
    k_status_t ret;

    while (1) {
        g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_BUF0_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
        BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

        /* check csi_kernel_msgq_del param */
        buf_queue_del_param_test();

        ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, -1);
        BUFQUEUE_VAL_CHK(ret == -EPERM);

        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

static void task_queue1_entry(void *arg)
{
    k_status_t ret;

    while (1) {
        ret = csi_kernel_msgq_del(g_test_bufqueue0);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        if (test_case_check_err == 0) {
            test_case_success++;
            PRINT_RESULT("buf queue del", PASS);
        } else {
            test_case_check_err = 0;
            test_case_fail++;
            PRINT_RESULT("buf queue del", FAIL);
        }

        next_test_case_notify();

        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

k_status_t task_buf_queue_del_test(void)
{
    k_status_t ret;
    test_case_check_err = 0;

    ret = csi_kernel_task_new((k_task_entry_t)task_queue0_entry, "task_bufqueue0_test",  0, 11, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_0_test);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    ret = csi_kernel_task_new((k_task_entry_t)task_queue1_entry, "task_bufqueue1_test",  0, 10, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_1_test);
    BUFQUEUE_VAL_CHK(ret == K_OK);
    next_test_case_wait();
    return 0;
}
