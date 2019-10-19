/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_case5(void)
{
    int i = 0;

    printf("Testing functions case5: Date operation interfaces!\n");

    /*
     * SADD8
     * 四组8位有符号整数相加
     *
     * ASSERT_TRUE(__SADD8(0x12341234, 0x70FF0000) == 0x82331234)
     */
    struct binary_calculation sadd8_test[TEST_SIZE] = {
        {0x12341234, 0x70FF0000, 0x82331234},
        {0x1234F234, 0x10000000, 0x2234F234},
        {0x12341234, 0x12341234, 0x24682468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SADD8(sadd8_test[i].op1, sadd8_test[i].op2) == sadd8_test[i].result);
    }

    /*
     * SADD16
     * 两组16位有符号整数相加
     *
     * ASSERT_TRUE(__SADD16(0x12341234, 0x70000000) == 0x82341234)
     */
    struct binary_calculation sadd16_test[TEST_SIZE] = {
        {0x12341234, 0x70000000, 0x82341234},
        {0x1234F234, 0x10000000, 0x2234F234},
        {0x12341234, 0x12341234, 0x24682468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SADD16(sadd16_test[i].op1, sadd16_test[i].op2) == sadd16_test[i].result);
    }

    /*
     * QADD8
     * 四组8位数相加
     *
     * ASSERT_TRUE(__QADD8(0x12341234, 0xF0007060) == 0x02347F7F)
     */
    struct binary_calculation qadd8_test[TEST_SIZE] = {
        {0x12341234, 0xF0007060, 0x02347F7F},
        {0x12341234, 0xF0607000, 0x027F7F34},
        {0x12341234, 0x7000F060, 0x7F34027F}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD8(qadd8_test[i].op1, qadd8_test[i].op2) == qadd8_test[i].result);
    }

    /*
     * QADD16
     * 同时操作两组16位整数相加
     *
     * ASSERT_TRUE(__QADD16(0x12341234, 0x00007000) == 0x12347FFF)
     */
    struct binary_calculation qadd16_test[TEST_SIZE] = {
        {0x12341234, 0x70000000, 0x7FFF1234},
        {0x12341234, 0x00007000, 0x12347FFF},
        {0x12345678, 0x87654321, 0x99997FFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD16(qadd16_test[i].op1, qadd16_test[i].op2) == qadd16_test[i].result);
    }

    /*
     * QADD
     * 获取两个整数和的饱和值
     *
     * ASSERT_TRUE(__QADD(0x12345678, 0x70000000) == 0x7FFFFFFF)
     */
    struct binary_calculation qadd_test[TEST_SIZE] = {
        {0x12345678, 0x70000000, 0x7FFFFFFF},
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12345678, 0xEDCBA988,        0x0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QADD(qadd_test[i].op1, qadd_test[i].op2) == qadd_test[i].result);
    }

    /*
     * SHADD8
     * 取两组4个8位有符号数的平均值
     *
     * ASSERT_TRUE(__SHADD8(0x12341234, 0x12345678) == 0x12343456)
     */
    struct binary_calculation shadd8_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x12343456},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12345678, 0x12345678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHADD8(shadd8_test[i].op1, shadd8_test[i].op2) == shadd8_test[i].result);
    }

    /*
     * SHADD16
     * 取两组有符号16位整数的平均数
     *
     * ASSERT_TRUE(__SHADD16(0x12341234, 0x12345678) == 0x12343456)
     */
    struct binary_calculation shadd16_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x12343456},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12345678, 0x12345678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHADD16(shadd16_test[i].op1, shadd16_test[i].op2) == shadd16_test[i].result);
    }

    /*
     * UADD8
     * 四组8位无符号整数相加
     *
     * ASSERT_TRUE(__UADD16(0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0x12341234, 0x24682468},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UADD8(uadd8_test[i].op1, uadd8_test[i].op2) == uadd8_test[i].result);
    }

    /*
     * UADD16
     * 两组16位无符号整数相加
     *
     * ASSERT_TRUE(__UADD16(0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0x12341234, 0x24682468},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UADD16(uadd16_test[i].op1, uadd16_test[i].op2) == uadd16_test[i].result);
    }

    /*
     * UQADD8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节饱和相加
     *
     * ASSERT_TRUE(__UQADD8 (0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uqadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0xF0000000, 0xFF341234},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQADD8(uqadd8_test[i].op1, uqadd8_test[i].op2) == uqadd8_test[i].result);
    }

    /*
     * UQADD16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字饱和相加
     *
     * ASSERT_TRUE(__UQADD16 (0x12345678, 0x12345678) == 0x2468ACF0)
     */
    struct binary_calculation uqadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x2468ACF0},
        {0x12341234, 0xF0000000, 0xFFFF1234},
        {0x12345678, 0x12341234, 0x246868AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQADD16(uqadd16_test[i].op1, uqadd16_test[i].op2) == uqadd16_test[i].result);
    }

    /*
     * UHADD8
     * 两个操作数都是由四个8位无符号数组成，先将两个操作数的每个字节相加，然
    后结果除以2
     *
     * ASSERT_TRUE(__UHADD8 (0x12345678, 0x12345678) == 0x 12345678)
     */
    struct binary_calculation uhadd8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x12343456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHADD8(uhadd8_test[i].op1, uhadd8_test[i].op2) == uhadd8_test[i].result);
    }

    /*
     * UHADD16
     * 两个操作数都是由两个16位无符号数组成，先将两个操作数的高低半字相加，>再将结果除以2
     *
     * ASSERT_TRUE(__UHADD16 (0x12345678, 0x12345678) == 0x 12345678)
     */
    struct binary_calculation uhadd16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x12343456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHADD16(uhadd16_test[i].op1, uhadd16_test[i].op2) == uhadd16_test[i].result);
    }

    /*
     * SSUB8
     * 两个操作数都是由四个8位有符号数组成。两个操作数的每个字节相减
     *
     * ASSERT_TRUE(__SSUB8(0x56785678, 0x12345678) == 0x44440000)
     */
    struct binary_calculation ssub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSUB8(ssub8_test[i].op1, ssub8_test[i].op2) == ssub8_test[i].result);
    }

    /*
     * SSUB16
     * 两个操作数都是由两个16位有符号数组成，两个操作数的高低半字各自相减
     *
     * ASSERT_TRUE(__SSUB16 (0x56785678, 0x12345678) == 0x44440000)
     */
    struct binary_calculation ssub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSUB16(ssub16_test[i].op1, ssub16_test[i].op2) == ssub16_test[i].result);
    }

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

    /*
     * SHSUB8
     * 每个操作数都是由四个8位有符号数组成。两个操作数的每个字节相减，然后除
    以2
     *
     * ASSERT_TRUE(__SHSUB8(0x56781234, 0x12341234) == 0x22220000)
     */
    struct binary_calculation shsub8_test[TEST_SIZE] = {
        {0x56781234, 0x12341234, 0x22220000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHSUB8(shsub8_test[i].op1, shsub8_test[i].op2) == shsub8_test[i].result);
    }

    /*
     * SHSUB16
     * 每个操作数都是由两个16位有符号数组成。两个操作数的高低半字相减，再除>以2
     *
     * ASSERT_TRUE(__SHSUB16 (0x56781234, 0x12341234) == 0x22220000)
     */
    struct binary_calculation shsub16_test[TEST_SIZE] = {
        {0x56781234, 0x12341234, 0x22220000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHSUB16(shsub16_test[i].op1, shsub16_test[i].op2) == shsub16_test[i].result);
    }


    /*
     * USUB8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减
     *
     * ASSERT_TRUE(__USUB16 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation usub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x22341234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USUB8(usub8_test[i].op1, usub8_test[i].op2) == usub8_test[i].result);
    }

    /*
     * UQSUB8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节饱和相减
     *
     * ASSERT_TRUE(__UQSUB8 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation uqsub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x00341234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSUB8(uqsub8_test[i].op1, uqsub8_test[i].op2) == uqsub8_test[i].result);
    }


    /*
     * UQSUB16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字分别饱和相>减
     *
     * ASSERT_TRUE(__UQSUB16 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation uqsub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0xF0000000, 0x00001234},
        {0x12345678, 0x12341234, 0x00004444}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSUB16(uqsub16_test[i].op1, uqsub16_test[i].op2) == uqsub16_test[i].result);
    }

    /*
     * UHSUB8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，结果除
    以2
     *
     * ASSERT_TRUE(__UHSUB8 (0x12345678, 0x12345678) == 0x 0)
     */
    struct binary_calculation uhsub8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x00000000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHSUB8(uhsub8_test[i].op1, uhsub8_test[i].op2) == uhsub8_test[i].result);
    }

    /*
     * UHSUB16
     * 两个操作数都是由两个16位无符号数组成，两个操作数的高低半字相减，然后>除以2
     *
     * ASSERT_TRUE(__UHSUB16 (0x12345678, 0x12345678) == 0x 0)
     */
    struct binary_calculation uhsub16_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x00000000},
        {0x12341234, 0x12341234, 0x00000000},
        {0x12345678, 0x12341234, 0x00002222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UHSUB16(uhsub16_test[i].op1, uhsub16_test[i].op2) == uhsub16_test[i].result);
    }

    /*
     * SASX
     * 交换第二个操作数的高低半字，然后两个操作数的高半字相加，低半字相减.
     *
     * ASSERT_TRUE(__SASX(0x12341234, 0x70000000) == 0x12348234)
     */
    struct binary_calculation sasx_test[TEST_SIZE] = {
        {0x12341234, 0x00007000, 0x82341234},
        {0x12341234, 0x70000000, 0x1234A234},
        {0x12341234, 0x12341234, 0x24680000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SASX(sasx_test[i].op1, sasx_test[i].op2) == sasx_test[i].result);
    }

    /*
     * QASX
     * 先交换第二个操作数的两个半字，然后与第一个操作数的高半字相加，低半字>相减。最后的结果做饱和处理。
     *
     * ASSERT_TRUE(__QASX(0xF2341234, 0x00008234) == 0x80001234)
     */
    struct binary_calculation qasx_test[TEST_SIZE] = {
        {0xF2341234, 0x00008234, 0x80001234},
        {0x1234F234, 0x90000000, 0x12346234},
        {0x12341234, 0x12341234, 0x24680000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QASX(qasx_test[i].op1, qasx_test[i].op2) == qasx_test[i].result);
    }

    /*
     * SHASX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的两个半字，然>后两个操作数的高低半字各自相减，最后都除2
     *
     * ASSERT_TRUE(__SHASX (0x12345678, 0x12341234) == 0x12342222)
     */
    struct binary_calculation shasx_test[TEST_SIZE] = {
        {0x12341234, 0x12345678, 0x34560000},
        {0x12341234, 0x12341234, 0x12340000},
        {0x12345678, 0x12341234, 0x12342222}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHASX(shasx_test[i].op1, shasx_test[i].op2) == shasx_test[i].result);
    }

    /*
     * QSAX
     * 先交换第二个操作数的两个半字，然后与第一个操作数的高半字相减，低半字>相加。最后的结果做饱和处理。
     *
     * ASSERT_TRUE(__QSAX(0xF2341234, 0x00007F00) == 0x80001234)
     */
    struct binary_calculation qsax_test[TEST_SIZE] = {
        {0xF2341234, 0x00007F00, 0x80001234},
        {0x1234F234, 0x70000000, 0x12346234},
        {0x12341234, 0x12341234, 0x00002468}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__QSAX(qsax_test[i].op1, qsax_test[i].op2) == qsax_test[i].result);
    }

    /*
     * SHSAX
     * 每个操作数都是由两个16位有符号数组成。交换第二个操作数的两个半字，然>后两个操作数的低半字相加，高半字相减，最后再除2
     *
     * ASSERT_TRUE(__SHSAX (0x56781234, 0x12341234) == 0x22221234)
     */
    struct binary_calculation shsax_test[TEST_SIZE] = {
        {0x56781234, 0x12341234, 0x22221234},
        {0x12341234, 0x12341234, 0x00001234},
        {0x12345678, 0x12341234, 0x00003456}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SHSAX(shsax_test[i].op1, shsax_test[i].op2) == shsax_test[i].result);
    }

    /*
     * USAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，>然后两个操作数的高半字相减，低半字相加
     *
     * ASSERT_TRUE(__USAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation usax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0xBBBC68AC},
        {0x12341234, 0xF0000000, 0x12340234},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAX(usax_test[i].op1, usax_test[i].op2) == usax_test[i].result);
    }

    /*
     * UQSAX
     * 两个操作数都是由两个16位无符号数组成，先交换第二个操作数的高低半字，
     * 然后两个操作数的高半字饱和相减，低半字饱和相加
     *
     * ASSERT_TRUE(__UQSAX (0x12345678, 0x12345678) == 0xBBBC68AC)
     */
    struct binary_calculation uqsax_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x000068AC},
        {0x12341234, 0xF0000000, 0x1234FFFF},
        {0x12345678, 0x12341234, 0x000068AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UQSAX(uqsax_test[i].op1, uqsax_test[i].op2) == uqsax_test[i].result);
    }

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

    /*
     * USAD8
     * 两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，然后将
    4个结果累加为一个无符号数
     *
     * ASSERT_TRUE(__USAD8 (0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation usad8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,  0x0},
        {0x12341234, 0xF0000000, 0x9C},
        {0x12345678, 0x12341234, 0x88}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAD8(usad8_test[i].op1, usad8_test[i].op2) == usad8_test[i].result);
    }

    /*
     * USADA8
     * 前两个操作数都是由四个8位无符号数组成，两个操作数的每个字节相减，然后
    将4个结果与第三个操作数累加为一个无符号数
     *
     * ASSERT_TRUE(__USADA8 (0x12345678, 0x12345678, 0x12345678) == 0x12345678)
     */
    struct ternary_calculation usada8_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0xF0000000, 0x12345678, 0x123457d0},
        {0x12345678, 0x12341234, 0x12345678, 0x12345700}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USADA8(usada8_test[i].op1, usada8_test[i].op2, usada8_test[i].op3) == usada8_test[i].result);
    }

    /*
     * SSAT16
     * 第一个操作数由两个16位有符号数组成，第二个操作数指明饱和的位数。
     * 用第二个操作数指明的饱和位数，处理第一个操作数中的两个有符号数
     *
     * ASSERT_TRUE(__SSAT16 (0x12340078, 8) == 0x7F0078)
     */
    struct binary_calculation ssat16_test[TEST_SIZE] = {
        {0x12345678, 8, 0x007F007F},
        {0x12341234, 4, 0x00070007},
        {0x12345678, 1, 0x00000000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAT16(ssat16_test[i].op1, ssat16_test[i].op2) == ssat16_test[i].result);
    }

    /*
     * SSAT
     * 饱和一个有符号数,饱和范围是1..31
     *
     * ASSERT_TRUE(0x7FFFFFF == __SSAT(0x12345678, 28))
     */
    struct binary_calculation ssat_test[TEST_SIZE] = {
        {0x12345678, 28,  0x7FFFFFF},
        {    0x1234, 28,     0x1234},
        {0xFFFFFFFF,  1, 0xFFFFFFFF}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SSAT(ssat_test[i].op1, ssat_test[i].op2) == ssat_test[i].result);
    }

    /*
     * USAT
     * 饱和一个无符号数.
     *
     * ASSERT_TRUE(0xFFFFFFF == __USAT(0x12345678, 28))
     */
    struct binary_calculation usat_test[TEST_SIZE] = {
        {0x12345678, 28,  0xFFFFFFF},
        {    0x1234, 28,     0x1234},
        {0x56781234,  1,        0x1}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAT(usat_test[i].op1, usat_test[i].op2) == usat_test[i].result);
    }

    /*
     * USAT16
     * 第一个操作数由两个16位无符号数组成，第二个操作数指明饱和的位数。
     * 用第二个操作数指明的饱和位数，处理第一个操作数中的两个无符号数
     *
     * ASSERT_TRUE(__USAT16 (0x12345678, 8) == 0xFF00FF)
     */
    struct binary_calculation usat16_test[TEST_SIZE] = {
        {0x12345678,  8, 0x00FF00FF},
        {0x12341234, 15, 0x12341234},
        {0x12345678,  1, 0x00010001}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__USAT16(usat16_test[i].op1, usat16_test[i].op2) == usat16_test[i].result);
    }


    /*
     * UXTB16
     * 零扩展操作数中的两个8位数到16位数
     *
     * ASSERT_TRUE(__UXTB16 (0x00F00170) == 0x00F00070)
     */
    struct unary_calculation uxtb16_test[TEST_SIZE] = {
        {0x00F00170, 0x00F00070},
        {0xF0000000,        0x0},
        {0x12341234, 0x00340034}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTB16(uxtb16_test[i].op1) == uxtb16_test[i].result);
    }

    /*
     * UXTAB16
     * 将第二个操作数两个8位数零扩展到16位数，然后与第一个操作数的两个16位数
    相加
     *
     * ASSERT_TRUE(__UXTB16 (0x56785678, 0x00F00170) == 0x576856E8)
     */
    struct binary_calculation uxtab16_test[TEST_SIZE] = {
        {0x12345678, 0x00F00170, 0x132456E8},
        {0x12341234, 0xF0000000, 0x12341234},
        {0x12345678, 0x12341234, 0x126856AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__UXTAB16(uxtab16_test[i].op1, uxtab16_test[i].op2) == uxtab16_test[i].result);
    }

    /*
     * SXTB16
     * 有符号扩展操作数中的两个8位数到16位
     * ASSERT_TRUE(__SXTB16 (0x00F0 0070) == 0xFFF00070)
     */
    struct unary_calculation sxtb16_test[TEST_SIZE] = {
        {0x00F00070, 0xFFF00070},
        {0x12341234, 0x00340034},
        {0x12345678, 0x00340078}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SXTB16(sxtb16_test[i].op1) == sxtb16_test[i].result);
    }

    /*
     * SXTAB16
     * 符号扩展第二个操作数的两个8位数(数据在[7:0] 和[23:16]),
     * 到两个16位数，然后与第一个操作数的高低半字相加
     *
     * ASSERT_TRUE(__SXTAB16 (0x56785678, 0x00F00070) == 0x566856E8)
     */
    struct binary_calculation sxtab16_test[TEST_SIZE] = {
        {0x56785678, 0x00F00070, 0x566856E8},
        {0x12341234, 0x12341234, 0x12681268},
        {0x12345678, 0x12341234, 0x126856AC}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SXTAB16(sxtab16_test[i].op1, sxtab16_test[i].op2) == sxtab16_test[i].result);
    }

    /*
     * SMUAD
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字分别>相乘，然后相加
     *
     * ASSERT_TRUE(__SMUAD (0x12345678, 0x12345678) == 0x1E8032D0)
     */
    struct binary_calculation smuad_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1E8032D0},
        {0x12341234, 0x12341234, 0x0296B520},
        {0x12345678, 0x12341234, 0x07715AF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUAD(smuad_test[i].op1, smuad_test[i].op2) == smuad_test[i].result);
    }

    /*
     * SMUADX
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字交叉>相乘，然后相加
     *
     * ASSERT_TRUE(__SMUADX (0x12345678, 0x12345678) == 0xC4C00C0)
     */
    struct binary_calculation smuadx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x0C4C00C0},
        {0x12341234, 0x12341234, 0x0296B520},
        {0x12345678, 0x12341234, 0x07715AF0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUADX(smuadx_test[i].op1, smuadx_test[i].op2) == smuadx_test[i].result);
    }

    /*
     * SMMLA
     * 两个32位有符号数相乘，将结果的高32位与第三个操作数相加
     *
     * ASSERT_TRUE(__SMMLA (0x12345678, 0x12345678, 0x12345678) == 0x137FBD54)
     */
    struct ternary_calculation smmla_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x137FBD54},
        {0x12341234, 0x12341234, 0x12341234, 0x137F6F5A},
        {0x12345678, 0x12341234, 0x56781234, 0x57C37435}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMMLA(smmla_test[i].op1, smmla_test[i].op2, smmla_test[i].op3) == smmla_test[i].result);
    }

    /*
     * SMLAD
     * 前两个操作数都是由两个16位有符号数组成，将它们的高低半字各自相乘得到>结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLAD (0x12345678, 0x12345678, 0x12345678) == 0x30B48948)
     */
    struct ternary_calculation smlad_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x30B48948},
        {0x12341234, 0x12341234, 0x12341234, 0x14CAC754},
        {0x12345678, 0x12341234, 0x56781234, 0x5DE96D24}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLAD(smlad_test[i].op1, smlad_test[i].op2, smlad_test[i].op3) == smlad_test[i].result);
    }

    /*
     * SMLADX
     * 前两个操作数都是由两个16位有符号数组成，先将第二个操作数的高低半字交>换，
     * 再将它们的高低半字各自相乘得到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLADX (0x12345678, 0x12345678, 0x12345678) == 0x1E805738)
     */
    struct ternary_calculation smladx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x1E805738},
        {0x12341234, 0x12341234, 0x12341234, 0x14CAC754},
        {0x12345678, 0x12341234, 0x56781234, 0x5DE96D24}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLADX(smladx_test[i].op1, smladx_test[i].op2, smladx_test[i].op3) == smladx_test[i].result);
    }

    /*
     * SMLALD
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位有符号数
     * 将前两个操作数的高低半字各自相乘得到结果，然后再把结果与第三个操作数>相加
     *
     * ASSERT_TRUE(__SMLALD(0x12345678, 0x12345678, 0x1234567890) == 0x1252D6AB60)
     */
    struct ternary64_calculation smlald_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1252D6AB60},
        {0x12341234, 0x12341234, 0x1234123490, 0x1236A8E9B0},
        {0x12345678, 0x12341234, 0x5678123490, 0x567F838F80}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLALD(smlald_test[i].op1, smlald_test[i].op2, smlald_test[i].op3) == smlald_test[i].result);
    }

    /*
     * SMLALDX
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位有符号数。
     * 先将第二个操作数的高低半字交换，再将前两个操作数的高低半字各自相乘得
     * 到结果，然后再把结果与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLALDX(0x12345678, 0x12345678, 0x1234567890) == 0x1240A27950)
     */
    struct ternary64_calculation smlaldx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1240A27950},
        {0x12341234, 0x12341234, 0x1234123490, 0x1236A8E9B0},
        {0x12345678, 0x12341234, 0x5678123490, 0x567F838F80}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLALDX(smlaldx_test[i].op1, smlaldx_test[i].op2, smlaldx_test[i].op3) == smlaldx_test[i].result);
    }

    /*
     * SMUSD
     * 两个操作数都是由两个16位有符号数组成，两个操作数的低半字和高半字分别>相乘，然后相减
     *
     * ASSERT_TRUE(__SMUSD(0x12345678, 0x12345678) == 0xE4168250)
     */
    struct binary_calculation smusd_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1BE97DB0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x04DAA5D0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUSD(smusd_test[i].op1, smusd_test[i].op2) == smusd_test[i].result);
    }

    /*
     * SMUSDX
     * 两个操作数都是由两个16位有符号数组成，第二个操作数先交换高低半字，
     * 然后两个操作数的低半字和高半字相乘，然后相减
     *
     * ASSERT_TRUE(__SMUSDX(0x12345678, 0x12345678) == 0x0)
     */
    struct binary_calculation smusdx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678,        0x0},
        {0x12341234, 0x12341234,        0x0},
        {0x12345678, 0x12341234, 0x04DAA5D0}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMUSDX(smusdx_test[i].op1, smusdx_test[i].op2) == smusdx_test[i].result);
    }

    /*
     * SMLSD
     * 前两个操作数都是由两个16位有符号数组成，将它们的高低半字各自相乘
     * 得到结果，然后再把两个结果相减，最后与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLSD (0x12345678, 0x12345678, 0x12345678) == 0x2E1DD428)
     */
    struct ternary_calculation smlsd_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x2E1DD428},
        {0x12341234, 0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x56781234, 0x5B52B804}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSD(smlsd_test[i].op1, smlsd_test[i].op2, smlsd_test[i].op3) == smlsd_test[i].result);
    }

    /*
     * SMLSDX
     * 前两个操作数都是由两个16位有符号数组成，先将第二个操作数的高低半字交>换，
     * 再将它们的高低半字各自相乘得到结果，然后再把两个结果相减，最后与第三>个操作数相加
     *
     * ASSERT_TRUE(__SMLSDX (0x12345678, 0x12345678, 0x12345678) == 0x12345678)
     */
    struct ternary_calculation smlsdx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x12345678, 0x12345678},
        {0x12341234, 0x12341234, 0x12341234, 0x12341234},
        {0x12345678, 0x12341234, 0x56781234, 0x5B52B804}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSDX(smlsdx_test[i].op1, smlsdx_test[i].op2, smlsdx_test[i].op3) == smlsdx_test[i].result);
    }

    /*
     * SMLSLD
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位整数，将前>两个操作数的
     * 高低半字各自相乘得到结果，然后再把两个结果相减，最后与第三个操作数相>加
     *
     * ASSERT_TRUE(__SMLSLD (0x12345678, 0x12345678, 0x1234567890) == 0x12186CFAE0)
     */
    struct ternary64_calculation smlsld_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x12503FF640},
        {0x12341234, 0x12341234, 0x1234123490, 0x1234123490},
        {0x12345678, 0x12341234, 0x5678123490, 0x567CECDA60}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSLD(smlsld_test[i].op1, smlsld_test[i].op2, smlsld_test[i].op3) == smlsld_test[i].result);
    }

    /*
     * SMLSLDX
     * 前两个操作数都是由两个16位有符号数组成，第三个操作数是64位整数，
     * 先将第二个操作数的高低半字交换，再将前两个操作数的高低半字各自相乘得>到结果，
     * 然后再把两个结果相减，最后与第三个操作数相加
     *
     * ASSERT_TRUE(__SMLSLDX (0x12345678, 0x12345678, 0x1234567890) == 0x1234567890)
     */
    struct ternary64_calculation smlsldx_test[TEST_SIZE] = {
        {0x12345678, 0x12345678, 0x1234567890, 0x1234567890},
        {0x12341234, 0x12341234, 0x1234123490, 0x1234123490},
        {0x12345678, 0x12341234, 0x5678123490, 0x567CECDA60}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__SMLSLDX(smlsldx_test[i].op1, smlsldx_test[i].op2, smlsldx_test[i].op3) == smlsldx_test[i].result);
    }

    /*
     * PKHBT
     * 将一个寄存器中的16位数与另外一个寄存器中的16位数组合在一起。第二个寄>存器中的数可以在组合前先左移
     *
     * ASSERT_TRUE(__PKHBT(0x5678, 0x8888, 1) == 0x56791110)
     */
    struct ternary_calculation pkhbt_test[TEST_SIZE] = {
        {0x5678, 0x88888000,  1, 0x11115678},
        {0x1234, 0x56780000,  0, 0x56781234},
        {0x5678, 0x67890001, 31, 0x80005678}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__PKHBT(pkhbt_test[i].op1, pkhbt_test[i].op2, pkhbt_test[i].op3) == pkhbt_test[i].result);
    }

    /*
     * PKHTB
     * 将一个寄存器中的16位数与另外一个寄存器中的16位数组合在一起。第二个寄>存器中的数可以在组合前先右移
     *
     * ASSERT_TRUE(__PKHBT(0x5678, 0x8888, 1) == 0x56791110)
     */
    struct ternary_calculation pkhtb_test[TEST_SIZE] = {
        {0x56780000, 0x8888,  1, 0x56784444},
        {0x12340000, 0x5678,  0, 0x12345678},
        {0x56780000, 0x6789, 16, 0x56780000}
    };

    for (i = 0; i < TEST_SIZE; i++) {
        ASSERT_TRUE(__PKHTB(pkhtb_test[i].op1, pkhtb_test[i].op2, pkhtb_test[i].op3) == pkhtb_test[i].result);
    }


    return 0;
}
