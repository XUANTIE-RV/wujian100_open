/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     task_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/
#include <test_util.h>
#include "dtest.h"

extern void task_sleep_test(void);
extern void task_suspend_test(void);
extern void task_yield_test(void);
extern void task_create_test(void);
extern void task_param_test(void);

void task_test(void)
{
#if 0
    /*Added by Csky Test Team*/
    task_create_test();
    next_test_case_wait();
    task_param_test();
    next_test_case_wait();
    /*----------------------*/
    task_sleep_test();
    next_test_case_wait();
    task_suspend_test();
    next_test_case_wait();
    task_yield_test();
    next_test_case_wait();
#else
    dtest_suite_info_t test_suite_info = {
        "test_task", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "task_create_test", task_create_test, 1 },
        { "task_param_test", task_param_test, 1 },
        { "task_sleep_test", task_sleep_test, 1 },
        { "task_suspend_test", task_suspend_test, 1 },
#ifndef CONFIG_KERNEL_UCOS
        { "task_yield_test", task_yield_test, 1 },
#endif
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

