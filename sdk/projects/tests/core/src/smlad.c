/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smlad(void)
{
    int i = 0;

    printf("Testing functions __SMLAD\n");

    /*
     * SMLAD
     * 前两个操作数都是由两个16位有符号数组成，将它们的高低半字各自相乘得到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLAD (0x12345678, 0x12345678, 0x12345678) == 0x30B48948)
     */
    struct ternary_calculation smlad_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x30B48948},
        {0x12341234, 0x12341234, 0x12341234, 0x14CAC754},
        {0x12345678, 0x12341234, 0x56781234, 0x5DE96D24}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLAD(smlad_test[i].op1, smlad_test[i].op2, smlad_test[i].op3) == smlad_test[i].result);
    }


    return 0;
}
