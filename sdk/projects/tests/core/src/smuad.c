/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smuad(void)
{
    int i = 0;

    printf("Testing functions __SMUAD\n");

    /*
     * SMUAD
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字分别相乘，然后相加
     *
     * ASSERT_TRUE(__SMUAD (0x12345678, 0x12345678) == 0x1E8032D0)
     */
    struct binary_calculation smuad_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1E8032D0},
        {0x12341234, 0x12341234, 0x0296B520},
        {0x12345678, 0x12341234, 0x07715AF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUAD(smuad_test[i].op1, smuad_test[i].op2) == smuad_test[i].result);
    }


    return 0;
}
