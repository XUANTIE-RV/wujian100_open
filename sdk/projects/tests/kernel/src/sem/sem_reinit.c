/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     sem_reinit.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "sem_test.h"

#define MODULE_NAME "sem_reinit"

static uint8_t sem_reinit_case1(void)
{
    k_status_t ret;

    test_sem = csi_kernel_sem_new(5, 0);
    MYASSERT(test_sem != NULL);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_del(test_sem);
    MYASSERT(ret == K_OK);

    test_sem = csi_kernel_sem_new(5, 3);
    MYASSERT(test_sem != NULL);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    int32_t cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 3);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 4);

    ret = csi_kernel_sem_del(test_sem);
    MYASSERT(ret == K_OK);

    return 0;
}

static uint8_t sem_reinit_case2(void)
{
    k_status_t ret;

    test_sem = csi_kernel_sem_new(10, 3);
    MYASSERT(test_sem != NULL);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(NULL, NO_WAIT);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    int32_t cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 3);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 4);

    ret = csi_kernel_sem_del(test_sem);
    MYASSERT(ret == K_OK);

    return 0;
}

static void task_sem_reinit_entry(void)
{
    sem_reinit_case1();
    sem_reinit_case2();
    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());

}

void sem_reinit_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_reinit_entry, MODULE_NAME, 0, TASK_SEM_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}
