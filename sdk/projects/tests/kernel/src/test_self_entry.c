/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     test_self_entry.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include <csi_config.h>
#include <test_kernel_config.h>

#define      TEST_CASE_TASK_STACK_SIZE 2048
k_task_handle_t      test_case_task;

#if 0
#define      TEST_ENHENCE_TASK_STACK_SIZE 2048
k_task_handle_t       test_enhence_task;
#endif

extern void task_test(void);
extern void mm_blk_test(void);
extern void event_test(void);
extern void sem_test(void);
extern void mutex_test(void);
extern void timer_test(void);
extern void buf_queue_test(void);

void test_case_task_entry(void *arg)
{
    test_case_init();

    dtest_init();

#if defined(TEST_EVENT)
    event_test();
#endif

#if defined(TEST_SEM)
    sem_test();
#endif

#if defined(TEST_MUTEX)
    mutex_test();
#endif

#if defined(TEST_SOFTWARE_TIMER)
    timer_test();
#endif

#if defined(TEST_MSGQ)
    buf_queue_test();
#endif

#if defined(TEST_TASK)
    task_test();
#endif

#if defined(TEST_MEMPOOL)
#ifndef CONFIG_KERNEL_FREERTOS
    mm_blk_test();
#endif
#endif

    dtest_run();

    dtest_print_result();

    dtest_cleanup();

    printf("all test finished, successfully tested %d, failed to tested %d\n",
           (int)test_case_success, (int)test_case_fail);

    while (1) {
        csi_kernel_delay(CSI_CONFIG_TICKS_PER_SECOND);
    }
}


void test_case_task_start(void)
{
    csi_kernel_task_new((k_task_entry_t)test_case_task_entry, "test_case_task", NULL, 7,
                        0, NULL, TEST_CASE_TASK_STACK_SIZE,
                        &test_case_task);
}

#if 0
void test_enhence_task_entry(void *arg)
{
    test_case_init();

    dtest_init();

#if defined(CONFIG_TEST_TASK)
    task_test();
#endif
#if defined(CONFIG_TEST_MEMPOOL)
    mm_blk_test();
#endif
#if defined(CONFIG_TEST_EVENT)
    event_test();
#endif
#if defined(CONFIG_TEST_SEM)
    sem_test();
#endif
#if defined(CONFIG_TEST_MUTEX)
    mutex_test();
#endif
#if defined(CONFIG_TEST_SOFTWARE_TIMER)
    timer_test();
#endif
#if defined(CONFIG_TEST_MSGQ)
    buf_queue_test();
#endif

    dtest_run();

    dtest_print_result();

    dtest_cleanup();

    printf("all test finished, successed test case %d, failed test case %d\n",
           (int)test_case_success, (int)test_case_fail);

    while (1) {
        csi_kernel_delay(CSI_CONFIG_TICKS_PER_SECOND);
    }
}

void test_enhence_task_start(void)
{
    csi_kernel_task_new((k_task_entry_t)test_enhence_task_entry, "test_enhence_task", NULL, 19,
                        0, NULL, TEST_ENHENCE_TASK_STACK_SIZE,
                        &test_enhence_task);
}
#endif
