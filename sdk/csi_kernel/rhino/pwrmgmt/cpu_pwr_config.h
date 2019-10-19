/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

#ifndef __k_config_pwr_mgmt_h__
#define __k_config_pwr_mgmt_h__

/* cpu power management configuration */

#ifndef RHINO_CONFIG_CPU_TICKLESS
#define RHINO_CONFIG_CPU_TICKLESS               1
#endif

#ifndef RHINO_CONFIG_CPU_PWR_MGMT_SHOW
#define RHINO_CONFIG_CPU_PWR_MGMT_SHOW          0
#endif

#ifndef RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT
#define RHINO_CONFIG_CPU_PWR_P_STATE_SUPPORT    0
#endif

#ifndef RHINO_CONFIG_PWR_DEBUG
#define RHINO_CONFIG_PWR_DEBUG                  0
#endif

#ifndef RHINO_PWR_MGMT_ERR
#define RHINO_PWR_MGMT_ERR -1
#endif

#endif /* __k_config_pwr_mgmt_h__ */
