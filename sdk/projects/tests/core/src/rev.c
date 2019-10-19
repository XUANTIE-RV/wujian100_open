/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_rev(void)
{
    int i = 0;

    printf("Testing functions __REV\n");

    /*
     * REV
     * 按字节翻转
     *
     * ASSERT_TRUE(__RBIT(0x12345678) == 0x78563412)
     */
    struct unary_calculation rev_test[TEST_SIZE] = {
        {0x12345678, 0x78563412},
        {0x2a3a4a5a, 0x5a4a3a2a},
        {0x12233445, 0x45342312}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__REV(rev_test[i].op1) == rev_test[i].result);
    }

    return 0;
}
