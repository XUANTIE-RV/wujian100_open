/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_spi.c
 * @brief    the main function for the SPI driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_spi.h"
#include "stdio.h"
#include "soc.h"
#include <string.h>
#include <pin.h>
#include "drv_gpio.h"
#include "w25q64fv.h"

#define OPERATE_ADDR    0x0
#define OPERATE_LEN     256
#define SPIFLASH_BASE_VALUE 0x0
static uint8_t erase_read_flag = 0;
static uint8_t program_read_flag = 0;

extern int32_t w25q64flash_read_id(spi_handle_t handle, uint32_t *id_num);
extern int32_t w25q64flash_erase_sector(spi_handle_t handle, uint32_t addr);
extern int32_t w25q64flash_erase_chip(spi_handle_t handle);
extern int32_t w25q64flash_program_data(spi_handle_t handle, uint32_t addr, const void *data, uint32_t cnt);
extern int32_t w25q64flash_read_data(spi_handle_t handle, uint32_t addr, void *data, uint32_t cnt);
extern int32_t drv_pinmux_config(pin_name_e pin, pin_func_e pin_func);
static void spi_event_cb_fun(int32_t idx, spi_event_e event)
{
    //printf("\nspi_event_cb_fun:%d\n",event);
}

void example_pin_spi_init(void)
{
    drv_pinmux_config(EXAMPLE_PIN_SPI_MISO, EXAMPLE_PIN_SPI_MISO_FUNC);
    drv_pinmux_config(EXAMPLE_PIN_SPI_MOSI, EXAMPLE_PIN_SPI_MOSI_FUNC);
    drv_pinmux_config(EXAMPLE_PIN_SPI_SCK, EXAMPLE_PIN_SPI_SCK_FUNC);
    drv_pinmux_config(EXAMPLE_PIN_SPI_CS, EXAMPLE_PIN_SPI_CS_FUNC);
}

static uint8_t input[OPERATE_LEN] = {0};
static uint8_t output[OPERATE_LEN] = {0};
static int test_spi_eeprom(int32_t idx)
{
    uint8_t id[5] = {0x11, 0x11};

    int i;
    int32_t ret;
    spi_handle_t spi_handle_t;

    example_pin_spi_init();

    spi_handle_t = csi_spi_initialize(idx, spi_event_cb_fun);

    if (spi_handle_t == NULL) {
        printf(" csi_spi_initialize failed\n");
        return -1;
    }

    ret = csi_spi_config(spi_handle_t, W25Q64FV_CLK_RATE, SPI_MODE_MASTER,
                         SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB,
                         SPI_SS_MASTER_SW, 8);

    if (ret != 0) {
        printf("%s(), %d spi config error, %d\n", __func__, __LINE__, ret);
        return -1;
    }

    ret = w25q64flash_read_id(spi_handle_t, (uint32_t *)&id);

    if (ret < 0) {
        printf(" flash_read_id failed\n");
        return -1;
    }

    printf("the spiflash id is %x %x\r\n", id[3], id[4]);

    ret = w25q64flash_erase_sector(spi_handle_t, OPERATE_ADDR);

    if (ret < 0) {
        printf(" flash_erase_sector failed\n");
        return -1;
    }


    ret = w25q64flash_read_data(spi_handle_t, OPERATE_ADDR, output, OPERATE_LEN);


    if (ret < 0) {
        printf(" flash_read_data failed\n");
        return -1;
    }

    printf("erase sector and then read\n");

    for (i = 0; i < OPERATE_LEN; i++) {
        if ((i % 10) == 0) {
            printf("output[%d]", i);
        }

        printf("%x ", output[i]);

        if (((i + 1) % 10) == 0) {
            printf("\n");
        }

        if (output[i] != 0xff) {
            erase_read_flag = 1;
            break;
        }
    }

    printf("\n");

    if (erase_read_flag == 1) {
        printf("flash erase check and read check failed\n");
        return -1;
    }

    for (i = 0; i < OPERATE_LEN; i++) {
        input[i] = i + SPIFLASH_BASE_VALUE;
    }


    printf("flash erase sector passed\n");
    memset(output, 0x00, sizeof(output));

    ret = w25q64flash_program_data(spi_handle_t, OPERATE_ADDR, input, OPERATE_LEN);

    if (ret == -1) {
        printf("%s, %d ,flash program data error\n", __func__, __LINE__);
    }

    ret = w25q64flash_read_data(spi_handle_t, OPERATE_ADDR, output, OPERATE_LEN);

    if (ret == -1) {
        printf("%s, %d ,flash read error\n", __func__, __LINE__);
    }

    printf("program data and then read\n");

    for (i = 0; i < OPERATE_LEN; i++) {
        if ((i % 10) == 0) {
            printf("output[%d]", i);
        }

        printf("%d ", output[i]);

        if (((i + 1) % 10) == 0) {
            printf("\n");
        }

        if (output[i] != input[i]) {
            program_read_flag = 1;
            break;
        }
    }

    printf("\n");

    if (program_read_flag == 1) {
        printf("flash program and read check failed\n");
        return -1;
    }

    printf("flash program data passed\n");

    ret = csi_spi_uninitialize(spi_handle_t);
    return 0;

}

int example_spi(int32_t idx)
{
    int ret;
    ret = test_spi_eeprom(idx);

    if (ret < 0) {
        printf("test spi eeprom failed\n");
        return -1;
    }

    printf("test spi eeprom successfully\n");

    return 0;
}

int main(void)
{
    return example_spi(EXAMPLE_SPI_IDX);
}
