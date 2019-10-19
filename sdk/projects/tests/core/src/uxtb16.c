/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uxtb16(void)
{
    int i = 0;

    printf("Testing functions __UXTB16\n");

    /*
     * UXTB16
     * 零扩展操作数中的两个8位数到16位数
     *
     * ASSERT_TRUE(__UXTB16 (0x00F00170) == 0x00F00070)
     */
    struct unary_calculation uxtb16_test[TEST_SIZE] = {
        {0x00F00170, 0x00F00070},
        {0xF0000000,        0x0},
        {0x12341234, 0x00340034}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTB16(uxtb16_test[i].op1) == uxtb16_test[i].result);
    }


    return 0;
}
