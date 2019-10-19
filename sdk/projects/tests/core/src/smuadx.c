/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smuadx(void)
{
    int i = 0;

    printf("Testing functions __SMUADX\n");

    /*
     * SMUADX
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字交叉相乘，然后相加
     *
     * ASSERT_TRUE(__SMUADX (0x12345678, 0x12345678) == 0xC4C00C0)
     */
    struct binary_calculation smuadx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x0C4C00C0},
        {0x12341234, 0x12341234, 0x0296B520},
        {0x12345678, 0x12341234, 0x07715AF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUADX(smuadx_test[i].op1, smuadx_test[i].op2) == smuadx_test[i].result);
    }


    return 0;
}
