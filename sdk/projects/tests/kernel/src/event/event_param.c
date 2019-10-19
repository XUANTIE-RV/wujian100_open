/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     event_param.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "event_test.h"

#define MODULE_NAME "event_param"

#define TEST_FLAG   0x005a5a5a

static uint8_t event_param_case1(void)
{
    k_status_t ret;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_del(NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}

#if 0
static uint8_t event_param_case2(void)
{
    k_status_t  ret;
    uint32_t actl_flags;
    uint32_t ret_flags;

    test_event = csi_kernel_event_new();
    MYASSERT(test_event != NULL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_event_wait(NULL, 0, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_wait(test_event, 0, KEVENT_OPT_SET_ALL, CLEAR, NULL, WAIT_FOREVER);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_wait(test_event, 0xff, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret == -EPERM);

    ret = csi_kernel_event_wait(test_event, TEST_FLAG, KEVENT_OPT_SET_ALL, 0xff, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_wait(test_event, TEST_FLAG, KEVENT_OPT_SET_ALL, 0xff, &actl_flags, NO_WAIT);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_wait(test_event, 0xf0, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, NO_WAIT);
    MYASSERT(ret == -EPERM);

    ret = csi_kernel_event_wait(test_event, 0xf0, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret == -EPERM);


    ret = csi_kernel_event_wait(test_event, TEST_FLAG, KEVENT_OPT_SET_ALL, CLEAR, &actl_flags, WAIT_FOREVER);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_event_set(NULL, TEST_FLAG, &ret_flags);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_set(test_event, TEST_FLAG, &ret_flags);
    MYASSERT(ret == K_OK);

    ret = csi_kernel_event_get(NULL, &ret_flags);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_get(test_event, NULL);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_event_get(test_event, &ret_flags);
    MYASSERT(ret_flags == TEST_FLAG);

    ret = csi_kernel_event_del(test_event);
    MYASSERT(ret == K_OK);

    return 0;
}
#endif

static void task_event_param_entry(void *arg)
{
    event_param_case1();
    test_case_success++;
#if 0
    event_param_case2();
    test_case_success++;
#endif
    PRINT_RESULT(MODULE_NAME, PASS);
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void event_param_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_event_param_entry, MODULE_NAME, 0, TASK_EVENT_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_event);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }
}
