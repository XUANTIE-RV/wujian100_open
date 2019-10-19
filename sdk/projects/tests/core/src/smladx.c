/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smladx(void)
{
    int i = 0;

    printf("Testing functions __SMLADX\n");

    /*
     * SMLADX
     * 前两个操作数都是由两个16位有符号数组成，先将第二个操作数的高低半字交换，
     * 再将它们的高低半字各自相乘得到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLADX (0x12345678, 0x12345678, 0x12345678) == 0x1E805738)
     */
    struct ternary_calculation smladx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x1E805738},
        {0x12341234, 0x12341234, 0x12341234, 0x14CAC754},
        {0x12345678, 0x12341234, 0x56781234, 0x5DE96D24}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLADX(smladx_test[i].op1, smladx_test[i].op2, smladx_test[i].op3) == smladx_test[i].result);
    }


    return 0;
}
