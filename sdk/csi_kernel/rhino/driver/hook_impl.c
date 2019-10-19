/*
 * Copyright (C) 2016 YunOS Project. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <k_api.h>
#include <drv_timer.h>
#include <csi_config.h>
#include <csi_core.h>
/* auto define heap size */
extern size_t __heap_start;
extern size_t __heap_end;
extern k_mm_region_t   g_mm_region[];

extern void soc_hw_timer_init(void);

#if (RHINO_CONFIG_USER_HOOK > 0)
void krhino_init_hook(void)
{
#if (RHINO_CONFIG_HW_COUNT > 0)
    soc_hw_timer_init();
#endif

    /* auto define heap size */
    g_mm_region[0].len = (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start);
}

__attribute__((weak)) void krhino_start_hook(void)
{

}

__attribute__((weak)) void krhino_task_create_hook(ktask_t *task)
{

}

__attribute__((weak)) void krhino_task_del_hook(ktask_t *task, res_free_t *arg)
{
}

__attribute__((weak)) void krhino_task_abort_hook(ktask_t *task)
{

}

__attribute__((weak)) void krhino_task_switch_hook(ktask_t *orgin, ktask_t *dest)
{

}


__attribute__((weak)) void krhino_tick_hook(void)
{

}

__attribute__((weak)) void krhino_idle_pre_hook(void)
{
    extern void lpm_idle_pre_hook(void);
    lpm_idle_pre_hook();
}

__attribute__((weak)) int32_t _sleep_tick_get()
{
    if (is_klist_empty(&g_tick_head))
    {
        return -1;
    }

    ktask_t * p_tcb  = krhino_list_entry(g_tick_head.next, ktask_t, tick_list);
    return  p_tcb->tick_match > g_tick_count ?  p_tcb->tick_match - g_tick_count : 0;
}

__attribute__((weak)) void krhino_idle_hook(void)
{
    extern void lpm_idle_hook(void);
    lpm_idle_hook();
}

__attribute__((weak)) void krhino_intrpt_hook(int irq)
{

}

__attribute__((weak)) void krhino_mm_alloc_hook(void *mem, size_t size)
{

}

#endif

__attribute__((weak)) void krhino_intrpt_enter_hook(int irq)
{

}

__attribute__((weak)) void krhino_intrpt_exit_hook(int irq)
{

}

#if (RHINO_CONFIG_TASK_SCHED_STATS > 0)
#ifndef CONFIG_CPU_USAGE_BLOCK_TIME
#define CONFIG_CPU_USAGE_BLOCK_TIME      4000
#endif
static lr_timer_t last_time= 0;
void krhino_task_sched_stats_get_hook(lr_timer_t cur_time)
{
    lr_timer_t exec_time  = cur_time - g_active_task[cpu_cur_get()]->task_time_start;

    lr_timer_t compare_times = g_active_task[cpu_cur_get()]->compare_block_times;
    g_active_task[cpu_cur_get()]->task_block_time_run += (sys_time_t)exec_time;

    /* get current time & task start time block times */
    lr_timer_t cur_delta_times = cur_time / CONFIG_CPU_USAGE_BLOCK_TIME;
    lr_timer_t start_delta_times = (g_active_task[cpu_cur_get()]->task_time_start) / CONFIG_CPU_USAGE_BLOCK_TIME;

    /* cross the block */
    if (cur_delta_times > compare_times) {
        /* task start block times equal to task last time block times */
        if (start_delta_times == compare_times) {
            g_active_task[cpu_cur_get()]->task_block_time_run -= (cur_time % CONFIG_CPU_USAGE_BLOCK_TIME);
            if (cur_delta_times - compare_times > 1) {
                g_active_task[cpu_cur_get()]->task_block_time_run_pre = CONFIG_CPU_USAGE_BLOCK_TIME;
            } else {
                g_active_task[cpu_cur_get()]->task_block_time_run_pre = g_active_task[cpu_cur_get()]->task_block_time_run;
            }
            g_active_task[cpu_cur_get()]->task_block_time_run = (cur_time % CONFIG_CPU_USAGE_BLOCK_TIME);
        } else {
            /* current time block times equal to task start time block times */
            if (cur_delta_times == start_delta_times) {
                if (cur_delta_times - compare_times > 1) {
                    g_active_task[cpu_cur_get()]->task_block_time_run_pre = 0;
                } else {
                    g_active_task[cpu_cur_get()]->task_block_time_run_pre = g_active_task[cpu_cur_get()]->task_block_time_run - exec_time;
                }
                g_active_task[cpu_cur_get()]->task_block_time_run = (sys_time_t)exec_time;
            /* current time block times larger than task start time block times */
            } else {
                g_active_task[cpu_cur_get()]->task_block_time_run_pre = (sys_time_t)exec_time - (cur_time % CONFIG_CPU_USAGE_BLOCK_TIME);
                g_active_task[cpu_cur_get()]->task_block_time_run = (cur_time % CONFIG_CPU_USAGE_BLOCK_TIME);
            }
        }
        g_active_task[cpu_cur_get()]->compare_block_times = cur_delta_times;
    }

    last_time = cur_time;
}

float krhino_cpu_usage_get_hook(volatile ktask_t *task)
{
    CPSR_ALLOC();

    RHINO_CRITICAL_ENTER();

    lr_timer_t delta_time = last_time%CONFIG_CPU_USAGE_BLOCK_TIME;
    sys_time_t task_run_time;
    float cpu_usage;

    if (task->compare_block_times < (last_time/CONFIG_CPU_USAGE_BLOCK_TIME)) {
        task->task_block_time_run_pre = task->task_block_time_run;
        task->task_block_time_run = 0;
    }

    if (delta_time > (float)(CONFIG_CPU_USAGE_BLOCK_TIME)/2) {
        task_run_time = 100 * task->task_block_time_run;
        cpu_usage = (float)task_run_time / (float)(delta_time);
    } else {
        task_run_time = 100 * (task->task_block_time_run + task->task_block_time_run_pre);
        cpu_usage = (float)task_run_time / (float)(delta_time+CONFIG_CPU_USAGE_BLOCK_TIME);
    }

    RHINO_CRITICAL_EXIT();
    return cpu_usage;
}
#endif
