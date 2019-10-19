/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uhasx(void)
{
    int i = 0;

    printf("Testing functions __UHASX\n");

    /*
     * UHASX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的高半字相加，低半字相减，最后将结果除以2
     *
     * ASSERT_TRUE(__UHASX (0x12345678, 0x12345678) == 0x34562222)
     */
    struct binary_calculation uhasx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x34562222},
        {0x12341234, 0x12341234, 0x12340000},
        {0x12345678, 0x12341234, 0x12342222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHASX(uhasx_test[i].op1, uhasx_test[i].op2) == uhasx_test[i].result);
    }



    return 0;
}
