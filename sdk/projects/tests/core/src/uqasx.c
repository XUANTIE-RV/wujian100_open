/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqasx(void)
{
    int i = 0;

    printf("Testing functions __UQASX\n");

    /*
     * UQASX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的高半字饱和相加，低半字饱和相减
     *
     * ASSERT_TRUE(__UQASX (0x12345678, 0x12345678) == 0x68AC4444)
     */
    struct binary_calculation uqasx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x68AC4444},
        {0x12341234, 0xF0000000, 0x12340000},
        {0x12345678, 0x12341234, 0x24684444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQASX(uqasx_test[i].op1, uqasx_test[i].op2) == uqasx_test[i].result);
    }


    return 0;
}
