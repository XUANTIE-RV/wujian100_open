/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     wj_usi_spi.h
 * @brief    header file for usi spi
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#ifndef _WJ_USI_SPI_H_
#define _WJ_USI_SPI_H_

#include "wj_usi.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    WJENUM_SPI_TXRX = 0,
    WJENUM_SPI_TX   = 1,
    WJENUM_SPI_RX   = 2,
    WJENUM_SPI_EERX = 3
} WJENUM_SPI_MODE;

typedef enum {
    WJENUM_SPI_CLOCK_POLARITY_LOW   = 0,
    WJENUM_SPI_CLOCK_POLARITY_HIGH  = 1
} WJENUM_SPI_POLARITY;

typedef enum {
    WJENUM_SPI_CLOCK_PHASE_MIDDLE   = 0,
    WJENUM_SPI_CLOCK_PHASE_START    = 1
} WJENUM_SPI_PHASE;

typedef enum {
    WJENUM_SPI_DATASIZE_4   = 3,
    WJENUM_SPI_DATASIZE_5   = 4,
    WJENUM_SPI_DATASIZE_6   = 5,
    WJENUM_SPI_DATASIZE_7   = 6,
    WJENUM_SPI_DATASIZE_8   = 7,
    WJENUM_SPI_DATASIZE_9   = 8,
    WJENUM_SPI_DATASIZE_10  = 9,
    WJENUM_SPI_DATASIZE_11  = 10,
    WJENUM_SPI_DATASIZE_12  = 11,
    WJENUM_SPI_DATASIZE_13  = 12,
    WJENUM_SPI_DATASIZE_14  = 13,
    WJENUM_SPI_DATASIZE_15  = 14,
    WJENUM_SPI_DATASIZE_16  = 15
} WJENUM_SPI_DATAWIDTH;

#define WJ_USI_SPI_MODE_MASTER  0x1
#define WJ_USI_SPI_MODE_SLAVE   0x0
/* some register bits macro for spi control register */
#define WJ_USI_SPI_CTRL_CPOL        (1 << 7)
#define WJ_USI_SPI_CTRL_CPHA        (1 << 6)
#define WJ_USI_SPI_CTRL_TMODE       (3 << 4)
#define WJ_USI_SPI_CTRL_TMODE_TXRX  (0 << 4)
#define WJ_USI_SPI_CTRL_TMODE_TX    (1 << 4)
#define WJ_USI_SPI_CTRL_TMODE_RX    (2 << 4)
#define WJ_USI_SPI_CTRL_DATA_SIZE   0xfff0

#define SPI_INITIALIZED         ((uint8_t)(1U))             // SPI initalized
#define SPI_POWERED             ((uint8_t)(1U<< 1))         // SPI powered on
#define SPI_CONFIGURED          ((uint8_t)(1U << 2))        // SPI configured
#define SPI_DATA_LOST           ((uint8_t)(1U << 3))        // SPI data lost occurred
#define SPI_MODE_FAULT          ((uint8_t)(1U << 4))        // SPI mode fault occurred

#ifdef __cplusplus
}
#endif

#endif /* _WJ_USI_SPI_H_ */
