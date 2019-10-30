/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


#include "drv_iic.h"
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "pin.h"
#include "test_driver_config.h"
#include <csi_config.h>

#define  IIC_SLAVE_ADDR         0x50
#define  EEPROM_PAGE_SIZE          32
#define  EEPROM_SIZE               8192
#define  EEPROM_SUB_ADDR_START     0x0000
#define  EEPROM_SUB_ADDR_END       0x1FFF

extern void mdelay(uint32_t ms);

typedef struct {
    uint8_t *data;
    uint32_t len;
    iic_mode_e  mode;
    iic_speed_e speed;
    iic_address_mode_e addr_mode;
    int32_t slave_addr;
    int32_t expect_out;
} iic_test_t;

static iic_test_t iic_config_cases[] = {
    {NULL, (uint32_t)NULL, IIC_MODE_MASTER, IIC_BUS_SPEED_HIGH, IIC_ADDRESS_10BIT + 1, IIC_SLAVE_ADDR, CSI_DRV_ERRNO_IIC_BASE | DRV_ERROR_PARAMETER},
    {NULL, (uint32_t)NULL, IIC_MODE_SLAVE + 1, IIC_BUS_SPEED_STANDARD, IIC_ADDRESS_10BIT, IIC_SLAVE_ADDR, CSI_DRV_ERRNO_IIC_BASE | DRV_ERROR_PARAMETER},
    {NULL, (uint32_t)NULL, IIC_MODE_MASTER, IIC_BUS_SPEED_STANDARD, IIC_ADDRESS_10BIT, IIC_SLAVE_ADDR, 0}

};

static iic_handle_t iic_handle;
static volatile uint8_t cb_transfer_flag;

static uint8_t write_data[EEPROM_PAGE_SIZE + 2] = {0x0, 0x0, 0};
static uint8_t read_data[EEPROM_PAGE_SIZE + 2] = {0x0, 0x0, 0};

static void iic_event_cb_fun(int32_t idx, iic_event_e event)
{
    if (event == IIC_EVENT_TRANSFER_DONE) {
        cb_transfer_flag = 1;
    }
}

void test_pin_iic_init(void)
{
    drv_pinmux_config(TEST_PIN_IIC_SDA, TEST_PIN_IIC_SDA_FUNC);
    drv_pinmux_config(TEST_PIN_IIC_SCL, TEST_PIN_IIC_SCL_FUNC);
}

static void test_at24c64_write_read(void)
{
    uint32_t timeout = 0;
    test_pin_iic_init();
    iic_handle = csi_iic_initialize(TEST_IIC_IDX, iic_event_cb_fun);
    ASSERT_TRUE(iic_handle != NULL);

    int32_t ret;
    ret = csi_iic_config(iic_handle, IIC_MODE_MASTER, IIC_BUS_SPEED_STANDARD, IIC_ADDRESS_7BIT, IIC_SLAVE_ADDR);
    ASSERT_TRUE(ret == 0);

    memset(write_data + 2, 0xae, EEPROM_PAGE_SIZE);

    cb_transfer_flag = 0;
    bool xfer_pending = false;
    ret = csi_iic_master_send(iic_handle, IIC_SLAVE_ADDR, write_data, sizeof(write_data), xfer_pending);
    ASSERT_TRUE(ret == 0);

    timeout = 0;

    while (!cb_transfer_flag) {
        timeout++;

        if (timeout > 0x7fffff) {
            break;
        }
    }

    ASSERT_TRUE(cb_transfer_flag == 1);
    mdelay(10);

    cb_transfer_flag = 0;
    ret = csi_iic_master_send(iic_handle, IIC_SLAVE_ADDR, read_data, 2, xfer_pending);
    ASSERT_TRUE(ret == 0);

    timeout = 0;

    while (!cb_transfer_flag) {
        timeout++;

        if (timeout > 0x7fffff) {
            break;
        }
    }

    ASSERT_TRUE(cb_transfer_flag == 1);

    cb_transfer_flag = 0;
    ret = csi_iic_master_receive(iic_handle, IIC_SLAVE_ADDR, read_data + 2, sizeof(read_data) - 2, xfer_pending);
    ASSERT_TRUE(ret == 0);

    timeout = 0;

    while (!cb_transfer_flag) {
        timeout++;

        if (timeout > 0x7ffff) {
            break;
        }
    }

    ASSERT_TRUE(cb_transfer_flag == 1);
    uint8_t i = 0;

    for (i = 2; i < EEPROM_PAGE_SIZE + 2; i++) {
        if (write_data[i] != read_data[i]) {
            break;
        }
    }

    ASSERT_TRUE(i == EEPROM_PAGE_SIZE + 2);

    ret = csi_iic_uninitialize(iic_handle);
    ASSERT_TRUE(ret == 0);
}

static void test_csi_iic_abort_transfer(void)
{
    test_pin_iic_init();
    iic_handle = csi_iic_initialize(TEST_IIC_IDX, iic_event_cb_fun);
    ASSERT_TRUE(iic_handle != NULL);

    int32_t ret;
    ret = csi_iic_config(iic_handle, IIC_MODE_MASTER, IIC_BUS_SPEED_STANDARD, IIC_ADDRESS_7BIT, IIC_SLAVE_ADDR);
    ASSERT_TRUE(ret == 0);

    memset(read_data + 2, 0x0, EEPROM_PAGE_SIZE);

    uint32_t timeout = 0x3ffff;
    cb_transfer_flag = 0;
    bool xfer_pending = false;
    ret = csi_iic_master_send(iic_handle, IIC_SLAVE_ADDR, read_data, 2, xfer_pending);
    ASSERT_TRUE(ret == 0);

    while (timeout) {
        timeout--;

        if (cb_transfer_flag == 1) {
            break;
        }
    }

    ASSERT_TRUE(cb_transfer_flag == 1);

    timeout = 0x3ffff;
    cb_transfer_flag = 0;
    ret = csi_iic_master_receive(iic_handle, IIC_SLAVE_ADDR, read_data + 2, sizeof(read_data) - 2, xfer_pending);
    ASSERT_TRUE(ret == 0);

    ret = csi_iic_abort_transfer(iic_handle);
    ASSERT_TRUE(ret == 0);

    uint8_t i = 0;

    for (i = 2; i < EEPROM_PAGE_SIZE + 2; i++) {
        if (write_data[i] != read_data[i]) {
            break;
        }
    }

    ret = csi_iic_uninitialize(iic_handle);
    ASSERT_TRUE(ret == 0);

}
static void test_csi_iic_config(void)
{

    test_pin_iic_init();
    iic_handle = csi_iic_initialize(TEST_IIC_IDX, iic_event_cb_fun);
    ASSERT_TRUE(iic_handle != NULL);

    int32_t ret;
    uint32_t i;

    for (i = 0; i < sizeof(iic_config_cases) / (sizeof(iic_test_t)); i++) {
        ret = csi_iic_config(iic_handle, iic_config_cases[i].mode, iic_config_cases[i].speed, iic_config_cases[i].addr_mode, iic_config_cases[i].slave_addr);
        ASSERT_TRUE(ret == iic_config_cases[i].expect_out);
    }
}


int test_iic()
{
    dtest_suite_info_t test_suite_info = {
        "test_iic", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_at24c64_write_read", test_at24c64_write_read, IIC_TEST_AT24C64_WRITE_READ_EN },
        { "test_csi_iic_abort_transfer", test_csi_iic_abort_transfer, IIC_TEST_ABORT_TRANSFER_INTERFACE_EN },
        { "test_csi_iic_config", test_csi_iic_config, IIC_TEST_CONFIG_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
