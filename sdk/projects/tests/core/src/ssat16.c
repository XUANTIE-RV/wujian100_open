/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ssat16(void)
{
    int i = 0;

    printf("Testing functions __SSAT16\n");

    /*
     * SSAT16
     * 第一个操作数由两个16位有符号数组成，第二个操作数指明饱和的位数。
     * 用第二个操作数指明的饱和位数，处理第一个操作数中的两个有符号数
     *
     * ASSERT_TRUE(__SSAT16 (0x12340078, 8) == 0x7F0078)
     */
    struct binary_calculation ssat16_test[TEST_SIZE] = {
        {0x12345678, 8, 0x007F007F},
        {0x12341234, 4, 0x00070007},
        {0x12345678, 1, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAT16(ssat16_test[i].op1, ssat16_test[i].op2) == ssat16_test[i].result);
    }


    return 0;
}
