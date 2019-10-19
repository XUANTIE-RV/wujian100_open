/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uasx(void)
{
    int i = 0;

    printf("Testing functions __UASX\n");

    /*
     * UASX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，然后两个操作数低半字相减，高半字相加
     *
     * ASSERT_TRUE(__UASX(0x12345678, 0x12345678) == 0x68AC4444)
     */
    struct binary_calculation uasx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x68AC4444},
        {0x12341234, 0x12341234, 0x24680000},
        {0x12345678, 0x12341234, 0x24684444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UASX(uasx_test[i].op1, uasx_test[i].op2) == uasx_test[i].result);
    }


    return 0;
}
