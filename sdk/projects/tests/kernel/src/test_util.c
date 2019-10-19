/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     test_util.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include "test_util.h"
uint32_t            test_case_success;
uint32_t            test_case_fail;
uint32_t            test_case_check_err;
static k_sem_handle_t        test_case_sem;
static k_mutex_handle_t      test_case_mutex;
#if 0
static test_case_t *case_func_runner = NULL;
#endif

extern void task_test(void);

extern void mm_blk_test(void);

extern void event_test(void);

extern void sem_test(void);

extern void mutex_test(void);

extern void timer_test(void);

extern void buf_queue_test(void);

#if 0
test_case_map_t test_fw_map[] = {
    {"task_test", task_test},
    {"mm_blk_test", mm_blk_test},
    {"event_test", event_test},
    {"sem_test", sem_test},
    {"mutex_test", mutex_test},
    {"timer_test", timer_test},
    {"buf_queue_test", buf_queue_test},
    /* last must be NULL! */
    {NULL, NULL},
};

uint8_t test_case_register(test_case_t *case_runner)
{
    if (case_func_runner == NULL) {
        case_func_runner = case_runner;
        return 0;
    }

    return 1;
}

void test_case_unregister(void)
{
    if (case_func_runner != NULL) {
        case_func_runner = NULL;
    }
}

void test_case_run(void)
{
    test_case_t *runner;

    runner = (test_case_t *)case_func_runner;

    while (1) {
        if (*runner == NULL) {
            break;
        }

        (*runner)();
        runner++;
        next_test_case_wait();
    }
}

#endif

void test_case_init(void)
{
    test_case_success = 0;
    test_case_fail = 0;
    test_case_sem = csi_kernel_sem_new(1, 0);

    if (test_case_sem == NULL) {
        printf("test_case_sem create failed !\n");
    }

    test_case_mutex = csi_kernel_mutex_new();

    if (test_case_mutex == NULL) {
        printf("test_case_mutex create failed !\n");
    }
}

void test_case_cleanup(void)
{
    csi_kernel_sem_del(test_case_sem);
    csi_kernel_mutex_del(test_case_mutex);
}

void test_case_critical_enter(void)
{
    csi_kernel_mutex_lock(test_case_mutex, WAIT_FOREVER);
}

void test_case_critical_exit(void)
{
    csi_kernel_mutex_unlock(test_case_mutex);
}

void next_test_case_notify(void)
{
    if (csi_kernel_sem_post(test_case_sem) != K_OK) {
        printf("next_test_case_notify failed!!!\n");
    }
}

void next_test_case_wait(void)
{
    if (csi_kernel_sem_wait(test_case_sem, WAIT_FOREVER) != K_OK) {
        printf("next_test_case_wait failed!!!\n");
    }

    csi_kernel_delay(10);
}
