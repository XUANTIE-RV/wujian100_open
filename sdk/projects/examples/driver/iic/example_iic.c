/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_iic.c
 * @brief    the main function for the IIC driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_iic.h"
#include "stdio.h"
#include <string.h>
#include <csi_config.h>
#include "soc.h"
#include "pin.h"

#define  WJ_IIC_SLAVE_ADDR         0x50
#define  EEPROM_PAGE_SIZE          0x20
#define  EEPROM_SIZE               8192
#define  EEPROM_SUB_ADDR_START     0x0000
#define  EEPROM_SUB_ADDR_END       0x1FFF

static iic_handle_t pcsi_iic;
static volatile uint8_t cb_transfer_flag = 0;

extern void mdelay(uint32_t ms);

static void iic_event_cb_fun(int32_t idx, iic_event_e event)
{
    if (event == IIC_EVENT_TRANSFER_DONE) {
        cb_transfer_flag = 1;
    }
}

void example_pin_iic_init(void)
{
    drv_pinmux_config(EXAMPLE_PIN_IIC_SDA, EXAMPLE_PIN_IIC_SDA_FUNC);
    drv_pinmux_config(EXAMPLE_PIN_IIC_SCL, EXAMPLE_PIN_IIC_SCL_FUNC);
}

static int test_iic_eeprom(int32_t iic_idx)
{
    bool xfer_pending = false;
    uint8_t write_data[EEPROM_PAGE_SIZE + 2] = {0x0, EEPROM_PAGE_SIZE, 0};
    uint8_t read_data[EEPROM_PAGE_SIZE + 2] = {0x0, EEPROM_PAGE_SIZE, 0};
    uint8_t i = 0;
    int32_t ret;

    cb_transfer_flag = 0;

    for (i = 2; i < sizeof(write_data); i++) {
        write_data[i] = i - 2;
    }

    example_pin_iic_init();

    pcsi_iic = csi_iic_initialize(iic_idx, iic_event_cb_fun);

    if (pcsi_iic == NULL) {
        printf("csi_iic_initialize error\n");
        return -1;
    }

    ret = csi_iic_config(pcsi_iic, IIC_MODE_MASTER, IIC_BUS_SPEED_STANDARD, IIC_ADDRESS_7BIT, WJ_IIC_SLAVE_ADDR);

    if (ret < 0) {
        printf("csi_iic_config error\n");
        return -1;
    }

    ret = csi_iic_master_send(pcsi_iic, WJ_IIC_SLAVE_ADDR, write_data, sizeof(write_data), xfer_pending);

    if (ret < 0) {
        printf("csi_iic_master_send error\n");
        return -1;
    }

    while (!cb_transfer_flag);

    mdelay(5);

    cb_transfer_flag = 0;
    ret = csi_iic_master_send(pcsi_iic, WJ_IIC_SLAVE_ADDR, read_data, 2, xfer_pending);

    if (ret < 0) {
        printf("csi_iic_master_send error\n");
        return -1;
    }

    while (!cb_transfer_flag);

    cb_transfer_flag = 0;
    ret = csi_iic_master_receive(pcsi_iic, WJ_IIC_SLAVE_ADDR, read_data + 2, sizeof(read_data) - 2, xfer_pending);

    if (ret < 0) {
        printf("csi_iic_master_receive error\n");
        return -1;
    }

    while (!cb_transfer_flag);


    printf("write_data,read_data:\n");

    for (i = 2; i < EEPROM_PAGE_SIZE + 2; i++) {
        printf("%x,%x \t", write_data[i], read_data[i]);

        if (((i + 3) % 4) == 0) {
            printf("\n");
        }

        if (write_data[i] != read_data[i]) {
            printf("\ntest at24c64 write and read failed\n");
            return -1;
        }
    }

    printf("\ntest at24c64 write and read passed\n");

    /* test abort fun */
    memset(read_data + 2, 0x0, EEPROM_PAGE_SIZE);
    cb_transfer_flag = 0;
    ret = csi_iic_master_send(pcsi_iic, WJ_IIC_SLAVE_ADDR, read_data, 2, xfer_pending);

    if (ret < 0) {
        printf("csi_iic_master_send error\n");
        return -1;
    }

    while (!cb_transfer_flag);

    cb_transfer_flag = 0;
    ret = csi_iic_master_receive(pcsi_iic, WJ_IIC_SLAVE_ADDR, read_data + 2, sizeof(read_data) - 2, xfer_pending);

    if (ret < 0) {
        printf("csi_iic_master_receive error\n");
        return -1;
    }

    ret = csi_iic_abort_transfer(pcsi_iic);

    if (ret < 0) {
        printf("csi_iic_abort_transfer error\n");
        return -1;
    }

    printf("write_data,read_data:\n");

    for (i = 2; i < EEPROM_PAGE_SIZE + 2; i++) {
        printf("%x,%x\t", write_data[i], read_data[i]);

        if (write_data[i] != read_data[i]) {
            break;
        }
    }

    if (i == EEPROM_PAGE_SIZE) {
        printf("\ntest abort function failed\n");
        return -1;
    }

    printf("\ntest abort function passed\n");

    ret = csi_iic_uninitialize(pcsi_iic);

    if (ret < 0) {
        printf("csi_iic_uninitialize error\n");
        return -1;
    }

    printf("test_iic_eeprom successfully\n");
    return 0;
}

int example_iic(int32_t iic_idx)
{
    int ret;

    ret = test_iic_eeprom(iic_idx);

    if (ret < 0) {
        printf("test_iic_eeprom fail\n");
        return -1;
    }

    return 0;
}

int main(void)
{
    return example_iic(EXAMPLE_IIC_IDX);
}
