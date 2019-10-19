/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     test_util.h
 * @brief    the head file
 * @version  V1.0
 * @date     15. July 2017
 ******************************************************************************/

#ifndef TEST_UTILITY_H
#define TEST_UTILITY_H

#include <csi_kernel.h>
#include <stdlib.h>
#include <string.h>
#include <csi_core.h>
#include "dtest.h"
#include <csi_config.h>


typedef void (*test_case_t)(void);

typedef struct {
    const char  *name;
    test_case_t  fn;
} test_case_map_t;

extern test_case_map_t test_fw_map[];
extern void vc_port_printf(char *f, ...);
extern uint32_t test_case_success;
extern uint32_t test_case_fail;
extern uint32_t test_case_check_err;

void    next_test_case_notify(void);
void    next_test_case_wait(void);
uint8_t test_case_register(test_case_t *case_runner);
void    test_case_run(void);
void    test_case_unregister(void);
void    test_case_init(void);
void    test_case_cleanup(void);
void    test_case_critical_enter(void);
void    test_case_critical_exit(void);

#define TEST_CASE_TASK_SIZE 1024

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

#define PASS 0
#define FAIL 1

#undef  CSI_CONFIG_TICKS_PER_SECOND
#define CSI_CONFIG_TICKS_PER_SECOND 100

#define test_intrpt_enter __disable_excp_irq
#define test_intrpt_exit  __enable_excp_irq

#define K_OK 0
#define NO_WAIT 0
#define WAIT_FOREVER  -1
#define CLEAR 1
#define NO_CLEAR 0

#define TEST_AND              0x02u
#define TEST_AND_CLEAR        0x03u
#define TEST_OR               0x00u
#define TEST_OR_CLEAR         0x01u

#define PRINT_PASS(s) printf("%-30s test [PASS %d]\n", s, test_case_success)
#define PRINT_FAIL(s) printf("%-30s test [FAIL %d]\n", s, test_case_fail)
#define PRINT_RESULT(s, f) do { if (f == PASS) { PRINT_PASS(s); } else { PRINT_FAIL(s); }} while (0)

#define TEST_FW_VAL_CHK(module_name,value) do {if ((int)(value) == 0) \
        { \
            test_case_critical_enter(); \
            test_case_check_err++;  \
            test_case_critical_exit(); \
            printf("%s test is [FAIL %d], func %s, line %d\n", \
                   module_name, (int)++test_case_check_err, __FUNCTION__, __LINE__); \
        }  \
    } while (0)

#ifdef __cplusplus
}
#endif
#endif /* TEST_UTILITY_H */
