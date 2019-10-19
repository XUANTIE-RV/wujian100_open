/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qadd8(void)
{
    int i = 0;

    printf("Testing functions __QADD8\n");

    /*
     * QADD8
     * 四组8位数相加
     *
     * ASSERT_TRUE(__QADD8(0x12341234, 0xF0007060) == 0x02347F7F)
     */
    struct binary_calculation qadd8_test[TEST_SIZE] = {
        {0x12341234, 0xF0007060, 0x02347F7F},
        {0x12341234, 0xF0607000, 0x027F7F34},
        {0x12341234, 0x7000F060, 0x7F34027F}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD8(qadd8_test[i].op1, qadd8_test[i].op2) == qadd8_test[i].result);
    }


    return 0;
}
