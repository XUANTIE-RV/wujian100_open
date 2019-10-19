/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_sadd8(void)
{
    int i = 0;

    printf("Testing functions __SADD8\n");

    /*
     * SADD8
     * 四组8位有符号整数相加
     *
     * ASSERT_TRUE(__SADD8(0x12341234, 0x70FF0000) == 0x82331234)
     */
    struct binary_calculation sadd8_test[TEST_SIZE] = {
        {0x12341234, 0x70FF0000, 0x82331234},
        {0x1234F234, 0x10000000, 0x2234F234},
        {0x12341234, 0x12341234, 0x24682468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SADD8(sadd8_test[i].op1, sadd8_test[i].op2) == sadd8_test[i].result);
    }



    return 0;
}
