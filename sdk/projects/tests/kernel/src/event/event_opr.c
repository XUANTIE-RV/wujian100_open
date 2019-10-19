/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     event_opr.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "event_test.h"

#define MODULE_NAME     "event_opr"
#define MODULE_NAME_CO  "event_coopr"

#define TEST_FLAG         0x005a5a5a
#define CHK_AND_ALL_FLAG  0x005a5a5a
#define CHK_AND_ONE_FLAG  0x00000002
#define CHK_AND_ZERO_FLAG 0x00000000
#define CHK_AND_PEND_FLAG 0x005a5a55

static uint8_t event_opr_case1(void)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    /* check event AND_CLEAR FLAG */
    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ALL_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == (TEST_FLAG & (~CHK_AND_ALL_FLAG)));

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ONE_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == (TEST_FLAG & (~CHK_AND_ONE_FLAG)));

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ZERO_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, NO_WAIT);
#ifdef CONFIG_KERNEL_FREERTOS
    MYASSERT(ret < 0);
#else
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == (TEST_FLAG & (~CHK_AND_ZERO_FLAG)));
#endif

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}

static uint8_t event_opr_case2(void)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);

    /* check event OR FLAG */
    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ALL_FLAG, KEVENT_OPT_SET_ANY, NO_CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ONE_FLAG, KEVENT_OPT_SET_ANY, NO_CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ZERO_FLAG, KEVENT_OPT_SET_ANY, NO_CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret != 0);

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}

static uint8_t event_opr_case3(void)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);

    /* check event OR_CLEAR FLAG */
    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ALL_FLAG, KEVENT_OPT_SET_ANY, CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);
    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == (TEST_FLAG & (~CHK_AND_ALL_FLAG)));

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == TEST_FLAG);

    ret = csi_kernel_event_wait(test_event, CHK_AND_ONE_FLAG, KEVENT_OPT_SET_ANY, CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == K_OK);
    MYASSERT(actl_flags == TEST_FLAG);

    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == (TEST_FLAG & (~CHK_AND_ONE_FLAG)));

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);
    MYASSERT(ret_flags == TEST_FLAG);

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}

static uint8_t event_opr_case4(void)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    /* try to get event flag in case of sched disable */
    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK && ret_flags == TEST_FLAG);

    csi_kernel_sched_suspend();

    ret = csi_kernel_event_wait(test_event, CHK_AND_PEND_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret < 0);

    csi_kernel_sched_resume(0);

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}

static void task_event_opr_test_entry(void)
{
    event_opr_case1();
    event_opr_case2();
    event_opr_case3();
    event_opr_case4();

    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void event_opr_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_event_opr_test_entry, MODULE_NAME, 0, TASK_EVENT_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_event);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}

static void task_event_co1_entry(void *arg)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);

    if (!(test_event != NULL && ret == K_OK && ret_flags == TEST_FLAG)) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO, FAIL);
        return;
    }

    while (1) {
        ret = csi_kernel_event_wait(test_event, ~CHK_AND_ALL_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);

        if (ret == K_OK) {
            break;
        } else {
            test_case_fail++;
            PRINT_RESULT(MODULE_NAME_CO, FAIL);

            csi_kernel_event_del(test_event);

            next_test_case_notify();
            csi_kernel_task_del(csi_kernel_task_get_cur());

            return;
        }
    }

    test_case_success++;
    PRINT_RESULT(MODULE_NAME_CO, PASS);

    csi_kernel_event_del(test_event);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_event_co2_entry(void *arg)
{
    while (1) {
        uint32_t ret;
        csi_kernel_event_set(test_event, ~CHK_AND_ALL_FLAG, &ret);
        break;
    }

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void event_coopr_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_event_co1_entry, MODULE_NAME, 0, TASK_EVENT_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_event_co1);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_event_co2_entry, MODULE_NAME, 0, TASK_EVENT_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_event_co2);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }
}

