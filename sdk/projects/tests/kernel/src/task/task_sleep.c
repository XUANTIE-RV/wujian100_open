/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     task_sleep.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>

#define LOOP_CNT 1

k_task_handle_t task_0_test;
static uint32_t cnt;

void task_sleep_entry(void *arg)
{
    while (1) {
        csi_kernel_delay(100);
        cnt++;

        if (cnt == LOOP_CNT) {
            test_case_success++;
            cnt = 0u;
            PRINT_RESULT("task_sleep", PASS);
            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());
        }
    }
}

void task_sleep_test(void)
{
    if (csi_kernel_task_new((k_task_entry_t)task_sleep_entry, "task_sleep_test", 0, 10, 0,
                            NULL, TEST_CASE_TASK_SIZE, &task_0_test) != K_OK) {
        printf("task_sleep_test failed \n");
    }

    next_test_case_wait();
}
