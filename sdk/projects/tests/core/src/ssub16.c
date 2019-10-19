/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ssub16(void)
{
    int i = 0;

    printf("Testing functions __SSUB16\n");

    /*
     * SSUB16
     * 两个操作数都是由两个16位有符号数组成，两个操作数的高低半字各自相减
     *
     * ASSERT_TRUE(__SSUB16 (0x56785678, 0x12345678) == 0x44440000)
     */
    struct binary_calculation ssub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSUB16(ssub16_test[i].op1, ssub16_test[i].op2) == ssub16_test[i].result);
    }


    return 0;
}
