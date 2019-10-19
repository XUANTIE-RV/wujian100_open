/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqadd8(void)
{
    int i = 0;

    printf("Testing functions __UQADD8\n");

    /*
     * UQADD8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节饱和相加
     *
     * ASSERT_TRUE(__UQADD8 (0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uqadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0xF0000000, 0xFF341234},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQADD8(uqadd8_test[i].op1, uqadd8_test[i].op2) == uqadd8_test[i].result);
    }


    return 0;
}
