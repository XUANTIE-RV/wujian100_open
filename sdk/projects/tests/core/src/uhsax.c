/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_uhsax(void)
{
    int i = 0;

    printf("Testing functions __UHSAX\n");

    /*
     * UHSAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的低半字相加，高半字相减，最后将结果除以2
     *
     * ASSERT_TRUE(__UHSAX (0x12345678, 0x12345678) == 0x DDDE3456)
     */
    struct binary_calculation uhsax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0xDDDE3456},
        {0x12341234, 0x12341234, 0x00001234},
        {0x12345678, 0x12341234, 0x00003456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHSAX(uhsax_test[i].op1, uhsax_test[i].op2) == uhsax_test[i].result);
    }


    return 0;
}
