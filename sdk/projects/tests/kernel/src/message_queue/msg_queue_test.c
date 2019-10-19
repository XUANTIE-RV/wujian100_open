/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     msg_queue_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "dtest.h"
#include "msg_queue_test.h"

void buf_queue_test(void)
{
#if 0
    task_buf_queue_recv_test();
    next_test_case_wait();

    task_buf_queue_del_test();
    next_test_case_wait();

    task_buf_queue_flush_test();
    next_test_case_wait();

    task_buf_queue_dyn_create_test();
    next_test_case_wait();
#else
    dtest_suite_info_t test_suite_info = {
        "buf_queue_test", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "task_buf_queue_recv_test", (void *)task_buf_queue_recv_test, 1 },
        { "task_buf_queue_del_test", (void *)task_buf_queue_del_test, 1 },
        { "task_buf_queue_flush_test", (void *)task_buf_queue_flush_test, 1 },
        { "task_buf_queue_dyn_create_test", (void *)task_buf_queue_dyn_create_test, 1 },
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

