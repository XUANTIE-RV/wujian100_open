/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     timer_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "dtest.h"
#include "timer_test.h"

void timer_test(void)
{
#if 0
    task_timer_create_del_test();
    next_test_case_wait();

    task_timer_start_stop_test();
    next_test_case_wait();
#else
    dtest_suite_info_t test_suite_info = {
        "timer_test", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "task_timer_start_stop_test", (void *)task_timer_start_stop_test, 1 },
        { "task_timer_create_del_test", (void *)task_timer_create_del_test, 1 },
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

