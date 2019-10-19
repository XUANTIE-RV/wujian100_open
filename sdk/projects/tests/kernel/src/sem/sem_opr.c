/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     sem_opr.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "sem_test.h"

#define MODULE_NAME     "sem_opr"
#define MODULE_NAME_CO1 "sem_coopr1"
#define MODULE_NAME_CO2 "sem_coopr2"

#define LOOP_CNT        8

static uint8_t sem_opr_case1(void)
{
    k_status_t   ret;
    int32_t      cnt;

    test_sem = csi_kernel_sem_new(10, 3);
    MYASSERT(test_sem != NULL);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_wait(test_sem, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_sem_post(test_sem);
    MYASSERT(ret == K_OK);

    cnt = csi_kernel_sem_get_count(test_sem);
    MYASSERT(cnt == 3);

    ret = csi_kernel_sem_del(test_sem);
    MYASSERT(ret == K_OK);

    return 0;
}

static const test_func_t sem_func_runner[] = {
    sem_opr_case1,
    NULL
};

void sem_opr_test(void)
{
    k_status_t ret;

    task_sem_entry_register(MODULE_NAME, (test_func_t *)sem_func_runner, sizeof(sem_func_runner) / sizeof(test_case_t));

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_entry, MODULE_NAME, 0, TASK_SEM_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}

static void task_sem_coopr1_co1_entry(void *arg)
{
    k_status_t ret;
    uint8_t cnt = 0;

    test_sem = csi_kernel_sem_new(16, 3);

    if (test_sem == NULL) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO1, FAIL);
        return;
    }

    csi_kernel_sem_wait(test_sem, 100);
    csi_kernel_sem_wait(test_sem, 100);
    csi_kernel_sem_wait(test_sem, 100);

    while (1) {
        ret = csi_kernel_sem_wait(test_sem, WAIT_FOREVER);

        if (ret == K_OK) {
            cnt++;

            if (cnt >= LOOP_CNT) {
                test_sem = csi_kernel_sem_new(20, 16);
                break;
            }
        } else {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO1, FAIL);

            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());

            return;
        }
    }

    test_case_success++;
    PRINT_RESULT(MODULE_NAME_CO1, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_sem_coopr1_co2_entry(void *arg)
{
    uint8_t     cnt = 0;
    int32_t     sem_cnt;

    while (1) {
        if (cnt < LOOP_CNT) {
            cnt++;
            csi_kernel_sem_post(test_sem);
        } else {
            sem_cnt = csi_kernel_sem_get_count(test_sem);

            if (sem_cnt == 16) {
                break;
            }
        }

    }

    csi_kernel_sem_del(test_sem);

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void sem_coopr1_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_coopr1_co1_entry, MODULE_NAME, 0, TASK_SEM_PRI + 1, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem_co1);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_coopr1_co2_entry, MODULE_NAME, 0, TASK_SEM_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem_co2);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}

static void task_sem_coopr2_co1_entry(void *arg)
{
    k_status_t ret;

    test_sem_co1 = csi_kernel_sem_new(1, 0);

    ret = csi_kernel_sem_wait(test_sem_co1, WAIT_FOREVER);

    TEST_FW_VAL_CHK(MODULE_NAME_CO2, ret == K_OK);

    if (test_case_check_err > 0) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    } else {
        test_case_success++;
        PRINT_RESULT(MODULE_NAME_CO2, PASS);
    }

    csi_kernel_sem_del(test_sem_co1);
    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_sem_coopr2_co2_entry(void *arg)
{
    k_status_t ret;

    test_sem_co2 = csi_kernel_sem_new(1, 0);

    while (1) {
        /* no task block on the semaphore and wait notification from other task */
        csi_kernel_delay(5);
        ret = csi_kernel_sem_wait(test_sem_co2, NO_WAIT);

        if (ret == K_OK) {
            csi_kernel_sem_post(test_sem_co1);
            break;
        }
    }

    csi_kernel_sem_del(test_sem_co2);
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_sem_coopr2_co3_entry(void *arg)
{
    k_status_t ret;

    while (1) {
        ret = csi_kernel_sem_post(test_sem_co2);

        if (ret == K_OK) {
            break;
        }
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void sem_coopr2_test(void)
{
    k_status_t ret;
    test_case_check_err = 0;

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_coopr2_co1_entry, MODULE_NAME, 0, TASK_SEM_PRI + 2, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem);

    TEST_FW_VAL_CHK(MODULE_NAME_CO2, ret == K_OK);

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_coopr2_co2_entry, MODULE_NAME, 0, TASK_SEM_PRI + 1, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem_co1);

    TEST_FW_VAL_CHK(MODULE_NAME_CO2, ret == K_OK);

    ret = csi_kernel_task_new((k_task_entry_t)task_sem_coopr2_co3_entry, MODULE_NAME, 0, TASK_SEM_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_sem_co2);

    TEST_FW_VAL_CHK(MODULE_NAME_CO2, ret == K_OK);

    next_test_case_wait();
}
