/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     msg_queue_recv.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>
#include "msg_queue_test.h"

#define TEST_BUFQUEUE_MSG0_SIZE     30
#define TEST_BUFQUEUE_BUF0_SIZE     64
#define TEST_BUFQUEUE_BUF0_ERR_SIZE 63
#define TEST_BUFQUEUE_MSG_MAX       12
#define TEST_BUFQUEUE_MSG_NUM       3
/* four char here */
static char send_char[TEST_BUFQUEUE_MSG_NUM + 1] = "yoc";

#define TEST_BUFQUEUE_RCV_TASK_RPI       12
#define TEST_BUFQUEUE_SND_TASK_HIGH_RPI  14
#define TEST_BUFQUEUE_SND_TASK_LOW_RPI   13

static k_task_handle_t      task_0_test;
static k_task_handle_t      task_1_test;
static k_task_handle_t      task_2_test;
static char         g_test_send_msg0[TEST_BUFQUEUE_MSG0_SIZE]     = {0};
static char         g_test_send_msg1[TEST_BUFQUEUE_MSG0_SIZE]     = {0};
static char         g_test_recv_msg0[TEST_BUFQUEUE_MSG0_SIZE]     = {0};
static k_msgq_handle_t g_test_bufqueue0;

static void buf_queue_recv_param_test(void)
{
    k_status_t ret;
    k_sem_handle_t  sem;

    ret = csi_kernel_msgq_get(NULL, g_test_recv_msg0, WAIT_FOREVER);
    BUFQUEUE_VAL_CHK(ret == -EINVAL);

    ret = csi_kernel_msgq_get(g_test_bufqueue0, NULL, WAIT_FOREVER);
    BUFQUEUE_VAL_CHK(ret == -EINVAL);

    sem = csi_kernel_sem_new(1, 0);
    BUFQUEUE_VAL_CHK(sem != NULL);

    ret = csi_kernel_msgq_get(sem, g_test_send_msg0, WAIT_FOREVER);
    BUFQUEUE_VAL_CHK(ret == -EPERM);
    csi_kernel_sem_del(sem);
}

static void buf_queue_send_param_test(void)
{
    k_status_t ret;
    k_sem_handle_t sem;

    ret = csi_kernel_msgq_put(g_test_bufqueue0, NULL, BACK, NO_WAIT);
    BUFQUEUE_VAL_CHK(ret == -EINVAL);

    ret = csi_kernel_msgq_put(NULL, NULL, BACK, NO_WAIT);
    BUFQUEUE_VAL_CHK(ret == -EINVAL);

    sem = csi_kernel_sem_new(1, 0);
    BUFQUEUE_VAL_CHK(sem != NULL);

    ret = csi_kernel_msgq_put(sem, g_test_send_msg0, BACK, NO_WAIT);
    BUFQUEUE_VAL_CHK(ret == -EPERM);
    csi_kernel_sem_del(sem);
}


static void task_queue1_entry(void *arg)
{
    k_status_t ret;

    g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_BUF0_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

    ret = csi_kernel_msgq_flush(g_test_bufqueue0);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    while (1) {
        memset(g_test_send_msg0, 'y', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg0, BACK, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        memset(g_test_send_msg0, 'o', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg0, FRONT, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        memset(g_test_send_msg0, 's', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg0, BACK, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        int32_t cur = csi_kernel_msgq_get_count(g_test_bufqueue0);
        BUFQUEUE_VAL_CHK(cur == 3);

        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

static void task_queue2_entry(void *arg)
{
    k_status_t ret;
    int count = 0;

    g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_BUF0_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

    ret = csi_kernel_msgq_flush(g_test_bufqueue0);
    BUFQUEUE_VAL_CHK(ret == K_OK);

    while (1) {
        memset(g_test_send_msg1, 's', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg1, FRONT, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);
        count++;

        memset(g_test_send_msg1, 'o', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg1, FRONT, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);
        count++;

        memset(g_test_send_msg1, 'y', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg1, FRONT, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);
        count++;

        memset(g_test_send_msg1, 'w', TEST_BUFQUEUE_MSG_MAX);
        ret = csi_kernel_msgq_put(g_test_bufqueue0, g_test_send_msg1, BACK, NO_WAIT);
        BUFQUEUE_VAL_CHK(ret == K_OK);
        count++;

        int32_t cur = csi_kernel_msgq_get_count(g_test_bufqueue0);
        BUFQUEUE_VAL_CHK(count == cur);
        csi_kernel_task_del(csi_kernel_task_get_cur());
    }
}

static void task_queue0_entry(void *arg)
{
    k_status_t ret;
    size_t  size = 0;
    int     count = 0;

    g_test_bufqueue0 = csi_kernel_msgq_new(TEST_BUFQUEUE_BUF0_SIZE / TEST_BUFQUEUE_MSG_MAX, TEST_BUFQUEUE_MSG_MAX);
    BUFQUEUE_VAL_CHK(g_test_bufqueue0 != NULL);

    /* check csi_kernel_msgq_get */
    buf_queue_recv_param_test();

    buf_queue_send_param_test();

    /* NO_WAIT */
    ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, NO_WAIT);
    BUFQUEUE_VAL_CHK(ret == -EPERM);
    /* check sched disalbe */
    ret = csi_kernel_sched_suspend();
    BUFQUEUE_VAL_CHK(ret == 0);
    ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, WAIT_FOREVER);
    BUFQUEUE_VAL_CHK(ret == -EPERM);
    csi_kernel_sched_resume(0);

    ret = csi_kernel_task_new((k_task_entry_t)task_queue1_entry, "task_bufqueue1_test",  0, TEST_BUFQUEUE_SND_TASK_LOW_RPI, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_1_test);

    BUFQUEUE_VAL_CHK(ret == K_OK);


    do {
        ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, WAIT_FOREVER);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        memset(g_test_send_msg0, send_char[count], TEST_BUFQUEUE_MSG_MAX);
        ret = memcmp(g_test_send_msg0, g_test_recv_msg0, size);
        BUFQUEUE_VAL_CHK(ret == 0);

        count ++;
    } while (count <  TEST_BUFQUEUE_MSG_NUM);


    ret = csi_kernel_task_new((k_task_entry_t)task_queue2_entry, "task_bufqueue2_test",  0, TEST_BUFQUEUE_SND_TASK_HIGH_RPI, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_2_test);

    BUFQUEUE_VAL_CHK(ret == K_OK);

    count = 0;

    do {
        ret = csi_kernel_msgq_get(g_test_bufqueue0, g_test_recv_msg0, WAIT_FOREVER);
        BUFQUEUE_VAL_CHK(ret == K_OK);

        memset(g_test_send_msg1, send_char[count], TEST_BUFQUEUE_MSG_MAX);
        ret = memcmp(g_test_send_msg1, g_test_recv_msg0, size);
        BUFQUEUE_VAL_CHK(ret == 0);

        count ++;
    } while (count <  TEST_BUFQUEUE_MSG_NUM);


    if (test_case_check_err == 0) {
        test_case_success++;
        PRINT_RESULT("buf queue recv", PASS);
    } else {
        test_case_check_err = 0;
        test_case_fail++;
        PRINT_RESULT("buf queue recv", FAIL);
    }

#if 0
    next_test_case_notify();
#endif
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

k_status_t task_buf_queue_recv_test(void)
{
    k_status_t ret;
    test_case_check_err = 0;

    ret = csi_kernel_task_new((k_task_entry_t)task_queue0_entry, "task_bufqueue0_test",  0, TEST_BUFQUEUE_RCV_TASK_RPI, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_0_test);
    BUFQUEUE_VAL_CHK(ret == K_OK);
#if 0
    next_test_case_wait();
#endif
    return 0;
}

