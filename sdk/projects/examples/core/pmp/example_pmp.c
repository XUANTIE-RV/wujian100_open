/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_pmp.c
 * @brief    the main function for the timer driver
 * @version  V1.0
 * @date     25. March 2017
 ******************************************************************************/

#include <stdint.h>
#include <stdio.h>
#include <soc.h>
#include <csi_core.h>

#define TEST_BUF_SIZE 4096
static uint8_t __attribute__((aligned(TEST_BUF_SIZE))) test_buf[TEST_BUF_SIZE];

int example_mpu(void)
{
    mpu_region_attr_t attr;

    attr.r = attr.w = attr.x = attr.l = 1;
    attr.a = ADDRESS_MATCHING_NAPOT;

    csi_mpu_config_region(3, (uint32_t)&test_buf, REGION_SIZE_4KB, attr, 1);

    printf("PMP region 3 has been confiured and enabled.\n\r");
    printf("region 3: 0x%x--0x%x\n", (uint32_t)&test_buf, (uint32_t)&test_buf + TEST_BUF_SIZE);

    csi_mpu_disable_region(3);

    printf("Example run successfully!\n");

    return 0;
}

int main(void)
{
    return example_mpu();
}
