/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_clz(void)
{
    int i = 0;

    printf("Testing functions CLZ\n");
    /*
     * CLZ
     * 计算在一个32位值中，第一个1前有多少个位是零.
     *
     * ASSERT_TRUE(__CLZ(0x00008234) == 16)
     */
    struct unary_calculation clz_test[TEST_SIZE] = {
        {0x92345678,  0},
        {0x00008234, 16},
        {       0x0, 32}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__CLZ(clz_test[i].op1) == clz_test[i].result);
    }


    return 0;
}
