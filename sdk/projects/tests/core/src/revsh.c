/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_revsh(void)
{
    int i = 0;

    printf("Testing functions __REVSH\n");

    /*
     * REVSH
     * 按字节顺序翻转带符号的16位值，翻转后扩展为32位数.
     *
     * ASSERT_TRUE(__REVSH(0x5688) == 0xFFFF8856)
     */
    struct unary_calculation revsh_test[TEST_SIZE] = {
        {0x5688, 0xFFFF8856},
        {0x4a5a, 0x00005a4a},
        {0x3445, 0x00004534}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__REVSH(revsh_test[i].op1) == revsh_test[i].result);
    }


    return 0;
}
