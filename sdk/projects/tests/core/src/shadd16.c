/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_shadd16(void)
{
    int i = 0;

    printf("Testing functions __SHADD16\n");

    /*
     * SHADD16
     * 取两组有符号16位整数的平均数
     *
     * ASSERT_TRUE(__SHADD16(0x12341234, 0x12345678) == 0x12343456)
     */
    struct binary_calculation shadd16_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x12343456},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12345678, 0x12345678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHADD16(shadd16_test[i].op1, shadd16_test[i].op2) == shadd16_test[i].result);
    }


    return 0;
}
