/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_strbt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions __STRBT\n");

    /*
     * STRBT
     * 非特权模式下的8位数值存储
     *
     * __STRBT(0x12, FREE_MEM)
     * ASSERT_TRUE(*(uint8_t *)FREE_MEM == 0x12)
     */
    struct binary_calculation strbt_test[TEST_SIZE] = {
        {0, 0x12, 0x12},
        {1, 0x34, 0x34},
        {3, 0x78, 0x78}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRBT(strbt_test[i].op2, (uint8_t *)(tst_addr + strbt_test[i].op1));
        ASSERT_TRUE(*(uint8_t *)(tst_addr + strbt_test[i].op1) == strbt_test[i].result);
    }

    return 0;
}
