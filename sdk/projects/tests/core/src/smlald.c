/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smlald(void)
{
    int i = 0;

    printf("Testing functions __SMLALD\n");

    /*
     * SMLALD
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位有符号数
     * 将前两个操作数的高低半字各自相乘得到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLALD(0x12345678, 0x12345678, 0x1234567890) == 0x1252D6AB60)
     */
    struct ternary64_calculation smlald_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1252D6AB60},
        {0x12341234, 0x12341234, 0x1234123490, 0x1236A8E9B0},
        {0x12345678, 0x12341234, 0x5678123490, 0x567F838F80}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLALD(smlald_test[i].op1, smlald_test[i].op2, smlald_test[i].op3) == smlald_test[i].result);
    }


    return 0;
}
