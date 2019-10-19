/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smusd(void)
{
    int i = 0;

    printf("Testing functions __SMUSD\n");

    /*
     * SMUSD
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字分别相乘，然后相减
     *
     * ASSERT_TRUE(__SMUSD(0x12345678, 0x12345678) == 0xE4168250)
     */
    struct binary_calculation smusd_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1BE97DB0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x04DAA5D0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUSD(smusd_test[i].op1, smusd_test[i].op2) == smusd_test[i].result);
    }

    return 0;
}
