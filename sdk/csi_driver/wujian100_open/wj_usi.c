/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file    wj_usi.c
 * @brief   CSI Source File for USI Driver
 * @version  V1.0
 * @date    02, June 2017
 ******************************************************************************/

#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <stddef.h>
#include "wj_usi.h"
#include "usi_pin_planning.h"

#define ERR_USI(errno) (CSI_DRV_ERRNO_USI_BASE | errno)

extern void wj_usi_usart_irqhandler(int idx);
extern void wj_usi_i2c_irqhandler(int idx);
extern void wj_usi_spi_irqhandler(int idx);
extern int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq);
//------------------------------------------
//            data private
//------------------------------------------
typedef struct {
    uint32_t base;
    uint32_t irq;
} wj_usi_priv_t;

static wj_usi_priv_t usi_instance[CONFIG_USI_NUM];

void wj_usi_set_rxfifo_th(wj_usi_reg_t *addr, uint32_t length)
{
    addr->USI_INTR_CTRL &= ~USI_INTR_CTRL_TH_MODE;
    addr->USI_INTR_CTRL &= USI_INTR_CTRL_RXFIFO_TH;

    if (length >= USI_RX_MAX_FIFO) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_12 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= USI_RX_MAX_FIFO - 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_8 | USI_INTR_CTRL_TH_MODE;
    } else if (length >= 4) {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4 | USI_INTR_CTRL_TH_MODE;
    } else {
        addr->USI_INTR_CTRL |= USI_INTR_CTRL_RXFIFO_TH_4;
    }
}

//------------------------------------------
//            CSI_DRIVER
//------------------------------------------
void wj_usi_irqhandler(int32_t idx)
{
    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    wj_usi_reg_t *addr = (wj_usi_reg_t *)(usi_priv->base);

    switch (addr->USI_MODE_SEL & 0x3) {
        case USI_MODE_UART:
#ifndef  CONFIG_CHIP_PANGU
            wj_usi_usart_irqhandler(idx);
#endif
            break;

        case USI_MODE_I2C:
            wj_usi_i2c_irqhandler(idx);
            break;

        case USI_MODE_SPI:
            wj_usi_spi_irqhandler(idx);
            break;

        default:
            return;
    }
}

int32_t drv_usi_initialize(int32_t idx)
{
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usi_init(idx, &base, &irq);

    if (ret < 0 || ret >= CONFIG_USI_NUM) {
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    wj_usi_priv_t *usi_priv = &usi_instance[idx];
    usi_priv->base = base;
    usi_priv->irq  = irq;

    return 0;
}

int32_t drv_usi_uninitialize(int32_t idx)
{
    if (idx < 0 || idx >= CONFIG_USI_NUM) {
        return ERR_USI(DRV_ERROR_PARAMETER);
    }

    return 0;
}
