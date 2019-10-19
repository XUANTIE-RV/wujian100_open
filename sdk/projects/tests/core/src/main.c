/*
 * Copyright (C) 2017-2019 Alibaba Group Holding Limited
 */


/******************************************************************************
 * @file     main.c
 * @brief    CSI Source File for main
 * @version  V1.0
 * @date     02. June 2017
 ******************************************************************************/
#include <csi_config.h>
#include "dtest.h"
#include <stdint.h>
#include <csi_core.h>

unsigned int *tst_addr = NULL;

extern void test_cache(void);
extern void test_cache_profile(void);
extern void test_capr(void);
extern void test_case1(void);
extern void test_case5(void);
extern void test_case7(void);
extern void test_clz(void);
extern void test_dcache_basic(void);
extern void test_debug(void);
extern void test_epc(void);
extern void test_epsr(void);
extern void test_fpu(void);
extern void test_gcr(void);
extern void test_ldrbt(void);
extern void test_ldrht(void);
extern void test_ldrt(void);
extern void test_vic(void);
extern void test_vic_test(void);
extern void test_pkhbt(void);
extern void test_pkhtb(void);
extern void test_psr(void);
extern void test_qadd16(void);
extern void test_qadd8(void);
extern void test_qadd(void);
extern void test_qasx(void);
extern void test_qsax(void);
extern void test_qsub16(void);
extern void test_qsub8(void);
extern void test_qsub(void);
extern void test_rbit(void);
extern void test_rev16(void);
extern void test_rev(void);
extern void test_revsh(void);
extern void test_ror(void);
extern void test_rrx(void);
extern void test_sadd16(void);
extern void test_sadd8(void);
extern void test_sasx(void);
extern void test_shadd16(void);
extern void test_shadd8(void);
extern void test_shasx(void);
extern void test_shsax(void);
extern void test_shsub16(void);
extern void test_shsub8(void);
extern void test_smlad(void);
extern void test_smladx(void);
extern void test_ssat16(void);
extern void test_ssat(void);
extern void test_ssax(void);
extern void test_ssub16(void);
extern void test_ssub8(void);
extern void test_strbt(void);
extern void test_strht(void);
extern void test_strt(void);
extern void test_sxtab16(void);
extern void test_sxtb16(void);
extern void test_systick(void);
extern void test_uadd16(void);
extern void test_uadd8(void);
extern void test_uasx(void);
extern void test_uhadd16(void);
extern void test_uhadd8(void);
extern void test_uhasx(void);
extern void test_uhsax(void);
extern void test_uhsub16(void);
extern void test_uhsub8(void);
extern void test_uqasx(void);
extern void test_uqsax(void);
extern void test_uqsub16(void);
extern void test_uqsub8(void);
extern void test_usad8(void);
extern void test_usada8(void);
extern void test_usat16(void);
extern void test_usub8(void);
extern void test_usat(void);
extern void test_usax(void);
extern void test_usub16(void);
extern void test_uxtab16(void);
extern void test_uxtb16(void);
extern void test_vbr(void);
extern void test_smlald(void);
extern void test_smlaldx(void);
extern void test_smlsd(void);
extern void test_smlsdx(void);
extern void test_smmla(void);
extern void test_smuad(void);
extern void test_smuadx(void);
extern void test_smusd(void);
extern void test_smusdx(void);
extern void test_uqadd16(void);
extern void test_uqadd8(void);
extern void test_mmu(void);
extern void test_mmu_ck610m(void);
extern void test_mpu(void);


int core_dtest(void)
{
    dtest_suite_info_t test_suite_info = {
        "test_core", NULL, NULL, NULL, NULL
    };

    dtest_suite_t *test_suite = dtest_add_suite(&test_suite_info);

    dtest_case_info_t test_case_info_array[] = {
        { "test_vbr", test_vbr, 1 },
        { "test_psr", test_psr, 1 },
        { "test_epc", test_epc, 1 },
        { "test_epsr", test_epsr, 1 },
        { "test_fpu", test_fpu, 1 },
        { "test_gcr", test_gcr, 1 },
        { "test_debug", test_debug, 1 },
        { "test_case5", test_case5, 1 },
        { "test_case7", test_case7, 1 },
        { "test_smlald", test_smlald, 1 },
        { "test_smlaldx", test_smlaldx, 1 },
        { "test_smlsd", test_smlsd, 1 },
        { "test_smlsdx", test_smlsdx, 1 },
        { "test_smmla", test_smmla, 1 },
        { "test_smusdx", test_smusdx, 1 },
        { "test_smuad", test_smuad, 1 },
        { "test_clz", test_clz, 1 },
        { "test_dcache_basic", test_dcache_basic, 0 },
        { "test_cache", test_cache, 0 },
        { "test_ldrbt", test_ldrbt, 1 },
        { "test_ldrht", test_ldrht, 1 },
        { "test_ldrt", test_ldrt, 1 },
        { "test_pkhbt", test_pkhbt, 1 },
        { "test_pkhtb", test_pkhtb, 1 },
        { "test_qadd16", test_qadd16, 1 },
        { "test_qadd8", test_qadd8, 1 },
        { "test_qadd", test_qadd, 1 },
        { "test_qasx", test_qasx, 1 },
        { "test_qsax", test_qsax, 1 },
        { "test_qsub16", test_qsub16, 1 },
        { "test_qsub8", test_qsub8, 1 },
        { "test_qsub", test_qsub, 1 },
        { "test_rbit", test_rbit, 1 },
        { "test_rev16", test_rev16, 1 },
        { "test_rev", test_rev, 1 },
        { "test_revsh", test_revsh, 1 },
        { "test_ror", test_ror, 1 },
        { "test_rrx", test_rrx, 1 },
        { "test_sadd16", test_sadd16, 1 },
        { "test_sadd8", test_sadd8, 1 },
        { "test_sasx", test_sasx, 1 },
        { "test_shadd16", test_shadd16, 1 },
        { "test_shadd8", test_shadd8, 1 },
        { "test_shasx", test_shasx, 1 },
        { "test_shsax", test_shsax, 1 },
        { "test_shsub16", test_shsub16, 1 },
        { "test_shsub8", test_shsub8, 1 },
        { "test_smlad", test_smlad, 1 },
        { "test_smladx", test_smladx, 1 },
        { "test_ssat16", test_ssat16, 1 },
        { "test_ssat", test_ssat, 1 },
        { "test_ssax", test_ssax, 1 },
        { "test_ssub16", test_ssub16, 1 },
        { "test_ssub8", test_ssub8, 1 },
        { "test_strbt", test_strbt, 1 },
        { "test_strht", test_strht, 1 },
        { "test_strt", test_strt, 1 },
        { "test_sxtab16", test_sxtab16, 1 },
        { "test_sxtb16", test_sxtb16, 1 },
        { "test_uqadd16", test_uqadd16, 1 },
        { "test_uqadd8", test_uqadd8, 1 },
        { "test_uadd16", test_uadd16, 1 },
        { "test_uadd8", test_uadd8, 1 },
        { "test_uasx", test_uasx, 1 },
        { "test_uhadd16", test_uhadd16, 1 },
        { "test_uhadd8", test_uhadd8, 1 },
        { "test_uhasx", test_uhasx, 1 },
        { "test_uhsax", test_uhsax, 1 },
        { "test_uhsub16", test_uhsub16, 1 },
        { "test_uhsub8", test_uhsub8, 1 },
        { "test_uqasx", test_uqasx, 1 },
        { "test_uqsax", test_uqsax, 1 },
        { "test_uqsub16", test_uqsub16, 1 },
        { "test_uqsub8", test_uqsub8, 1 },
        { "test_usad8", test_usad8, 1 },
        { "test_usada8", test_usada8, 1 },
        { "test_usat16", test_usat16, 1 },
        { "test_usub8", test_usub8, 1 },
        { "test_usat", test_usat, 1 },
        { "test_usax", test_usax, 1 },
        { "test_usub16", test_usub16, 1 },
        { "test_uxtb16", test_uxtb16, 1 },

        { "test_mmu", test_mmu, 1},
        { "test_mpu", test_mpu, 1},
        { "test_cache_profile", test_cache_profile, 0 },
        { "test_vic", test_vic, 1 },
        { NULL, NULL }
    };

    dtest_add_cases(test_suite, test_case_info_array);

    return 0;
}

int main(void)
{
    dtest_init();

    core_dtest();

    dtest_run();

    dtest_print_result();

    dtest_cleanup();

    return 0;
}
