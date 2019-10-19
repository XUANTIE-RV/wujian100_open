/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mm_blk_test.c
 * @brief    the main function
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#include <test_util.h>
#include "dtest.h"
#include "mm_blk_test.h"

//k_task_handle_t    task_mm_blk;
//k_task_handle_t    task_mm_blk_co;
k_mpool_handle_t   mblk_pool_test;
char        mblk_pool[MBLK_POOL_SIZE];

static test_func_t *module_runner;
static const char  *module_name;
static uint8_t      module_casenum;

/*
static const test_case_t mm_blk_case_runner[] = {
    mm_blk_param_test,
    mm_blk_opr_test,
    mm_blk_reinit_test,
    mm_blk_fragment_test,
    mm_blk_coopr_test,
    NULL
};
*/
void mm_blk_test(void)
{
#if 0

    if (test_case_register((test_case_t *)mm_blk_case_runner) == 0) {
        test_case_run();
        test_case_unregister();
    }

#else
    dtest_suite_info_t test_suite_info = {
        "mm_blk_test", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "mm_blk_param_test", mm_blk_param_test, 1 },
        { "mm_blk_opr_test", mm_blk_opr_test, 1 },
        { "mm_blk_reinit_test", mm_blk_reinit_test, 1 },
        { "mm_blk_fragment_test", mm_blk_fragment_test, 1 },
        { "mm_blk_coopr_test", mm_blk_coopr_test, 1 },
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);
#endif
}

void task_mm_blk_entry_register(const char *name, test_func_t *runner, uint8_t casenum)
{
    module_runner  = runner;
    module_name    = name;
    module_casenum = casenum;
}

void task_mm_blk_entry(void *arg)
{
    test_func_t *runner;
    uint8_t      caseidx;
    char         name[64];
    uint8_t      casenum;

    runner  = (test_func_t *)module_runner;
    casenum = module_casenum;
    caseidx = 0;

    while (1) {
        if (*runner == NULL) {
            break;
        }

        if (casenum > 2) {
            caseidx++;
            sprintf(name, "%s_%d", module_name, caseidx);
        } else {
            sprintf(name, "%s", module_name);
        }

        if ((*runner)() == 0) {
            test_case_success++;
            PRINT_RESULT(name, PASS);
        } else {
            test_case_fail++;
            PRINT_RESULT(name, FAIL);
        }

        runner++;
    }

    next_test_case_notify();
    csi_kernel_task_del(csi_kernel_task_get_cur());
}
