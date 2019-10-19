/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     task_param.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "task_test.h"

k_task_handle_t param_test;
k_task_handle_t task_param_test_1;

void task_test_entry(void) {}

static uint8_t task_param_entry(void)
{
    int ret;

    ret = csi_kernel_task_new(NULL, "param_test", NULL, 10, 0,
                              NULL, TEST_CASE_TASK_SIZE, NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_task_new((k_task_entry_t)task_test_entry, "param_test", NULL, 10, 0,
                              NULL, TEST_CASE_TASK_SIZE, NULL);
    MYASSERT(ret == -EINVAL);

    csi_kernel_task_suspend(NULL);
    MYASSERT(ret == -EINVAL);

    csi_kernel_task_resume(NULL);
    MYASSERT(ret == -EINVAL);

    test_case_success++;
    PRINT_RESULT("task_param", PASS);
    next_test_case_notify();
    ret = csi_kernel_task_del(csi_kernel_task_get_cur());
    MYASSERT(ret == K_OK);
    return 0;
}

void task_param_test(void)
{
    if (csi_kernel_task_new((k_task_entry_t)task_param_entry, "task_param_test", 0, 10, 0,
                            NULL, TEST_CASE_TASK_SIZE, &param_test) != K_OK) {
        printf("task_sleep_test failed \n");
        test_case_fail++;
        PRINT_RESULT("task_param", FAIL);
    }

    next_test_case_wait();
}
