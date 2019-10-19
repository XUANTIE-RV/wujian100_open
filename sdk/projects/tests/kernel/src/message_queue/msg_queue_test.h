/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     msg_queue_test.h
 * @brief
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef BUF_QUEUE_TEST_H
#define BUF_QUEUE_TEST_H

#include "dtest.h"

#ifdef __cplusplus
extern "C" {
#endif

#define FRONT 1
#define BACK  0

#define BUFQUEUE_VAL_CHK(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("message queue test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

k_status_t task_buf_queue_send_test(void);
k_status_t task_buf_queue_recv_test(void);
k_status_t task_buf_queue_del_test(void);
k_status_t task_buf_queue_flush_test(void);
k_status_t task_buf_queue_dyn_create_test(void);

#ifdef __cplusplus
}
#endif

#endif /* BUF_QUEUE_TEST_H */
