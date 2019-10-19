##
 # Copyright (C) 2017-2019 Alibaba Group Holding Limited
##


ifeq ($(KERNEL), rhino)
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/include
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/rhino/pwrmgmt
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/rhino/common
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/rhino/core/include
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/rhino/arch/include

CSRC += $(ROOTDIR)/csi_kernel/rhino/arch/riscv/cpu_impl.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/arch/riscv/csky_sched.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/arch/riscv/dump_backtrace.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/arch/riscv/port_c.c
SSRC += $(ROOTDIR)/csi_kernel/rhino/arch/riscv/port_s.S

CSRC += $(ROOTDIR)/csi_kernel/rhino/adapter/csi_rhino.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_buf_queue.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_dyn_mem_proc.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_err.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_event.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_idle.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_mm.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_mm_debug.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_mm_blk.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_mutex.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_obj.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_pend.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_queue.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_ringbuf.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_sched.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_sem.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_stats.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_sys.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_task.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_task_sem.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_tick.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_time.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_timer.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/core/k_workqueue.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/driver/hook_impl.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/driver/hook_weak.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/driver/systick.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/driver/yoc_impl.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/common/k_atomic.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/common/k_ffs.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/board/board_cpu_pwr.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/board/board_cpu_pwr_systick.c
CSRC += $(ROOTDIR)/csi_kernel/rhino/board/board_cpu_pwr_timer.c

endif

ifeq ($(KERNEL), freertos)
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/freertosv8.2.3/include/
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/include
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/portable/GCC/riscv
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/portable/GCC/riscv/port.c
SSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/portable/GCC/riscv/cpu_task_sw.S

CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/adapter/csi_freertos.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/croutine.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/event_groups.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/list.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/portable/MemMang/heap_4.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/queue.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/tasks.c
CSRC += $(ROOTDIR)/csi_kernel/freertosv8.2.3/FreeRTOS/Source/timers.c
endif

ifeq ($(KERNEL), ucos3)
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/ucos3/include
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/ucos3/include/riscv
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/ucos3/include/lib
INCLUDEDIRS += -I$(ROOTDIR)/csi_kernel/ucos3/include/ucfsinc

CSRC += $(ROOTDIR)/csi_kernel/ucos3/arch/riscv/cpu_core.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/arch/riscv/os_cpu_c.c
SSRC += $(ROOTDIR)/csi_kernel/ucos3/arch/riscv/os_cpu_a.S

CSRC += $(ROOTDIR)/csi_kernel/ucos3/adapter/csi_ucos.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/drivers/bsp.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/clibmisc.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/lib_ascii.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/lib_math.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/lib_mem.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/lib_print.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/lib/lib_str.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_cfg_app.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_core.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_dbg.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_flag.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_int.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_mem.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_msg.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_mutex.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_pend_multi.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_prio.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_q.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_sem.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_stat.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_task.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_tick.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_time.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_tmr.c
CSRC += $(ROOTDIR)/csi_kernel/ucos3/ucos/os_var.c
endif

ifeq ($(HELIX), y)
INCLUDEDIRS += -I$(ROOTDIR)/projects/benchmark/helix/real
INCLUDEDIRS += -I$(ROOTDIR)/projects/benchmark/helix/testwrap
INCLUDEDIRS += -I$(ROOTDIR)/projects/benchmark/helix/pub
endif

ifeq ($(findstring y,$(SD)$(MMC)),y)
INCLUDEDIRS += -I$(ROOTDIR)/libs/sdmmc/core
INCLUDEDIRS += -I$(ROOTDIR)/libs/sdmmc/host

CSRC += $(ROOTDIR)/libs/sdmmc/core/sdmmc_common.c
CSRC += $(ROOTDIR)/libs/sdmmc/host/sdmmc_event.c
CSRC += $(ROOTDIR)/libs/sdmmc/host/sdmmc_host.c

ifeq ($(SD), y)
CSRC += $(ROOTDIR)/libs/sdmmc/core/sd.c
endif
ifeq ($(MMC), y)
CSRC += $(ROOTDIR)/libs/sdmmc/core/mmc.c
endif
endif

ifeq ($(FATFS), y)
INCLUDEDIRS += -I$(ROOTDIR)/projects/examples/fs/lib/fatfs/src
INCLUDEDIRS += -I$(ROOTDIR)/projects/examples/fs/lib/fatfs/src/sd_disk

CSRC += $(ROOTDIR)/projects/examples/fs/lib/fatfs/src/diskio.c
CSRC += $(ROOTDIR)/projects/examples/fs/lib/fatfs/src/ff.c
CSRC += $(ROOTDIR)/projects/examples/fs/lib/fatfs/src/ffsystem.c
CSRC += $(ROOTDIR)/projects/examples/fs/lib/fatfs/src/ffunicode.c
CSRC += $(ROOTDIR)/projects/examples/fs/lib/fatfs/src/sd_disk/sd_disk.c
endif
