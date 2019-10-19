/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "pin.h"
#define csi_usart_initialize       drv_usi_usart_initialize
#define csi_usart_uninitialize     drv_usi_usart_uninitialize
#define csi_usart_get_capabilities drv_usi_usart_get_capabilities
#define csi_usart_config           drv_usi_usart_config
#define csi_usart_send             drv_usi_usart_send
#define csi_usart_abort_send       drv_usi_usart_abort_send
#define csi_usart_receive          drv_usi_usart_receive
#define csi_usart_receive_query    drv_usi_usart_receive_query
#define csi_usart_abort_receive    drv_usi_usart_abort_receive
#define csi_usart_transfer         drv_usi_usart_transfer
#define csi_usart_abort_transfer   drv_usi_usart_abort_transfer
#define csi_usart_get_status       drv_usi_usart_get_status
#define csi_usart_flush            drv_usi_usart_flush
#define csi_usart_set_interrupt    drv_usi_usart_set_interrupt
#define csi_usart_config_baudrate  drv_usi_usart_config_baudrate
#define csi_usart_config_mode      drv_usi_usart_config_mode
#define csi_usart_config_parity    drv_usi_usart_config_parity
#define csi_usart_config_stopbits  drv_usi_usart_config_stopbits
#define csi_usart_config_databits  drv_usi_usart_config_databits
#define csi_usart_getchar          drv_usi_usart_getchar
#define csi_usart_putchar          drv_usi_usart_putchar
#define csi_usart_get_tx_count     drv_usi_usart_get_tx_count
#define csi_usart_get_rx_count     drv_usi_usart_get_rx_count
#define csi_usart_power_control    drv_usi_usart_power_control
#define csi_usart_config_flowctrl  drv_usi_usart_config_flowctrl
#define csi_usart_config_clock     drv_usi_usart_config_clock
#define csi_usart_control_tx       drv_usi_usart_control_tx
#define csi_usart_control_rx       drv_usi_usart_control_rx
#define csi_usart_control_break    drv_usi_usart_control_break

#undef EXAMPLE_PIN_USART_TX
#undef EXAMPLE_PIN_USART_RX
#undef EXAMPLE_PIN_USART_TX_FUNC
#undef EXAMPLE_PIN_USART_RX_FUNC
#undef EXAMPLE_USART_IDX

#define EXAMPLE_USART_IDX         EXAMPLE_USI_USART_IDX
#define EXAMPLE_PIN_USART_TX      EXAMPLE_PIN_USI_USART_TX
#define EXAMPLE_PIN_USART_RX      EXAMPLE_PIN_USI_USART_RX
#define EXAMPLE_PIN_USART_TX_FUNC EXAMPLE_PIN_USI_USART_TX_FUNC
#define EXAMPLE_PIN_USART_RX_FUNC EXAMPLE_PIN_USI_USART_RX_FUNC

#include "example_usart.txt"
