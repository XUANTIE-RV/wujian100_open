/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     wj_usi_usart.h
 * @brief    header file for usart driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#ifndef _WJ_USI_USART_H_
#define _WJ_USI_USART_H_

#include "wj_usi.h"

#ifdef __cplusplus
extern "C" {
#endif

#define CTRL_DBIT_BITS  0x3c
#define CTRL_DBIT_5     0x0
#define CTRL_DBIT_6     0x1
#define CTRL_DBIT_7     0x2
#define CTRL_DBIT_8     0x3

#define CTRL_STOP_BITS 0x33
#define CTRL_STOP_1     (0x0 << 2)
#define CTRL_STOP_1_5   (0x1 << 2)
#define CTRL_STOP_2     (0x2 << 2)

#define CTRL_PARITY_BITS    0x0f
#define CTRL_PARITY_ENABLE  (0x1 << 4)
#define CTRL_PARITY_ODD     (0x0 << 5)
#define CTRL_PARITY_EVEN    (0x1 << 5)

#define WJ_UART_INT_ENABLE_DEFAUL (USI_INT_UART_PERR | USI_INT_UART_STOP | USI_INT_RX_WERR | \
                                   USI_INT_RX_RERR | USI_INT_RX_FULL \
                                   | USI_INT_TX_WERR | USI_INT_TX_RERR)
#ifdef __cplusplus
}
#endif

#endif /* _WJ_USI_USART_H_ */
