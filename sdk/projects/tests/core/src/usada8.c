/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_usada8(void)
{
    int i = 0;

    printf("Testing functions __USADA8\n");

    /*
     * USADA8
     * 前两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，然后将4个结果与第三个操作数累加为一个无符号数
     *
     * ASSERT_TRUE(__USADA8 (0x12345678, 0x12345678, 0x12345678) == 0x12345678)
     */
    struct ternary_calculation usada8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0xF0000000, 0x12345678, 0x123457d0},
        {0x12345678, 0x12341234, 0x12345678, 0x12345700}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USADA8(usada8_test[i].op1, usada8_test[i].op2, usada8_test[i].op3) == usada8_test[i].result);
    }


    return 0;
}
