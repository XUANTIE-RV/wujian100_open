/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mm_blk_param.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "mm_blk_test.h"

#define MODULE_NAME "mm_blk_param"

static k_task_handle_t task_mm_blk;

static uint8_t mm_blk_param_case1(void)
{
    mblk_pool_test = csi_kernel_mpool_new(NULL, MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 1), MBLK_POOL_SIZE >> 1);
    MYASSERT(mblk_pool_test == NULL);

    /* check block size is less than half of pool size */
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, MBLK_POOL_SIZE / ((MBLK_POOL_SIZE >> 1) + 1), MBLK_POOL_SIZE >> 1);
    MYASSERT(mblk_pool_test == NULL);

    /* check block size is less than half of pool size */
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, MBLK_POOL_SIZE / MBLK_POOL_SIZE, MBLK_POOL_SIZE);
    MYASSERT(mblk_pool_test == NULL);

    /* check pool address is not align */
    mblk_pool_test = csi_kernel_mpool_new((void *)(mblk_pool + 1),  MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2), MBLK_POOL_SIZE >> 2);
    MYASSERT(mblk_pool_test == NULL);

    /* check block size is not align */
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, MBLK_POOL_SIZE / ((MBLK_POOL_SIZE >> 2) + 1), (MBLK_POOL_SIZE >> 2) + 1);
    MYASSERT(mblk_pool_test == NULL);

    /* check pool size is not align */
    mblk_pool_test = NULL;
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, (MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2)), MBLK_POOL_SIZE >> (2 + 1));
    MYASSERT(mblk_pool_test != NULL);

    return 0;
}

static uint8_t mm_blk_param_case2(void)
{
    k_status_t ret;
    void *ptr;

    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2), MBLK_POOL_SIZE >> 2);
    MYASSERT(mblk_pool_test != NULL);

    ptr = csi_kernel_mpool_alloc(NULL, NO_WAIT);
    MYASSERT(ptr == NULL);

    ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    MYASSERT(ptr != K_OK);

    ret = csi_kernel_mpool_free(NULL, ptr);
    MYASSERT(ret == -EINVAL);

    ret = csi_kernel_mpool_free(&mblk_pool_test, NULL);
    MYASSERT(ret == -EINVAL);

    return 0;
}

static void task_mm_blk_param_entry(void)
{
    mm_blk_param_case1();
    mm_blk_param_case2();
    test_case_success++;
    PRINT_RESULT(MODULE_NAME, PASS);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void mm_blk_param_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mm_blk_param_entry, MODULE_NAME, 0, TASK_MM_BLK_PRI, 0, NULL, TEST_CASE_TASK_SIZE, &task_mm_blk);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}

