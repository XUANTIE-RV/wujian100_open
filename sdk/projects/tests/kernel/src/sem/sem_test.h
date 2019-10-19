/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     sem_test.h
 * @brief     head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef SEM_TEST_H
#define SEM_TEST_H
#ifdef __cplusplus
extern "C" {
#endif


#define TASK_SEM_PRI         19

//#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) { return 1; }} while (0)
#define MYASSERT(value) do {ASSERT_TRUE(value); if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("semaphore test is [FAIL %d], func %s, line %d\n", \
                   ++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

extern k_task_handle_t task_sem;
extern k_task_handle_t task_sem_co1;
extern k_task_handle_t task_sem_co2;
extern k_sem_handle_t  test_sem;
extern k_sem_handle_t  test_sem_ext;
extern k_sem_handle_t  test_sem_co1;
extern k_sem_handle_t  test_sem_co2;

typedef uint8_t (*test_func_t)(void);

void task_sem_entry_register(const char *name, test_func_t *runner, uint8_t casnum);
void task_sem_entry(void *arg);
void sem_test(void);
void sem_param_test(void);
void sem_break_test(void);
void sem_reinit_test(void);
void sem_count_test(void);
void sem_opr_test(void);
void sem_coopr1_test(void);
void sem_coopr2_test(void);

#ifdef __cplusplus
}
#endif

#endif /* SEM_TEST_H */

