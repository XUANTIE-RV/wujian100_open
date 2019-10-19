/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uhsub8(void)
{
    int i = 0;

    printf("Testing functions __UHADD8\n");

    /*
     * UHSUB8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，结果除以2
     *
     * ASSERT_TRUE(__UHSUB8 (0x12345678, 0x12345678) == 0x 0)
     */
    struct binary_calculation uhsub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x00000000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHSUB8(uhsub8_test[i].op1, uhsub8_test[i].op2) == uhsub8_test[i].result);
    }


    return 0;
}
