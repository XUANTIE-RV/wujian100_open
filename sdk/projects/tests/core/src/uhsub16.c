/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uhsub16(void)
{
    int i = 0;

    printf("Testing functions __UHSUB16\n");

    /*
     * UHSUB16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字相减，然后除以2
     *
     * ASSERT_TRUE(__UHSUB16 (0x12345678, 0x12345678) == 0x 0)
     */
    struct binary_calculation uhsub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x00000000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHSUB16(uhsub16_test[i].op1, uhsub16_test[i].op2) == uhsub16_test[i].result);
    }


    return 0;
}
