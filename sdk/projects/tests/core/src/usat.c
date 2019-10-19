/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_usat(void)
{
    int i = 0;

    printf("Testing functions __USAT\n");

    /*
     * USAT
     * 饱和一个无符号数.
     *
     * ASSERT_TRUE(0xFFFFFFF == __USAT(0x12345678, 28))
     */
    struct binary_calculation usat_test[TEST_SIZE] = {
        {0x12345678, 28,  0xFFFFFFF},
        {    0x1234, 28,     0x1234},
        {0x56781234,  1,        0x1}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAT(usat_test[i].op1, usat_test[i].op2) == usat_test[i].result);
    }


    return 0;
}
