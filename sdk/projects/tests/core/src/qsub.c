/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_qsub(void)
{
    int i = 0;

    printf("Testing functions __QSUB\n");
    /*
     * QSUB
     * 获取两个数相减后的饱和值
     *
     * ASSERT_TRUE(__QSUB(0x92341234, 0x20000000) == 0x80000000)
     */
    struct binary_calculation qsub_test[TEST_SIZE] = {
        {0x92341234, 0x20007000, 0x80000000},
        {0x1234F234, 0x10000000, 0x0234F234},
        {0x12341234, 0x12341234, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSUB(qsub_test[i].op1, qsub_test[i].op2) == qsub_test[i].result);
    }



    return 0;
}
