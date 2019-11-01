/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     wj_pwm.c
 * @brief    CSI Source File for PWM Driver
 * @version  V1.0
 * @date     19. Feb 2019
 ******************************************************************************/

#include <csi_config.h>
#include <drv_pwm.h>
#include <drv_irq.h>
#include <wj_pwm.h>
#include <soc.h>

#define ERR_PWM(errno) (CSI_DRV_ERRNO_PWM_BASE | errno)

#define PWM_NULL_PARAM_CHK(para)          HANDLE_PARAM_CHK(para, ERR_PWM(DRV_ERROR_PARAMETER))
#define PWM_NULL_PARAM_CHK_NORETVAL(para) HANDLE_PARAM_CHK_NORETVAL(para, ERR_PWM(DRV_ERROR_PARAMETER))

typedef struct {
#ifdef CONFIG_LPM
    uint8_t pwm_power_status;
    uint32_t pwm_regs_saved[36];
#endif
    uint32_t base;
    uint32_t irq;
    uint32_t idx;
    pwm_event_cb_t pwm_event_cb[CONFIG_PER_PWM_CHANNEL_NUM];
} wj_pwm_priv_t;

extern int32_t target_pwm_init(uint32_t idx, uint32_t *base, uint32_t *irq, void **handler);
extern int32_t csi_pwm_power_control(pwm_handle_t handle, csi_power_stat_e state);

static wj_pwm_priv_t pwm_instance[CONFIG_PWM_NUM];

#ifdef CONFIG_LPM
static void manage_clock(pwm_handle_t handle, uint8_t enable)
{
    drv_clock_manager_config(CLOCK_MANAGER_PWM, enable);
}

static void do_prepare_sleep_action(pwm_handle_t handle)
{
    wj_pwm_priv_t *pwm_priv = handle;
    uint32_t *abase = (uint32_t *)(pwm_priv->base);
    registers_save(pwm_priv->pwm_regs_saved, abase, 7);
    registers_save(&pwm_priv->pwm_regs_saved[7], abase + 9, 2);
    registers_save(&pwm_priv->pwm_regs_saved[9], abase + 13, 4);
    registers_save(&pwm_priv->pwm_regs_saved[13], abase + 20, 11);
    registers_save(&pwm_priv->pwm_regs_saved[24], abase + 32, 1);
    registers_save(&pwm_priv->pwm_regs_saved[25], abase + 37, 4);
    registers_save(&pwm_priv->pwm_regs_saved[29], abase + 42, 1);
    registers_save(&pwm_priv->pwm_regs_saved[30], abase + 44, 6);
}

static void do_wakeup_sleep_action(pwm_handle_t handle)
{
    wj_pwm_priv_t *pwm_priv = handle;
    uint32_t *abase = (uint32_t *)(pwm_priv->base);
    registers_restore(abase, pwm_priv->pwm_regs_saved, 7);
    registers_restore(abase + 9, &pwm_priv->pwm_regs_saved[7], 2);
    registers_restore(abase + 13, &pwm_priv->pwm_regs_saved[9], 4);
    registers_restore(abase + 20, &pwm_priv->pwm_regs_saved[13], 11);
    registers_restore(abase + 32, &pwm_priv->pwm_regs_saved[24], 1);
    registers_restore(abase + 37, &pwm_priv->pwm_regs_saved[25], 4);
    registers_restore(abase + 42, &pwm_priv->pwm_regs_saved[29], 1);
    registers_restore(abase + 44, &pwm_priv->pwm_regs_saved[30], 6);
}
#endif

/**
  \brief       Initialize PWM Interface. 1. Initializes the resources needed for the PWM interface 2.registers event callback function
  \param[in]   idx pwm idx
  \return      handle pwm handle to operate.
*/
pwm_handle_t csi_pwm_initialize(uint32_t idx)
{
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_pwm_init(idx, &base, &irq, NULL);

    if (ret != idx || ret < 0) {
        return NULL;
    }

    wj_pwm_priv_t *pwm_priv = &pwm_instance[idx];

    pwm_priv->base      = base;
    pwm_priv->irq       = irq;
    pwm_priv->idx       = idx;

#ifdef CONFIG_LPM
    csi_pwm_power_control(pwm_priv, DRV_POWER_FULL);
#endif

    return pwm_priv;
}

/**
  \brief       De-initialize PWM Interface. stops operation and releases the software resources used by the interface
  \param[in]   handle pwm handle to operate.
*/
void csi_pwm_uninitialize(pwm_handle_t handle)
{
    wj_pwm_priv_t *pwm_priv = handle;

#ifdef CONFIG_LPM
    csi_pwm_power_control(pwm_priv, DRV_POWER_OFF);
#endif

    drv_irq_disable(pwm_priv->irq);
    drv_irq_unregister(pwm_priv->irq);
}

int32_t csi_pwm_power_control(pwm_handle_t handle, csi_power_stat_e state)
{
    PWM_NULL_PARAM_CHK(handle);

#ifdef CONFIG_LPM
    power_cb_t callback = {
        .wakeup = do_wakeup_sleep_action,
        .sleep = do_prepare_sleep_action,
        .manage_clock = manage_clock
    };
    return drv_soc_power_control(handle, state, &callback);
#else
    return ERR_PWM(DRV_ERROR_UNSUPPORTED);
#endif
}

/**
  \brief       config pwm clock division.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
  \param[in]   div      clock div.
*/
void drv_pwm_config_clockdiv(pwm_handle_t handle, uint8_t channel, uint32_t div)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);
    addr->PWMCFG &= ~(7 << 24);

    switch (div) {
        case 1:
            addr->PWMCFG &= ~(PWM_CFG_CNTDIV_EN);
            break;

        case 2:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_2;
            break;

        case 4:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_4;
            break;

        case 8:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_8;
            break;

        case 16:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_16;
            break;

        case 32:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_32;
            break;

        case 64:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_64;
            break;

        case 128:
            addr->PWMCFG |= PWM_CFG_CNTDIV_EN | PWM_CFG_CNTDIV_128;
            break;

        default:
            break;
    }
}

/**
  \brief       get pwm clock division.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
  \return      div      clock div.
*/
uint32_t drv_pwm_get_clockdiv(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK(handle);

    uint32_t pwmcfg, div_bits, clockdiv;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);
    pwmcfg = addr->PWMCFG;

    div_bits = pwmcfg & PWM_CFG_CNTDIV_Msk;

    switch (div_bits) {
        case PWM_CFG_CNTDIV_2:
            clockdiv = 2;
            break;

        case PWM_CFG_CNTDIV_4:
            clockdiv = 4;
            break;

        case PWM_CFG_CNTDIV_8:
            clockdiv = 8;
            break;

        case PWM_CFG_CNTDIV_16:
            clockdiv = 16;
            break;

        case PWM_CFG_CNTDIV_32:
            clockdiv = 32;
            break;

        case PWM_CFG_CNTDIV_64:
            clockdiv = 64;
            break;

        case PWM_CFG_CNTDIV_128:
            clockdiv = 128;
            break;

        default:
            clockdiv = 1;
    }

    return clockdiv;
}

/**
  \brief       config pwm mode.
  \param[in]   handle           pwm handle to operate.
  \param[in]   channel          channelnel num.
  \param[in]   period_us        the PWM period in us
  \param[in]   pulse_width_us   the PMW pulse width in us
  \return      error code
*/
int32_t csi_pwm_config(pwm_handle_t handle, uint8_t channel, uint32_t period_us, uint32_t pulse_width_us)
{
    PWM_NULL_PARAM_CHK(handle);

    if (pulse_width_us > period_us) {
        return ERR_PWM(DRV_ERROR_PARAMETER);
    }

    wj_pwm_priv_t *pwm_priv = handle;
    uint32_t counter;
    uint8_t cnt_div[8] = {1, 2, 4, 8, 16, 32, 64, 128};
    uint8_t count_div;

    for (count_div = 0; count_div <  sizeof(cnt_div) / sizeof(uint8_t); count_div++) {
        drv_pwm_config_clockdiv(handle, channel, cnt_div[count_div]);
        counter = (drv_get_pwm_freq(pwm_priv->idx) / 1000000 * period_us / cnt_div[count_div]);

        if ((counter <= 0xffff)) {
            break;
        }
    }

    if (count_div >= sizeof(cnt_div) / sizeof(uint8_t)) {
        return ERR_PWM(DRV_ERROR_PARAMETER);
    }

    uint32_t cmp_counter = (drv_get_pwm_freq(pwm_priv->idx) / 1000000 * pulse_width_us / cnt_div[count_div]);

    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);
    uint32_t ctl_tmp = addr->PWMCTL;
    uint32_t temp;

    if (channel == WJENUM_PWM_CH0 || channel == WJENUM_PWM_CH1) {
        ctl_tmp &= 0xfffffffe;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP;

        temp = addr->PWM01LOAD;
        temp &= 0xffff0000;
        addr->PWM01LOAD = temp | counter;

        temp = addr->PWM0CMP;

        if (channel == WJENUM_PWM_CH0) {
            temp &= 0xffff0000;
            addr->PWM0CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM0CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == WJENUM_PWM_CH2 || channel == WJENUM_PWM_CH3) {
        ctl_tmp &= 0xfffffffd;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP << 1;

        temp = addr->PWM01LOAD;
        temp &= 0x0000ffff;
        addr->PWM01LOAD = temp | counter << 16 ;

        temp = addr->PWM1CMP;

        if (channel == WJENUM_PWM_CH2) {
            temp &= 0xffff0000;
            addr->PWM1CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM1CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == WJENUM_PWM_CH4 || channel == WJENUM_PWM_CH5) {
        ctl_tmp &= 0xfffffffb;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP << 2;

        temp = addr->PWM23LOAD;
        temp &= 0xffff0000;
        addr->PWM23LOAD = temp | counter;

        temp = addr->PWM2CMP;

        if (channel == WJENUM_PWM_CH4) {
            temp &= 0xffff0000;
            addr->PWM2CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM2CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == WJENUM_PWM_CH6 || channel == WJENUM_PWM_CH7) {
        ctl_tmp &= 0xfffffff7;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP << 3;

        temp = addr->PWM23LOAD;
        temp &= 0x0000ffff;
        addr->PWM23LOAD = temp | counter << 16 ;

        temp = addr->PWM3CMP;

        if (channel == WJENUM_PWM_CH6) {
            temp &= 0xffff0000;
            addr->PWM3CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM3CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == WJENUM_PWM_CH8 || channel == WJENUM_PWM_CH9) {
        ctl_tmp &= 0xffffffef;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP << 4;

        temp = addr->PWM45LOAD;
        temp &= 0xffff0000;
        addr->PWM45LOAD = temp | counter ;

        temp = addr->PWM4CMP;

        if (channel == WJENUM_PWM_CH8) {
            temp &= 0xffff0000;
            addr->PWM4CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM4CMP = temp | cmp_counter << 16;
        }
    }

    if (channel == WJENUM_PWM_CH10 || channel == WJENUM_PWM_CH11) {
        ctl_tmp &= 0xffffffdf;
        addr->PWMCTL = ctl_tmp | (uint32_t)WJENUM_PWM_COUNT_UP << 5;

        temp = addr->PWM45LOAD;
        temp &= 0x0000ffff;
        addr->PWM45LOAD = temp | counter << 16 ;

        temp = addr->PWM5CMP;

        if (channel == WJENUM_PWM_CH10) {
            temp &= 0xffff0000;
            addr->PWM5CMP = temp | cmp_counter;
        } else {
            temp &= 0x0000ffff;
            addr->PWM5CMP = temp | cmp_counter << 16;
        }
    }

    return 0;
}

/**
  \brief       start generate pwm signal.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  channel num.
  \return      \ref execution_status
*/
void csi_pwm_start(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    if (channel == WJENUM_PWM_CH0 || channel == WJENUM_PWM_CH1) {
        addr->PWMCFG |= 0x00000003;        /* PWM0 output enable */
    }

    if (channel == WJENUM_PWM_CH2 || channel == WJENUM_PWM_CH3) {
        addr->PWMCFG |= 0x0000000C;        /* PWM1 output enable */
    }

    if (channel == WJENUM_PWM_CH4 || channel == WJENUM_PWM_CH5) {
        addr->PWMCFG |= 0x00000030;        /* PWM2 output enable */
    }

    if (channel == WJENUM_PWM_CH6 || channel == WJENUM_PWM_CH7) {
        addr->PWMCFG |= 0x000000C0;        /* PWM3 output enable */
    }

    if (channel == WJENUM_PWM_CH8 || channel == WJENUM_PWM_CH9) {
        addr->PWMCFG |= 0x00000300;        /* PWM4 output enable */
    }

    if (channel == WJENUM_PWM_CH10 || channel == WJENUM_PWM_CH11) {
        addr->PWMCFG |= 0x00000C00;        /* PWM5 output enable */
    }
}

/**
  \brief       Stop generate pwm signal.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  channel num.
  \return      \ref execution_status
*/
void  csi_pwm_stop(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    if (channel == WJENUM_PWM_CH0 || channel == WJENUM_PWM_CH1) {
        addr->PWMCFG &= ~0x00000003;        /* PWM0 output disable */
    }

    if (channel == WJENUM_PWM_CH2 || channel == WJENUM_PWM_CH3) {
        addr->PWMCFG &= ~0x0000000C;        /* PWM1 output disable */
    }

    if (channel == WJENUM_PWM_CH4 || channel == WJENUM_PWM_CH5) {
        addr->PWMCFG &= ~0x00000030;        /* PWM2 output disable */
    }

    if (channel == WJENUM_PWM_CH6 || channel == WJENUM_PWM_CH7) {
        addr->PWMCFG &= ~0x000000C0;        /* PWM3 output disable */
    }

    if (channel == WJENUM_PWM_CH8 || channel == WJENUM_PWM_CH9) {
        addr->PWMCFG &= ~0x00000300;        /* PWM4 output disable */
    }

    if (channel == WJENUM_PWM_CH10 || channel == WJENUM_PWM_CH11) {
        addr->PWMCFG &= ~0x00000C00;        /* PWM5 output disable */
    }
}

void wj_pwm_irqhandler(int32_t idx)
{
    int i;

    wj_pwm_priv_t *pwm_priv = &pwm_instance[idx];
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);
    uint32_t capis = addr->CAPIS;
    uint32_t timis = addr->TIMIS;

    for (i = 0; i < CONFIG_PER_PWM_CHANNEL_NUM/2; i++) {
        if (timis & (0x1 << i)) {
            pwm_event_cb_t cb = pwm_priv->pwm_event_cb[i << 1];

            addr->TIMIC |= 0x1 << i;

            if (cb) {
                cb(i, PWM_TIMER_EVENT_TIMEOUT, 0);
            }

            continue;
        }

        if (capis & (0x1 << i)) {
            uint32_t val = 0;
            volatile uint32_t timeout = 0;
            pwm_event_cb_t cb = pwm_priv->pwm_event_cb[i << 1];

            while (addr->CAPIS & (0x1 << i)) {
                addr->CAPIC |= (0x1 << i);

                if (timeout++ > 10000000) {
                    break;
                }
            }

            if (cb) {
                cb(i, PWM_CAPTURE_EVENT_COUNT, val);
            }

            continue;
        }

        if (capis & (0x40 << i)) {
            uint32_t val;
            volatile uint32_t timeout = 0;
            pwm_event_cb_t cb = pwm_priv->pwm_event_cb[i << 1];

            while (addr->CAPIS & (0x40 << i)) {
                addr->CAPIC |= (0x40 << i);

                if (timeout++ > 10000000) {
                    break;
                }
            }

            if (cb) {
                val = (uint16_t)(*(volatile uint32_t *)((uint32_t)&addr->CAP01T
                                                        + ((i >> 1) << 2)) >> (16 & (i & 0x1)));

                cb(i, PWM_CAPTURE_EVENT_TIME, val);
            }

            continue;
        }
    }
}

/**
  \brief       config pwm clock division.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
  \param[in]   cb_event event callback.
*/
void drv_pwm_config_cb(pwm_handle_t handle, uint8_t channel, pwm_event_cb_t cb_event)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    void *handler;
    wj_pwm_priv_t *pwm_priv = handle;
    pwm_priv->pwm_event_cb[channel] = cb_event;

    target_pwm_init(pwm_priv->idx, NULL, NULL, &handler);

    drv_irq_register(pwm_priv->irq, handler);
    drv_irq_enable(pwm_priv->irq);
}

/**
  \brief       config pwm capture mode.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
  \param[in]   config   capture config.
*/
void drv_pwm_capture_config(pwm_handle_t handle, uint8_t channel, pwm_input_config_t *config)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    uint8_t real_ch = channel / 2;
    uint32_t capctl, capinten;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    capctl = addr->CAPCTL & ~PWM_CAPCTL_EVENT_MODE_Msk(real_ch);

    if (config->event_mode == PWM_INPUT_EVENT_MODE_POSEDGE) {
        addr->CAPCTL = capctl | PWM_CAPCTL_POSEDGE(real_ch);
    } else if (config->event_mode == PWM_INPUT_EVENT_MODE_NEGEDGE) {
        addr->CAPCTL = capctl | PWM_CAPCTL_NEGEDGE(real_ch);
    } else if (config->event_mode == PWM_INPUT_EVENT_MODE_BOTHEDGE) {
        addr->CAPCTL = capctl | PWM_CAPCTL_BOTH_EDGE(real_ch);
    }

    capctl = addr->CAPCTL & ~PWM_CAPCTL_EDGE_MODE_Msk(real_ch);
    capinten = addr->CAPINTEN & ~PWM_CAPINTEN_EDGE_COUNT_IRQ_Msk(real_ch);

    if (config->input_mode == PWM_INPUT_MODE_EDGE_TIME) {
        addr->CAPCTL = capctl | PWM_CAPCTL_EDGE_TIME(real_ch);
        addr->CAPINTEN = capinten | PWM_CAPINTEN_EDGE_TIME_IRQ_EN(real_ch);
    } else {
        switch (real_ch) {
            case 0:
                addr->CAP01MATCH &= 0xFFFF0000;
                addr->CAP01MATCH |= (uint16_t)config->count;
                break;
            case 1:
                addr->CAP01MATCH &= 0x0000FFFF;
                addr->CAP01MATCH |= ((uint16_t)config->count << 16);
                break;
            case 2:
                addr->CAP23MATCH &= 0xFFFF0000;
                addr->CAP23MATCH |= (uint16_t)config->count;
                break;
            case 3:
                addr->CAP23MATCH &= 0x0000FFFF;
                addr->CAP23MATCH |= ((uint16_t)config->count << 16);
                break;
            case 4:
                addr->CAP45MATCH &= 0xFFFF0000;
                addr->CAP45MATCH |= (uint16_t)config->count;
                break;
            case 5:
                addr->CAP45MATCH &= 0x0000FFFF;
                addr->CAP45MATCH |= ((uint16_t)config->count << 16);
                break;
            default:
                break;
        }
        addr->CAPCTL = capctl | PWM_CAPCTL_EDGE_COUNT(real_ch);
        addr->CAPINTEN = capinten | PWM_CAPINTEN_EDGE_COUNT_IRQ_EN(real_ch);
    }
}

/**
  \brief       start pwm capture.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
*/
void drv_pwm_capture_start(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    uint8_t real_ch = channel / 2;
    uint32_t pwmcfg;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    pwmcfg = addr->PWMCFG & ~PWM_PWMCFG_OUTPUT_Msk(real_ch);
    addr->PWMCFG = pwmcfg | PWM_PWMCFG_OUTPUT_DISABLE(real_ch);

    pwmcfg = addr->PWMCFG & ~PWM_PWMCFG_CAPTURE_Msk(real_ch);
    addr->PWMCFG = pwmcfg | PWM_PWMCFG_CAPTURE_ENABLE(real_ch);
}

/**
  \brief       stop pwm capture.
  \param[in]   handle   pwm handle to operate.
  \param[in]   channel  channel num.
*/
void drv_pwm_capture_stop(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    uint8_t real_ch = channel / 2;
    uint32_t pwmcfg, capinten;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    pwmcfg = addr->PWMCFG & ~PWM_PWMCFG_CAPTURE_Msk(real_ch);
    addr->PWMCFG = pwmcfg | PWM_PWMCFG_CAPTURE_DISABLE(real_ch);

    capinten = addr->CAPINTEN & ~PWM_CAPINTEN_EDGE_COUNT_IRQ_Msk(real_ch);
    addr->CAPINTEN = capinten | PWM_CAPINTEN_EDGE_COUNT_IRQ_DIS(real_ch);

    capinten = addr->CAPINTEN & ~PWM_CAPINTEN_EDGE_TIME_IRQ_Msk(real_ch);
    addr->CAPINTEN = capinten | PWM_CAPINTEN_EDGE_TIME_IRQ_DIS(real_ch);
}

/**
  \brief       set pwm timeout.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  channel num.
  \param[in]   timeout the timeout value in microseconds(us).
*/
void drv_pwm_timer_set_timeout(pwm_handle_t handle, uint8_t channel, uint32_t timeout)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    uint32_t clockdiv, sysclk;
    uint32_t pwmcfg;
    uint16_t load;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    clockdiv = drv_pwm_get_clockdiv(handle, channel);
    sysclk = drv_get_pwm_freq(pwm_priv->idx);
    load = (uint16_t)((sysclk / 1000000) * timeout / clockdiv);

    switch (channel) {
        case 0:
            addr->TIM01LOAD &= 0xFFFF0000;
            addr->TIM01LOAD |= load;
            break;

        case 1:
            addr->TIM01LOAD &= 0x0000FFFF;
            addr->TIM01LOAD |= (load << 16);
            break;

        case 2:
            addr->TIM23LOAD &= 0xFFFF0000;
            addr->TIM23LOAD |= load;
            break;

        case 3:
            addr->TIM23LOAD &= 0x0000FFFF;
            addr->TIM23LOAD |= (load << 16);
            break;

        case 4:
            addr->TIM45LOAD &= 0xFFFF0000;
            addr->TIM45LOAD |= load;
            break;

        case 5:
            addr->TIM45LOAD &= 0x0000FFFF;
            addr->TIM45LOAD |= (load << 16);
            break;

        default:
            break;
    }

    pwmcfg = addr->PWMCFG & ~PWM_PWMCFG_OUTPUT_Msk(channel);
    addr->PWMCFG = pwmcfg | PWM_PWMCFG_OUTPUT_DISABLE(channel);
}

/**
  \brief       start pwm timer.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  chnnel num.
*/
void drv_pwm_timer_start(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    addr->PWMCFG |= (0x1 << (18 + channel));
    addr->TIMINTEN |= 0x1 << channel;
}

/**
  \brief       stop pwm timer.
  \param[in]   handle pwm handle to operate.
  \param[in]   channel  chnnel num.
*/
void drv_pwm_timer_stop(pwm_handle_t handle, uint8_t channel)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);

    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    addr->PWMCFG &= ~(0x1 << (18 + channel));
    addr->TIMINTEN &= ~(0x1 << channel);
}

/**
  \brief       get pwm timer current value
  \param[in]   handle pwm handle to operate.
  \param[in]   channel   channel num.
  \param[out]  value     timer current value
*/
void drv_pwm_timer_get_current_value(pwm_handle_t handle, uint8_t channel, uint32_t *value)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);
    PWM_NULL_PARAM_CHK_NORETVAL(value);

    uint16_t cur;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    switch (channel) {
        case 0:
            cur = (uint16_t)addr->TIM01COUNT;
            break;

        case 1:
            cur = (uint16_t)(addr->TIM01COUNT >> 16);
            break;

        case 2:
            cur = (uint16_t)addr->TIM23COUNT;
            break;

        case 3:
            cur = (uint16_t)(addr->TIM23COUNT >> 16);
            break;

        case 4:
            cur = (uint16_t)addr->TIM45COUNT;
            break;

        case 5:
            cur = (uint16_t)(addr->TIM45COUNT >> 16);
            break;

        default:
            cur = 0;
            break;
    }

    *value = (uint32_t)cur;
}

/**
  \brief       get pwm timer reload value
  \param[in]   handle pwm handle to operate.
  \param[in]   channel   channel num.
  \param[out]  value    timer reload value
*/
void drv_pwm_timer_get_load_value(pwm_handle_t handle, uint8_t channel, uint32_t *value)
{
    PWM_NULL_PARAM_CHK_NORETVAL(handle);
    PWM_NULL_PARAM_CHK_NORETVAL(value);

    uint16_t load;
    wj_pwm_priv_t *pwm_priv = handle;
    wj_pwm_reg_t *addr = (wj_pwm_reg_t *)(pwm_priv->base);

    switch (channel) {
        case 0:
            load = (uint16_t)addr->TIM01LOAD;
            break;

        case 1:
            load = (uint16_t)(addr->TIM01LOAD >> 16);
            break;

        case 2:
            load = (uint16_t)addr->TIM23LOAD;
            break;

        case 3:
            load = (uint16_t)(addr->TIM23LOAD >> 16);
            break;

        case 4:
            load = (uint16_t)addr->TIM45LOAD;
            break;

        case 5:
            load = (uint16_t)(addr->TIM45LOAD >> 16);
            break;

        default:
            load = 0;
            break;
    }

    *value = (uint32_t)load;
}
