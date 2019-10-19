/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqsax(void)
{
    int i = 0;

    printf("Testing functions __UQSAX\n");

    /*
     * UQSAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的高半字饱和相减，低半字饱和相加
     *
     * ASSERT_TRUE(__UQSAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation uqsax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x000068AC},
        {0x12341234, 0xF0000000, 0x1234FFFF},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSAX(uqsax_test[i].op1, uqsax_test[i].op2) == uqsax_test[i].result);
    }


    return 0;
}
