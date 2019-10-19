/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqsub8(void)
{
    int i = 0;

    printf("Testing functions __UQSUB8\n");

    /*
     * UQSUB8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节饱和相减
     *
     * ASSERT_TRUE(__UQSUB8 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation uqsub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x00341234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSUB8(uqsub8_test[i].op1, uqsub8_test[i].op2) == uqsub8_test[i].result);
    }



    return 0;
}
