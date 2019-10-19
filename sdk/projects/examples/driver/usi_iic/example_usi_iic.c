/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


#include "pin.h"

#define csi_iic_initialize               drv_usi_iic_initialize
#define csi_iic_uninitialize             drv_usi_iic_uninitialize
#define csi_iic_get_capabilities         drv_usi_iic_get_capabilities
#define csi_iic_config                   drv_usi_iic_config
#define csi_iic_master_send              drv_usi_iic_master_send
#define csi_iic_master_receive           drv_usi_iic_master_receive
#define csi_iic_slave_send               drv_usi_iic_slave_send
#define csi_iic_slave_receive            drv_usi_iic_slave_receive
#define csi_iic_abort_transfer           drv_usi_iic_abort_transfer
#define csi_iic_get_status               drv_usi_iic_get_status
#define csi_iic_power_control            drv_usi_iic_power_control
#define csi_iic_config_mode              drv_usi_iic_config_mode
#define csi_iic_config_speed             drv_usi_iic_config_speed
#define csi_iic_config_addr_mode         drv_usi_iic_config_addr_mode
#define csi_iic_config_slave_addr        drv_usi_iic_config_slave_addr
#define csi_iic_get_data_count           drv_usi_iic_get_data_count
#define csi_iic_send_start               drv_usi_iic_send_start
#define csi_iic_send_stop                drv_usi_iic_send_stop
#define csi_iic_reset                    drv_usi_iic_reset

#undef EXAMPLE_PIN_IIC_SDA
#undef EXAMPLE_PIN_IIC_SCL
#undef EXAMPLE_PIN_IIC_SDA_FUNC
#undef EXAMPLE_PIN_IIC_SCL_FUNC
#undef EXAMPLE_IIC_IDX

#define EXAMPLE_IIC_IDX                 EXAMPLE_USI_IIC_IDX
#define EXAMPLE_PIN_IIC_SDA             EXAMPLE_PIN_USI_IIC_SDA
#define EXAMPLE_PIN_IIC_SCL             EXAMPLE_PIN_USI_IIC_SCL
#define EXAMPLE_PIN_IIC_SDA_FUNC        EXAMPLE_PIN_USI_IIC_SDA_FUNC
#define EXAMPLE_PIN_IIC_SCL_FUNC        EXAMPLE_PIN_USI_IIC_SCL_FUNC

#include "example_iic.txt"
