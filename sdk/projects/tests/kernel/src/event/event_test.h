/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     event_test.h
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef EVENT_TEST_H
#define EVENT_TEST_H

#include "dtest.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TASK_EVENT_PRI       16

//#define MYASSERT(value) do {ASSERT_TRUE(value);if ((int)(value) == 0) { printf("xxxx: %d \n", __LINE__); return 1; }} while (0)
#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("kernel event test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

extern k_task_handle_t   task_event;
extern k_task_handle_t   task_event_co1;
extern k_task_handle_t   task_event_co2;
extern k_event_handle_t  test_event;
extern k_event_handle_t  test_event_ext;

typedef uint8_t (*test_func_t)(void);

void task_event_entry_register(const char *name, test_func_t *runner, uint8_t casenum);
void task_event_entry(void *arg);
void event_test(void);
void event_param_test(void);
void event_opr_test(void);
void event_break_test(void);
void event_reinit_test(void);
void event_coopr_test(void);

#ifdef __cplusplus
}
#endif

#endif /* EVENT_TEST_H */

