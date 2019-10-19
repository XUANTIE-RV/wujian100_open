/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_rbit(void)
{
    int i = 0;

    printf("Testing functions __RBIT\n");

    /*
     * RBIT
     * 按位翻转
     *
     * ASSERT_TRUE(0x88888888 == __RBIT(0x11111111))
     */
    struct unary_calculation rbit_test[TEST_SIZE] = {
        {0x88888888, 0x11111111},
        {0x5a5a5a5a, 0x5a5a5a5a},
        {0x22222222, 0x44444444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__RBIT(rbit_test[i].op1) == rbit_test[i].result);
    }

    return 0;
}
