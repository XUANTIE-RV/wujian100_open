/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_strt(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = test_mem;

    printf("Testing functions __STRT\n");

    /*
     * STRT
     * 非特权模式下的32位数值存储
     *
     * __STRT(0x12345678, FREE_MEM)
     * ASSERT_TRUE(*(uint32_t *)FREE_MEM == 0x12345678)
     */
    struct binary_calculation strt_test[TEST_SIZE] = {
        {0, 0x12345678, 0x12345678},
        {4, 0xFEDCBA09, 0xFEDCBA09},
        {0, 0x56781234, 0x56781234}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRT(strt_test[i].op2, (uint32_t *)(tst_addr + strt_test[i].op1));
        ASSERT_TRUE(*(uint32_t *)(tst_addr + strt_test[i].op1) == strt_test[i].result);
    }


    return 0;
}
