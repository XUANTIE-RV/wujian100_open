/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qsub16(void)
{
    int i = 0;

    printf("Testing functions __QSUB16\n");

    /*
     * QSUB16
     * 同时操作两组16位整数相减
     *
     * ASSERT_TRUE(__QSUB16(0x92341234, 0x20000000) == 0x80000000)
     */
    struct binary_calculation qsub16_test[TEST_SIZE] = {
        {0x92341234, 0x20007000, 0x8000A234},
        {0x1234F234, 0x10000000, 0x0234F234},
        {0x12341234, 0x12341234, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSUB16(qsub16_test[i].op1, qsub16_test[i].op2) == qsub16_test[i].result);
    }


    return 0;
}
