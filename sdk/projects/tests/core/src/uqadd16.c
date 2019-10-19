/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uqadd16(void)
{
    int i = 0;

    printf("Testing functions __UQADD16\n");

    /*
     * UQADD16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字饱和相加
     *
     * ASSERT_TRUE(__UQADD16 (0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uqadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0xF0000000, 0xFFFF1234},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQADD16(uqadd16_test[i].op1, uqadd16_test[i].op2) == uqadd16_test[i].result);
    }



    return 0;
}
