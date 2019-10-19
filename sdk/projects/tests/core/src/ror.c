/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ror(void)
{
    int i = 0;

    printf("Testing functions __ROR\n");

    /*
     * ROR
     * 右移指定位.移位的范围是[1..31]
     *
     * ASSERT_TRUE(0x56781234 == __ROR(0x12345678, 16))
     */
    struct binary_calculation ror_test[TEST_SIZE] = {
        {0x12345678,  1, 0x91A2B3C },
        {0x12345678, 16, 0x56781234},
        {0x12345678, 31, 0x2468ACF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__ROR(ror_test[i].op1, ror_test[i].op2) == ror_test[i].result);
    }


    return 0;
}
