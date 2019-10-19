/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     mm_blk_test.h
 * @brief    the head file
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#ifndef MM_BLK_TEST_H
#define MM_BLK_TEST_H

#include "dtest.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TASK_MM_BLK_PRI      16

#define MBLK_POOL_SIZE       64

#define MYASSERT(value) do {ASSERT_TRUE(value);  if((int)(value) == 0) {printf("ERROR: %s:%d, ERROR-NO: %d\n", __FUNCTION__, __LINE__, value); }} while (0)

extern k_mpool_handle_t mblk_pool_test;
extern char mblk_pool[MBLK_POOL_SIZE];

typedef uint8_t (*test_func_t)(void);

void task_mm_blk_entry_register(const char *name, test_func_t *runner, uint8_t casenum);
void task_mm_blk_entry(void *arg);
void mm_blk_test(void);
void mm_blk_param_test(void);
void mm_blk_opr_test(void);
void mm_blk_break_test(void);
void mm_blk_reinit_test(void);
void mm_blk_fragment_test(void);
void mm_blk_coopr_test(void);

#ifdef __cplusplus
}
#endif

#endif /* MM_BLK_TEST_H */

