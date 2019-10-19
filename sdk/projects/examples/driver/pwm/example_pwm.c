/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     example_pwm.c
 * @brief    the main function for the PWM driver
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include "drv_pwm.h"
#include "stdio.h"
#include "soc.h"
#include <pin.h>

extern void mdelay(uint32_t ms);

void example_pin_pwm_init(void)
{
    drv_pinmux_config(EXAMPLE_PWM_CH, EXAMPLE_PWM_CH_FUNC);
}

int32_t  pwm_signal_test(uint32_t pwm_idx, uint8_t pwm_ch)
{
    int32_t ret;
    pwm_handle_t pwm_handle;

    example_pin_pwm_init();

    pwm_handle = csi_pwm_initialize(pwm_idx);

    if (pwm_handle == NULL) {
        printf("csi_pwm_initialize error\n");
        return -1;
    }

    ret = csi_pwm_config(pwm_handle, pwm_ch, 3000, 1500);

    if (ret < 0) {
        printf("csi_pwm_config error\n");
        return -1;
    }

    csi_pwm_start(pwm_handle, pwm_ch);
    mdelay(20);

    ret = csi_pwm_config(pwm_handle, pwm_ch, 200, 150);

    if (ret < 0) {
        printf("csi_pwm_config error\n");
        return -1;
    }

    mdelay(20);
    csi_pwm_stop(pwm_handle, pwm_ch);


    csi_pwm_uninitialize(pwm_handle);

    return 0;

}

int example_pwm(uint32_t pwm_idx, uint8_t pwm_pin)
{
    int32_t ret;
    ret = pwm_signal_test(pwm_idx, pwm_pin);

    if (ret < 0) {
        printf("pwm_signal_test error\n");
        return -1;
    }

    printf("pwm_signal_test OK\n");

    return 0;
}

int main(void)
{
    return example_pwm(EXAMPLE_PWM_IDX, EXAMPLE_PWM_CH_IDX);
}
