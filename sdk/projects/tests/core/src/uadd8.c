/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uadd8(void)
{
    int i = 0;

    printf("Testing functions __UADD8\n");

    /*
     * UADD8
     * 四组8位无符号整数相加
     *
     * ASSERT_TRUE(__UADD16(0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0x12341234, 0x24682468},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UADD8(uadd8_test[i].op1, uadd8_test[i].op2) == uadd8_test[i].result);
    }


    return 0;
}
