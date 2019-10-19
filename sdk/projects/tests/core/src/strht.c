/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_strht(void)
{
    int i = 0;
    unsigned int test_mem[20];
    tst_addr = (unsigned int *)&test_mem;

    printf("Testing functions __STRHT\n");

    /*
     * STRHT
     * 非特权模式下的16位数值存储
     *
     * __STRBT(0x1234, FREE_MEM)
     * ASSERT_TRUE(*(uint16_t *)FREE_MEM == 0x1234)
     */
    struct binary_calculation strht_test[TEST_SIZE] = {
        {0, 0x1234, 0x1234},
        {2, 0xFEDC, 0xFEDC},
        {0, 0x5678, 0x5678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        __STRHT(strht_test[i].op2, (uint16_t *)(tst_addr + strht_test[i].op1));
        ASSERT_TRUE(*(uint16_t *)(tst_addr + strht_test[i].op1) == strht_test[i].result);
    }


    return 0;
}
