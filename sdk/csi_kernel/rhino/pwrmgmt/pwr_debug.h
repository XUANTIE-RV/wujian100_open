/* pwr_debug.c - CPU power manager debug header file */

/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

/*
modification history
--------------------
21jan2018,WangMin  writen.
*/

#ifndef __pwr_debug_h__
#define __pwr_debug_h__

#ifdef __cplusplus
extern "C" {
#endif

#include "stdio.h"

#define DBG_OFF             0x00000000
#define DBG_WARN            0x00000001
#define DBG_ERR             0x00000002
#define DBG_INFO            0x00000004
#define DBG_ALL             0xffffffff

extern int pwr_debug_level;

#undef PWR_DEBUG_LINE_INFO

#if RHINO_CONFIG_PWR_DEBUG

#ifdef PWR_DEBUG_LINE_INFO
    #define PWR_DBG(lvl,...)                    \
        printf("%s,%d\n",__FILE__,__LINE__);    \
        do {                                    \
            if (pwr_debug_level >= lvl)           \
                {                               \
                printf(__VA_ARGS__);            \
                }                               \
            }                                   \
        while (0)
    #else /* PWR_DEBUG_LINE_INFO */
    #define PWR_DBG(lvl,...)                    \
        do {                                    \
            if (pwr_debug_level >= lvl)           \
                {                               \
                printf(__VA_ARGS__);            \
                }                               \
            }                                   \
        while (0)    
    #endif /* ！PWR_DEBUG_LINE_INFO */
#else /* RHINO_CONFIG_PWR_DEBUG */

#define PWR_DBG(lvl,...)

#endif /* ! RHINO_CONFIG_PWR_DEBUG */


#ifdef __cplusplus
}
#endif

#endif /* __pwr_debug_h__ */

