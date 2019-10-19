/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_shadd8(void)
{
    int i = 0;

    printf("Testing functions __SHADD8\n");

    /*
     * SHADD8
     * 取两组4个8位有符号数的平均值
     *
     * ASSERT_TRUE(__SHADD8(0x12341234, 0x12345678) == 0x12343456)
     */
    struct binary_calculation shadd8_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x12343456},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12345678, 0x12345678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHADD8(shadd8_test[i].op1, shadd8_test[i].op2) == shadd8_test[i].result);
    }



    return 0;
}
