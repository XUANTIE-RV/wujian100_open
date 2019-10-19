/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include <stdio.h>
#include "dtest.h"
#include "test_device.h"

int test_debug(void)
{
#ifdef DEBUG_HAD
    printf("Testing debug access\n");

    /*
     * to host
     */
    HAD_SendChar("h");
    HAD_SendChar("e");
    HAD_SendChar("l");
    HAD_SendChar("l");
    HAD_SendChar("o");

    /*
     * from host
     */
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("%c ", HAD_ReceiveChar());
    printf("\n");

    /*
     * check buf
     */
    printf("%d ", HAD_CheckChar());
    printf("%u ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%u ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%u ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%u ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("%d ", HAD_CheckChar());
    printf("%u ", *(unsigned int *)0xe001103c);
    ASSERT_TRUE(HAD_CheckChar() == *(unsigned int *)0xe001103c);
    printf("\n");

#endif
    return 0;
}
