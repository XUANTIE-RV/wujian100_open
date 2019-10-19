/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     msg_queue_create.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <stdio.h>
#include <test_util.h>

#include "msg_queue_test.h"

#define TEST_BUFQUEUE_MSG_MAX   4
#define TEST_BUFQUEUE_MAX_NUM   10
#define TEST_BUFQUEUE_SIZE      100
#define TEST_BUFQUEUE_MSG0_SIZE 10

static k_task_handle_t   task_0_test;
static k_task_handle_t    task_1_test;
static k_msgq_handle_t   g_test_bufqueue0;
static char         g_test_recv_msg0[TEST_BUFQUEUE_MSG0_SIZE];

static void queue_create_param_test(void)
{
    g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

    g_test_bufqueue0 = csi_kernel_msgq_new(0, 10);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 == NULL);

    g_test_bufqueue0 = csi_kernel_msgq_new(1, 0);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 == NULL);

    g_test_bufqueue0 = csi_kernel_msgq_new(0xffffffff, 0xffffffff);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 == NULL);

    g_test_bufqueue0 = csi_kernel_msgq_new(-1, -1);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 == NULL);
}

static void task_queue0_entry(void *arg)
{
    int     i;
    k_status_t ret = 0;

    while (1) {
        /* check csi_kernel_msgq_new param */
        queue_create_param_test();

        for (i = 1; i < TEST_BUFQUEUE_MAX_NUM; i++) {
            g_test_bufqueue0 = csi_kernel_msgq_new(i * 8 / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
            BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

            ret = csi_kernel_msgq_del(g_test_bufqueue0);
            BUFQUEUE_VAL_CHK(ret == K_OK);
        }

        g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
        BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

        ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, -1);
        BUFQUEUE_VAL_CHK(ret == -EPERM);

        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

static void task_queue1_entry(void *arg)
{
    k_status_t ret;
    ret = csi_kernel_msgq_del(g_test_bufqueue0);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    if (test_case_check_err == 0) {
        test_case_success++;
        PRINT_RESULT("buf queue dyn create&del", PASS);
    } else {
        test_case_check_err = 0;
        test_case_fail++;
        PRINT_RESULT("buf queue dyn create&del", FAIL);
    }

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

k_status_t task_buf_queue_dyn_create_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_queue0_entry, "task_bufqueue0_test",  0, 11, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_0_test);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    ret = csi_kernel_task_new((k_task_entry_t)task_queue1_entry, "task_bufqueue1_test",  0, 10, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_1_test);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    next_test_case_wait();
    return 0;
}
