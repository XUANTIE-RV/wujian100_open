/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */

/******************************************************************************
* @file     wj_dmac_v2.c
* @brief    CSI Source File for DMAC Driver
* @version  V1.0
* @date     02. June 2017
******************************************************************************/

#include <csi_config.h>
#include <stdbool.h>
#include <string.h>
#include <soc.h>
#include <wj_dmac_v2.h>
#include <csi_core.h>
#include <drv_irq.h>
#include <drv_dmac.h>

#define ERR_DMA(errno) (CSI_DRV_ERRNO_DMA_BASE | errno)

typedef struct {
#ifdef CONFIG_LPM
    uint8_t dma_power_status;
#endif
    uint32_t base;
    uint32_t irq;
    dma_event_cb_t cb_event;
    void *cb_arg;
    dma_channel_req_mode_e ch_mode;
    uint32_t src_tw;
    uint32_t dst_tw;
    dma_trig_trans_mode_e mode;
    dma_status_e status;
    uint8_t ch_opened;
} wj_dma_priv_t;

extern int32_t target_get_dmac(int32_t idx, uint32_t *base, uint32_t *irq, void **handler);
static wj_dma_priv_t dma_instance[CONFIG_DMA_CHANNEL_NUM];

static const dma_capabilities_t dma_capabilities = {
    .unalign_addr = 1,          ///< support for unalign address transfer when memory is source
};

static int32_t wj_dma_set_total_size(wj_dma_reg_t *addr, uint32_t len)
{
    addr->CHCTRLA &= 0xff000fff;
    addr->CHCTRLA |= (len - 1) << 12;

    return 0;
}

static int32_t wj_dma_set_channel(wj_dma_reg_t *addr, uint32_t source, uint32_t dest)
{
    addr->SAR = source;
    addr->DAR = dest ;

    return 0;
}

static int32_t wj_dma_set_addrinc(wj_dma_reg_t *addr, enum_addr_state_e src_addrinc, enum_addr_state_e dst_addrinc)
{
    if ((src_addrinc != DMA_ADDR_INCREMENT && src_addrinc != DMA_ADDR_DECREMENT && src_addrinc != DMA_ADDR_NOCHANGE) ||
        (dst_addrinc != DMA_ADDR_INCREMENT && dst_addrinc != DMA_ADDR_DECREMENT && dst_addrinc != DMA_ADDR_NOCHANGE)) {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    uint32_t  temp = addr->CHCTRLA;
    temp &= 0xffffff0f;
    temp |= (src_addrinc << 6);
    temp |= (dst_addrinc << 4);
    addr->CHCTRLA = temp;

    return 0;
}

int32_t wj_dma_set_transferwidth(wj_dma_reg_t *addr, dma_datawidth_e src_width, dma_datawidth_e dst_width)
{
    if ((src_width != 1 && src_width != 2 && src_width != 4) ||
        (dst_width != 1 && dst_width != 2 && dst_width != 4)) {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    uint32_t temp = addr->CHCTRLA;
    uint32_t src_temp = 0;
    uint32_t dst_temp = 0;

    if (src_width == 1 || src_width == 2) {
        src_temp = src_width - 1;
    } else if (src_width == 4) {
        src_temp = 2;
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    if (dst_width == 1 || dst_width == 2) {
        dst_temp = dst_width - 1;
    } else if (dst_width == 4) {
        dst_temp = 2;
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    temp &= 0xfffffff0;
    temp |= src_temp << 2;
    temp |= dst_temp;
    addr->CHCTRLA = temp;

    return 0;

}

static int32_t wj_dma_trans_mode_set(wj_dma_reg_t *addr, dma_trig_trans_mode_e mode)
{
    addr->CHCTRLB &= 0xfffffff9;
    addr->CHCTRLB |= (mode << 1);
    return 0;
}

static int32_t wj_dma_set_addr_endian(wj_dma_reg_t *addr, dma_addr_endian_e src_endian, dma_addr_endian_e dst_endian)
{
    addr->CHCTRLB &= 0xffff9fff;
    addr->CHCTRLB |= (src_endian << 13);
    addr->CHCTRLB |= (dst_endian << 14);
    return 0;
}

static int32_t wj_dma_set_singlemode(wj_dma_reg_t *addr, dma_config_t *config)
{
    addr->CHCTRLA &= 0xefffffff;
    addr->CHCTRLA |= (config->single_dir << 26);

    if (config->preemption == 0) {
        if (config->single_dir == DMA_DIR_SOURCE) {
            addr->CHCTRLA &= 0xfbffffff;
        } else {
            addr->CHCTRLA &= 0xfdffffff;
        }
    } else if (config->preemption == 1) {
        if (config->single_dir == DMA_DIR_DEST) {
            addr->CHCTRLA |= 0x04000000;
        } else {
            addr->CHCTRLA |= 0x02000000;
        }
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    return 0;
}

static int32_t wj_dma_set_groupmode(wj_dma_reg_t *addr, dma_config_t *config)
{
    if (config->src_inc == DMA_ADDR_INC || config->src_inc == DMA_ADDR_DEC) {
        addr->CHCTRLA &= 0xdfffffff;
    } else if (config->src_inc == DMA_ADDR_CONSTANT) {
        addr->CHCTRLA |= (1 << 29);
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    if (config->dst_inc == DMA_ADDR_INC || config->dst_inc == DMA_ADDR_DEC) {
        addr->CHCTRLA &= 0x7fffffff;
    } else if (config->dst_inc == DMA_ADDR_CONSTANT) {
        addr->CHCTRLA |= (1U << 31);
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    if (config->preemption == 0) {
        addr->CHCTRLA &= 0xfeffffff;
    } else if (config->preemption == 1) {
        //Channel interrupt by high priority channel mode Control
        addr->CHCTRLA |= (1 << 24);
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    addr->CHCTRLA &= 0xfffff0ff;
    addr->CHCTRLA |= ((config->group_len - 1) << 8);
    return 0;
}

static int32_t wj_dma_set_blockmode(wj_dma_reg_t *addr)
{

    return 0;
}

void wj_dma_irqhandler(int32_t idx)
{
    uint32_t temp = 0;
    uint32_t i;
    wj_dma_reg_t *addr;
    uint32_t ch_max = idx * CONFIG_PER_DMAC_CHANNEL_NUM + CONFIG_PER_DMAC_CHANNEL_NUM;
    uint32_t base;
    target_get_dmac(idx * CONFIG_PER_DMAC_CHANNEL_NUM, &base, NULL, NULL);

    for (i = idx * CONFIG_PER_DMAC_CHANNEL_NUM ; i < ch_max; i++) {
        addr = (wj_dma_reg_t *)(base + (i % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);
        temp = addr->CHINTS;
        addr->CHINTC = 0x1f;

        if (temp & WJ_DMA_TFR) {
            break;
        }
    }

    if (i >= ch_max) {
        return;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[i];

    if (temp & WJ_DMA_TFR || (temp & (WJ_DMA_TFR | WJ_DMA_TRGETCMPFR))) {
        dma_priv->status = DMA_STATE_DONE;

        if (dma_priv->cb_event) {
            if (temp & WJ_DMA_TFR) {
                dma_priv->cb_event(i, DMA_EVENT_TRANSFER_DONE, dma_priv->cb_arg);
            }
        }

        return;
    }

    if (temp & WJ_DMA_ERR) {
        addr->CHINTC |= WJ_DMA_ERR;

        if (dma_priv->cb_event) {
            dma_priv->cb_event(i, DMA_EVENT_TRANSFER_ERROR, dma_priv->cb_arg);
        }
    }

    return;
}

#ifdef CONFIG_LPM
static void manage_clock(void *handle, uint8_t enable)
{
    uint8_t i;

    for (i = 0; i < CONFIG_DMA_CHANNEL_NUM; i++) {
        if (dma_instance[i].ch_opened) {
            return;
        }
    }

    drv_clock_manager_config(CLOCK_MANAGER_DMAC0, enable);
}
#endif

/**
  \brief       control dma power.
  \param[in]   ch      dma channel num
  \param[in]   state   power state.\ref csi_power_stat_e.
  \return      error code
*/
int32_t csi_dma_power_control(int32_t ch, csi_power_stat_e state)
{
#ifdef CONFIG_LPM
    power_cb_t callback = {
        .wakeup = NULL,
        .sleep = NULL,
        .manage_clock = manage_clock
    };
    return drv_soc_power_control(NULL, state, &callback);
#else
    return ERR_DMA(DRV_ERROR_UNSUPPORTED);
#endif

}
/**
  \brief       Get driver capabilities.
  \param[in]   ch      dma channel num
  \return      \ref dma_capabilities_t
*/
dma_capabilities_t csi_dma_get_capabilities(int32_t ch)
{
    if (ch > (CONFIG_DMA_CHANNEL_NUM - 1)) {
        dma_capabilities_t ret;
        memset(&ret, 0, sizeof(dma_capabilities_t));
        return ret;
    }

    return dma_capabilities;
}

/**
  \brief     get one free dma channel
  \param[in] ch channel num. if -1 then allocate a free channal in this dma
                             else allocate a fix channal
  \return    dma channel num. if -1 alloc channle error
 */
int32_t csi_dma_alloc_channel_ex(int32_t ch)
{
    uint8_t ch_num = 0;

    uint32_t result = csi_irq_save();

    if (ch == -1) {
        // alloc a free channal
        for (ch_num = 0; ch_num < CONFIG_DMA_CHANNEL_NUM; ch_num++) {
            if (dma_instance[ch_num].ch_opened != 0x1) {
                dma_instance[ch_num].ch_opened = 1;
                break;
            }
        }
    } else {
        ch_num = ch;

        if (dma_instance[ch_num].ch_opened != 0x1) {
            dma_instance[ch_num].ch_opened = 1;
        } else {
            csi_irq_restore(result);
            return -1;
        }
    }

    csi_irq_restore(result);

    if (ch_num >= CONFIG_DMA_CHANNEL_NUM) {
        return -1;
    }

    uint32_t base = 0u;
    uint32_t irq = 0u;
    void *handler;

    int32_t real_ch = target_get_dmac(ch_num, &base, &irq, &handler);

    if (real_ch != ch_num) {
        return -1;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch_num];

    dma_priv->base = base;
    dma_priv->irq  = irq;
    dma_priv->status = DMA_STATE_READY;
    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch_num % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);

    addr->CHINTM |= WJ_DMA_MASK;
    addr->CHINTC |= WJ_DMA_INTC;

    result = csi_irq_save();
    uint32_t i;
    uint32_t ch_open_num = 0;

    for (i = ch_num; i < (ch_num / CONFIG_PER_DMAC_CHANNEL_NUM + CONFIG_PER_DMAC_CHANNEL_NUM); i++) {
        if (dma_instance[i].ch_opened == 0x1) {
            ch_open_num++;
        }
    }

    if (ch_open_num >= 1) {
        drv_irq_register(dma_priv->irq, handler);
        drv_irq_enable(dma_priv->irq);
#ifdef CONFIG_LPM
        csi_dma_power_control(ch_num, DRV_POWER_FULL);
#endif
        *(volatile uint32_t *)WJ_V2_DMAC_STATUSCHPEND = WJ_DMA_ALL_CAHNNELS_PEND_INTR_VALID;
        *(volatile uint32_t *)WJ_V2_DMAC_CHSR = WJ_DMA_ALL_CAHNNELS_DATA_TRANS_BUSY_VALID;
    }

    csi_irq_restore(result);

    return ch_num;
}
/**
  \brief     get one free dma channel
  \return    dma channel num. if -1 alloc channle error
 */
int32_t csi_dma_alloc_channel(void)
{
    uint8_t ch_num = 0;

    uint32_t result = csi_irq_save();

    for (ch_num = 0; ch_num < CONFIG_DMA_CHANNEL_NUM; ch_num++) {
        if (dma_instance[ch_num].ch_opened != 0x1) {
            dma_instance[ch_num].ch_opened = 1;
            break;
        }
    }

    csi_irq_restore(result);

    if (ch_num >= CONFIG_DMA_CHANNEL_NUM) {
        return -1;
    }

    uint32_t base = 0u;
    uint32_t irq = 0u;
    void *handler;

    int32_t real_ch = target_get_dmac(ch_num, &base, &irq, &handler);

    if (real_ch != ch_num) {
        return -1;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch_num];

    dma_priv->base = base;
    dma_priv->irq  = irq;
    dma_priv->status = DMA_STATE_READY;
    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch_num % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);

    addr->CHINTM |= WJ_DMA_MASK;
    addr->CHINTC |= WJ_DMA_INTC;

    result = csi_irq_save();
    uint32_t i;
    uint32_t ch_open_num = 0;

    for (i = ch_num; i < (ch_num / CONFIG_PER_DMAC_CHANNEL_NUM + CONFIG_PER_DMAC_CHANNEL_NUM); i++) {
        if (dma_instance[i].ch_opened == 0x1) {
            ch_open_num++;
        }
    }

    if (ch_open_num >= 1) {
        drv_irq_register(dma_priv->irq, handler);
        drv_irq_enable(dma_priv->irq);
#ifdef CONFIG_LPM
        csi_dma_power_control(ch_num, DRV_POWER_FULL);
#endif
        *(volatile uint32_t *)WJ_V2_DMAC_STATUSCHPEND = WJ_DMA_ALL_CAHNNELS_PEND_INTR_VALID;
        *(volatile uint32_t *)WJ_V2_DMAC_CHSR = WJ_DMA_ALL_CAHNNELS_DATA_TRANS_BUSY_VALID;
    }

    csi_irq_restore(result);

    return ch_num;
}

/**
  \brief        release dma channel and related resources
  \param[in]    ch dma channel num
  \return       error code
 */
void csi_dma_release_channel(int32_t ch)
{
    uint32_t result = 0;

    if (ch >= CONFIG_DMA_CHANNEL_NUM || ch < 0) {
        return;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch];
    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);

    dma_priv->status = DMA_STATE_FREE;
    dma_priv->ch_opened = 0;

    addr->CHINTM = WJ_CHINTM_RESETVALUE;
    addr->CHINTC = WJ_CHINTC_RESETVALUE;

    uint32_t ch_num;

    result = csi_irq_save();

    for (ch_num = ch; ch_num < (ch / CONFIG_PER_DMAC_CHANNEL_NUM + CONFIG_PER_DMAC_CHANNEL_NUM); ch_num++) {
        if (dma_instance[ch_num].ch_opened == 0x1) {
            break;
        }
    }

    if (ch_num >= CONFIG_PER_DMAC_CHANNEL_NUM) {
        drv_irq_disable(dma_priv->irq);
        drv_irq_unregister(dma_priv->irq);

#ifdef CONFIG_LPM
        csi_dma_power_control(ch, DRV_POWER_OFF);
#endif
    }

    csi_irq_restore(result);
}

/**
  \brief        config dma channel
  \param[in]    ch          dma channel num
  \param[in]    config      dma channel transfer configure
  \param[in]    cb_event    Pointer to \ref dma_event_cb_t
  \param[in]    cb_arg      Pointer to \ref dam event user arg
  \return       error code
 */
int32_t csi_dma_config_channel(int32_t ch, dma_config_t *config, dma_event_cb_t cb_event, void *cb_arg)
{
    uint32_t src_in_bytes;
    uint32_t dst_in_bytes;
    int32_t ret;

    if (ch >= CONFIG_DMA_CHANNEL_NUM || ch < 0 || config == NULL) {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch];

    if (!(config->src_tw) || !(config->dst_tw)) {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    src_in_bytes = config->src_tw;
    dst_in_bytes = config->dst_tw;
    dma_priv->src_tw = config->src_tw;
    dma_priv->dst_tw = config->dst_tw;
    dma_priv->mode   = config->mode;

    if (dma_priv->ch_opened == 0) {
        return ERR_DMA(DRV_ERROR_BUSY);
    }

    dma_priv->cb_event = cb_event;
    dma_priv->cb_arg = cb_arg;
    dma_priv->ch_mode = config->ch_mode;

    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);

    /* Initializes corresponding channel registers */
    ret = wj_dma_set_transferwidth(addr, config->src_tw, config->dst_tw);

    if (ret < 0) {
        return ret;
    }

    ret = wj_dma_set_addrinc(addr, config->src_inc, config->dst_inc);

    if (ret < 0) {
        return ret;
    }

    ret = wj_dma_set_addr_endian(addr, config->src_endian, config->dst_endian);

    if (ret < 0) {
        return ret;
    }

    ret = wj_dma_trans_mode_set(addr, config->mode);

    if (ret < 0) {
        return ret;
    }

    if (config->mode == DMA_SINGLE_TRIGGER) {
        ret = wj_dma_set_singlemode(addr, config);

        if (ret < 0) {
            return ret;
        }
    } else if (config->mode == DMA_GROUP_TRIGGER) {
        if ((config->group_len != DMA_GROUP_LEN1) && (config->group_len != DMA_GROUP_LEN2) && (config->group_len != DMA_GROUP_LEN3) && (config->group_len != DMA_GROUP_LEN4) && (config->group_len != DMA_GROUP_LEN5) && (config->group_len != DMA_GROUP_LEN6) && (config->group_len != DMA_GROUP_LEN7) && (config->group_len != DMA_GROUP_LEN8)) {
            return ERR_DMA(DRV_ERROR_PARAMETER);
        }

        if ((config->group_len % src_in_bytes != 0) || (config->group_len % dst_in_bytes != 0)) {
            return ERR_DMA(DRV_ERROR_PARAMETER);
        }

        ret = wj_dma_set_groupmode(addr, config);

        if (ret < 0) {
            return ret;
        }
    } else if (config->mode == DMA_BLOCK_TRIGGER) {
        ret = wj_dma_set_blockmode(addr);

        if (ret < 0) {
            return ret;
        }
    } else {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    dma_priv->status = DMA_STATE_READY;
    return ch;
}

/**
  \brief       start generate dma channel signal.
  \param[in]   ch          dma channel num
  \param[in]   psrcaddr    dma transfer source address
  \param[in]   pdstaddr    dma transfer destination address
  \param[in]   length      dma transfer length (unit: bytes).
*/
void csi_dma_start(int32_t ch, void *psrcaddr, void *pdstaddr, uint32_t length)
{
    if (ch >= CONFIG_DMA_CHANNEL_NUM || ch < 0 || psrcaddr == NULL || pdstaddr == NULL) {
        return;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch];

    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);

    if (dma_priv->mode == DMA_GROUP_TRIGGER || dma_priv->mode == DMA_BLOCK_TRIGGER) {
        if (dma_priv->src_tw == 0 || dma_priv->dst_tw == 0) {
            return;
        }

        if ((length % dma_priv->src_tw != 0) || (length % (dma_priv->dst_tw != 0))) {
            return;
        }
    }

    if ((length * dma_priv->src_tw) % dma_priv->dst_tw != 0) {
        return;
    }

    int32_t ret = wj_dma_set_total_size(addr, length);

    if (ret < 0) {
        return ;
    }

    ret = wj_dma_set_channel(addr, (uint32_t)psrcaddr, (uint32_t)pdstaddr);

    if (ret < 0) {
        return;
    }

    addr->CHCTRLB |= WJ_DMA_INT_EN;

    //global register DMACCFG : the global DMAC enable bit only can be operated in security wolrd.
    //already do in startup.S
    addr->CHEN |= WJ_DMA_CH_EN;

    *((volatile uint32_t *)WJ_V2_DMAC_DMACCFG) = 0x01;

    if (dma_priv->ch_mode == DMA_MODE_SOFTWARE) {
        addr->CHSREQ = WJ_DMA_CH_REQ;
    }

    dma_priv->status = DMA_STATE_BUSY;
}

void csi_dma_stop(int32_t ch)
{
    if (ch >= CONFIG_DMA_CHANNEL_NUM || ch < 0) {
        return;
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch];

    wj_dma_reg_t *addr = (wj_dma_reg_t *)(dma_priv->base + (ch % CONFIG_PER_DMAC_CHANNEL_NUM) * 0x30);
    addr->CHCTRLB &= ~WJ_DMA_INT_EN;      // interrupt disable
    addr->CHEN    &= ~WJ_DMA_CH_EN;

    if (dma_priv->ch_mode == DMA_MODE_SOFTWARE) {
        addr->CHSREQ = 0;
    }

    dma_priv->status = DMA_STATE_DONE;
}

int32_t csi_dma_cyclic_prep(int32_t ch, void *psrcaddr, void *pdstaddr, uint32_t cycle_len, uint32_t cycle_num)
{
    return ERR_DMA(DRV_ERROR_UNSUPPORTED);
}

void csi_dma_cyclic_start(int32_t ch)
{
}

void csi_dma_cyclic_stop(int32_t ch)
{
}

dma_status_e csi_dma_get_status(int32_t ch)
{
    if (ch >= CONFIG_DMA_CHANNEL_NUM || ch < 0) {
        return ERR_DMA(DRV_ERROR_PARAMETER);
    }

    wj_dma_priv_t *dma_priv = &dma_instance[ch];

    uint32_t tmp = *(uint32_t *)WJ_V2_DMAC_CHSR;

    if ((1 << ch) & tmp) {
        if (dma_priv->status != DMA_STATE_BUSY) {
            dma_priv->status = DMA_STATE_BUSY;
        }
    }

    return dma_priv->status;
}
