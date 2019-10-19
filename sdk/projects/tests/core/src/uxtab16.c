/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uxtab16(void)
{
    int i = 0;

    printf("Testing functions __UXTAB16\n");

    /*
     * UXTAB16
     * 将第二个操作数两个8位数零扩展到16位数，然后与第一个操作数的两个16位数相加
     *
     * ASSERT_TRUE(__UXTB16 (0x56785678, 0x00F00170) == 0x576856E8)
     */
    struct binary_calculation uxtab16_test[TEST_SIZE] = {
        {0x12345678, 0x00F00170, 0x132456E8},
        {0x12341234, 0xF0000000, 0x12341234},
        {0x12345678, 0x12341234, 0x126856AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTAB16(uxtab16_test[i].op1, uxtab16_test[i].op2) == uxtab16_test[i].result);
    }


    return 0;
}
