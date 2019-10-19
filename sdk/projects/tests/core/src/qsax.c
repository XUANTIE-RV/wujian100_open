/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qsax(void)
{
    int i = 0;

    printf("Testing functions __QSAX\n");

    /*
     * QSAX
     * 先交换第二个操作数的两个半字，然后与第一个操作数的高半字相减，低半字相加。最后的结果做饱和处理。
     *
     * ASSERT_TRUE(__QSAX(0xF2341234, 0x00007F00) == 0x80001234)
     */
    struct binary_calculation qsax_test[TEST_SIZE] = {
        {0xF2341234, 0x00007F00, 0x80001234},
        {0x1234F234, 0x70000000, 0x12346234},
        {0x12341234, 0x12341234, 0x00002468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSAX(qsax_test[i].op1, qsax_test[i].op2) == qsax_test[i].result);
    }


    return 0;
}
