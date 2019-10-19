/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_smmla(void)
{
    int i = 0;

    printf("Testing functions __SMMLA\n");

    /*
     * SMMLA
     * 两个32位有符号数相乘，将结果的高32位与第三个操作数相加
     *
     * ASSERT_TRUE(__SMMLA (0x12345678, 0x12345678, 0x12345678) == 0x137FBD54)
     */
    struct ternary_calculation smmla_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x137FBD54},
        {0x12341234, 0x12341234, 0x12341234, 0x137F6F5A},
        {0x12345678, 0x12341234, 0x56781234, 0x57C37435}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMMLA(smmla_test[i].op1, smmla_test[i].op2, smmla_test[i].op3) == smmla_test[i].result);
    }


    return 0;
}
