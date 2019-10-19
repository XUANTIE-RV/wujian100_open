/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     test_gpio.c
 * @brief    the main function for the GPIO driver
 * @version  V1.0
 * @date     20. July 2016
 ******************************************************************************/
#include "dtest.h"
#include <stdio.h>
#include "soc.h"
#include "drv_gpio.h"
#include "test_driver_config.h"

static volatile bool int_flag = 1;

typedef struct {
    gpio_mode_e mode;
    gpio_direction_e dir;
    gpio_irq_mode_e irq_mode;
    uint32_t expect_out;
} gpio_test_t;

static void gpio_interrupt_handler(int32_t idx)
{
    (void)idx;
    int_flag = 0;
}

static gpio_test_t gpio_config_cases[] = {
    {GPIO_MODE_PULLNONE, GPIO_DIRECTION_OUTPUT + 1, 0, (CSI_DRV_ERRNO_GPIO_BASE | GPIO_ERROR_DIRECTION)},
};

static gpio_test_t gpio_pin_irq_set_cases[] = {
    {0, 0, GPIO_IRQ_MODE_HIGH_LEVEL + 1, (CSI_DRV_ERRNO_GPIO_BASE | GPIO_ERROR_IRQ_MODE)},
};

void test_pin_gpio_init(void)
{
    drv_pinmux_config(TEST_GPIO_PIN, TEST_GPIO_PIN_FUNC);
}

static void test_gpio_interfaces(void)
{
    uint32_t ret = 0;
    uint32_t i;
    bool pin_value;
    gpio_pin_handle_t pin = NULL;
    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, gpio_interrupt_handler);
    ASSERT_TRUE(pin != NULL);

    for (i = 0; i < sizeof(gpio_config_cases) / (sizeof(gpio_test_t)); i++) {
        csi_gpio_pin_config_mode(pin, gpio_config_cases[i].mode);
        ret = csi_gpio_pin_config_direction(pin, gpio_config_cases[i].dir);
        ASSERT_TRUE(ret == gpio_config_cases[i].expect_out);
    }

    for (i = 0; i < sizeof(gpio_pin_irq_set_cases) / (sizeof(gpio_test_t)); i++) {
        ret = csi_gpio_pin_set_irq(pin, gpio_pin_irq_set_cases[i].irq_mode, 1);
        ASSERT_TRUE(ret == gpio_pin_irq_set_cases[i].expect_out);
    }

    ret = csi_gpio_pin_config_mode(NULL, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(NULL, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret != 0);

    ret = csi_gpio_pin_set_irq(NULL, GPIO_IRQ_MODE_RISING_EDGE, 1);
    ASSERT_TRUE(ret != 0);

    ret = csi_gpio_pin_read(NULL, &pin_value);
    ASSERT_TRUE(ret != 0);

    ret = csi_gpio_pin_read(pin, NULL);
    ASSERT_TRUE(ret != 0);

    ret = csi_gpio_pin_write(NULL, pin_value);
    ASSERT_TRUE(ret != 0);
}

void test_gpio_rising_edge(void)
{
    uint32_t ret = 0;
    gpio_pin_handle_t pin = NULL;
    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, gpio_interrupt_handler);
    ASSERT_TRUE(pin != NULL);

    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret == 0);
    ret = csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_RISING_EDGE, 1);
    ASSERT_TRUE(ret == 0);

    while (int_flag);

    int_flag = 1;

    ret = csi_gpio_pin_uninitialize(pin);
    ASSERT_TRUE(ret == 0);
    printf("gpio rising_edge test passed!!!\n");
}

void test_gpio_falling_edge(void)
{
    uint32_t ret = 0;
    gpio_pin_handle_t pin = NULL;
    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, gpio_interrupt_handler);
    ASSERT_TRUE(pin != NULL);

    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret == 0);
    ret = csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_FALLING_EDGE, 1);
    ASSERT_TRUE(ret == 0);

    while (int_flag);

    int_flag = 1;
    ret = csi_gpio_pin_uninitialize(pin);
    ASSERT_TRUE(ret == 0);
    printf("gpio falling_edge test passed!!!\n");
}

void test_gpio_high_level(void)
{
    uint32_t ret = 0;
    gpio_pin_handle_t pin = NULL;
    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, gpio_interrupt_handler);
    ASSERT_TRUE(pin != NULL);

    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret == 0);
    ret = csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_HIGH_LEVEL, 1);
    ASSERT_TRUE(ret == 0);

    while (int_flag);

    int_flag = 1;
    ret = csi_gpio_pin_uninitialize(pin);
    ASSERT_TRUE(ret == 0);
    printf("gpio high level test passed!!!\n");
}

void test_gpio_low_level(void)
{
    uint32_t ret = 0;
    gpio_pin_handle_t pin = NULL;
    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, gpio_interrupt_handler);
    ASSERT_TRUE(pin != NULL);

    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret == 0);
    ret = csi_gpio_pin_set_irq(pin, GPIO_IRQ_MODE_LOW_LEVEL, 1);
    ASSERT_TRUE(ret == 0);

    while (int_flag);

    int_flag = 1;
    ret = csi_gpio_pin_uninitialize(pin);
    ASSERT_TRUE(ret == 0);
    printf("gpio low level test passed!!!\n");
}

void test_gpio_get_value(void)
{
    uint32_t ret = 0;
    bool value = 1;
    gpio_pin_handle_t pin = NULL;

    test_pin_gpio_init();
    pin = csi_gpio_pin_initialize(test_gpio_pin, NULL);
    ASSERT_TRUE(pin != NULL);
    printf("Test the gpio get value\r\n");

    ret = csi_gpio_pin_config_mode(pin, GPIO_MODE_PULLNONE);
    ret = csi_gpio_pin_config_direction(pin, GPIO_DIRECTION_INPUT);
    ASSERT_TRUE(ret == 0);
    printf("\tPlease force the gpio pin %s to low ,do you?\n", TEST_BOARD_GPIO_PIN_NAME);

    while (value == 1) {
        csi_gpio_pin_read(pin, &value);
    }

    value = 0x1;

    ret = csi_gpio_pin_uninitialize(pin);
    ASSERT_TRUE(ret == 0);
    printf("test gpio get value is passed\r\n");
}

/*****************************************************************************
test_gpio: main function of the gpio test

INPUT: NULL

RETURN: NULL

*****************************************************************************/
int test_gpio(void)
{
    dtest_suite_info_t test_suite_info = {
        "test_gpio", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_gpio_low_level", test_gpio_low_level, GPIO_LOW_LEVEL_EN },
        { "test_gpio_high_level", test_gpio_high_level, GPIO_HIGH_LEVEL_EN },
        { "test_gpio_falling_edge", test_gpio_falling_edge, GPIO_FALLING_EDGE_EN },
        { "test_gpio_rising_edge", test_gpio_rising_edge, GPIO_RISNG_EDGE_EN },
        { "test_gpio_get_value", test_gpio_get_value, GPIO_GET_VALUE_EN },
        { "test_gpio_interfaces", test_gpio_interfaces, GPIO_TEST_INTERFACE_EN },
        { NULL, NULL, 0 }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}
