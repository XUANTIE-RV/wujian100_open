/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_shsub16(void)
{
    int i = 0;

    printf("Testing functions __SHSUB16\n");

    /*
     * SHSUB16
     * 每个操作数都是由两个16位有符号数组成。两个操作数的高低半字相减，再除以2
     *
     * ASSERT_TRUE(__SHSUB16 (0x56781234, 0x12341234) == 0x22220000)
     */
    struct binary_calculation shsub16_test[TEST_SIZE] = {
        {0x56781234, 0x12341234, 0x22220000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHSUB16(shsub16_test[i].op1, shsub16_test[i].op2) == shsub16_test[i].result);
    }


    return 0;
}
