/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smusdx(void)
{
    int i = 0;

    printf("Testing functions __SMUSDX\n");

    /*
     * SMUSDX
     * 两个操作数都是由两个16位有符号数组成，第二个操作数先交换高低半字，
     * 然后两个操作数的低半字和高半字相乘，然后相减
     *
     * ASSERT_TRUE(__SMUSDX(0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation smusdx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x04DAA5D0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUSDX(smusdx_test[i].op1, smusdx_test[i].op2) == smusdx_test[i].result);
    }


    return 0;
}
