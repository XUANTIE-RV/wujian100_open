/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_shsax(void)
{
    int i = 0;

    printf("Testing functions __SHSAX\n");

    /*
     * SHSAX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的两个半字，然后两个操作数的低半字相加，高半字相减，最后再除2
     *
     * ASSERT_TRUE(__SHSAX (0x56781234, 0x12341234) == 0x22221234)
     */
    struct binary_calculation shsax_test[TEST_SIZE] = {
        {0x56781234, 0x12341234, 0x22221234},
        {0x12341234, 0x12341234, 0x00001234},
        {0x12345678, 0x12341234, 0x00003456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHSAX(shsax_test[i].op1, shsax_test[i].op2) == shsax_test[i].result);
    }


    return 0;
}
