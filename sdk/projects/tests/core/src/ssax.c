/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ssax(void)
{
    int i = 0;

    printf("Testing functions __SSAX\n");

    /*
     * SSAX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的高低半字，
     * 然后两个操作数的低半字相加，高半字相减
     *
     * ASSERT_TRUE(__SSAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation ssax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0xBBBC68AC},
        {0x12341234, 0x12341234, 0x00002468},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAX(ssax_test[i].op1, ssax_test[i].op2) == ssax_test[i].result);
    }


    return 0;
}
