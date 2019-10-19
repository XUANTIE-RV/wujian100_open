/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include"pin.h"

#define csi_spi_initialize              drv_usi_spi_initialize
#define csi_spi_uninitialize            drv_usi_spi_uninitialize
#define csi_spi_get_capabilities        drv_usi_spi_get_capabilities
#define csi_spi_config                  drv_usi_spi_config
#define csi_spi_send                    drv_usi_spi_send
#define csi_spi_receive                 drv_usi_spi_receive
#define csi_spi_transfer                drv_usi_spi_transfer
#define csi_spi_abort_transfer          drv_usi_spi_abort_transfer
#define csi_spi_get_status              drv_usi_spi_get_status
#define csi_spi_config_mode             drv_usi_spi_config_mode
#define csi_spi_config_block_mode       drv_usi_spi_config_block_mode
#define csi_spi_config_baudrate         drv_usi_spi_config_baudrate
#define csi_spi_config_bit_order        drv_usi_spi_config_bit_order
#define csi_spi_config_datawidth        drv_usi_spi_config_datawidth
#define csi_spi_config_format           drv_usi_spi_config_format
#define csi_spi_config_ss_mode          drv_usi_spi_config_ss_mode
#define csi_spi_get_data_count          drv_usi_spi_get_data_count
#define csi_spi_power_control           drv_usi_spi_power_control
#define csi_spi_ss_control              drv_usi_spi_ss_control

#undef EXAMPLE_PIN_SPI_MISO
#undef EXAMPLE_PIN_SPI_MOSI
#undef EXAMPLE_PIN_SPI_CS
#undef EXAMPLE_PIN_SPI_SCK
#undef EXAMPLE_PIN_SPI_MISO_FUNC
#undef EXAMPLE_PIN_SPI_MOSI_FUNC
#undef EXAMPLE_PIN_SPI_CS_FUNC
#undef EXAMPLE_PIN_SPI_SCK_FUNC
#undef EXAMPLE_SPI_IDX

#define EXAMPLE_SPI_IDX                 EXAMPLE_USI_SPI_IDX
#define EXAMPLE_PIN_SPI_MISO            EXAMPLE_PIN_USI_SPI_MISO
#define EXAMPLE_PIN_SPI_MOSI            EXAMPLE_PIN_USI_SPI_MOSI
#define EXAMPLE_PIN_SPI_CS              EXAMPLE_PIN_USI_SPI_CS
#define EXAMPLE_PIN_SPI_SCK             EXAMPLE_PIN_USI_SPI_SCK
#define EXAMPLE_PIN_SPI_MISO_FUNC       EXAMPLE_PIN_USI_SPI_MISO_FUNC
#define EXAMPLE_PIN_SPI_MOSI_FUNC       EXAMPLE_PIN_USI_SPI_MOSI_FUNC
#define EXAMPLE_PIN_SPI_CS_FUNC         EXAMPLE_PIN_USI_SPI_CS_FUNC
#define EXAMPLE_PIN_SPI_SCK_FUNC        EXAMPLE_PIN_USI_SPI_SCK_FUNC

#include "example_spi.txt"
#include "w25q64fv.txt"
