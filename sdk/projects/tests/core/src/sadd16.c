/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_sadd16(void)
{
    int i = 0;

    printf("Testing functions __SADD16\n");

    /*
     * SADD16
     * 两组16位有符号整数相加
     *
     * ASSERT_TRUE(__SADD16(0x12341234, 0x70000000) == 0x82341234)
     */
    struct binary_calculation sadd16_test[TEST_SIZE] = {
        {0x12341234, 0x70000000, 0x82341234},
        {0x1234F234, 0x10000000, 0x2234F234},
        {0x12341234, 0x12341234, 0x24682468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SADD16(sadd16_test[i].op1, sadd16_test[i].op2) == sadd16_test[i].result);
    }



    return 0;
}
