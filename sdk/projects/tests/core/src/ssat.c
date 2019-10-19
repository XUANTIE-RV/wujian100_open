/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ssat(void)
{
    int i = 0;

    printf("Testing functions __SSAT\n");

    /*
     * SSAT
     * 饱和一个有符号数,饱和范围是1..31
     *
     * ASSERT_TRUE(0x7FFFFFF == __SSAT(0x12345678, 28))
     */
    struct binary_calculation ssat_test[TEST_SIZE] = {
        {0x12345678, 28,  0x7FFFFFF},
        {    0x1234, 28,     0x1234},
        {0xFFFFFFFF,  1, 0xFFFFFFFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAT(ssat_test[i].op1, ssat_test[i].op2) == ssat_test[i].result);
    }


    return 0;
}
