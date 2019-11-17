/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     devices.c
 * @brief    source file for the devices
 * @version  V1.0
 * @date     07. Mar 2019
 ******************************************************************************/

#include <stdio.h>
#include <csi_config.h>
#include <soc.h>
#include <drv_usart.h>
#include <drv_timer.h>
#include <drv_gpio.h>
#include <pin_name.h>
#include <usi_pin_planning.h>

extern void TIM0_IRQHandler(void);
extern void TIM1_IRQHandler(void);
extern void TIM2_IRQHandler(void);
extern void TIM3_IRQHandler(void);
extern void TIM4_IRQHandler(void);
extern void TIM5_IRQHandler(void);
extern void TIM6_IRQHandler(void);
extern void TIM7_IRQHandler(void);
extern void TIM8_IRQHandler(void);
extern void TIM9_IRQHandler(void);
extern void TIM10_IRQHandler(void);
extern void TIM11_IRQHandler(void);
extern void TIM12_IRQHandler(void);
extern void TIM13_IRQHandler(void);
extern void TIM14_IRQHandler(void);
extern void TIM15_IRQHandler(void);
extern void GPIO0_IRQHandler(void);
extern void PWM_IRQHandler(void);
extern void RTC_IRQHandler(void);
extern void USI0_IRQHandler(void);
extern void USI1_IRQHandler(void);
extern void USI2_IRQHandler(void);
extern void WDT_IRQHandler(void);
extern void DMAC0_IRQHandler(void);

#define readl(addr) \
    ({ unsigned int __v = (*(volatile unsigned int *) (addr)); __v; })

#define writel(b,addr) (void)((*(volatile unsigned int *) (addr)) = (b))

struct {
    uint32_t base;
    uint32_t irq;
    void *handler;
}
const sg_timer_config[CONFIG_TIMER_NUM] = {
    {WJ_TIMER0_BASE, TIM0_IRQn, TIM0_IRQHandler},
    {WJ_TIMER1_BASE, TIM1_IRQn, TIM1_IRQHandler},
    {WJ_TIMER2_BASE, TIM2_IRQn, TIM2_IRQHandler},
    {WJ_TIMER3_BASE, TIM3_IRQn, TIM3_IRQHandler},
    {WJ_TIMER4_BASE, TIM4_IRQn, TIM4_IRQHandler},
    {WJ_TIMER5_BASE, TIM5_IRQn, TIM5_IRQHandler},
    {WJ_TIMER6_BASE, TIM6_IRQn, TIM6_IRQHandler},
    {WJ_TIMER7_BASE, TIM7_IRQn, TIM7_IRQHandler},
    {WJ_TIMER8_BASE, TIM8_IRQn, TIM8_IRQHandler},
    {WJ_TIMER9_BASE, TIM9_IRQn, TIM9_IRQHandler},
    {WJ_TIMER10_BASE, TIM10_IRQn, TIM10_IRQHandler},
    {WJ_TIMER11_BASE, TIM11_IRQn, TIM11_IRQHandler},
    {WJ_TIMER12_BASE, TIM12_IRQn, TIM12_IRQHandler},
    {WJ_TIMER13_BASE, TIM13_IRQn, TIM13_IRQHandler},
    {WJ_TIMER14_BASE, TIM14_IRQn, TIM14_IRQHandler},
    {WJ_TIMER15_BASE, TIM15_IRQn, TIM15_IRQHandler},
};

int32_t target_get_timer_count(void)
{
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_timer_count()) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_timer_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_timer_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = sg_timer_config[idx].handler;
    }

    return idx;
}

typedef struct {
    int count;
    struct {
        uint32_t base;
        uint32_t irq;
        void *handler;
    } config[];
} device_irq_table_t;

int32_t target_get(const device_irq_table_t *table, int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx < table->count) {
        if (base) {
            *base = table->config[idx].base;
        }

        if (irq) {
            *irq = table->config[idx].irq;
        }

        if (handler) {
            *handler = table->config[idx].handler;
        }

        return idx;
    }

    return -1;
}

static const device_irq_table_t sg_wdt_config = {
    .count = CONFIG_WDT_NUM,
    .config = {
        {WJ_WDT_BASE, WDT_IRQn, WDT_IRQHandler}
    }
};

int32_t target_get_wdt(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    return target_get(&sg_wdt_config, idx, base, irq, handler);
}

static const device_irq_table_t sg_dmac_config = {
    .count = CONFIG_DMA_CHANNEL_NUM,
    .config = {
        {WJ_DMAC0_BASE, DMAC0_IRQn, DMAC0_IRQHandler},
    }
};

int32_t target_get_dmac(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    return target_get(&sg_dmac_config, idx, base, irq, handler);
}

struct {
    uint32_t base;
    uint32_t irq;
    uint32_t pin_num;
    port_name_e port;
}
const sg_gpio_config[CONFIG_GPIO_NUM] = {
    {WJ_GPIO0_BASE, GPIO0_IRQn, CONFIG_GPIO_PIN_NUM, PORTA},
};

typedef struct {
    int32_t    gpio_pin;
    uint32_t cfg_idx;
} gpio_pin_map_t;

int32_t target_gpio_port_init(port_name_e port, uint32_t *base, uint32_t *irq, void **handler, uint32_t *pin_num)
{
    if (base == NULL || irq == NULL || handler == NULL || pin_num == NULL) {
        return -1;
    }

    if (sg_gpio_config[0].port == port) {
        if (base != NULL) {
            *base = sg_gpio_config[0].base;
        }

        if (irq != NULL) {
            *irq = sg_gpio_config[0].irq;
        }

        if (pin_num != NULL) {
            *pin_num = sg_gpio_config[0].pin_num;
        }

        if (handler != NULL) {
            *handler = (void *)GPIO0_IRQHandler;
        }

        return 0;
    }

    return -1;
}

int32_t target_gpio_pin_init(int32_t gpio_pin, uint32_t *port_idx)
{
    *port_idx = 0;

    if (gpio_pin >= PA0 && gpio_pin <= PA31) {
        return gpio_pin;
    }

    return -1;
}

struct {
    uint32_t base;
    uint32_t irq;
}
const sg_pmu_config[CONFIG_PMU_NUM] = {
    {WJ_PMU_BASE, PMU_IRQn}
};

int32_t target_get_pmu(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_PMU_NUM) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_pmu_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_pmu_config[idx].irq;
    }

    return idx;
}

struct {
    uint32_t base;
    uint32_t irq;
    void *handler;
}
const sg_pwm_config[CONFIG_PWM_NUM] = {
    {WJ_PWM_BASE, PWM_IRQn, PWM_IRQHandler},
};

int32_t target_get_pwm_count(void)
{
    return CONFIG_PWM_NUM;
}

int32_t target_pwm_init(uint32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= target_get_pwm_count()) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_pwm_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_pwm_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = sg_pwm_config[idx].handler;
    }

    return idx;
}

struct {
    uint32_t base;
    uint32_t irq;
    void *handler;
}
const sg_usi_config[CONFIG_USI_NUM] = {
    {WJ_USI0_BASE, USI0_IRQn, USI0_IRQHandler},
    {WJ_USI1_BASE, USI1_IRQn, USI1_IRQHandler},
    {WJ_USI2_BASE, USI2_IRQn, USI2_IRQHandler},
};

int32_t target_usi_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= CONFIG_USI_NUM) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_usi_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_usi_config[idx].irq;
    }

    return idx;
}

int32_t target_usi_usart_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_SPI_NUM) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_usi_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_usi_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = sg_usi_config[idx].handler;
    }

    return idx;
}

int32_t target_usi_spi_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler, uint32_t *ssel)
{
    if (idx >= CONFIG_USI_I2C_NUM) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_usi_config[idx].base;
    }

    if (irq != NULL) {
        *irq  = sg_usi_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = sg_usi_config[idx].handler;
    }

    if (ssel != NULL) {
        if (idx == 0) {
            *ssel = PA13;
        } else {
            *ssel = PA19;
        }
    }

    return idx;
}

int32_t target_usi_iic_init(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    if (idx >= CONFIG_USI_I2C_NUM) {
        return -1;
    }

    if (base != NULL) {
        *base = sg_usi_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_usi_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = sg_usi_config[idx].handler;
    }

    return idx;
}

struct {
    uint32_t base;
    uint32_t irq;
    void *handler;
}
const sg_rtc_config[CONFIG_RTC_NUM] = {
    {WJ_RTC0_BASE, RTC_IRQn, RTC_IRQHandler},
};

int32_t target_get_rtc_count(void)
{
    return CONFIG_RTC_NUM;
}

#define BIT1 (0x1)

int32_t target_get_rtc(int32_t idx, uint32_t *base, uint32_t *irq, void **handler)
{
    unsigned int value;

    if (idx >= target_get_rtc_count()) {
        return -1;
    }

    value  = readl(WJ_PMU_BASE);
    value &= ~BIT1;
    writel(value, WJ_PMU_BASE);

    if (base != NULL) {
        *base = sg_rtc_config[idx].base;
    }

    if (irq != NULL) {
        *irq = sg_rtc_config[idx].irq;
    }

    if (handler != NULL) {
        *handler = (void *)RTC_IRQHandler;
    }

    return idx;
}

