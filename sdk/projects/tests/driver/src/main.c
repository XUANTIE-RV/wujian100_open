/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
 * @file     main.c
 * @brief    CSI Source File for main
 * @version  V1.1
 * @date     29. April 2019
 ******************************************************************************/
#include <stdio.h>
#include <stdint.h>
#include <csi_config.h>
#include <dtest.h>
#include <test_driver_config.h>

extern int test_usart(void);
extern int test_spu_usart(void);
extern int test_usi_usart(void);
extern int test_trng(void);
extern int test_crc(void);
extern int test_eflash(void);
extern int test_spiflash(void);
extern int test_timer(void);
extern int test_gpio(void);
extern int test_aes(void);
extern int test_iic(void);
extern int test_spu_iic(void);
extern int test_usi_iic(void);
extern int test_rsa(void);
extern int test_rtc(void);
extern int test_spi(void);
extern int test_spu_spi(void);
extern int test_usi_spi(void);
extern int test_wdt(void);
extern int test_sha(void);
extern int test_pwm(void);
extern int test_dmac(void);
extern int test_eth(void);
extern int test_i2s(void);
extern int test_dpu(void);
extern int test_vpu(void);
extern int test_qw_efuse(void);
extern int test_pmu_tx216(void);
extern int test_aes_tx216(void);
extern int test_eth_phy_loopback(void);
extern int test_memory(void);

extern void syslog_init(void);

int dtest_main(void)
{
#if defined(TEST_USART)
    test_usart();
#endif

#if defined(TEST_SPU_USART)
    test_spu_usart();
#endif

#if defined(TEST_USI_USART)
    test_usi_usart();
#endif

#if defined(TEST_SPI)
    test_spi();
#endif

#if defined(TEST_SPU_SPI)
    test_spu_spi();
#endif

#if defined(TEST_USI_SPI)
    test_usi_spi();
#endif
#if defined(TEST_TRNG)
    test_trng();
#endif

#if defined(TEST_CRC)
    test_crc();
#endif

#if defined(TEST_EFLASH)
    test_eflash();
#endif

#if defined(TEST_SPIFLASH)
    test_spiflash();
#endif

#if defined(TEST_TIMER)
    test_timer();
#endif

#if defined(TEST_GPIO)
    test_gpio();
#endif

#if defined(TEST_AES)
    test_aes();
#endif

#if defined(TEST_IIC)
    test_iic();
#endif

#if defined(TEST_SPU_IIC)
    test_spu_iic();
#endif

#if defined(TEST_USI_IIC)
    test_usi_iic();
#endif

#if defined(TEST_RSA)
    test_rsa();
#endif

#if defined(TEST_RTC)
    test_rtc();
#endif

#if defined(TEST_SHA)
    test_sha();
#endif

#if defined(TEST_PWM)
    test_pwm();
#endif

#if defined(TEST_DMAC)
    test_dmac();
#endif

#if defined(TEST_WDT)
    test_wdt();
#endif

#if defined(TEST_ETH)
    test_eth();
#endif

#if defined(TEST_I2S)
    test_i2s();
#endif

#if defined(TEST_DPU)
    test_dpu();
#endif

#if defined(TEST_VPU)
    test_vpu();
#endif

#if defined(TEST_PMU_TX216)
    test_pmu_tx216();
#endif

#if defined(TEST_AES_TX216)
    test_aes_tx216();
#endif

#if defined(TEST_QW_EFUSE)
    test_qw_efuse();
#endif

#if defined(TEST_ETH_PHY_LOOPBACK)
    test_eth_phy_loopback();
#endif

#if defined(TEST_MEMORY)
    test_memory();
#endif

    return 0;
}

int __attribute__((weak)) main(void)
{
    int loop_count = 1;
    int round = 1;
#ifdef DRIVER_TEST_LOOP_COUNT   /* <0 means loop forever */
    loop_count = DRIVER_TEST_LOOP_COUNT;
#endif

    do {
        printf("*** test drivers round-%d ***\n", round);
        dtest_init();
        dtest_main();
        dtest_run();
        dtest_print_result();
        dtest_cleanup();
        round++;

        if (loop_count > 0) {
            loop_count--;
        }
    } while (loop_count != 0);

    return 0;
}
