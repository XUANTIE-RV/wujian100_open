/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qsub8(void)
{
    int i = 0;

    printf("Testing functions __QSUB8\n");

    /*
     * QSUB8
     * 同时操作四组8位整数相减
     *
     * ASSERT_TRUE(__QSUB8(0x92341234, 0x20000000) == 0x80000000)
     */
    struct binary_calculation qsub8_test[TEST_SIZE] = {
        {0x92341234, 0x20007000, 0x8034A234},
        {0x1234F234, 0x10000000, 0x0234F234},
        {0x12341234, 0x12341234, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSUB8(qsub8_test[i].op1, qsub8_test[i].op2) == qsub8_test[i].result);
    }


    return 0;
}
