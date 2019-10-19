/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module aou_top(
  apb1_gpio_psel_s5,
  apb1_pmu_psel_s15,
  apb1_rtc_psel_s6,
  apb1_xx_paddr,
  apb1_xx_penable,
  apb1_xx_pprot,
  apb1_xx_pwdata,
  apb1_xx_pwrite,
  cpu_pmu_dfs_ack,
  cpu_pmu_sleep_b,
  dft_clk,
  ehs_pmu_clk,
  els_pmu_clk,
  gpio_apb1_prdata,
  gpio_ioctl_porta_dr,
  gpio_wic_intr,
  ioctl_gpio_ext_porta,
  pad_core_clk,
  pad_core_ctim_refclk,
  pad_core_rst_b,
  pad_gpio_ien,
  pad_gpio_oen,
  pad_mcurst_b,
  pmu_apb0_pclk_en,
  pmu_apb0_s3clk,
  pmu_apb0_s3rst_b,
  pmu_apb1_pclk_en,
  pmu_apb1_prdata,
  pmu_apb1_s3clk,
  pmu_apb1_s3rst_b,
  pmu_cpu_dfs_req,
  pmu_dmac0_hclk,
  pmu_dmac0_hrst_b,
  pmu_dmemdummy0_hclk,
  pmu_dmemdummy0_hrst_b,
  pmu_dummy0_hclk,
  pmu_dummy0_hrst_b,
  pmu_dummy0_s3clk,
  pmu_dummy0_s3rst_b,
  pmu_dummy1_hclk,
  pmu_dummy1_hrst_b,
  pmu_dummy1_p0clk,
  pmu_dummy1_p0rst_b,
  pmu_dummy1_p1clk,
  pmu_dummy1_p1rst_b,
  pmu_dummy1_s3clk,
  pmu_dummy1_s3rst_b,
  pmu_dummy2_hclk,
  pmu_dummy2_hrst_b,
  pmu_dummy2_p0clk,
  pmu_dummy2_p0rst_b,
  pmu_dummy2_p1clk,
  pmu_dummy2_p1rst_b,
  pmu_dummy2_s3clk,
  pmu_dummy2_s3rst_b,
  pmu_dummy3_hclk,
  pmu_dummy3_hrst_b,
  pmu_dummy3_p0clk,
  pmu_dummy3_p0rst_b,
  pmu_dummy3_p1clk,
  pmu_dummy3_p1rst_b,
  pmu_dummy3_s3clk,
  pmu_dummy3_s3rst_b,
  pmu_dummy4_p0clk,
  pmu_dummy4_p0rst_b,
  pmu_dummy4_p1clk,
  pmu_dummy4_p1rst_b,
  pmu_dummy5_p0clk,
  pmu_dummy5_p0rst_b,
  pmu_dummy5_p1clk,
  pmu_dummy5_p1rst_b,
  pmu_dummy6_p1clk,
  pmu_dummy6_p1rst_b,
  pmu_dummy7_p0clk,
  pmu_dummy7_p0rst_b,
  pmu_dummy7_p1clk,
  pmu_dummy7_p1rst_b,
  pmu_dummy8_p0clk,
  pmu_dummy8_p0rst_b,
  pmu_dummy8_p1clk,
  pmu_dummy8_p1rst_b,
  pmu_dummy9_p0clk,
  pmu_dummy9_p0rst_b,
  pmu_hmain0_hclk,
  pmu_hmain0_hrst_b,
  pmu_imemdummy0_hclk,
  pmu_imemdummy0_hrst_b,
  pmu_lsbus_hclk,
  pmu_lsbus_hrst_b,
  pmu_mdummy0_hclk,
  pmu_mdummy0_hrst_b,
  pmu_mdummy1_hclk,
  pmu_mdummy1_hrst_b,
  pmu_mdummy2_hclk,
  pmu_mdummy2_hrst_b,
  pmu_pwm_p0clk,
  pmu_pwm_p0rst_b,
  pmu_smc_hclk,
  pmu_smc_hrst_b,
  pmu_sub3_s3clk,
  pmu_sub3_s3rst_b,
  pmu_tim0_p0clk,
  pmu_tim0_p0rst_b,
  pmu_tim1_p1clk,
  pmu_tim1_p1rst_b,
  pmu_tim2_p0clk,
  pmu_tim2_p0rst_b,
  pmu_tim3_p1clk,
  pmu_tim3_p1rst_b,
  pmu_tim4_p0clk,
  pmu_tim4_p0rst_b,
  pmu_tim5_p1clk,
  pmu_tim5_p1rst_b,
  pmu_tim6_p0clk,
  pmu_tim6_p0rst_b,
  pmu_tim7_p1clk,
  pmu_tim7_p1rst_b,
  pmu_usi0_p0clk,
  pmu_usi0_p0rst_b,
  pmu_usi1_p1clk,
  pmu_usi1_p1rst_b,
  pmu_usi2_p0clk,
  pmu_usi2_p0rst_b,
  pmu_wdt_p0clk,
  pmu_wdt_p0rst_b,
  pmu_wic_intr,
  rtc_apb1_prdata,
  rtc_wic_intr,
  test_mode,
  wdt_pmu_rst_b
);
input           apb1_gpio_psel_s5;    
input           apb1_pmu_psel_s15;    
input           apb1_rtc_psel_s6;     
input   [31:0]  apb1_xx_paddr;        
input           apb1_xx_penable;      
input   [2 :0]  apb1_xx_pprot;        
input   [31:0]  apb1_xx_pwdata;       
input           apb1_xx_pwrite;       
input           cpu_pmu_dfs_ack;      
input           cpu_pmu_sleep_b;      
input           ehs_pmu_clk;          
input           els_pmu_clk;          
input   [31:0]  ioctl_gpio_ext_porta; 
input           pad_mcurst_b;         
input           test_mode;            
input           wdt_pmu_rst_b;        
output          dft_clk;              
output  [31:0]  gpio_apb1_prdata;     
output  [31:0]  gpio_ioctl_porta_dr;  
output          gpio_wic_intr;        
output          pad_core_clk;         
output          pad_core_ctim_refclk; 
output          pad_core_rst_b;       
output  [31:0]  pad_gpio_ien;         
output  [31:0]  pad_gpio_oen;         
output          pmu_apb0_pclk_en;     
output          pmu_apb0_s3clk;       
output          pmu_apb0_s3rst_b;     
output          pmu_apb1_pclk_en;     
output  [31:0]  pmu_apb1_prdata;      
output          pmu_apb1_s3clk;       
output          pmu_apb1_s3rst_b;     
output          pmu_cpu_dfs_req;      
output          pmu_dmac0_hclk;       
output          pmu_dmac0_hrst_b;     
output          pmu_dmemdummy0_hclk;  
output          pmu_dmemdummy0_hrst_b; 
output          pmu_dummy0_hclk;      
output          pmu_dummy0_hrst_b;    
output          pmu_dummy0_s3clk;     
output          pmu_dummy0_s3rst_b;   
output          pmu_dummy1_hclk;      
output          pmu_dummy1_hrst_b;    
output          pmu_dummy1_p0clk;     
output          pmu_dummy1_p0rst_b;   
output          pmu_dummy1_p1clk;     
output          pmu_dummy1_p1rst_b;   
output          pmu_dummy1_s3clk;     
output          pmu_dummy1_s3rst_b;   
output          pmu_dummy2_hclk;      
output          pmu_dummy2_hrst_b;    
output          pmu_dummy2_p0clk;     
output          pmu_dummy2_p0rst_b;   
output          pmu_dummy2_p1clk;     
output          pmu_dummy2_p1rst_b;   
output          pmu_dummy2_s3clk;     
output          pmu_dummy2_s3rst_b;   
output          pmu_dummy3_hclk;      
output          pmu_dummy3_hrst_b;    
output          pmu_dummy3_p0clk;     
output          pmu_dummy3_p0rst_b;   
output          pmu_dummy3_p1clk;     
output          pmu_dummy3_p1rst_b;   
output          pmu_dummy3_s3clk;     
output          pmu_dummy3_s3rst_b;   
output          pmu_dummy4_p0clk;     
output          pmu_dummy4_p0rst_b;   
output          pmu_dummy4_p1clk;     
output          pmu_dummy4_p1rst_b;   
output          pmu_dummy5_p0clk;     
output          pmu_dummy5_p0rst_b;   
output          pmu_dummy5_p1clk;     
output          pmu_dummy5_p1rst_b;   
output          pmu_dummy6_p1clk;     
output          pmu_dummy6_p1rst_b;   
output          pmu_dummy7_p0clk;     
output          pmu_dummy7_p0rst_b;   
output          pmu_dummy7_p1clk;     
output          pmu_dummy7_p1rst_b;   
output          pmu_dummy8_p0clk;     
output          pmu_dummy8_p0rst_b;   
output          pmu_dummy8_p1clk;     
output          pmu_dummy8_p1rst_b;   
output          pmu_dummy9_p0clk;     
output          pmu_dummy9_p0rst_b;   
output          pmu_hmain0_hclk;      
output          pmu_hmain0_hrst_b;    
output          pmu_imemdummy0_hclk;  
output          pmu_imemdummy0_hrst_b; 
output          pmu_lsbus_hclk;       
output          pmu_lsbus_hrst_b;     
output          pmu_mdummy0_hclk;     
output          pmu_mdummy0_hrst_b;   
output          pmu_mdummy1_hclk;     
output          pmu_mdummy1_hrst_b;   
output          pmu_mdummy2_hclk;     
output          pmu_mdummy2_hrst_b;   
output          pmu_pwm_p0clk;        
output          pmu_pwm_p0rst_b;      
output          pmu_smc_hclk;         
output          pmu_smc_hrst_b;       
output          pmu_sub3_s3clk;       
output          pmu_sub3_s3rst_b;     
output          pmu_tim0_p0clk;       
output          pmu_tim0_p0rst_b;     
output          pmu_tim1_p1clk;       
output          pmu_tim1_p1rst_b;     
output          pmu_tim2_p0clk;       
output          pmu_tim2_p0rst_b;     
output          pmu_tim3_p1clk;       
output          pmu_tim3_p1rst_b;     
output          pmu_tim4_p0clk;       
output          pmu_tim4_p0rst_b;     
output          pmu_tim5_p1clk;       
output          pmu_tim5_p1rst_b;     
output          pmu_tim6_p0clk;       
output          pmu_tim6_p0rst_b;     
output          pmu_tim7_p1clk;       
output          pmu_tim7_p1rst_b;     
output          pmu_usi0_p0clk;       
output          pmu_usi0_p0rst_b;     
output          pmu_usi1_p1clk;       
output          pmu_usi1_p1rst_b;     
output          pmu_usi2_p0clk;       
output          pmu_usi2_p0rst_b;     
output          pmu_wdt_p0clk;        
output          pmu_wdt_p0rst_b;      
output          pmu_wic_intr;         
output  [31:0]  rtc_apb1_prdata;      
output          rtc_wic_intr;         
wire    [31:0]  apb1_gpio_paddr;      
wire            apb1_gpio_penable;    
wire            apb1_gpio_psel_s5;    
wire    [31:0]  apb1_gpio_pwdata;     
wire            apb1_gpio_pwrite;     
wire    [31:0]  apb1_pmu_paddr;       
wire            apb1_pmu_penable;     
wire            apb1_pmu_psel_s15;    
wire    [31:0]  apb1_pmu_pwdata;      
wire            apb1_pmu_pwrite;      
wire    [31:0]  apb1_rtc_paddr;       
wire            apb1_rtc_penable;     
wire            apb1_rtc_psel_s6;     
wire    [31:0]  apb1_rtc_pwdata;      
wire            apb1_rtc_pwrite;      
wire    [31:0]  apb1_xx_paddr;        
wire            apb1_xx_penable;      
wire    [2 :0]  apb1_xx_pprot;        
wire    [31:0]  apb1_xx_pwdata;       
wire            apb1_xx_pwrite;       
wire            cpu_pmu_dfs_ack;      
wire            cpu_pmu_sleep_b;      
wire            dft_clk;              
wire            ehs_pmu_clk;          
wire            els_pmu_clk;          
wire    [31:0]  gpio0_etb_trig;       
wire    [31:0]  gpio_apb1_prdata;     
wire            gpio_gpio_intrclk_en; 
wire    [31:0]  gpio_ioctl_porta_ddr; 
wire    [31:0]  gpio_ioctl_porta_dr;  
wire            gpio_wic_intr;        
wire    [31:0]  ioctl_gpio_ext_porta; 
wire            pad_core_clk;         
wire            pad_core_ctim_refclk; 
wire            pad_core_rst_b;       
wire    [31:0]  pad_gpio_ien;         
wire    [31:0]  pad_gpio_oen;         
wire            pad_mcurst_b;         
wire            pmu_apb0_pclk_en;     
wire            pmu_apb0_s3clk;       
wire            pmu_apb0_s3rst_b;     
wire            pmu_apb1_pclk_en;     
wire    [31:0]  pmu_apb1_prdata;      
wire            pmu_apb1_s3clk;       
wire            pmu_apb1_s3rst_b;     
wire            pmu_cpu_dfs_req;      
wire            pmu_dmac0_hclk;       
wire            pmu_dmac0_hrst_b;     
wire            pmu_dmemdummy0_hclk;  
wire            pmu_dmemdummy0_hrst_b; 
wire            pmu_dummy0_hclk;      
wire            pmu_dummy0_hrst_b;    
wire            pmu_dummy0_s3clk;     
wire            pmu_dummy0_s3rst_b;   
wire            pmu_dummy1_hclk;      
wire            pmu_dummy1_hrst_b;    
wire            pmu_dummy1_p0clk;     
wire            pmu_dummy1_p0rst_b;   
wire            pmu_dummy1_p1clk;     
wire            pmu_dummy1_p1rst_b;   
wire            pmu_dummy1_s3clk;     
wire            pmu_dummy1_s3rst_b;   
wire            pmu_dummy2_hclk;      
wire            pmu_dummy2_hrst_b;    
wire            pmu_dummy2_p0clk;     
wire            pmu_dummy2_p0rst_b;   
wire            pmu_dummy2_p1clk;     
wire            pmu_dummy2_p1rst_b;   
wire            pmu_dummy2_s3clk;     
wire            pmu_dummy2_s3rst_b;   
wire            pmu_dummy3_hclk;      
wire            pmu_dummy3_hrst_b;    
wire            pmu_dummy3_p0clk;     
wire            pmu_dummy3_p0rst_b;   
wire            pmu_dummy3_p1clk;     
wire            pmu_dummy3_p1rst_b;   
wire            pmu_dummy3_s3clk;     
wire            pmu_dummy3_s3rst_b;   
wire            pmu_dummy4_p0clk;     
wire            pmu_dummy4_p0rst_b;   
wire            pmu_dummy4_p1clk;     
wire            pmu_dummy4_p1rst_b;   
wire            pmu_dummy5_p0clk;     
wire            pmu_dummy5_p0rst_b;   
wire            pmu_dummy5_p1clk;     
wire            pmu_dummy5_p1rst_b;   
wire            pmu_dummy6_p1clk;     
wire            pmu_dummy6_p1rst_b;   
wire            pmu_dummy7_p0clk;     
wire            pmu_dummy7_p0rst_b;   
wire            pmu_dummy7_p1clk;     
wire            pmu_dummy7_p1rst_b;   
wire            pmu_dummy8_p0clk;     
wire            pmu_dummy8_p0rst_b;   
wire            pmu_dummy8_p1clk;     
wire            pmu_dummy8_p1rst_b;   
wire            pmu_dummy9_p0clk;     
wire            pmu_dummy9_p0rst_b;   
wire            pmu_gpio_p1clk;       
wire            pmu_gpio_p1rst_b;     
wire            pmu_hmain0_hclk;      
wire            pmu_hmain0_hrst_b;    
wire            pmu_imemdummy0_hclk;  
wire            pmu_imemdummy0_hrst_b; 
wire            pmu_lsbus_hclk;       
wire            pmu_lsbus_hrst_b;     
wire            pmu_mdummy0_hclk;     
wire            pmu_mdummy0_hrst_b;   
wire            pmu_mdummy1_hclk;     
wire            pmu_mdummy1_hrst_b;   
wire            pmu_mdummy2_hclk;     
wire            pmu_mdummy2_hrst_b;   
wire            pmu_pwm_p0clk;        
wire            pmu_pwm_p0rst_b;      
wire            pmu_rtc_clk;          
wire            pmu_rtc_p1clk;        
wire            pmu_rtc_p1rst_b;      
wire            pmu_smc_hclk;         
wire            pmu_smc_hrst_b;       
wire            pmu_sub3_s3clk;       
wire            pmu_sub3_s3rst_b;     
wire            pmu_tim0_p0clk;       
wire            pmu_tim0_p0rst_b;     
wire            pmu_tim1_p1clk;       
wire            pmu_tim1_p1rst_b;     
wire            pmu_tim2_p0clk;       
wire            pmu_tim2_p0rst_b;     
wire            pmu_tim3_p1clk;       
wire            pmu_tim3_p1rst_b;     
wire            pmu_tim4_p0clk;       
wire            pmu_tim4_p0rst_b;     
wire            pmu_tim5_p1clk;       
wire            pmu_tim5_p1rst_b;     
wire            pmu_tim6_p0clk;       
wire            pmu_tim6_p0rst_b;     
wire            pmu_tim7_p1clk;       
wire            pmu_tim7_p1rst_b;     
wire            pmu_usi0_p0clk;       
wire            pmu_usi0_p0rst_b;     
wire            pmu_usi1_p1clk;       
wire            pmu_usi1_p1rst_b;     
wire            pmu_usi2_p0clk;       
wire            pmu_usi2_p0rst_b;     
wire            pmu_wdt_p0clk;        
wire            pmu_wdt_p0rst_b;      
wire            pmu_wic_intr;         
wire    [31:0]  rtc_apb1_prdata;      
wire            rtc_etb_trig;         
wire            rtc_wic_intr;         
wire            test_mode;            
wire            tipc_gpio0_trust;     
wire            tipc_rtc0_trust;      
wire            wdt_pmu_rst_b;        
pmu_dummy_top  x_pmu_top (
  .cpu_pmu_dfs_ack       (cpu_pmu_dfs_ack      ),
  .cpu_pmu_sleep_b       (cpu_pmu_sleep_b      ),
  .dft_clk               (dft_clk              ),
  .ehs_pmu_clk           (ehs_pmu_clk          ),
  .els_pmu_clk           (els_pmu_clk          ),
  .pad_core_clk          (pad_core_clk         ),
  .pad_core_ctim_refclk  (pad_core_ctim_refclk ),
  .pad_core_rst_b        (pad_core_rst_b       ),
  .pad_mcurst_b          (pad_mcurst_b         ),
  .paddr                 (apb1_pmu_paddr       ),
  .penable               (apb1_pmu_penable     ),
  .pmu_apb0_pclk_en      (pmu_apb0_pclk_en     ),
  .pmu_apb0_s3clk        (pmu_apb0_s3clk       ),
  .pmu_apb0_s3rst_b      (pmu_apb0_s3rst_b     ),
  .pmu_apb1_pclk_en      (pmu_apb1_pclk_en     ),
  .pmu_apb1_s3clk        (pmu_apb1_s3clk       ),
  .pmu_apb1_s3rst_b      (pmu_apb1_s3rst_b     ),
  .pmu_cpu_dfs_req       (pmu_cpu_dfs_req      ),
  .pmu_dmac0_hclk        (pmu_dmac0_hclk       ),
  .pmu_dmac0_hrst_b      (pmu_dmac0_hrst_b     ),
  .pmu_dmemdummy0_hclk   (pmu_dmemdummy0_hclk  ),
  .pmu_dmemdummy0_hrst_b (pmu_dmemdummy0_hrst_b),
  .pmu_dummy0_hclk       (pmu_dummy0_hclk      ),
  .pmu_dummy0_hrst_b     (pmu_dummy0_hrst_b    ),
  .pmu_dummy0_s3clk      (pmu_dummy0_s3clk     ),
  .pmu_dummy0_s3rst_b    (pmu_dummy0_s3rst_b   ),
  .pmu_dummy1_hclk       (pmu_dummy1_hclk      ),
  .pmu_dummy1_hrst_b     (pmu_dummy1_hrst_b    ),
  .pmu_dummy1_p0clk      (pmu_dummy1_p0clk     ),
  .pmu_dummy1_p0rst_b    (pmu_dummy1_p0rst_b   ),
  .pmu_dummy1_p1clk      (pmu_dummy1_p1clk     ),
  .pmu_dummy1_p1rst_b    (pmu_dummy1_p1rst_b   ),
  .pmu_dummy1_s3clk      (pmu_dummy1_s3clk     ),
  .pmu_dummy1_s3rst_b    (pmu_dummy1_s3rst_b   ),
  .pmu_dummy2_hclk       (pmu_dummy2_hclk      ),
  .pmu_dummy2_hrst_b     (pmu_dummy2_hrst_b    ),
  .pmu_dummy2_p0clk      (pmu_dummy2_p0clk     ),
  .pmu_dummy2_p0rst_b    (pmu_dummy2_p0rst_b   ),
  .pmu_dummy2_p1clk      (pmu_dummy2_p1clk     ),
  .pmu_dummy2_p1rst_b    (pmu_dummy2_p1rst_b   ),
  .pmu_dummy2_s3clk      (pmu_dummy2_s3clk     ),
  .pmu_dummy2_s3rst_b    (pmu_dummy2_s3rst_b   ),
  .pmu_dummy3_hclk       (pmu_dummy3_hclk      ),
  .pmu_dummy3_hrst_b     (pmu_dummy3_hrst_b    ),
  .pmu_dummy3_p0clk      (pmu_dummy3_p0clk     ),
  .pmu_dummy3_p0rst_b    (pmu_dummy3_p0rst_b   ),
  .pmu_dummy3_p1clk      (pmu_dummy3_p1clk     ),
  .pmu_dummy3_p1rst_b    (pmu_dummy3_p1rst_b   ),
  .pmu_dummy3_s3clk      (pmu_dummy3_s3clk     ),
  .pmu_dummy3_s3rst_b    (pmu_dummy3_s3rst_b   ),
  .pmu_dummy4_p0clk      (pmu_dummy4_p0clk     ),
  .pmu_dummy4_p0rst_b    (pmu_dummy4_p0rst_b   ),
  .pmu_dummy4_p1clk      (pmu_dummy4_p1clk     ),
  .pmu_dummy4_p1rst_b    (pmu_dummy4_p1rst_b   ),
  .pmu_dummy5_p0clk      (pmu_dummy5_p0clk     ),
  .pmu_dummy5_p0rst_b    (pmu_dummy5_p0rst_b   ),
  .pmu_dummy5_p1clk      (pmu_dummy5_p1clk     ),
  .pmu_dummy5_p1rst_b    (pmu_dummy5_p1rst_b   ),
  .pmu_dummy6_p1clk      (pmu_dummy6_p1clk     ),
  .pmu_dummy6_p1rst_b    (pmu_dummy6_p1rst_b   ),
  .pmu_dummy7_p0clk      (pmu_dummy7_p0clk     ),
  .pmu_dummy7_p0rst_b    (pmu_dummy7_p0rst_b   ),
  .pmu_dummy7_p1clk      (pmu_dummy7_p1clk     ),
  .pmu_dummy7_p1rst_b    (pmu_dummy7_p1rst_b   ),
  .pmu_dummy8_p0clk      (pmu_dummy8_p0clk     ),
  .pmu_dummy8_p0rst_b    (pmu_dummy8_p0rst_b   ),
  .pmu_dummy8_p1clk      (pmu_dummy8_p1clk     ),
  .pmu_dummy8_p1rst_b    (pmu_dummy8_p1rst_b   ),
  .pmu_dummy9_p0clk      (pmu_dummy9_p0clk     ),
  .pmu_dummy9_p0rst_b    (pmu_dummy9_p0rst_b   ),
  .pmu_gpio_p1clk        (pmu_gpio_p1clk       ),
  .pmu_gpio_p1rst_b      (pmu_gpio_p1rst_b     ),
  .pmu_hmain0_hclk       (pmu_hmain0_hclk      ),
  .pmu_hmain0_hrst_b     (pmu_hmain0_hrst_b    ),
  .pmu_imemdummy0_hclk   (pmu_imemdummy0_hclk  ),
  .pmu_imemdummy0_hrst_b (pmu_imemdummy0_hrst_b),
  .pmu_lsbus_hclk        (pmu_lsbus_hclk       ),
  .pmu_lsbus_hrst_b      (pmu_lsbus_hrst_b     ),
  .pmu_mdummy0_hclk      (pmu_mdummy0_hclk     ),
  .pmu_mdummy0_hrst_b    (pmu_mdummy0_hrst_b   ),
  .pmu_mdummy1_hclk      (pmu_mdummy1_hclk     ),
  .pmu_mdummy1_hrst_b    (pmu_mdummy1_hrst_b   ),
  .pmu_mdummy2_hclk      (pmu_mdummy2_hclk     ),
  .pmu_mdummy2_hrst_b    (pmu_mdummy2_hrst_b   ),
  .pmu_pwm_p0clk         (pmu_pwm_p0clk        ),
  .pmu_pwm_p0rst_b       (pmu_pwm_p0rst_b      ),
  .pmu_rtc_clk           (pmu_rtc_clk          ),
  .pmu_rtc_p1clk         (pmu_rtc_p1clk        ),
  .pmu_rtc_p1rst_b       (pmu_rtc_p1rst_b      ),
  .pmu_smc_hclk          (pmu_smc_hclk         ),
  .pmu_smc_hrst_b        (pmu_smc_hrst_b       ),
  .pmu_sub3_s3clk        (pmu_sub3_s3clk       ),
  .pmu_sub3_s3rst_b      (pmu_sub3_s3rst_b     ),
  .pmu_tim0_p0clk        (pmu_tim0_p0clk       ),
  .pmu_tim0_p0rst_b      (pmu_tim0_p0rst_b     ),
  .pmu_tim1_p1clk        (pmu_tim1_p1clk       ),
  .pmu_tim1_p1rst_b      (pmu_tim1_p1rst_b     ),
  .pmu_tim2_p0clk        (pmu_tim2_p0clk       ),
  .pmu_tim2_p0rst_b      (pmu_tim2_p0rst_b     ),
  .pmu_tim3_p1clk        (pmu_tim3_p1clk       ),
  .pmu_tim3_p1rst_b      (pmu_tim3_p1rst_b     ),
  .pmu_tim4_p0clk        (pmu_tim4_p0clk       ),
  .pmu_tim4_p0rst_b      (pmu_tim4_p0rst_b     ),
  .pmu_tim5_p1clk        (pmu_tim5_p1clk       ),
  .pmu_tim5_p1rst_b      (pmu_tim5_p1rst_b     ),
  .pmu_tim6_p0clk        (pmu_tim6_p0clk       ),
  .pmu_tim6_p0rst_b      (pmu_tim6_p0rst_b     ),
  .pmu_tim7_p1clk        (pmu_tim7_p1clk       ),
  .pmu_tim7_p1rst_b      (pmu_tim7_p1rst_b     ),
  .pmu_usi0_p0clk        (pmu_usi0_p0clk       ),
  .pmu_usi0_p0rst_b      (pmu_usi0_p0rst_b     ),
  .pmu_usi1_p1clk        (pmu_usi1_p1clk       ),
  .pmu_usi1_p1rst_b      (pmu_usi1_p1rst_b     ),
  .pmu_usi2_p0clk        (pmu_usi2_p0clk       ),
  .pmu_usi2_p0rst_b      (pmu_usi2_p0rst_b     ),
  .pmu_wdt_p0clk         (pmu_wdt_p0clk        ),
  .pmu_wdt_p0rst_b       (pmu_wdt_p0rst_b      ),
  .pmu_wic_intr          (pmu_wic_intr         ),
  .pprot                 (apb1_xx_pprot        ),
  .prdata                (pmu_apb1_prdata      ),
  .psel                  (apb1_pmu_psel_s15    ),
  .pwdata                (apb1_pmu_pwdata      ),
  .pwrite                (apb1_pmu_pwrite      ),
  .wdt_pmu_rst_b         (wdt_pmu_rst_b        )
);
gpio0_sec_top  x_gpio_sec_top (
  .gpio0_etb_trig       (gpio0_etb_trig      ),
  .gpio_ext_porta       (ioctl_gpio_ext_porta),
  .gpio_intr_flag       (gpio_wic_intr       ),
  .gpio_intrclk_en      (gpio_gpio_intrclk_en),
  .gpio_porta_ddr       (gpio_ioctl_porta_ddr),
  .gpio_porta_dr        (gpio_ioctl_porta_dr ),
  .paddr                (apb1_gpio_paddr     ),
  .pclk                 (pmu_gpio_p1clk      ),
  .pclk_intr            (pmu_gpio_p1clk      ),
  .penable              (apb1_gpio_penable   ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (gpio_apb1_prdata    ),
  .presetn              (pmu_gpio_p1rst_b    ),
  .psel                 (apb1_gpio_psel_s5   ),
  .pwdata               (apb1_gpio_pwdata    ),
  .pwrite               (apb1_gpio_pwrite    ),
  .tipc_gpio0_trust     (tipc_gpio0_trust    )
);
assign pad_gpio_oen[31:0] = ~gpio_ioctl_porta_ddr[31:0];
assign pad_gpio_ien[31:0] = gpio_ioctl_porta_ddr[31:0];
rtc0_sec_top  x_rtc0_sec_top (
  .aortc_paddr        (apb1_rtc_paddr    ),
  .aortc_pclk         (pmu_rtc_p1clk     ),
  .aortc_penable      (apb1_rtc_penable  ),
  .aortc_pprot        (apb1_xx_pprot[2:0]),
  .aortc_prdata       (rtc_apb1_prdata   ),
  .aortc_psel         (apb1_rtc_psel_s6  ),
  .aortc_pwdata       (apb1_rtc_pwdata   ),
  .aortc_pwrite       (apb1_rtc_pwrite   ),
  .aortc_rst_n        (pmu_rtc_p1rst_b   ),
  .etb_rtc_trig       (1'b0              ),
  .i_rtc_ext_clk      (pmu_rtc_clk       ),
  .rtc0_vic_intr      (rtc_wic_intr      ),
  .rtc_etb_trig       (rtc_etb_trig      ),
  .test_mode          (test_mode         ),
  .tipc_rtc0_trust    (tipc_rtc0_trust   )
);
assign tipc_rtc0_trust = 1'b0;
assign tipc_gpio0_trust = 1'b0;
assign apb1_pmu_paddr[31:0]  = apb1_xx_paddr[31:0];
assign apb1_pmu_pwdata[31:0] = apb1_xx_pwdata[31:0];
assign apb1_pmu_penable      = apb1_xx_penable;
assign apb1_pmu_pwrite       = apb1_xx_pwrite;
assign apb1_gpio_paddr[31:0]  = apb1_xx_paddr[31:0];
assign apb1_gpio_pwdata[31:0] = apb1_xx_pwdata[31:0];
assign apb1_gpio_penable      = apb1_xx_penable;
assign apb1_gpio_pwrite       = apb1_xx_pwrite;
assign apb1_rtc_paddr[31:0]  = apb1_xx_paddr[31:0];
assign apb1_rtc_pwdata[31:0] = apb1_xx_pwdata[31:0];
assign apb1_rtc_penable      = apb1_xx_penable;
assign apb1_rtc_pwrite       = apb1_xx_pwrite;
endmodule
