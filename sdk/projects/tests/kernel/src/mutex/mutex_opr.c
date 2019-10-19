/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mutex_opr.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "mutex_test.h"

#define MODULE_NAME     "mutex_opr"
#define MODULE_NAME_CO1 "mutex_coopr1"
#define MODULE_NAME_CO2 "mutex_coopr2"

static void task_mutex_entry_private(void)
{
    k_status_t ret;

    test_mutex = csi_kernel_mutex_new();
    MYASSERT(test_mutex != NULL);

    ret = csi_kernel_mutex_unlock(test_mutex);
    MYASSERT(ret == -EPERM);

    ret = csi_kernel_mutex_lock(test_mutex, NO_WAIT);
    MYASSERT(ret == K_OK);

    csi_kernel_task_set_prio(csi_kernel_task_get_cur(), TASK_MUTEX_PRI);

    ret = csi_kernel_mutex_lock(test_mutex, NO_WAIT);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_unlock(test_mutex);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_unlock(test_mutex);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_mutex_del(test_mutex);
    MYASSERT(ret == K_OK);

    test_case_success++;
    PRINT_RESULT(MODULE_NAME_CO2, PASS);

    next_test_case_notify();

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void mutex_opr_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_entry_private, MODULE_NAME_CO2, 0, TASK_MUTEX_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    next_test_case_wait();

}

void task_mutex_coopr1_co1_entry(void *arg)
{
    k_status_t ret;

    while (1) {
        csi_kernel_delay(10);
#if 0
        csi_kernel_sched_suspend();
        ret = csi_kernel_mutex_lock(test_mutex, WAIT_FOREVER);

        if (ret < 0) {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO1, FAIL);
        }

        csi_kernel_sched_resume(0);

        ret = csi_kernel_mutex_lock(test_mutex, NO_WAIT);

        if (ret < 0) {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO1, FAIL);
        }

#endif
        ret = csi_kernel_mutex_lock(test_mutex, WAIT_FOREVER);

        if (ret != K_OK) {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO1, FAIL);
        }

        csi_kernel_mutex_unlock(test_mutex);

        break;
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void task_mutex_coopr1_co2_entry(void *arg)
{
    uint8_t pri;

    test_mutex = csi_kernel_mutex_new();
    MYASSERT(test_mutex != NULL);

    while (1) {
        csi_kernel_mutex_lock(test_mutex, WAIT_FOREVER);
        csi_kernel_delay(10);

        /* now, the task's priority is revert */
        pri = csi_kernel_task_get_prio(csi_kernel_task_get_cur());

        if (pri != TASK_MUTEX_PRI + 1) {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO1, FAIL);
            csi_kernel_mutex_del(test_mutex);

            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());

            return;
        } else {
            break;
        }
    }

    csi_kernel_mutex_unlock(test_mutex);

    test_case_success++;
    PRINT_RESULT(MODULE_NAME_CO1, PASS);

    csi_kernel_mutex_del(test_mutex);
    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

/* the case is to test a mutex task owner 's priority revert in case of another higher
 * priority task try to get mutex */
void mutex_coopr1_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_coopr1_co1_entry, MODULE_NAME_CO1, 0, TASK_MUTEX_PRI + 1, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex_co1);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_coopr1_co2_entry, MODULE_NAME_CO1, 0, TASK_MUTEX_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex_co2);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    next_test_case_wait();
}

static void task_mutex_coopr2_co1_entry(void *arg)
{
    k_status_t ret;

    while (1) {
        csi_kernel_delay(10);

        ret = csi_kernel_mutex_lock(test_mutex_co1, WAIT_FOREVER);

        if (ret != K_OK) {
            break;
        }

        csi_kernel_mutex_unlock(test_mutex_co1);

        break;
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_mutex_coopr2_co2_entry(void *arg)
{
    while (1) {
        csi_kernel_delay(10);

        csi_kernel_mutex_lock(test_mutex_co2, WAIT_FOREVER);
        csi_kernel_mutex_lock(test_mutex_co2, WAIT_FOREVER);

        break;
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_mutex_coopr2_co3_entry(void *arg)
{
    uint8_t pri;

    test_mutex_co1 = csi_kernel_mutex_new();
    MYASSERT(test_mutex_co1 != NULL);
    test_mutex_co2 = csi_kernel_mutex_new();
    MYASSERT(test_mutex_co2 != NULL);

    while (1) {
        csi_kernel_mutex_lock(test_mutex_co1, WAIT_FOREVER);
        csi_kernel_mutex_lock(test_mutex_co2, WAIT_FOREVER);

        csi_kernel_delay(20);
        pri = csi_kernel_task_get_prio(csi_kernel_task_get_cur());

        if (pri == TASK_MUTEX_PRI + 2) {
            csi_kernel_mutex_unlock(test_mutex_co1);

            pri = csi_kernel_task_get_prio(csi_kernel_task_get_cur());

            if (pri >= TASK_MUTEX_PRI) {
                csi_kernel_mutex_unlock(test_mutex_co2);

                pri = csi_kernel_task_get_prio(csi_kernel_task_get_cur());

                if (pri == TASK_MUTEX_PRI) {
                    break;
                } else {
                    test_case_fail++;
                    PRINT_RESULT(MODULE_NAME_CO2, FAIL);

                    csi_kernel_mutex_del(test_mutex);

                    next_test_case_notify();
                    csi_kernel_task_del(csi_kernel_task_get_cur());

                    return;
                }
            } else {
                test_case_fail++;
                PRINT_RESULT(MODULE_NAME_CO2, FAIL);

                csi_kernel_mutex_del(test_mutex);

                next_test_case_notify();
                csi_kernel_task_del(csi_kernel_task_get_cur());

                return;
            }
        } else {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO2, FAIL);

            csi_kernel_mutex_del(test_mutex);

            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());

            return;
        }

    }

    test_case_success++;
    PRINT_RESULT(MODULE_NAME_CO2, PASS);
    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}


void mutex_coopr2_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_coopr2_co1_entry, MODULE_NAME_CO2, 0, TASK_MUTEX_PRI + 2, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex_co1);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_coopr2_co2_entry, MODULE_NAME_CO2, 0, TASK_MUTEX_PRI + 1, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex_co2);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_mutex_coopr2_co3_entry, MODULE_NAME_CO2, 0, TASK_MUTEX_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mutex_co3);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO2, FAIL);
    }

    next_test_case_wait();
}

