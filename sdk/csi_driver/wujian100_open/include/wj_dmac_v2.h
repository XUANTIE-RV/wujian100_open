/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
* @file     wj_dmac_v2.h
* @brief    header file for DMAC Driver
* @version  V1.0
* @date     02. June 2017
******************************************************************************/
#ifndef __WJ_DMAC_V2_H
#define __WJ_DMAC_V2_H
#include <stdio.h>
#include <soc.h>

#ifdef __cplusplus
extern "C" {
#endif

#define WJ_DMA_MAXCHANNEL  16

#define WJ_DMA_INT_EN      1
#define WJ_DMA_CH_EN       1
#define WJ_DMA_CH_REQ      1
#define WJ_DMACCFG_EN      1

#define WJ_DMA_TRGETCMPFR  0x8
#define WJ_DMA_HTFR        0x4
#define WJ_DMA_TFR         0x2
#define WJ_DMA_ERR         0x1

#define WJ_DMA_INTC        0x1f
#define WJ_DMA_MASK        0x13

#define WJ_CHINTM_RESETVALUE    0x0
#define WJ_CHINTC_RESETVALUE    0x0

#define WJ_DMA_ALL_CAHNNELS_PEND_INTR_VALID          0x0000ffff
#define WJ_DMA_ALL_CAHNNELS_DATA_TRANS_BUSY_VALID    0x0000ffff

typedef enum {
    DMA_ADDR_INCREMENT = 0,
    DMA_ADDR_DECREMENT = 1,
    DMA_ADDR_NOCHANGE  = 2
} enum_addr_state_e;

typedef enum {
    DMA_DATAWIDTH_SIZE8  = 1,
    DMA_DATAWIDTH_SIZE16 = 2,
    DMA_DATAWIDTH_SIZE32 = 3
} dma_datawidth_e;

typedef enum {
    DMA_GROUP_LEN1  = 1,
    DMA_GROUP_LEN2  = 2,
    DMA_GROUP_LEN3  = 3,
    DMA_GROUP_LEN4  = 4,
    DMA_GROUP_LEN5  = 5,
    DMA_GROUP_LEN6  = 6,
    DMA_GROUP_LEN7  = 7,
    DMA_GROUP_LEN8  = 8
} dma_group_len_e;

typedef enum {
    DMA_HANDSHAKING_HARDWARE = 0,
    DMA_HANDSHAKING_SOFTWARE = 1,
} dma_handshaking_select_e;

typedef enum {
    DMA_PRIORITY0 =  0,
    DMA_PRIORITY1 =  1,
    DMA_PRIOTITY2 =  2,
    DMA_PRIOTITY3 =  3,
    DMA_PRIOTITY4 =  4,
    DMA_PRIOTITY5 =  5,
    DMA_PRIOTITY6 =  6,
    DMA_PRIOTITY7 =  7,
    DMA_PRIOTITY8 =  8,
    DMA_PRIOTITY9 =  9,
    DMA_PRIOTITY10 =  10,
    DMA_PRIOTITY11 =  11,
    DMA_PRIOTITY12 =  12,
    DMA_PRIOTITY13 =  13,
    DMA_PRIOTITY14 =  14,
    DMA_PRIOTITY15 = 15
} dma_priority_t;

#define WJ_V2_DMAC_STATUSCHPEND    (WJ_DMAC0_BASE + 0x330)
#define WJ_V2_DMAC_CHSR            (WJ_DMAC0_BASE + 0x330 + 0x8)
#define WJ_V2_DMAC_DMACCFG         (WJ_DMAC0_BASE + 0x330 + 0xc)
typedef struct {
    __IOM uint32_t   SAR;       /* offset: 0x00 (R/W) Channel Source Address Register        */
    __IOM uint32_t   DAR;       /* offset: 0x04 (R/W) Channel Destination Address Register   */
    __IOM uint32_t   CHCTRLA;   /* offset: 0x08 (R/W) Channel Control Register A             */
    __IOM uint32_t   CHCTRLB;   /* offset: 0x0C (R/W) Channel Control Register B             */
    __IOM uint32_t   CHINTM;   /* offset: 0x10 (R/W) Channel Interrupt Mask Register        */
    __IM  uint32_t   CHINTS;   /* offset: 0x14 (R/ ) Channel Interrupt Status Register      */
    __IOM uint32_t   CHINTC;   /* offset: 0x18 (R/W) Channel Interrupt Clear Register       */
    __IOM uint32_t   CHSREQ;   /* offset: 0x1C (R/W) Channel Software Request Register      */
    __IOM uint32_t   CHEN;     /* offset: 0x20 (R/W) Channel Enable Register                */
} wj_dma_reg_t;
#ifdef __cplusplus
}
#endif

#endif /* __WJ_DMAC_V2_H */
