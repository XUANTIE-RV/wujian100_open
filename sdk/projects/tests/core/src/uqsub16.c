/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqsub16(void)
{
    int i = 0;

    printf("Testing functions __UQSUB16\n");

    /*
     * UQSUB16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字分别饱和相减
     *
     * ASSERT_TRUE(__UQSUB16 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation uqsub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x00001234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSUB16(uqsub16_test[i].op1, uqsub16_test[i].op2) == uqsub16_test[i].result);
    }


    return 0;
}
