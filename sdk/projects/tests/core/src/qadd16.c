/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qadd16(void)
{
    int i = 0;

    printf("Testing functions __QADD16\n");

    /*
     * QADD16
     * 同时操作两组16位整数相加
     *
     * ASSERT_TRUE(__QADD16(0x12341234, 0x00007000) == 0x12347FFF)
     */
    struct binary_calculation qadd16_test[TEST_SIZE] = {
        {0x12341234, 0x70000000, 0x7FFF1234},
        {0x12341234, 0x00007000, 0x12347FFF},
        {0x12345678, 0x87654321, 0x99997FFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD16(qadd16_test[i].op1, qadd16_test[i].op2) == qadd16_test[i].result);
    }


    return 0;
}
