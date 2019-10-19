/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mutex_test.h
 * @brief    head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef MUTEX_TEST_H
#define MUTEX_TEST_H

#include "dtest.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TASK_MUTEX_PRI         16

//#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) { printf("line:%d\n", __LINE__);return 1; }} while (0)

#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("mutex test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

extern k_task_handle_t  task_mutex;
extern k_task_handle_t  task_mutex_co1;
extern k_task_handle_t  task_mutex_co2;
extern k_task_handle_t  task_mutex_co3;
extern k_mutex_handle_t test_mutex_dyn;
extern k_mutex_handle_t  test_mutex;
extern k_mutex_handle_t  test_mutex_co1;
extern k_mutex_handle_t  test_mutex_co2;

typedef uint8_t (*test_func_t)(void);

void task_mutex_entry_register(const char *name, test_func_t *runner, uint8_t casnum);
void task_mutex_entry(void *arg);
void mutex_test(void);
void mutex_param_test(void);
void mutex_opr_test(void);
void mutex_reinit_test(void);
void mutex_coopr1_test(void);
void mutex_coopr2_test(void);

#ifdef __cplusplus
}
#endif

#endif /* MUTEX_TEST_H */

