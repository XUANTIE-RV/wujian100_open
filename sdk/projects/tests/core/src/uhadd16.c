/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uhadd16(void)
{
    int i = 0;

    printf("Testing functions __UHADD16\n");

    /*
     * UHADD16
     * 两个操作数都是由两个16位无符号数组成，先将两个操作数的高低半字相加，再将结果除以2
     *
     * ASSERT_TRUE(__UHADD16 (0x12345678, 0x12345678) == 0x 12345678)
     */
    struct binary_calculation uhadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x12343456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHADD16(uhadd16_test[i].op1, uhadd16_test[i].op2) == uhadd16_test[i].result);
    }


    return 0;
}
