/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_usad8(void)
{
    int i = 0;

    printf("Testing functions __UQSAD8\n");

    /*
     * USAD8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，然后将4个结果累加为一个无符号数
     *
     * ASSERT_TRUE(__USAD8 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation usad8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,  0x0},
        {0x12341234, 0xF0000000, 0x9C},
        {0x12345678, 0x12341234, 0x88}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAD8(usad8_test[i].op1, usad8_test[i].op2) == usad8_test[i].result);
    }


    return 0;
}
