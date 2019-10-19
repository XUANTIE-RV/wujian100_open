/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_rev16(void)
{
    int i = 0;

    printf("Testing functions __REV16\n");

    /*
     * REV16
     * 两个半字各自按字节翻转.
     *
     * ASSERT_TRUE(__RBIT(0x12345678) = 0x34127856)
     */
    struct unary_calculation rev16_test[TEST_SIZE] = {
        {0x12345678, 0x34127856},
        {0x2a3a4a5a, 0x3a2a5a4a},
        {0x12233445, 0x23124534}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__REV16(rev16_test[i].op1) == rev16_test[i].result);
    }

    return 0;
}
