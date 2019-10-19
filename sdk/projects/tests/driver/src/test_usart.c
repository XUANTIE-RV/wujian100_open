/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

#include "drv_usart.h"
#include "stdio.h"
#include "soc.h"
#include "dtest.h"
#include "pin.h"
#include "test_driver_config.h"
#include <csi_config.h>
static volatile uint8_t usart_rx_async_flag = 0;
static volatile uint8_t usart_tx_async_flag = 0;

extern void mdelay(uint32_t ms);

uint8_t data[14] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'};
#define THE_SIZE    14

typedef struct {
    uint32_t baud;
    uint32_t clock;
    usart_mode_e mode;
    usart_parity_e parity;
    usart_stop_bits_e stopbits;
    usart_data_bits_e bits;
    uint32_t expect_out;
} usart_test_t;

static usart_test_t usart_cases[] = {
    {115200, 20000000, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_5 - 1, CSI_DRV_ERRNO_USART_BASE | USART_ERROR_DATA_BITS},
    {115200, 20000000, USART_MODE_ASYNCHRONOUS, USART_PARITY_0 + 1, 4, USART_DATA_BITS_5, CSI_DRV_ERRNO_USART_BASE | USART_ERROR_PARITY},
    {115200, 20000000, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_0_5 + 1, USART_DATA_BITS_5, CSI_DRV_ERRNO_USART_BASE | USART_ERROR_STOP_BITS},
};

void test_pin_usart_init(void)
{
    drv_pinmux_config(TEST_PIN_USART_TX, TEST_PIN_USART_TX_FUNC);
    drv_pinmux_config(TEST_PIN_USART_RX, TEST_PIN_USART_RX_FUNC);
}


#if (CONFIG_USART_NUM >= 2)
static usart_handle_t p_csi_usart;

static int usart_sync_init(int32_t bauds, int parity, int stopbits, int databits)
{
    int32_t ret;

    test_pin_usart_init();
    p_csi_usart = csi_usart_initialize(TEST_USART_IDX, NULL);
    ASSERT_TRUE(p_csi_usart != NULL);

    /* config the USART 0*/
    ret = csi_usart_config(p_csi_usart, bauds, USART_MODE_ASYNCHRONOUS, parity, stopbits, databits);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    return 0;
}

static void usart_uninit(void)
{
    int32_t ret;

    ret = csi_usart_uninitialize(p_csi_usart);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

}

static void usart_event_cb(int32_t idx, uint32_t event)
{
    switch (event) {
        case USART_EVENT_SEND_COMPLETE:
            usart_tx_async_flag = 1;
            break;

        case USART_EVENT_RECEIVE_COMPLETE:
            usart_rx_async_flag = 1;

            break;

        default:
            break;
    }
}

static int usart_async_init(int32_t bauds, int parity, int stopbits, int databits)
{
    int32_t ret;

    test_pin_usart_init();
    p_csi_usart = csi_usart_initialize(TEST_USART_IDX, usart_event_cb);
    ASSERT_TRUE(p_csi_usart != NULL);

    /* config the USART */
    ret = csi_usart_config(p_csi_usart, bauds, USART_MODE_ASYNCHRONOUS, parity, stopbits, databits);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    return 0;

}

static void usart_test_async_mode(uint8_t mask)
{
    int32_t ret;
    uint8_t answer[20];
    uint8_t i;
    int8_t  flag = 0;
    int time_out = 0x7ffff;

    ///////////////////* async mode ///////////////////////
    // printf("\r\t(async mode ): Output is---\n\t\t");

    for (i = 0; i < THE_SIZE ; i++) {
        answer[i] = '\0';
    }

    ret = csi_usart_receive(p_csi_usart, answer, THE_SIZE);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    ret = csi_usart_send(p_csi_usart, data, THE_SIZE);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    while (time_out) {
        time_out--;

        if ((usart_tx_async_flag == 1) && (usart_rx_async_flag == 1)) {
            break;
        }
    }

    usart_rx_async_flag = 0;
    usart_tx_async_flag = 0;

    for (i = 0; i < THE_SIZE; i++) {
        if ((answer[i] & mask) != (data[i]&mask)) {
            flag = 1;
            break;
        }
    }

    ASSERT_TRUE(flag == 0);

}

static void usart_test_sync_mode(uint8_t mask)
{
    int32_t ret;
    uint8_t answer[20];
    uint8_t i;
    int8_t  flag = 0;
    usart_status_t status;
    int time_out = 0x7ffff;

    ///////////////////* sync mode *//////////////////////////
    // printf("\r\t(sync mode ): Output is---\n\t\t");
    for (i = 0; i < THE_SIZE ; i++) {
        answer[i] = '\0';
    }

    ret = csi_usart_receive(p_csi_usart, answer, THE_SIZE);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    ret = csi_usart_send(p_csi_usart, data, THE_SIZE);

    if (ret < 0) {
        ASSERT_TRUE(ret);
    }

    while (time_out) {
        time_out--;
        status = csi_usart_get_status(p_csi_usart);

        if (!status.rx_busy) {
            break;
        }
    }

    for (i = 0; i < THE_SIZE; i++) {
        if ((answer[i] & mask) != (data[i] & mask)) {
            flag = 1;
            break;
        }
    }

    if (time_out == 0) {
        csi_usart_abort_receive(p_csi_usart);
    }

    ASSERT_FALSE(flag);
}
static int test_function(int32_t bauds, int parity, int stopbits, int databits)
{
    uint8_t mask = 0xff;
    int i;

    for (i = databits + 5; i < 8; i++) {
        mask &= ~(1 << i);
    }

    if (usart_sync_init(bauds, parity, stopbits, databits) <  0) {
        printf(" usart_sync_init error\n");
        return -1;
    }

    usart_test_sync_mode(mask);
    usart_uninit();

    if (usart_async_init(bauds, parity, stopbits, databits) < 0) {
        return -1;
    }

    usart_test_async_mode(mask);
    usart_uninit();
    return 0;
}

static void usart_test_fun(void)
{
    int32_t baud[]         = { 4800, 9600, 14400, 19200, 38400, 56000, 57600, 115200};
    int32_t parity[]       = { USART_PARITY_NONE, USART_PARITY_EVEN, USART_PARITY_ODD};
    int32_t stopbits[]     = { USART_STOP_BITS_1, USART_STOP_BITS_2};
    int32_t databits[]     = { USART_DATA_BITS_5, USART_DATA_BITS_6, USART_DATA_BITS_7, USART_DATA_BITS_8};

    uint8_t i, j, k, l;

    for (i = 0; i < sizeof(baud) / sizeof(baud[0]); i++)
        for (j = 0; j < sizeof(parity) / sizeof(parity[0]); j++)
            for (k = 0; k < sizeof(stopbits) / sizeof(stopbits[0]); k++)
                for (l = 0; l < sizeof(databits) / sizeof(databits[0]); l++) {
                    if (test_function(baud[i], parity[j], stopbits[k], databits[l]) < 0) {
                        printf("test_function error\n");
                        return;
                    }
                }

}
#endif

static void usart_test_interfaces(void)
{
    usart_handle_t pcsi_usart;
    uint8_t i;
    uint32_t ret;
    uint8_t answer[20];

    test_pin_usart_init();
    pcsi_usart = csi_usart_initialize(TEST_USART_IDX, NULL);
    ASSERT_TRUE(pcsi_usart != NULL);

    for (i = 0; i < sizeof(usart_cases) / sizeof(usart_test_t); i++) {
        ret = csi_usart_config(pcsi_usart, usart_cases[i].baud, usart_cases[i].mode, usart_cases[i].parity, usart_cases[i].stopbits, usart_cases[i].bits);
        ASSERT_TRUE(ret == usart_cases[i].expect_out);
    }

    ASSERT_TRUE(csi_usart_send(NULL, data, 13/*,bool asynch*/) != 0);
    ASSERT_TRUE(csi_usart_receive(NULL, answer, 13/*,bool asynch*/) != 0);
    ASSERT_TRUE(csi_usart_abort_send(NULL) != 0);
    ASSERT_TRUE(csi_usart_abort_receive(NULL) != 0);
    ASSERT_TRUE(csi_usart_uninitialize(NULL) != 0);
}

int test_usart(void)
{
    dtest_suite_info_t test_suite_info = {
        "test_usart", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
#if (CONFIG_USART_NUM >= 2)
        { "usart_test_fun", usart_test_fun, USART_TEST_FUN_EN },
#endif
        { "usart_test_interfaces", usart_test_interfaces, USART_TEST_INTERFACE_EN },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
