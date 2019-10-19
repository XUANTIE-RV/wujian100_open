/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     main.c
 * @brief    CSI Source File for main
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <csi_config.h>
#include <stdint.h>
#include <stdio.h>
#include <csi_kernel.h>

extern void test_case_task_start(void);

int main(void)
{
    uint32_t ret = 0;

    printf("test_case_task_start!\n");

    csi_kernel_init();
    test_case_task_start();
    csi_kernel_start();

    return ret;
}
