/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "drv_spi.h"
#include "pin.h"
#include "test_driver_config.h"

#define OPERATE_ADDR    0x0
#define OPERATE_LEN     256
#define SPIFLASH_BASE_VALUE 0x0
#define SPI_TEST_BAUD   0x300000       /* 300KHZ*/
uint8_t input[OPERATE_LEN] = {0};
uint8_t output[OPERATE_LEN] = {0};
spi_handle_t g_spi_handle;
static uint8_t erase_read_flag = 0;
static uint8_t program_read_flag = 0;

extern int32_t w25q64flash_read_id(spi_handle_t handle, uint32_t *id_num);
extern int32_t w25q64flash_erase_sector(spi_handle_t handle, uint32_t addr);
extern int32_t w25q64flash_erase_chip(spi_handle_t handle);
extern int32_t w25q64flash_program_data(spi_handle_t handle, uint32_t addr, const void *data, uint32_t cnt);
extern int32_t w25q64flash_read_data(spi_handle_t handle, uint32_t addr, void *data, uint32_t cnt);

typedef struct {
    int32_t baud;
    spi_mode_e  mode;
    spi_format_e format;
    spi_bit_order_e order;
    spi_ss_mode_e  ss_mode;
    int32_t     bit_width;
    uint32_t expect_out;
} spi_test_t;

static spi_test_t spi_config_cases[] = {
    {SPI_TEST_BAUD, SPI_MODE_MASTER, SPI_FORMAT_CPOL1_CPHA1 + 1, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8, CSI_DRV_ERRNO_SPI_BASE | SPI_ERROR_FRAME_FORMAT},
    {1, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_HW_OUTPUT, 8, CSI_DRV_ERRNO_SPI_BASE | DRV_ERROR_PARAMETER},
    {SPI_TEST_BAUD, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_HW_OUTPUT, 8, 0},
    {SPI_TEST_BAUD, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 8, 0},
    {SPI_TEST_BAUD, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 1, CSI_DRV_ERRNO_SPI_BASE | SPI_ERROR_DATA_BITS},
    {SPI_TEST_BAUD, SPI_MODE_MASTER, SPI_FORMAT_CPOL0_CPHA0, SPI_ORDER_MSB2LSB, SPI_SS_MASTER_SW, 17, CSI_DRV_ERRNO_SPI_BASE | SPI_ERROR_DATA_BITS},
};


static void spi_event_cb_fun(int32_t idx, spi_event_e event)
{

}

static void test_w25q64fv_read(void)
{
    w25q64flash_read_data(g_spi_handle, OPERATE_ADDR, output, OPERATE_LEN);

    int i;

    for (i = 0; i < OPERATE_LEN; i++) {
        if (output[i] != input[i]) {
            program_read_flag = 1;
            break;
        }

    }

    ASSERT_TRUE(program_read_flag == 0);
    int ret;
    ret = csi_spi_uninitialize(g_spi_handle);
    ASSERT_TRUE(ret == 0);

}
static void test_w25q64fv_program(void)
{
    int i;

    for (i = 0; i < sizeof(input); i++) {
        input[i] = i + SPIFLASH_BASE_VALUE;
    }

    memset(output, 0xfb, sizeof(output));

    w25q64flash_program_data(g_spi_handle, OPERATE_ADDR, input, OPERATE_LEN);

}

static void test_w25q64fv_sector_erase(void)
{
    w25q64flash_erase_sector(g_spi_handle, OPERATE_ADDR);
    w25q64flash_read_data(g_spi_handle, OPERATE_ADDR, output, OPERATE_LEN);
    int i;

    for (i = 0; i < OPERATE_LEN; i++) {
        if (output[i] != 0xff) {
            erase_read_flag = 1;
            break;
        }
    }

    ASSERT_TRUE(erase_read_flag == 0);
}

void test_pin_spi_init(void)
{
    drv_pinmux_config(TEST_PIN_SPI_MISO, TEST_PIN_SPI_MISO_FUNC);
    drv_pinmux_config(TEST_PIN_SPI_MOSI, TEST_PIN_SPI_MOSI_FUNC);
    drv_pinmux_config(TEST_PIN_SPI_CS, TEST_PIN_SPI_CS_FUNC);
    drv_pinmux_config(TEST_PIN_SPI_SCK, TEST_PIN_SPI_SCK_FUNC);
}


static void test_w25q64fv_read_id(void)
{

    uint8_t id[3] = {0x11, 0x11};

    test_pin_spi_init();
    /* initialize spi driver */
    g_spi_handle = csi_spi_initialize(TEST_SPI_IDX, spi_event_cb_fun);

    ASSERT_TRUE(g_spi_handle != NULL);

    w25q64flash_read_id(g_spi_handle, (uint32_t *)&id);
    printf("the spiflash id is %x %x\r\n", id[0], id[1]);

}

static void test_csi_spi_config(void)
{
    int32_t ret;
    uint32_t i;

    spi_handle_t spi_handle;

    /* initialize spi driver */
    spi_handle = csi_spi_initialize(TEST_SPI_IDX, NULL);

    ASSERT_TRUE(spi_handle != NULL);

    for (i = 0; i < sizeof(spi_config_cases) / (sizeof(spi_test_t)); i++) {
        ret = csi_spi_config(spi_handle, spi_config_cases[i].baud, spi_config_cases[i].mode, spi_config_cases[i].format, spi_config_cases[i].order, spi_config_cases[i].ss_mode, spi_config_cases[i].bit_width);
        ASSERT_TRUE(ret == spi_config_cases[i].expect_out);
    }
}
int test_spi()
{
    dtest_suite_info_t test_suite_info = {
        "test_spi", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_w25q64fv_read", test_w25q64fv_read, SPI_TEST_W25Q64FV_READ_EN },
        { "test_w25q64fv_program", test_w25q64fv_program, SPI_TEST_W25Q64FV_PROGRAM_EN },
        { "test_w25q64fv_sector_erase", test_w25q64fv_sector_erase, SPI_TEST_W25Q64FV_SECTOR_ERASE_EN },
        { "test_w25q64fv_read_id", test_w25q64fv_read_id, SPI_TEST_W25Q64FV_RDID_EN },
        { "test_csi_spi_config", test_csi_spi_config, SPI_TEST_CONFIG_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
