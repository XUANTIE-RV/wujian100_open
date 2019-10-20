/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     test_driver_config.h
 * @brief    head file for driver config
 * @version  V1.0
 * @date     02. June 2019
 ******************************************************************************/
#ifndef _TEST_DRIVER_CONFIG_H_
#define _TEST_DRIVER_CONFIG_H_

#include "pin.h"
#include "pin_name.h"

#ifdef __cplusplus
extern "C" {
#endif

#define TEST_TIMER  1
#define TEST_USART  1
#define TEST_GPIO   1
#define TEST_IIC        1
#define TEST_SPI        1
#define TEST_PWM    1
#define TEST_DMAC   1
#define TEST_RTC    1
#define TEST_WDT    1


/* GPIO case config */
#define GPIO_GET_VALUE_EN       0x1
#define GPIO_SET_VALUE_EN       0x1
#define GPIO_RISNG_EDGE_EN      0x1
#define GPIO_FALLING_EDGE_EN    0x1
#define GPIO_HIGH_LEVEL_EN      0x1
#define GPIO_LOW_LEVEL_EN       0x1
#define GPIO_PORT_CONFIG_EN     0x1
#define GPIO_PIN_IRQ_SET_EN     0x1
#define GPIO_TEST_INTERFACE_EN  0x1

#define test_gpio_port  CTS_GPIO_TEST_PORT
#define test_gpio_pin   TEST_GPIO_PIN

/* DMAC case config*/
#define DMA_MEM2MEM_EN                0x1
#define DMAC_CONFIG_INTERFACE_EN      0x1
#define DMAC_START_INTERFACE_EN       0x1
#define DMAC_STOP_INTERFACE_EN        0x1
#define DMAC_ALLOC_INTERFACE_EN       0x1
#define DMAC_RELEASE_INTERFACE_EN     0x1
#define DMAC_GET_STATUS_INTERFACE_EN  0x1

/* RTC case config */
#define RTC_TEST_TIMEOUT_EN     0x01
#define RTC_TEST_LEAP_YEAR_EN   0x01
#define RTC_TEST_INTERFACE_EN   0x01

/* PWM case config */
#define PWM_TEST_INTERFACE_EN   0x1
#define PWM_TEST_FUN_EN         0x1

/* TIMER case config */
#define TIMER_TEST_FREE_RUNNING 0x1
#define TIMER_TEST_USER_DEFINED 0x1
#define TIMER_TEST_INTERFACE_EN 0x1

/* USART case config */
#define USART_TEST_FUN_EN       0x1
#define USART_TEST_INTERFACE_EN 0x1

/* WDT case config */
#define WDT_FUN_FEEDOG_EN       0x1
#define WDT_FUN_SYSRESET_EN     0x1
#define WDT_TEST_INTERFACE_EN   0x1

/* IIC case config */
#define IIC_TEST_AT24C64_WRITE_READ_EN         0x1
#define IIC_TEST_ABORT_TRANSFER_INTERFACE_EN   0x1
#define IIC_TEST_CONFIG_INTERFACE_EN           0x1

/* SPI case config */
#define SPI_TEST_W25Q64FV_RDID_EN           0x1
#define SPI_TEST_W25Q64FV_SECTOR_ERASE_EN   0x1
#define SPI_TEST_W25Q64FV_PROGRAM_EN        0x1
#define SPI_TEST_W25Q64FV_READ_EN           0x1
#define SPI_TEST_CONFIG_INTERFACE_EN         0x1

#ifdef __cplusplus
}
#endif

#endif
