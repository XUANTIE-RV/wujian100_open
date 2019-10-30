/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/**************************************************************************//**
 * @file     soc.h
 * @brief    CSI Core Peripheral Access Layer Header File for
 *           WJSOC Device Series
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/

#ifndef _SOC_H_
#define _SOC_H_

#include <stdint.h>
#include <csi_core.h>
#include <sys_freq.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef IHS_VALUE
#define  IHS_VALUE    (20000000)
#endif

#ifndef EHS_VALUE
#define  EHS_VALUE    (20000000)
#endif

/* -------------------------  Interrupt Number Definition  ------------------------ */

typedef enum IRQn {
    User_Software_IRQn              =   0,      /* User software interrupt */
    Supervisor_Software_IRQn        =   1,      /* Supervisor software interrupt */
    Machine_Software_IRQn           =   3,      /* Machine software interrupt */
    User_Timer_IRQn                 =   4,      /* User timer interrupt */
    Supervisor_Timer_IRQn           =   5,      /* Supervisor timer interrupt */
    CORET_IRQn                      =   7,      /* core Timer Interrupt */
    GPIO0_IRQn                      =   16,     /* uart Interrupt */
    TIM0_IRQn                       =   17,     /* timer0 Interrupt */
    TIM1_IRQn                       =   18,     /* timer1 Interrupt */
    TIM2_IRQn                       =   19,     /* timer2 Interrupt */
    TIM3_IRQn                       =   20,     /* timer3 Interrupt */
    TIM4_IRQn                       =   21,     /* timer4 Interrupt */
    TIM5_IRQn                       =   22,     /* timer5 Interrupt */
    TIM6_IRQn                       =   23,     /* timer6 Interrupt */
    TIM7_IRQn                       =   24,     /* timer7 Interrupt */
    PWM_IRQn                        =   25,     /* pwm Interrupt */
    RTC_IRQn                        =   26,     /* rtc Interrupt */
    WDT_IRQn                        =   27,     /* wdt Interrupt */
    USI0_IRQn                       =   28,     /* usi0 Interrupt */
    USI1_IRQn                       =   29,     /* usi1 Interrupt */
    USI2_IRQn                       =   30,     /* usi2 Interrupt */
    PMU_IRQn                        =   31,     /* pmu Interrupt */
    DMAC0_IRQn                      =   32,     /* dmac0 Interrupt */
    TIM8_IRQn                       =   33,     /* timer8 Interrupt */
    TIM9_IRQn                       =   34,     /* timer9 Interrupt */
    TIM10_IRQn                       =  35,     /* timer10 Interrupt */
    TIM11_IRQn                       =  36,     /* timer11 Interrupt */
    TIM12_IRQn                       =  37,     /* timer12 Interrupt */
    TIM13_IRQn                       =  38,     /* timer13 Interrupt */
    TIM14_IRQn                       =  39,     /* timer14 Interrupt */
    TIM15_IRQn                       =  40,     /* timer15 Interrupt */
}
IRQn_Type;

/* ================================================================================ */
/* ================       Device Specific Peripheral Section       ================ */
/* ================================================================================ */

#define CONFIG_TIMER_NUM    16
#define CONFIG_GPIO_NUM     1
#define CONFIG_GPIO_PIN_NUM 31
#define CONFIG_WDT_NUM      1
#define CONFIG_DMA_CHANNEL_NUM 16
#define CONFIG_PER_DMAC_CHANNEL_NUM 16
#define CONFIG_PER_PWM_CHANNEL_NUM    12

#define CONFIG_PWM_NUM  1
#define CONFIG_RTC_NUM 1
#define CONFIG_USI_NUM 3
#define CONFIG_PMU_NUM 1

/* ================================================================================ */
/* ================              Peripheral memory map             ================ */
/* ================================================================================ */
/* --------------------------  CPU FPGA memory map  ------------------------------- */

#define WJ_PMU_BASE               (0x60030000UL)
#define WJ_DMAC0_BASE             (0x40000000UL)
#define WJ_WDT_BASE               (0x50008000UL)
#define WJ_PWM_BASE               (0x5001C000UL)
#define WJ_USI0_BASE              (0x50028000UL)
#define WJ_USI1_BASE              (0x60028000UL)
#define WJ_USI2_BASE              (0x50029000UL)
#define WJ_GPIO0_BASE              (0x60018000UL)
#define WJ_RTC0_BASE               (0x60004000UL)
#define WJ_TIMER0_BASE            (0x50000000UL)
#define WJ_TIMER1_BASE            (0x50000014UL)
#define WJ_TIMER2_BASE            (0x60000000UL)
#define WJ_TIMER3_BASE            (0x60000014UL)
#define WJ_TIMER4_BASE            (0x50000400UL)
#define WJ_TIMER5_BASE            (0x50000414UL)
#define WJ_TIMER6_BASE            (0x60000400UL)
#define WJ_TIMER7_BASE            (0x60000414UL)
#define WJ_TIMER8_BASE            (0x50000800UL)
#define WJ_TIMER9_BASE            (0x50000814UL)
#define WJ_TIMER10_BASE            (0x60000800UL)
#define WJ_TIMER11_BASE            (0x60000814UL)
#define WJ_TIMER12_BASE            (0x50000c00UL)
#define WJ_TIMER13_BASE            (0x50000c14UL)
#define WJ_TIMER14_BASE            (0x60000c00UL)
#define WJ_TIMER15_BASE            (0x60000c14UL)

typedef enum {
    WJENUM_DMA_UART0_RX,
    WJENUM_DMA_UART0_TX,
    WJENUM_DMA_UART1_RX,
    WJENUM_DMA_UART1_TX,
    WJENUM_DMA_ADC_RX,
    WJENUM_DMA_ADC_TX,
    WJENUM_DMA_SPI1_RX,
    WJENUM_DMA_SPI1_TX,
    WJENUM_DMA_SPI0_RX,
    WJENUM_DMA_SPI0_TX,
    WJENUM_DMA_IIC_RX,
    WJENUM_DMA_IIC_TX,
    WJENUM_DMA_IIC1_RX,
    WJENUM_DMA_IIC1_TX,
    WJENUM_DMA_IIS_RX,
    WJENUM_DMA_IIS_TX,
    WJENUM_DMA_MEMORY
} wjenum_dma_device_e;

/* ================================================================================ */
/* ================             Peripheral declaration             ================ */
/* ================================================================================ */
#define WJ_UART                  ((   WJ_UART_TypeDef *)    WJ_UART_BASE)

#define SOC_LPM_RESUME_ADDR        (0x1003f7f0UL)
#define CONFIG_WJ_DMAC

#ifdef __cplusplus
}
#endif

#endif  /* _SOC_H_ */
