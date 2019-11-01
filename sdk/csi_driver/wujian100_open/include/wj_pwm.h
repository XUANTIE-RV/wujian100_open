/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     wj_pwm.h
 * @brief    header file for pwm driver
 * @version  V1.0
 * @date     19. Feb 2019
 ******************************************************************************/

#ifndef _WJ_PWM_H_
#define _WJ_PWM_H_

#include "soc.h"

#ifdef __cplusplus
extern "C" {
#endif

#define PWM_CFG_CNTDIV_128      (0x6 << 24)
#define PWM_CFG_CNTDIV_64       (0x5 << 24)
#define PWM_CFG_CNTDIV_32       (0x4 << 24)
#define PWM_CFG_CNTDIV_16       (0x3 << 24)
#define PWM_CFG_CNTDIV_8        (0x2 << 24)
#define PWM_CFG_CNTDIV_4        (0x1 << 24)
#define PWM_CFG_CNTDIV_2        (0x0 << 24)
#define PWM_CFG_CNTDIV_EN       (0x1 << 27)
#define PWM_CFG_CNTDIV_Msk      (0x7 << 24)

#define PWM_PWMCFG_OUTPUT_Msk(ch)           (1U << (ch))
#define PWM_PWMCFG_OUTPUT_ENABLE(ch)        (1U << (ch))
#define PWM_PWMCFG_OUTPUT_DISABLE(ch)       (0U)

#define PWM_PWMCFG_CAPTURE_Msk(ch)          (1U << ((ch) + 12))
#define PWM_PWMCFG_CAPTURE_ENABLE(ch)       (1U << ((ch) + 12))
#define PWM_PWMCFG_CAPTURE_DISABLE(ch)      (0U)

#define PWM_PWMCFG_COMPARE_Msk(ch)          (1U << ((ch) + 18))
#define PWM_PWMCFG_COMPARE_ENABLE(ch)       (1U << ((ch) + 18))
#define PWM_PWMCFG_COMPARE_DISABLE(ch)      (0U)

#define PWM_CAPCTL_EDGE_MODE_Msk(ch)        (1U << (ch))
#define PWM_CAPCTL_EDGE_COUNT(ch)           (1U << (ch))
#define PWM_CAPCTL_EDGE_TIME(ch)            (0U)

#define PWM_CAPCTL_EVENT_MODE_Msk(ch)       (0x3U << ((ch * 2) + 6))
#define PWM_CAPCTL_POSEDGE(ch)              (0U)
#define PWM_CAPCTL_NEGEDGE(ch)              (0x1U << ((ch * 2) + 6))
#define PWM_CAPCTL_BOTH_EDGE(ch)            (0x3U << ((ch * 2) + 6))

#define PWM_CAPINTEN_EDGE_COUNT_IRQ_Msk(ch) (1U << (ch))
#define PWM_CAPINTEN_EDGE_COUNT_IRQ_EN(ch)  (1U << (ch))
#define PWM_CAPINTEN_EDGE_COUNT_IRQ_DIS(ch) (0U)

#define PWM_CAPINTEN_EDGE_TIME_IRQ_Msk(ch)  (1U << ((ch) + 6))
#define PWM_CAPINTEN_EDGE_TIME_IRQ_EN(ch)   (1U << ((ch) + 6))
#define PWM_CAPINTEN_EDGE_TIME_IRQ_DIS(ch)  (0U)

#define PWM_CAPIC_EDGE_COUNT_IRQ_Msk(ch)    (1U << (ch))
#define PWM_CAPIC_EDGE_COUNT_IRQ_CLR(ch)    (1U << (ch))

#define PWM_CAPIC_EDGE_TIME_IRQ_Msk(ch)     (1U << ((ch) + 6))
#define PWM_CAPIC_EDGE_TIME_IRQ_CLR(ch)     (1U << ((ch) + 6))

typedef enum {
    WJENUM_PWM_CH0    = 0,
    WJENUM_PWM_CH1    = 1,
    WJENUM_PWM_CH2    = 2,
    WJENUM_PWM_CH3    = 3,
    WJENUM_PWM_CH4    = 4,
    WJENUM_PWM_CH5    = 5,
    WJENUM_PWM_CH6    = 6,
    WJENUM_PWM_CH7    = 7,
    WJENUM_PWM_CH8    = 8,
    WJENUM_PWM_CH9    = 9,
    WJENUM_PWM_CH10   = 10,
    WJENUM_PWM_CH11   = 11
} WJENUM_PWM_CHANNEL;

typedef enum {
    WJENUM_PWM_COUNT_UP          = 0,
    WJENUM_PWM_COUNT_UP_DOWN     = 1
} WJENUM_PWM_COUNTER_MODE;

typedef struct {
    __IOM uint32_t     PWMCFG;              /* Offset: 0x000 (R/W)  PWM configure register */
    __IOM uint32_t     PWMINVERTTRIG;       /* Offset: 0x004 (R/W)  PWM signal is inverted register */
    __IOM uint32_t     PWM01TRIG;           /* Offset: 0x008 (R/W)  contain the trigger generate compare value */
    __IOM uint32_t     PWM23TRIG;           /* Offset: 0x00C (R/W)  contain the trigger generate compare value */
    __IOM uint32_t     PWM45TRIG;           /* Offset: 0x010 (N/A)  contain the trigger generate compare value */
    __IOM uint32_t     PWMINTEN1;           /* Offset: 0x014 (R/W)  interrupt enable */
    __IM  uint32_t     PWMINTEN2;           /* Offset: 0x018 (N/A)  interrupt enable */
    __IOM uint32_t     PWMRIS1;             /* Offset: 0x01C (R/ )  raw interrupt status */
    __IOM uint32_t     PWMRIS2;             /* Offset: 0x020 (N/A)  raw interrupt status */
    __IOM uint32_t     PWMIC1;              /* Offset: 0x024 (R/W)  interrupt clear */
    __IOM uint32_t     PWMIC2;              /* Offset: 0x028 (R/W)  interrupt clear */
    __IOM uint32_t     PWMIS1;              /* Offset: 0x02C (R/W)  interrupt status */
    __IOM uint32_t     PWMIS2;              /* Offset: 0x030 (R/W)  interrupt status */
    __IOM uint32_t     PWMCTL;              /* Offset: 0x034 (R/W)  configure the pwm generation blocks */
    __IOM uint32_t     PWM01LOAD;           /* Offset: 0x038 (R/W)  contain the load value of the PWM count */
    __IOM uint32_t     PWM23LOAD;           /* Offset: 0x03C (R/W)  contain the load value of the PWM count */
    __IOM uint32_t     PWM45LOAD;           /* Offset: 0x040 (N/A)  contain the load value of the PWM count */
    __IM  uint32_t     PWM01COUNT;          /* Offset: 0x044 (R/ )  contain the current value of the PWM count */
    __IM  uint32_t     PWM23COUNT;          /* Offset: 0x048 (R/ )  contain the current value of the PWM count */
    __IOM uint32_t     PWM45COUNT;          /* Offset: 0x04C (N/A)  contain the current value of the PWM count */
    __IOM uint32_t     PWM0CMP;             /* Offset: 0x050 (R/W)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM1CMP;             /* Offset: 0x054 (R/W)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM2CMP;             /* Offset: 0x058 (R/W)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM3CMP;             /* Offset: 0x05C (N/A)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM4CMP;             /* Offset: 0x060 (N/A)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM5CMP;             /* Offset: 0x064 (N/A)  contain a value to be compared against the counter */
    __IOM uint32_t     PWM01DB;             /* Offset: 0x068 (R/W)  contain the number of clock ticks to delay */
    __IOM uint32_t     PWM23DB;             /* Offset: 0x06C (R/W)  contain the number of clock ticks to delayr */
    __IOM uint32_t     PWM45DB;             /* Offset: 0x070 (N/A)  contain the number of clock ticks to delay */
    __IOM uint32_t     CAPCTL;              /* Offset: 0x074 (R/W)  input capture control */
    __IOM uint32_t     CAPINTEN;            /* Offset: 0x078 (R/W)  input capture interrupt enable */
    __IM  uint32_t     CAPRIS;              /* Offset: 0x07C (R/ )  input capture raw interrupt status */
    __IOM uint32_t     CAPIC;               /* Offset: 0x080 (R/W)  input capture interrupt clear */
    __IM  uint32_t     CAPIS;               /* Offset: 0x084 (R/ )  input capture interrupt status */
    __IM  uint32_t     CAP01T;              /* Offset: 0x088 (R/ )  input capture count value  */
    __IM  uint32_t     CAP23T;              /* Offset: 0x08C (R/ )  input capture count value  */
    __IOM uint32_t     CAP45T;              /* Offset: 0x090 (N/A)  input capture count value  */
    __IOM uint32_t     CAP01MATCH;          /* Offset: 0x094 (R/W)  input capture match value  */
    __IOM uint32_t     CAP23MATCH;          /* Offset: 0x098 (R/W)  input capture match value  */
    __IOM uint32_t     CAP45MATCH;          /* Offset: 0x09C (N/A)  input capture match value  */
    __IOM uint32_t     TIMINTEN;            /* Offset: 0x0A0 (R/W)  time interrupt enable */
    __IM  uint32_t     TIMRIS;              /* Offset: 0x0A4 (R/ )  time raw interrupt stats */
    __IOM uint32_t     TIMIC;               /* Offset: 0x0A8 (R/W)  time interrupt clear */
    __IM  uint32_t     TIMIS;               /* Offset: 0x0AC (R/ )  time interrupt status */
    __IOM uint32_t     TIM01LOAD;           /* Offset: 0x0B0 (R/W)  time load value */
    __IOM uint32_t     TIM23LOAD;           /* Offset: 0x0B4 (R/W)  time load value */
    __IOM uint32_t     TIM45LOAD;           /* Offset: 0x0B8 (N/A)  time load value */
    __IOM uint32_t     TIM01COUNT;          /* Offset: 0x0BC (R/W)  time current count time */
    __IOM uint32_t     TIM23COUNT;          /* Offset: 0x0C0 (R/W)  time current count time */
    __IOM uint32_t     TIM45COUNT;          /* Offset: 0x0C4 (R/W)  time current count time */
} wj_pwm_reg_t;

#ifdef __cplusplus
}
#endif

#endif /* _WJ_PWM_H_ */

