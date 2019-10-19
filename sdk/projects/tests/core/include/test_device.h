/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#ifndef TEST_DEVICE_H
#define TEST_DEVICE_H

#include <stdint.h>
#include "soc.h"
#include "csi_core.h"

#ifdef __cplusplus
extern "C" {
#endif

struct unary_calculation {
    uint32_t op1;
    uint32_t result;
};

struct binary_calculation {
    uint32_t op1;
    uint32_t op2;
    uint32_t result;
};

struct ternary_calculation {
    uint32_t op1;
    uint32_t op2;
    uint32_t op3;
    uint32_t result;
};

struct ternary64_calculation {
    uint32_t op1;
    uint32_t op2;
    uint64_t op3;
    uint64_t result;
};

#define TEST_SIZE 3
//#ifdef __NO_TESTCODE__
extern unsigned int *tst_addr;
//#else
//unsigned int tst_addr = 0x2000cff8;
//#endif

#ifdef __cplusplus
}
#endif

#endif  /* TEST_DEVICE_H */
