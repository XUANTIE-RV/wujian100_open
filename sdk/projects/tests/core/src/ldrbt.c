/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_ldrbt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions \n");
    /*
     * LDRBT
     * 以非特权模式获取一个8位的值
     *
     * *FREE_MEM = 0x12345678
     * *(uint8_t *)FREE_MEM = __LDRBT(FREE_MEM)
     */
    struct binary_calculation ldrbt_test[TEST_SIZE] = {
        {0, 0x12345678, 0x78},
        {2, 0x12345678, 0x34},
        {3, 0x12345678, 0x12}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        *(uint32_t *)tst_addr = ldrbt_test[i].op2;
        ASSERT_TRUE(__LDRBT((uint8_t *)tst_addr + ldrbt_test[i].op1) == ldrbt_test[i].result);
    }


    return 0;
}
