/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_pkhbt(void)
{
    int i = 0;

    printf("Testing functions __PKHBT\n");
    /*
     * PKHBT
     * 将一个寄存器中的16位数与另外一个寄存器中的16位数组合在一起。第二个寄存器中的数可以在组合前先左移
     *
     * ASSERT_TRUE(__PKHBT(0x5678, 0x8888, 1) == 0x56791110)
     */
    struct ternary_calculation pkhbt_test[TEST_SIZE] = {
        {0x5678, 0x88888000,  1, 0x11115678},
        {0x1234, 0x56780000,  0, 0x56781234},
        {0x5678, 0x67890001, 31, 0x80005678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__PKHBT(pkhbt_test[i].op1, pkhbt_test[i].op2, pkhbt_test[i].op3) == pkhbt_test[i].result);
    }


    return 0;
}
