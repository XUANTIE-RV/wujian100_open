/*
 * Copyright (C) 2018 Alibaba Group Holding Limited
 */

#ifndef __k_ffs_h__
#define __k_ffs_h__

#ifdef __cplusplus
extern "C" {
#endif

/* function declarations */

extern int ffs32_lsb (uint32_t i);
extern int ffs32_msb (uint32_t i);

#define FFS_LSB(i)		ffs32_lsb(i)
#define FFS_MSB(i)		ffs32_msb(i)

#ifdef __cplusplus
}
#endif

#endif /* __k_ffs_h__ */

