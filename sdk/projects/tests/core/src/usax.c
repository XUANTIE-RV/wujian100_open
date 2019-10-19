/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_usax(void)
{
    int i = 0;

    printf("Testing functions __USAX\n");

    /*
     * USAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，然后两个操作数的高半字相减，低半字相加
     *
     * ASSERT_TRUE(__USAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation usax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0xBBBC68AC},
        {0x12341234, 0xF0000000, 0x12340234},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAX(usax_test[i].op1, usax_test[i].op2) == usax_test[i].result);
    }


    return 0;
}
