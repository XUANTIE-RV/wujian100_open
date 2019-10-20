/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     w25q64fv.c
 * @brief    the test function for the at15f512a driver
 * @version  V1.0
 * @date     23. July 2017
 ******************************************************************************/
#include <csi_config.h>
#include "w25q64fv.h"
#include "dtest.h"
#include "stdio.h"
#include "drv_spi.h"
#include <string.h>
#include "soc.h"
#include "drv_gpio.h"
#include "pin.h"

#define TEST_SPI_TIMEOUT 0x100000
static uint32_t timecount = 0;

gpio_pin_handle_t pgpio_pin_handle;
//
// Functions
//
static int32_t spi_norflash_read_status_register(spi_handle_t handle, uint8_t *status)
{
    uint8_t command[2] = {0x05};
    uint8_t ret = 0;
    uint8_t data[2] = {0};

    /* read status register*/

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_transfer(handle, &command, data, 2, 2);

    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    *status = data[1];
    return 0;
}
extern int g_flags;
static int32_t spi_norflash_write_page(spi_handle_t handle, uint32_t dst_addr, uint8_t *src_buf, uint32_t len)
{
    uint8_t reg1 = 0xff;
    uint8_t reg = 0x00;
    uint8_t command_enable_write = 0x06;
    uint8_t command_page_write[132] = {0x02, 0x0, 0x0, 0x0};
    uint8_t ret = 0;
    spi_status_t status = {0};

    if (len == 0 || src_buf == NULL) {
        return -1;
    }

    ret = csi_spi_config(handle, W25Q64FV_CLK_RATE, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8);
    ASSERT_TRUE(ret == 0);

    command_page_write[1] = (dst_addr >> 16) & 0xff;
    command_page_write[2] = (dst_addr >> 8) & 0xff;
    command_page_write[3] = dst_addr & 0xff;

    memcpy(&command_page_write[4], src_buf, len);
    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, &command_enable_write, 1);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);

    timecount = 0;

    while ((reg & 0x2) == 0) {
        spi_norflash_read_status_register(handle, &reg);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, command_page_write, len + 4);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    timecount = 0;

    while (1) {
        status = csi_spi_get_status(handle);

        if (status.busy == 0) {
            break;
        }

        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    timecount = 0;

    while (((reg1 & 0x1) == 1) || ((reg1 & 0x2) == 0x2)) {
        spi_norflash_read_status_register(handle, &reg1);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    return 0;
}

/**
  \fn          int32_t CSKY_Flash_ReadData (CSKY_DRIVER_FLASH *instance, uint32_t addr, void *data, uint32_t cnt)
  \brief       Read data from Flash.
  \param[in]   instance     Pointer to flash's instance
  \param[in]   addr  Data address.
  \param[out]  data  Pointer to a buffer storing the data read from Flash.
  \param[in]   cnt   Number of data items to read.
  \return      number of data items read or \ref execution_status
*/
int32_t w25q64flash_read_data(spi_handle_t handle, uint32_t addr, void *data, uint32_t cnt)
{

    uint8_t command[8] = {0x3, 0x0, 0x0, 0x00};
    uint8_t ret = 0;
    spi_status_t status = {0};
    uint32_t count = 0;
    uint8_t rxdata[8] = {0};

    if (!IS_FLASH_ADDR((int32_t)addr) || !(IS_FLASH_ADDR((int32_t)(addr + cnt))) || data == NULL) {
        printf("error\n");
        return -1;
    }

    ret = csi_spi_config(handle, W25Q64FV_CLK_RATE, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8);
    ASSERT_TRUE(ret == 0);

    while (count < cnt) {
        command[1] = (addr >> 16) & 0xff;
        command[2] = (addr >> 8) & 0xff;
        command[3] = addr & 0xff;

        csi_gpio_pin_write(pgpio_pin_handle, false);
        csi_spi_transfer(handle, command, rxdata, 8, 8);
        timecount = 0;

        while (csi_spi_get_status(handle).busy) {
            timecount++;

            if (timecount >= TEST_SPI_TIMEOUT) {
                printf("transfer timeout\n");
                csi_gpio_pin_write(pgpio_pin_handle, true);
                return -1;
            }
        }

        csi_gpio_pin_write(pgpio_pin_handle, true);

        memcpy(data, &rxdata[4], 4);
        addr = addr + 4;
        count = count + 4;
        data = data + 4;
    }

    timecount = 0;

    while (1) {
        status = csi_spi_get_status(handle);

        if (status.busy == 0) {
            break;
        }

        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    return cnt;
}

/**
  \fn          int32_t CSKY_Flash_ReadID (CSKY_DRIVER_FLASH *instance, uint32_t *id_num)
  \brief       Read the FlashID.
  \param[in]   instance     Pointer to flash's instance
  \param[in]   id_num    Pointer to the id.
  \return      \ref execution_status
*/
int32_t w25q64flash_read_id(spi_handle_t handle, uint32_t *id_num)
{
    uint8_t command[6] = {0x90, 0x0, 0x0, 0x0, 0x0, 0x0};
    uint8_t ret = 0;
    uint8_t rxdata[6] = {0};
    /* read the ID*/
    ret = csi_spi_config(handle, W25Q64FV_CLK_RATE, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8);
    ASSERT_TRUE(ret == 0);
    drv_pinmux_config(TEST_PIN_SPI_CS, PIN_FUNC_GPIO);
    pgpio_pin_handle = csi_gpio_pin_initialize(TEST_PIN_SPI_CS, NULL);
    csi_gpio_pin_config_mode(pgpio_pin_handle, GPIO_MODE_PULLNONE);
    csi_gpio_pin_config_direction(pgpio_pin_handle, GPIO_DIRECTION_OUTPUT);
    csi_gpio_pin_write(pgpio_pin_handle, true);
    csi_gpio_pin_write(pgpio_pin_handle, false);

    ret = csi_spi_transfer(handle, command, &rxdata, 6, 6);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    memcpy((uint8_t *)id_num, &rxdata[4], 2);
    return 0;
}

/**
  \fn          int32_t CSKY_Flash_EraseSector (CSKY_DRIVER_FLASH *instance, uint32_t addr)
  \brief       Erase Flash Sector.
  \param[in]   instance     Pointer to flash's instance
  \param[in]   addr  Sector address
  \return      \ref execution_status
*/
int32_t w25q64flash_erase_sector(spi_handle_t handle, uint32_t addr)
{
    uint8_t reg1 = 0xff;
    uint8_t reg = 0x0;
    uint8_t command_enable_write = 0x06;
    uint8_t command_erase_sector[4] = {0x52, 0x0, 0x0, 0x0};
    uint8_t ret = 0;

    ret = csi_spi_config(handle, W25Q64FV_CLK_RATE, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8);
    ASSERT_TRUE(ret == 0);

    command_erase_sector[1] = (addr >> 16) & 0xff;
    command_erase_sector[2] = (addr >> 8) & 0xff;
    command_erase_sector[3] = addr & 0xff;

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, &command_enable_write, 1);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    timecount = 0;

    while ((reg & 0x2) == 0) {
        spi_norflash_read_status_register(handle, &reg);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, command_erase_sector, 4);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    timecount = 0;

    while (((reg1 & 0x1) == 1) || ((reg1 & 0x2) == 0x2)) {
        spi_norflash_read_status_register(handle, &reg1);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    return 0;
}

/**
  \fn          int32_t CSKY_Flash_EraseChip (CSKY_DRIVER_FLASH *instance)
  \brief       Erase complete Flash.
               Optional function for faster full chip erase.
  \param[in]   instance     Pointer to flash's instance
  \return      \ref execution_status
*/
int32_t w25q64flash_erase_chip(spi_handle_t handle)
{
    uint8_t reg1 = 0xff;
    uint8_t reg = 0x0;
    uint8_t command_enable_write = 0x06;
    uint8_t command_erase_chip = 0x62;
    uint8_t ret = 0;


    ret = csi_spi_config(handle, W25Q64FV_CLK_RATE, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8);
    ASSERT_TRUE(ret == 0);

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, &command_enable_write, 1);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    timecount = 0;

    while ((reg & 0x2) == 0) {
        spi_norflash_read_status_register(handle, &reg);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, false);
    ret = csi_spi_send(handle, &command_erase_chip, 1);
    timecount = 0;

    while (csi_spi_get_status(handle).busy) {
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    csi_gpio_pin_write(pgpio_pin_handle, true);

    ASSERT_TRUE(ret == 0);
    timecount = 0;

    while (((reg1 & 0x1) == 1) || ((reg1 & 0x2) == 0x2)) {
        spi_norflash_read_status_register(handle, &reg1);
        timecount++;

        if (timecount >= TEST_SPI_TIMEOUT) {
            printf("transfer timeout\n");
            csi_gpio_pin_write(pgpio_pin_handle, true);
            return -1;
        }
    }

    return 0;
}

/**
  \fn          int32_t CSKY_Flash_ProgramData (CSKY_DRIVER_FLASH *instance, uint32_t addr, const void *data, uint32_t cnt)
  \brief       Program data to Flash.
  \param[in]   instance     Pointer to flash's instance
  \param[in]   addr  Data address.
  \param[in]   data  Pointer to a buffer containing the data to be programmed to Flash.
  \param[in]   cnt   Number of data items to program.
  \return      number of data items programmed or \ref execution_status
*/
int32_t w25q64flash_program_data(spi_handle_t handle, uint32_t addr, const void *data, uint32_t cnt)
{
    uint32_t first_page_space;
    uint8_t *p = (uint8_t *)data;
    uint32_t page_num;
    uint8_t i;
    uint8_t ret = 0;
    uint32_t program_length = 0;
    uint8_t tmp[W25Q64FV_PAGE_SIZE];

    if (!IS_FLASH_ADDR((int32_t)addr) || !(IS_FLASH_ADDR((int32_t)(addr + cnt))) || data == NULL) {
        return -1;
    }

    if (cnt < W25Q64FV_PAGE_SIZE) {
        first_page_space = cnt;
    } else {
        first_page_space = W25Q64FV_PAGE_SIZE - (addr % (W25Q64FV_PAGE_SIZE));
    }

    if (first_page_space < W25Q64FV_PAGE_SIZE) {
        w25q64flash_read_data(handle, addr, tmp, W25Q64FV_PAGE_SIZE);
        memcpy(&tmp[W25Q64FV_PAGE_SIZE - first_page_space], p, first_page_space);
        spi_norflash_write_page(handle, (addr / W25Q64FV_PAGE_SIZE) * W25Q64FV_PAGE_SIZE, tmp, W25Q64FV_PAGE_SIZE);
    } else {
        spi_norflash_write_page(handle, addr, p, W25Q64FV_PAGE_SIZE);
    }

    program_length += first_page_space;

    addr += first_page_space;
    p += first_page_space;
    cnt -= first_page_space;

    page_num = cnt / W25Q64FV_PAGE_SIZE;

    for (i = 0; i < page_num; i++) {
        ret = spi_norflash_write_page(handle, addr, p, W25Q64FV_PAGE_SIZE);
        program_length += ret + i * W25Q64FV_PAGE_SIZE;

        if (ret != W25Q64FV_PAGE_SIZE) {
            return program_length;
        }

        addr += W25Q64FV_PAGE_SIZE;
        p += W25Q64FV_PAGE_SIZE;
        cnt -= W25Q64FV_PAGE_SIZE;
    }

    if (cnt) {
        w25q64flash_read_data(handle, addr, tmp, W25Q64FV_PAGE_SIZE);
        memcpy(tmp, p, cnt);
        spi_norflash_write_page(handle, addr, tmp, W25Q64FV_PAGE_SIZE);
        program_length += cnt;
    }

    return program_length;
}

