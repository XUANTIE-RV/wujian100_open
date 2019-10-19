/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     task_create.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>
#include "dtest.h"
#include "task_test.h"

#define HERE_TEST_TASK_NUM    8
k_task_handle_t task[HERE_TEST_TASK_NUM];
static int g_here_i = 0;

static uint8_t test_task_2_entry(void *arg)
{
    MYASSERT(g_here_i == (int)arg);
    test_case_success++;
    PRINT_RESULT("task_create", PASS);
#if 0
    next_test_case_notify();
#endif
    g_here_i ++;
    csi_kernel_task_del(task[(int)arg]);
    return 0;
}

void task_create_test(void)
{
    int i = 0;

    int ret;

    for (i = 0; i < HERE_TEST_TASK_NUM; i++) {
        ret = csi_kernel_task_new((k_task_entry_t)test_task_2_entry, "test_create_task", (void *)i, 14, 0, NULL, TEST_CASE_TASK_SIZE, &task[i]);
    }

    if (ret != K_OK) {
        printf("Error in thread#1 creation\n");
        test_case_fail++;
        PRINT_RESULT("task_create", FAIL);
        return;
    }

#if 0
    next_test_case_wait();
#endif
}
