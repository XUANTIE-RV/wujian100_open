/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_usub16(void)
{
    int i = 0;

    printf("Testing functions __USUB16\n");

    /*
     * USUB16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字各自相减。
     *
     * ASSERT_TRUE(__USUB16 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation usub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x22341234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USUB16(usub16_test[i].op1, usub16_test[i].op2) == usub16_test[i].result);
    }


    return 0;
}
