/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "drv_dmac.h"
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "test_driver_config.h"

#define DMA_M2M_SIZE    512
static  volatile uint8_t dma_cb_flag = 0;
static uint8_t p_src[DMA_M2M_SIZE];
static uint8_t p_dst[DMA_M2M_SIZE];

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

static dma_config_t dmac_config[] = {
    {
        .src_inc = DMA_ADDR_INC + 1,
        .dst_inc = DMA_ADDR_INC,
        .src_endian = DMA_ADDR_BIG,
        .dst_endian = DMA_ADDR_BIG,
        .type = DMA_PERH2PERH,
        .src_reload_en = 0,
        .dest_reload_en = 0,
    },
    {
        .src_inc = DMA_ADDR_INC,
        .dst_inc = DMA_ADDR_INC + 1,
        .src_endian = DMA_ADDR_BIG,
        .dst_endian = DMA_ADDR_BIG,
        .type = DMA_PERH2PERH,
        .src_reload_en = 0,
        .dest_reload_en = 0,
    },
    {
        .src_inc = DMA_ADDR_INC,
        .dst_inc = DMA_ADDR_INC,
        .src_endian = DMA_ADDR_BIG + 1,
        .dst_endian = DMA_ADDR_BIG,
        .type = DMA_PERH2PERH,
        .src_reload_en = 0,
        .dest_reload_en = 0,
    },
    {
        .src_inc = DMA_ADDR_INC,
        .dst_inc = DMA_ADDR_INC,
        .src_endian = DMA_ADDR_BIG,
        .dst_endian = DMA_ADDR_BIG + 1,
        .type = DMA_PERH2PERH,
        .src_reload_en = 0,
        .dest_reload_en = 0,
    },
    {
        .src_inc = DMA_ADDR_INC,
        .dst_inc = DMA_ADDR_INC,
        .src_endian = DMA_ADDR_BIG,
        .dst_endian = DMA_ADDR_BIG,
        .type = DMA_PERH2PERH + 1,
        .src_reload_en = 0,
        .dest_reload_en = 0,
    },
};

typedef struct {
    uint8_t ch;
    dma_config_t *config;
    uint32_t expect_out;
} dmac_test_t;

static dmac_test_t dmac_config_cases[] = {
    {0,  NULL, CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
    {0,  &dmac_config[1], CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
    {0,  &dmac_config[2], CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
    {0,  &dmac_config[3], CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
    {0,  &dmac_config[4], CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
    {0,  &dmac_config[5], CSI_DRV_ERRNO_DMA_BASE | DRV_ERROR_PARAMETER},
};

static void test_csi_dmac_alloc_channel(void)
{
    int32_t ch = csi_dma_alloc_channel();
    ASSERT_TRUE(ch != -1);

    csi_dma_release_channel(ch);
}


static void test_csi_dmac_get_status(void)
{
    int32_t ch = csi_dma_alloc_channel();
    ASSERT_TRUE(ch != -1);

    dma_status_e dma_status = csi_dma_get_status(ch);
    ASSERT_TRUE(dma_status == DMA_STATE_READY);

    csi_dma_release_channel(ch);
}

static void test_csi_dmac_config(void)
{
    uint32_t i;
    uint32_t ret;

    for (i = 0; i < sizeof(dmac_config_cases) / (sizeof(dmac_test_t)); i++) {
        int32_t ch = csi_dma_alloc_channel();

        ASSERT_TRUE(ch == dmac_config_cases[i].ch);
        ret = csi_dma_config_channel(dmac_config_cases[i].ch, dmac_config_cases[i].config, dma_event_cb_fun, NULL);
        ASSERT_TRUE(ret == dmac_config_cases[i].expect_out);
        csi_dma_release_channel(dmac_config_cases[i].ch);
    }
}

static void dma_test_mem2mem(void)
{
    uint32_t i;
    uint8_t success = 1;
    int32_t ch;
    dma_config_t config;
    uint32_t ret;

    // printf("==================[dma_mem2mem_test_func] begin==================\n");

    for (i = 0; i < DMA_M2M_SIZE; i++) {
        p_src[i] = i;
    }

    memset(p_dst, 0, DMA_M2M_SIZE);

    ch = csi_dma_alloc_channel();
    ASSERT_TRUE(ch != -1);
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
    ASSERT_TRUE(ret == 0);
    csi_dma_start(ch, p_src, p_dst, DMA_M2M_SIZE);

    printf("sleep or do other things while data in transfermation using DMA\n");
    sleep(1);

    while (!dma_cb_flag);

    for (i = 0; i < DMA_M2M_SIZE; i++) {
        if (p_dst[i] != p_src[i]) {
            success = 0;
            ASSERT_TRUE(success == 0);
            break;
        }
    }

    ASSERT_TRUE(success == 1);

    csi_dma_stop(ch);
    csi_dma_release_channel(ch);
}

int test_dmac()
{
    dtest_suite_info_t test_suite_info = {
        "test_dmac", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "dma_test_mem2mem", dma_test_mem2mem, DMA_MEM2MEM_EN},
        { "test_csi_dmac_get_status", test_csi_dmac_get_status, DMAC_GET_STATUS_INTERFACE_EN },
        { "test_csi_dmac_alloc_channel", test_csi_dmac_alloc_channel, DMAC_ALLOC_INTERFACE_EN },
        { "test_csi_dmac_config", test_csi_dmac_config, DMAC_CONFIG_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
