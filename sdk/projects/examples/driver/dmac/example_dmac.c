/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_dmac.c
 * @brief    the main function for the DMAC driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_dmac.h"
#include "stdio.h"
#include "soc.h"
#include <string.h>

static  volatile uint8_t dma_cb_flag = 0;
#ifndef DMA_M2M_SIZE
#define DMA_M2M_SIZE    512
#endif
static uint8_t p_src[DMA_M2M_SIZE] = {0};
static uint8_t p_dst[DMA_M2M_SIZE] = {0};

static void sleep(uint32_t k)
{
    int i, j;

    for (i = 0; i < 1000; i++) {
        for (j = 0; j < k; j++);
    }
}
static void dma_event_cb_fun(int32_t ch, dma_event_e event, void *arg)
{
    dma_cb_flag = 1;
}

static int32_t dma_test_mem2mem(void)
{
    uint32_t i;
    dma_config_t config;
    int32_t ret;
    int32_t ch;

    for (i = 0; i < DMA_M2M_SIZE; i++) {
        p_src[i] = i;
    }

    memset(p_dst, 0, DMA_M2M_SIZE);

    ch = csi_dma_alloc_channel();

    if (ch == -1) {
        printf("csi_dma_alloc_channel error\n");
        return -1;
    }

    config.src_inc  = DMA_ADDR_INC;
    config.dst_inc  = DMA_ADDR_INC;
    config.src_endian = DMA_ADDR_LITTLE;
    config.dst_endian = DMA_ADDR_LITTLE;
    config.src_tw   = 1;
    config.dst_tw   = 1;
    config.group_len = 8;
    config.mode = DMA_BLOCK_TRIGGER;
    config.type     = DMA_MEM2MEM;
    config.ch_mode  = DMA_MODE_SOFTWARE;
    config.src_reload_en = 0;
    config.dest_reload_en = 0;

    ret = csi_dma_config_channel(ch, &config, dma_event_cb_fun, NULL);

    if (ret < 0) {
        csi_dma_release_channel(ch);
        printf("csi_dma_config_channel error\n");
        return 0;
    }

    csi_dma_start(ch, p_src, p_dst, DMA_M2M_SIZE);

    printf("sleep or do other things while data in transfermation using DMA\n");
    sleep(1);

    //while (csi_dma_get_status(dma_handle, ch) != DMA_STATE_DONE) ;
    while (!dma_cb_flag);

    for (i = 0; i < DMA_M2M_SIZE; i++) {
        if (p_dst[i] != p_src[i]) {
            return -1;
        }
    }

    csi_dma_stop(ch);
    csi_dma_release_channel(ch);

    printf("dma_mem2mem_test_func OK\n");
    return 0;
}
static int32_t test_dmac(void)
{
    int32_t ret;

    ret = dma_test_mem2mem();

    if (ret < 0) {
        printf("test dma mem to mem error\n");
        return -1;
    }

    return 0;
}

int example_dmac(void)
{
    int ret;
    ret = test_dmac();

    if (ret < 0) {
        printf("test dmac failed\n");
        return -1;
    }

    printf("test dmac successfully\n");
    return 0;
}

int main(void)
{
    return example_dmac();
}

