/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mm_blk_opr.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "mm_blk_test.h"

#define MODULE_NAME    "mm_blk_opr"
#define MODULE_NAME_CO "mm_blk_coopr"

static void *co_ptr;
static k_task_handle_t task_mm_blk;
static k_task_handle_t task_mm_blk_co;

static uint8_t mm_blk_opr_case1(void)
{
    void   *ptr;
    k_status_t ret;
    int32_t    blktotal;

    blktotal = MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2);
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, blktotal, MBLK_POOL_SIZE >> 2);
    MYASSERT(mblk_pool_test != NULL);

    ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    MYASSERT(ptr != NULL);

    ret = csi_kernel_mpool_free(mblk_pool_test, ptr);
    MYASSERT(ret == K_OK);

    csi_kernel_mpool_del(mblk_pool_test);

    return 0;
}

static const test_func_t mm_blk_func_runner[] = {
    mm_blk_opr_case1,
    NULL
};

void mm_blk_opr_test(void)
{
    k_status_t ret;

    task_mm_blk_entry_register(MODULE_NAME, (test_func_t *)mm_blk_func_runner, sizeof(mm_blk_func_runner) / sizeof(test_func_t));


    ret = csi_kernel_task_new((k_task_entry_t)task_mm_blk_entry, MODULE_NAME, 0, TASK_MM_BLK_PRI, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_mm_blk);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME, FAIL);
    }

    next_test_case_wait();
}

static void task_mm_blk_co1_entry(void *arg)
{
    int32_t    blktotal;

    blktotal = MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2);
    mblk_pool_test = csi_kernel_mpool_new((void *)mblk_pool, blktotal, MBLK_POOL_SIZE >> 2);
    MYASSERT(mblk_pool_test != NULL);

    co_ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    csi_kernel_delay(5);
    co_ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    csi_kernel_delay(5);
    co_ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    csi_kernel_delay(5);
    co_ptr = csi_kernel_mpool_alloc(mblk_pool_test, NO_WAIT);
    csi_kernel_delay(5);

    csi_kernel_task_del(csi_kernel_task_get_cur());
}

static void task_mm_blk_co2_entry(void *arg)
{
    int32_t    blktotal;
    blktotal = MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2);

    while (1) {
        csi_kernel_mpool_free(mblk_pool_test, co_ptr);
        csi_kernel_delay(5);
        csi_kernel_mpool_free(mblk_pool_test, co_ptr);
        csi_kernel_delay(5);
        csi_kernel_mpool_free(mblk_pool_test, co_ptr);
        csi_kernel_delay(5);
        csi_kernel_mpool_free(mblk_pool_test, co_ptr);
        csi_kernel_delay(5);

        break;
    }

    int32_t get_avail = blktotal - csi_kernel_mpool_get_count(mblk_pool_test);

    if (get_avail == (MBLK_POOL_SIZE / (MBLK_POOL_SIZE >> 2))) {
        test_case_success++;
        PRINT_RESULT(MODULE_NAME_CO, PASS);
    } else {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO, FAIL);
    }

    csi_kernel_mpool_del(mblk_pool_test);

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}

void mm_blk_coopr_test(void)
{
    k_status_t ret;

    ret = csi_kernel_task_new((k_task_entry_t)task_mm_blk_co1_entry, MODULE_NAME, 0, TASK_MM_BLK_PRI + 1, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_mm_blk);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO, FAIL);
    }

    ret = csi_kernel_task_new((k_task_entry_t)task_mm_blk_co2_entry, MODULE_NAME, 0, TASK_MM_BLK_PRI, 0,
                              NULL, TEST_CASE_TASK_SIZE, &task_mm_blk_co);

    if (ret != K_OK) {
        test_case_fail++;
        PRINT_RESULT(MODULE_NAME_CO, FAIL);
    }

    next_test_case_wait();
}

