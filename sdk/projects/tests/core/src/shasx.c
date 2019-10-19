/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_shasx(void)
{
    int i = 0;

    printf("Testing functions __SHASX\n");

    /*
     * SHASX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的两个半字，然后两个操作数的高低半字各自相减，最后都除2
     *
     * ASSERT_TRUE(__SHASX (0x12345678, 0x12341234) == 0x12342222)
     */
    struct binary_calculation shasx_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x34560000},
        {0x12341234, 0x12341234, 0x12340000},
        {0x12345678, 0x12341234, 0x12342222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHASX(shasx_test[i].op1, shasx_test[i].op2) == shasx_test[i].result);
    }


    return 0;
}
