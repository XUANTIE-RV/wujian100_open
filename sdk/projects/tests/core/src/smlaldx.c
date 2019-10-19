/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smlaldx(void)
{
    int i = 0;

    printf("Testing functions __SMLALDX\n");

    /*
     * SMLALDX
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位有符号数。
     * 先将第二个操作数的高低半字交换，再将前两个操作数的高低半字各自相乘得
     * 到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLALDX(0x12345678, 0x12345678, 0x1234567890) == 0x1240A27950)
     */
    struct ternary64_calculation smlaldx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1240A27950},
        {0x12341234, 0x12341234, 0x1234123490, 0x1236A8E9B0},
        {0x12345678, 0x12341234, 0x5678123490, 0x567F838F80}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLALDX(smlaldx_test[i].op1, smlaldx_test[i].op2, smlaldx_test[i].op3) == smlaldx_test[i].result);
    }


    return 0;
}
