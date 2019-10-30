/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     wj_rtc.h
 * @brief    header file for rtc driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#ifndef __WJ_RTC_H
#define __WJ_RTC_H

#include <stdio.h>
#include "soc.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SEC_PER_MIN  ((time_t)60)
#define SEC_PER_HOUR ((time_t)60 * SEC_PER_MIN)
#define SEC_PER_DAY  ((time_t)24 * SEC_PER_HOUR)

typedef struct {
    __IM  uint32_t    RTC_CCVR;         /* Offset: 0x000 (R/ )  current count value register */
    __IOM uint32_t    RTC_CMR;          /* Offset: 0x004 (R/W)  count match register */
    __IOM uint32_t    RTC_CLR;          /* Offset: 0x008 (R/W)  count load register */
    __IOM uint32_t    RTC_CCR;          /* Offset: 0x00c (R/W)  count control register */
    __IM  uint32_t    RTC_STAT;         /* Offset: 0x010 (R/ )  interrupt status register */
    __IM  uint32_t    RTC_RSTAT;        /* Offset: 0x014 (R/ )  interrupt raw status register */
    __IM  uint32_t    RTC_EOI;          /* Offset: 0x018 (R/ )  end of interrupt register */
    __IM  uint32_t    RTC_COMP_VERSION; /* Offset: 0x01c (R/ )  component version register */
    __IOM uint32_t    RTC_DIV;          /* Offset: 0x020 (R/W)  rtc clock divider register */
} wj_rtc_reg_t;

#ifdef __cplusplus
}
#endif

#endif /* __WJ_RTC_H */

