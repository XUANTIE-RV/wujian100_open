/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_sxtb16(void)
{
    int i = 0;

    printf("Testing functions __SXTB16\n");

    /*
     * SXTB16
     * 有符号扩展操作数中的两个8位数到16位
     * ASSERT_TRUE(__SXTB16 (0x00F0 0070) == 0xFFF00070)
     */
    struct unary_calculation sxtb16_test[TEST_SIZE] = {
        {0x00F00070, 0xFFF00070},
        {0x12341234, 0x00340034},
        {0x12345678, 0x00340078}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SXTB16(sxtb16_test[i].op1) == sxtb16_test[i].result);
    }


    return 0;
}
