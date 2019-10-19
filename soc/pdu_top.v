/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pdu_top(
  apb0_dummy1_intr,
  apb0_dummy2_intr,
  apb0_dummy3_intr,
  apb0_dummy4_intr,
  apb0_dummy5_intr,
  apb0_dummy7_intr,
  apb0_dummy8_intr,
  apb0_dummy9_intr,
  apb1_dummy1_intr,
  apb1_dummy2_intr,
  apb1_dummy3_intr,
  apb1_dummy4_intr,
  apb1_dummy5_intr,
  apb1_dummy6_intr,
  apb1_dummy7_intr,
  apb1_dummy8_intr,
  apb1_gpio_psel_s5,
  apb1_pmu_psel_s15,
  apb1_rtc_psel_s6,
  apb1_xx_paddr,
  apb1_xx_penable,
  apb1_xx_pprot,
  apb1_xx_pwdata,
  apb1_xx_pwrite,
  cpu_hmain0_m0_haddr,
  cpu_hmain0_m0_hburst,
  cpu_hmain0_m0_hprot,
  cpu_hmain0_m0_hsize,
  cpu_hmain0_m0_htrans,
  cpu_hmain0_m0_hwdata,
  cpu_hmain0_m0_hwrite,
  cpu_hmain0_m1_haddr,
  cpu_hmain0_m1_hburst,
  cpu_hmain0_m1_hprot,
  cpu_hmain0_m1_hsize,
  cpu_hmain0_m1_htrans,
  cpu_hmain0_m1_hwdata,
  cpu_hmain0_m1_hwrite,
  cpu_hmain0_m2_haddr,
  cpu_hmain0_m2_hburst,
  cpu_hmain0_m2_hprot,
  cpu_hmain0_m2_hsize,
  cpu_hmain0_m2_htrans,
  cpu_hmain0_m2_hwdata,
  cpu_hmain0_m2_hwrite,
  dmac0_wic_intr,
  gpio_apb1_prdata,
  hmain0_cpu_m0_hrdata,
  hmain0_cpu_m0_hready,
  hmain0_cpu_m0_hresp,
  hmain0_cpu_m1_hrdata,
  hmain0_cpu_m1_hready,
  hmain0_cpu_m1_hresp,
  hmain0_cpu_m2_hrdata,
  hmain0_cpu_m2_hready,
  hmain0_cpu_m2_hresp,
  hmain0_ismc_s0_haddr,
  hmain0_ismc_s0_hprot,
  hmain0_ismc_s0_hsel,
  hmain0_ismc_s0_hsize,
  hmain0_ismc_s0_htrans,
  hmain0_ismc_s0_hwdata,
  hmain0_ismc_s0_hwrite,
  hmain0_smc_s2_haddr,
  hmain0_smc_s2_hprot,
  hmain0_smc_s2_hsel,
  hmain0_smc_s2_hsize,
  hmain0_smc_s2_htrans,
  hmain0_smc_s2_hwdata,
  hmain0_smc_s2_hwrite,
  hmain0_smc_s3_haddr,
  hmain0_smc_s3_hprot,
  hmain0_smc_s3_hsel,
  hmain0_smc_s3_hsize,
  hmain0_smc_s3_htrans,
  hmain0_smc_s3_hwdata,
  hmain0_smc_s3_hwrite,
  hmain0_smc_s4_haddr,
  hmain0_smc_s4_hprot,
  hmain0_smc_s4_hsel,
  hmain0_smc_s4_hsize,
  hmain0_smc_s4_htrans,
  hmain0_smc_s4_hwdata,
  hmain0_smc_s4_hwrite,
  ioctl_pwm_cap0,
  ioctl_pwm_cap10,
  ioctl_pwm_cap2,
  ioctl_pwm_cap4,
  ioctl_pwm_cap6,
  ioctl_pwm_cap8,
  ioctl_pwm_fault,
  ioctl_usi0_nss_in,
  ioctl_usi0_sclk_in,
  ioctl_usi0_sd0_in,
  ioctl_usi0_sd1_in,
  ioctl_usi1_nss_in,
  ioctl_usi1_sclk_in,
  ioctl_usi1_sd0_in,
  ioctl_usi1_sd1_in,
  ioctl_usi2_nss_in,
  ioctl_usi2_sclk_in,
  ioctl_usi2_sd0_in,
  ioctl_usi2_sd1_in,
  ismc_hmain0_s0_hrdata,
  ismc_hmain0_s0_hready,
  ismc_hmain0_s0_hresp,
  lsbus_dummy0_intr,
  lsbus_dummy1_intr,
  lsbus_dummy2_intr,
  lsbus_dummy3_intr,
  main_dmemdummy0_intr,
  main_dummy0_intr,
  main_dummy1_intr,
  main_dummy2_intr,
  main_dummy3_intr,
  main_imemdummy0_intr,
  pmu_apb0_pclk_en,
  pmu_apb0_s3clk,
  pmu_apb0_s3rst_b,
  pmu_apb1_pclk_en,
  pmu_apb1_prdata,
  pmu_apb1_s3clk,
  pmu_apb1_s3rst_b,
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
  pwm_ioctl_ch0,
  pwm_ioctl_ch0_oe_n,
  pwm_ioctl_ch1,
  pwm_ioctl_ch10,
  pwm_ioctl_ch10_oe_n,
  pwm_ioctl_ch11,
  pwm_ioctl_ch11_oe_n,
  pwm_ioctl_ch1_oe_n,
  pwm_ioctl_ch2,
  pwm_ioctl_ch2_oe_n,
  pwm_ioctl_ch3,
  pwm_ioctl_ch3_oe_n,
  pwm_ioctl_ch4,
  pwm_ioctl_ch4_oe_n,
  pwm_ioctl_ch5,
  pwm_ioctl_ch5_oe_n,
  pwm_ioctl_ch6,
  pwm_ioctl_ch6_oe_n,
  pwm_ioctl_ch7,
  pwm_ioctl_ch7_oe_n,
  pwm_ioctl_ch8,
  pwm_ioctl_ch8_oe_n,
  pwm_ioctl_ch9,
  pwm_ioctl_ch9_oe_n,
  pwm_wic_intr,
  rtc_apb1_prdata,
  scan_mode,
  smc_hmain0_s2_hrdata,
  smc_hmain0_s2_hready,
  smc_hmain0_s2_hresp,
  smc_hmain0_s3_hrdata,
  smc_hmain0_s3_hready,
  smc_hmain0_s3_hresp,
  smc_hmain0_s4_hrdata,
  smc_hmain0_s4_hready,
  smc_hmain0_s4_hresp,
  test_mode,
  tim0_wic_intr,
  tim1_wic_intr,
  tim2_wic_intr,
  tim3_wic_intr,
  tim4_wic_intr,
  tim5_wic_intr,
  tim6_wic_intr,
  tim7_wic_intr,
  usi0_ioctl_nss_ie_n,
  usi0_ioctl_nss_oe_n,
  usi0_ioctl_nss_out,
  usi0_ioctl_sclk_ie_n,
  usi0_ioctl_sclk_oe_n,
  usi0_ioctl_sclk_out,
  usi0_ioctl_sd0_ie_n,
  usi0_ioctl_sd0_oe_n,
  usi0_ioctl_sd0_out,
  usi0_ioctl_sd1_ie_n,
  usi0_ioctl_sd1_oe_n,
  usi0_ioctl_sd1_out,
  usi0_wic_intr,
  usi1_ioctl_nss_ie_n,
  usi1_ioctl_nss_oe_n,
  usi1_ioctl_nss_out,
  usi1_ioctl_sclk_ie_n,
  usi1_ioctl_sclk_oe_n,
  usi1_ioctl_sclk_out,
  usi1_ioctl_sd0_ie_n,
  usi1_ioctl_sd0_oe_n,
  usi1_ioctl_sd0_out,
  usi1_ioctl_sd1_ie_n,
  usi1_ioctl_sd1_oe_n,
  usi1_ioctl_sd1_out,
  usi1_wic_intr,
  usi2_ioctl_nss_ie_n,
  usi2_ioctl_nss_oe_n,
  usi2_ioctl_nss_out,
  usi2_ioctl_sclk_ie_n,
  usi2_ioctl_sclk_oe_n,
  usi2_ioctl_sclk_out,
  usi2_ioctl_sd0_ie_n,
  usi2_ioctl_sd0_oe_n,
  usi2_ioctl_sd0_out,
  usi2_ioctl_sd1_ie_n,
  usi2_ioctl_sd1_oe_n,
  usi2_ioctl_sd1_out,
  usi2_wic_intr,
  wdt_pmu_rst_b,
  wdt_wic_intr
);
input   [31:0]  cpu_hmain0_m0_haddr;    
input   [2 :0]  cpu_hmain0_m0_hburst;   
input   [3 :0]  cpu_hmain0_m0_hprot;    
input   [2 :0]  cpu_hmain0_m0_hsize;    
input   [1 :0]  cpu_hmain0_m0_htrans;   
input   [31:0]  cpu_hmain0_m0_hwdata;   
input           cpu_hmain0_m0_hwrite;   
input   [31:0]  cpu_hmain0_m1_haddr;    
input   [2 :0]  cpu_hmain0_m1_hburst;   
input   [3 :0]  cpu_hmain0_m1_hprot;    
input   [2 :0]  cpu_hmain0_m1_hsize;    
input   [1 :0]  cpu_hmain0_m1_htrans;   
input   [31:0]  cpu_hmain0_m1_hwdata;   
input           cpu_hmain0_m1_hwrite;   
input   [31:0]  cpu_hmain0_m2_haddr;    
input   [2 :0]  cpu_hmain0_m2_hburst;   
input   [3 :0]  cpu_hmain0_m2_hprot;    
input   [2 :0]  cpu_hmain0_m2_hsize;    
input   [1 :0]  cpu_hmain0_m2_htrans;   
input   [31:0]  cpu_hmain0_m2_hwdata;   
input           cpu_hmain0_m2_hwrite;   
input   [31:0]  gpio_apb1_prdata;       
input           ioctl_pwm_cap0;         
input           ioctl_pwm_cap10;        
input           ioctl_pwm_cap2;         
input           ioctl_pwm_cap4;         
input           ioctl_pwm_cap6;         
input           ioctl_pwm_cap8;         
input           ioctl_pwm_fault;        
input           ioctl_usi0_nss_in;      
input           ioctl_usi0_sclk_in;     
input           ioctl_usi0_sd0_in;      
input           ioctl_usi0_sd1_in;      
input           ioctl_usi1_nss_in;      
input           ioctl_usi1_sclk_in;     
input           ioctl_usi1_sd0_in;      
input           ioctl_usi1_sd1_in;      
input           ioctl_usi2_nss_in;      
input           ioctl_usi2_sclk_in;     
input           ioctl_usi2_sd0_in;      
input           ioctl_usi2_sd1_in;      
input   [31:0]  ismc_hmain0_s0_hrdata;  
input           ismc_hmain0_s0_hready;  
input   [1 :0]  ismc_hmain0_s0_hresp;   
input           pmu_apb0_pclk_en;       
input           pmu_apb0_s3clk;         
input           pmu_apb0_s3rst_b;       
input           pmu_apb1_pclk_en;       
input   [31:0]  pmu_apb1_prdata;        
input           pmu_apb1_s3clk;         
input           pmu_apb1_s3rst_b;       
input           pmu_dmac0_hclk;         
input           pmu_dmac0_hrst_b;       
input           pmu_dmemdummy0_hclk;    
input           pmu_dmemdummy0_hrst_b;  
input           pmu_dummy0_hclk;        
input           pmu_dummy0_hrst_b;      
input           pmu_dummy0_s3clk;       
input           pmu_dummy0_s3rst_b;     
input           pmu_dummy1_hclk;        
input           pmu_dummy1_hrst_b;      
input           pmu_dummy1_p0clk;       
input           pmu_dummy1_p0rst_b;     
input           pmu_dummy1_p1clk;       
input           pmu_dummy1_p1rst_b;     
input           pmu_dummy1_s3clk;       
input           pmu_dummy1_s3rst_b;     
input           pmu_dummy2_hclk;        
input           pmu_dummy2_hrst_b;      
input           pmu_dummy2_p0clk;       
input           pmu_dummy2_p0rst_b;     
input           pmu_dummy2_p1clk;       
input           pmu_dummy2_p1rst_b;     
input           pmu_dummy2_s3clk;       
input           pmu_dummy2_s3rst_b;     
input           pmu_dummy3_hclk;        
input           pmu_dummy3_hrst_b;      
input           pmu_dummy3_p0clk;       
input           pmu_dummy3_p0rst_b;     
input           pmu_dummy3_p1clk;       
input           pmu_dummy3_p1rst_b;     
input           pmu_dummy3_s3clk;       
input           pmu_dummy3_s3rst_b;     
input           pmu_dummy4_p0clk;       
input           pmu_dummy4_p0rst_b;     
input           pmu_dummy4_p1clk;       
input           pmu_dummy4_p1rst_b;     
input           pmu_dummy5_p0clk;       
input           pmu_dummy5_p0rst_b;     
input           pmu_dummy5_p1clk;       
input           pmu_dummy5_p1rst_b;     
input           pmu_dummy6_p1clk;       
input           pmu_dummy6_p1rst_b;     
input           pmu_dummy7_p0clk;       
input           pmu_dummy7_p0rst_b;     
input           pmu_dummy7_p1clk;       
input           pmu_dummy7_p1rst_b;     
input           pmu_dummy8_p0clk;       
input           pmu_dummy8_p0rst_b;     
input           pmu_dummy8_p1clk;       
input           pmu_dummy8_p1rst_b;     
input           pmu_dummy9_p0clk;       
input           pmu_dummy9_p0rst_b;     
input           pmu_hmain0_hclk;        
input           pmu_hmain0_hrst_b;      
input           pmu_imemdummy0_hclk;    
input           pmu_imemdummy0_hrst_b;  
input           pmu_lsbus_hclk;         
input           pmu_lsbus_hrst_b;       
input           pmu_mdummy0_hclk;       
input           pmu_mdummy0_hrst_b;     
input           pmu_mdummy1_hclk;       
input           pmu_mdummy1_hrst_b;     
input           pmu_mdummy2_hclk;       
input           pmu_mdummy2_hrst_b;     
input           pmu_pwm_p0clk;          
input           pmu_pwm_p0rst_b;        
input           pmu_sub3_s3clk;         
input           pmu_sub3_s3rst_b;       
input           pmu_tim0_p0clk;         
input           pmu_tim0_p0rst_b;       
input           pmu_tim1_p1clk;         
input           pmu_tim1_p1rst_b;       
input           pmu_tim2_p0clk;         
input           pmu_tim2_p0rst_b;       
input           pmu_tim3_p1clk;         
input           pmu_tim3_p1rst_b;       
input           pmu_tim4_p0clk;         
input           pmu_tim4_p0rst_b;       
input           pmu_tim5_p1clk;         
input           pmu_tim5_p1rst_b;       
input           pmu_tim6_p0clk;         
input           pmu_tim6_p0rst_b;       
input           pmu_tim7_p1clk;         
input           pmu_tim7_p1rst_b;       
input           pmu_usi0_p0clk;         
input           pmu_usi0_p0rst_b;       
input           pmu_usi1_p1clk;         
input           pmu_usi1_p1rst_b;       
input           pmu_usi2_p0clk;         
input           pmu_usi2_p0rst_b;       
input           pmu_wdt_p0clk;          
input           pmu_wdt_p0rst_b;        
input   [31:0]  rtc_apb1_prdata;        
input           scan_mode;              
input   [31:0]  smc_hmain0_s2_hrdata;   
input           smc_hmain0_s2_hready;   
input   [1 :0]  smc_hmain0_s2_hresp;    
input   [31:0]  smc_hmain0_s3_hrdata;   
input           smc_hmain0_s3_hready;   
input   [1 :0]  smc_hmain0_s3_hresp;    
input   [31:0]  smc_hmain0_s4_hrdata;   
input           smc_hmain0_s4_hready;   
input   [1 :0]  smc_hmain0_s4_hresp;    
input           test_mode;              
output          apb0_dummy1_intr;       
output          apb0_dummy2_intr;       
output          apb0_dummy3_intr;       
output          apb0_dummy4_intr;       
output          apb0_dummy5_intr;       
output          apb0_dummy7_intr;       
output          apb0_dummy8_intr;       
output          apb0_dummy9_intr;       
output          apb1_dummy1_intr;       
output          apb1_dummy2_intr;       
output          apb1_dummy3_intr;       
output          apb1_dummy4_intr;       
output          apb1_dummy5_intr;       
output          apb1_dummy6_intr;       
output          apb1_dummy7_intr;       
output          apb1_dummy8_intr;       
output          apb1_gpio_psel_s5;      
output          apb1_pmu_psel_s15;      
output          apb1_rtc_psel_s6;       
output  [31:0]  apb1_xx_paddr;          
output          apb1_xx_penable;        
output  [2 :0]  apb1_xx_pprot;          
output  [31:0]  apb1_xx_pwdata;         
output          apb1_xx_pwrite;         
output          dmac0_wic_intr;         
output  [31:0]  hmain0_cpu_m0_hrdata;   
output          hmain0_cpu_m0_hready;   
output  [1 :0]  hmain0_cpu_m0_hresp;    
output  [31:0]  hmain0_cpu_m1_hrdata;   
output          hmain0_cpu_m1_hready;   
output  [1 :0]  hmain0_cpu_m1_hresp;    
output  [31:0]  hmain0_cpu_m2_hrdata;   
output          hmain0_cpu_m2_hready;   
output  [1 :0]  hmain0_cpu_m2_hresp;    
output  [31:0]  hmain0_ismc_s0_haddr;   
output  [3 :0]  hmain0_ismc_s0_hprot;   
output          hmain0_ismc_s0_hsel;    
output  [2 :0]  hmain0_ismc_s0_hsize;   
output  [1 :0]  hmain0_ismc_s0_htrans;  
output  [31:0]  hmain0_ismc_s0_hwdata;  
output          hmain0_ismc_s0_hwrite;  
output  [31:0]  hmain0_smc_s2_haddr;    
output  [3 :0]  hmain0_smc_s2_hprot;    
output          hmain0_smc_s2_hsel;     
output  [2 :0]  hmain0_smc_s2_hsize;    
output  [1 :0]  hmain0_smc_s2_htrans;   
output  [31:0]  hmain0_smc_s2_hwdata;   
output          hmain0_smc_s2_hwrite;   
output  [31:0]  hmain0_smc_s3_haddr;    
output  [3 :0]  hmain0_smc_s3_hprot;    
output          hmain0_smc_s3_hsel;     
output  [2 :0]  hmain0_smc_s3_hsize;    
output  [1 :0]  hmain0_smc_s3_htrans;   
output  [31:0]  hmain0_smc_s3_hwdata;   
output          hmain0_smc_s3_hwrite;   
output  [31:0]  hmain0_smc_s4_haddr;    
output  [3 :0]  hmain0_smc_s4_hprot;    
output          hmain0_smc_s4_hsel;     
output  [2 :0]  hmain0_smc_s4_hsize;    
output  [1 :0]  hmain0_smc_s4_htrans;   
output  [31:0]  hmain0_smc_s4_hwdata;   
output          hmain0_smc_s4_hwrite;   
output          lsbus_dummy0_intr;      
output          lsbus_dummy1_intr;      
output          lsbus_dummy2_intr;      
output          lsbus_dummy3_intr;      
output          main_dmemdummy0_intr;   
output          main_dummy0_intr;       
output          main_dummy1_intr;       
output          main_dummy2_intr;       
output          main_dummy3_intr;       
output          main_imemdummy0_intr;   
output          pwm_ioctl_ch0;          
output          pwm_ioctl_ch0_oe_n;     
output          pwm_ioctl_ch1;          
output          pwm_ioctl_ch10;         
output          pwm_ioctl_ch10_oe_n;    
output          pwm_ioctl_ch11;         
output          pwm_ioctl_ch11_oe_n;    
output          pwm_ioctl_ch1_oe_n;     
output          pwm_ioctl_ch2;          
output          pwm_ioctl_ch2_oe_n;     
output          pwm_ioctl_ch3;          
output          pwm_ioctl_ch3_oe_n;     
output          pwm_ioctl_ch4;          
output          pwm_ioctl_ch4_oe_n;     
output          pwm_ioctl_ch5;          
output          pwm_ioctl_ch5_oe_n;     
output          pwm_ioctl_ch6;          
output          pwm_ioctl_ch6_oe_n;     
output          pwm_ioctl_ch7;          
output          pwm_ioctl_ch7_oe_n;     
output          pwm_ioctl_ch8;          
output          pwm_ioctl_ch8_oe_n;     
output          pwm_ioctl_ch9;          
output          pwm_ioctl_ch9_oe_n;     
output          pwm_wic_intr;           
output  [1 :0]  tim0_wic_intr;          
output  [1 :0]  tim1_wic_intr;          
output  [1 :0]  tim2_wic_intr;          
output  [1 :0]  tim3_wic_intr;          
output  [1 :0]  tim4_wic_intr;          
output  [1 :0]  tim5_wic_intr;          
output  [1 :0]  tim6_wic_intr;          
output  [1 :0]  tim7_wic_intr;          
output          usi0_ioctl_nss_ie_n;    
output          usi0_ioctl_nss_oe_n;    
output          usi0_ioctl_nss_out;     
output          usi0_ioctl_sclk_ie_n;   
output          usi0_ioctl_sclk_oe_n;   
output          usi0_ioctl_sclk_out;    
output          usi0_ioctl_sd0_ie_n;    
output          usi0_ioctl_sd0_oe_n;    
output          usi0_ioctl_sd0_out;     
output          usi0_ioctl_sd1_ie_n;    
output          usi0_ioctl_sd1_oe_n;    
output          usi0_ioctl_sd1_out;     
output          usi0_wic_intr;          
output          usi1_ioctl_nss_ie_n;    
output          usi1_ioctl_nss_oe_n;    
output          usi1_ioctl_nss_out;     
output          usi1_ioctl_sclk_ie_n;   
output          usi1_ioctl_sclk_oe_n;   
output          usi1_ioctl_sclk_out;    
output          usi1_ioctl_sd0_ie_n;    
output          usi1_ioctl_sd0_oe_n;    
output          usi1_ioctl_sd0_out;     
output          usi1_ioctl_sd1_ie_n;    
output          usi1_ioctl_sd1_oe_n;    
output          usi1_ioctl_sd1_out;     
output          usi1_wic_intr;          
output          usi2_ioctl_nss_ie_n;    
output          usi2_ioctl_nss_oe_n;    
output          usi2_ioctl_nss_out;     
output          usi2_ioctl_sclk_ie_n;   
output          usi2_ioctl_sclk_oe_n;   
output          usi2_ioctl_sclk_out;    
output          usi2_ioctl_sd0_ie_n;    
output          usi2_ioctl_sd0_oe_n;    
output          usi2_ioctl_sd0_out;     
output          usi2_ioctl_sd1_ie_n;    
output          usi2_ioctl_sd1_oe_n;    
output          usi2_ioctl_sd1_out;     
output          usi2_wic_intr;          
output          wdt_pmu_rst_b;          
output          wdt_wic_intr;           
wire            apb0_dummy1_intr;       
wire            apb0_dummy2_intr;       
wire            apb0_dummy3_intr;       
wire            apb0_dummy4_intr;       
wire            apb0_dummy5_intr;       
wire            apb0_dummy7_intr;       
wire            apb0_dummy8_intr;       
wire            apb0_dummy9_intr;       
wire    [31:0]  apb0_lsbus_s2_hrdata;   
wire            apb0_lsbus_s2_hready;   
wire    [1 :0]  apb0_lsbus_s2_hresp;    
wire            apb1_dummy1_intr;       
wire            apb1_dummy2_intr;       
wire            apb1_dummy3_intr;       
wire            apb1_dummy4_intr;       
wire            apb1_dummy5_intr;       
wire            apb1_dummy6_intr;       
wire            apb1_dummy7_intr;       
wire            apb1_dummy8_intr;       
wire            apb1_gpio_psel_s5;      
wire    [31:0]  apb1_lsbus_s3_hrdata;   
wire            apb1_lsbus_s3_hready;   
wire    [1 :0]  apb1_lsbus_s3_hresp;    
wire            apb1_pmu_psel_s15;      
wire            apb1_rtc_psel_s6;       
wire    [31:0]  apb1_xx_paddr;          
wire            apb1_xx_penable;        
wire    [2 :0]  apb1_xx_pprot;          
wire    [31:0]  apb1_xx_pwdata;         
wire            apb1_xx_pwrite;         
wire    [31:0]  cpu_hmain0_m0_haddr;    
wire    [2 :0]  cpu_hmain0_m0_hburst;   
wire    [3 :0]  cpu_hmain0_m0_hprot;    
wire    [2 :0]  cpu_hmain0_m0_hsize;    
wire    [1 :0]  cpu_hmain0_m0_htrans;   
wire    [31:0]  cpu_hmain0_m0_hwdata;   
wire            cpu_hmain0_m0_hwrite;   
wire    [31:0]  cpu_hmain0_m1_haddr;    
wire    [2 :0]  cpu_hmain0_m1_hburst;   
wire    [3 :0]  cpu_hmain0_m1_hprot;    
wire    [2 :0]  cpu_hmain0_m1_hsize;    
wire    [1 :0]  cpu_hmain0_m1_htrans;   
wire    [31:0]  cpu_hmain0_m1_hwdata;   
wire            cpu_hmain0_m1_hwrite;   
wire    [31:0]  cpu_hmain0_m2_haddr;    
wire    [2 :0]  cpu_hmain0_m2_hburst;   
wire    [3 :0]  cpu_hmain0_m2_hprot;    
wire    [2 :0]  cpu_hmain0_m2_hsize;    
wire    [1 :0]  cpu_hmain0_m2_htrans;   
wire    [31:0]  cpu_hmain0_m2_hwdata;   
wire            cpu_hmain0_m2_hwrite;   
wire            dmac0_wic_intr;         
wire    [31:0]  gpio_apb1_prdata;       
wire    [31:0]  hmain0_cpu_m0_hrdata;   
wire            hmain0_cpu_m0_hready;   
wire    [1 :0]  hmain0_cpu_m0_hresp;    
wire    [31:0]  hmain0_cpu_m1_hrdata;   
wire            hmain0_cpu_m1_hready;   
wire    [1 :0]  hmain0_cpu_m1_hresp;    
wire    [31:0]  hmain0_cpu_m2_hrdata;   
wire            hmain0_cpu_m2_hready;   
wire    [1 :0]  hmain0_cpu_m2_hresp;    
wire    [31:0]  hmain0_ismc_s0_haddr;   
wire    [3 :0]  hmain0_ismc_s0_hprot;   
wire            hmain0_ismc_s0_hsel;    
wire    [2 :0]  hmain0_ismc_s0_hsize;   
wire    [1 :0]  hmain0_ismc_s0_htrans;  
wire    [31:0]  hmain0_ismc_s0_hwdata;  
wire            hmain0_ismc_s0_hwrite;  
wire    [31:0]  hmain0_lsbus_s10_haddr; 
wire    [2 :0]  hmain0_lsbus_s10_hburst; 
wire    [3 :0]  hmain0_lsbus_s10_hprot; 
wire            hmain0_lsbus_s10_hsel;  
wire    [2 :0]  hmain0_lsbus_s10_hsize; 
wire    [1 :0]  hmain0_lsbus_s10_htrans; 
wire    [31:0]  hmain0_lsbus_s10_hwdata; 
wire            hmain0_lsbus_s10_hwrite; 
wire    [31:0]  hmain0_smc_s2_haddr;    
wire    [3 :0]  hmain0_smc_s2_hprot;    
wire            hmain0_smc_s2_hsel;     
wire    [2 :0]  hmain0_smc_s2_hsize;    
wire    [1 :0]  hmain0_smc_s2_htrans;   
wire    [31:0]  hmain0_smc_s2_hwdata;   
wire            hmain0_smc_s2_hwrite;   
wire    [31:0]  hmain0_smc_s3_haddr;    
wire    [3 :0]  hmain0_smc_s3_hprot;    
wire            hmain0_smc_s3_hsel;     
wire    [2 :0]  hmain0_smc_s3_hsize;    
wire    [1 :0]  hmain0_smc_s3_htrans;   
wire    [31:0]  hmain0_smc_s3_hwdata;   
wire            hmain0_smc_s3_hwrite;   
wire    [31:0]  hmain0_smc_s4_haddr;    
wire    [3 :0]  hmain0_smc_s4_hprot;    
wire            hmain0_smc_s4_hsel;     
wire    [2 :0]  hmain0_smc_s4_hsize;    
wire    [1 :0]  hmain0_smc_s4_htrans;   
wire    [31:0]  hmain0_smc_s4_hwdata;   
wire            hmain0_smc_s4_hwrite;   
wire            ioctl_pwm_cap0;         
wire            ioctl_pwm_cap10;        
wire            ioctl_pwm_cap2;         
wire            ioctl_pwm_cap4;         
wire            ioctl_pwm_cap6;         
wire            ioctl_pwm_cap8;         
wire            ioctl_pwm_fault;        
wire            ioctl_usi0_nss_in;      
wire            ioctl_usi0_sclk_in;     
wire            ioctl_usi0_sd0_in;      
wire            ioctl_usi0_sd1_in;      
wire            ioctl_usi1_nss_in;      
wire            ioctl_usi1_sclk_in;     
wire            ioctl_usi1_sd0_in;      
wire            ioctl_usi1_sd1_in;      
wire            ioctl_usi2_nss_in;      
wire            ioctl_usi2_sclk_in;     
wire            ioctl_usi2_sd0_in;      
wire            ioctl_usi2_sd1_in;      
wire    [31:0]  ismc_hmain0_s0_hrdata;  
wire            ismc_hmain0_s0_hready;  
wire    [1 :0]  ismc_hmain0_s0_hresp;   
wire    [31:0]  lsbus_apb0_s2_haddr;    
wire    [2 :0]  lsbus_apb0_s2_hburst;   
wire    [3 :0]  lsbus_apb0_s2_hprot;    
wire            lsbus_apb0_s2_hsel;     
wire    [2 :0]  lsbus_apb0_s2_hsize;    
wire    [1 :0]  lsbus_apb0_s2_htrans;   
wire    [31:0]  lsbus_apb0_s2_hwdata;   
wire            lsbus_apb0_s2_hwrite;   
wire    [31:0]  lsbus_apb1_s3_haddr;    
wire    [2 :0]  lsbus_apb1_s3_hburst;   
wire    [3 :0]  lsbus_apb1_s3_hprot;    
wire            lsbus_apb1_s3_hsel;     
wire    [2 :0]  lsbus_apb1_s3_hsize;    
wire    [1 :0]  lsbus_apb1_s3_htrans;   
wire    [31:0]  lsbus_apb1_s3_hwdata;   
wire            lsbus_apb1_s3_hwrite;   
wire            lsbus_dummy0_intr;      
wire            lsbus_dummy1_intr;      
wire            lsbus_dummy2_intr;      
wire            lsbus_dummy3_intr;      
wire    [31:0]  lsbus_hmain0_s10_hrdata; 
wire            lsbus_hmain0_s10_hready; 
wire    [1 :0]  lsbus_hmain0_s10_hresp; 
wire            main_dmemdummy0_intr;   
wire            main_dummy0_intr;       
wire            main_dummy1_intr;       
wire            main_dummy2_intr;       
wire            main_dummy3_intr;       
wire            main_imemdummy0_intr;   
wire            pmu_apb0_pclk_en;       
wire            pmu_apb0_s3clk;         
wire            pmu_apb0_s3rst_b;       
wire            pmu_apb1_pclk_en;       
wire    [31:0]  pmu_apb1_prdata;        
wire            pmu_apb1_s3clk;         
wire            pmu_apb1_s3rst_b;       
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
wire            pwm_ioctl_ch0;          
wire            pwm_ioctl_ch0_oe_n;     
wire            pwm_ioctl_ch1;          
wire            pwm_ioctl_ch10;         
wire            pwm_ioctl_ch10_oe_n;    
wire            pwm_ioctl_ch11;         
wire            pwm_ioctl_ch11_oe_n;    
wire            pwm_ioctl_ch1_oe_n;     
wire            pwm_ioctl_ch2;          
wire            pwm_ioctl_ch2_oe_n;     
wire            pwm_ioctl_ch3;          
wire            pwm_ioctl_ch3_oe_n;     
wire            pwm_ioctl_ch4;          
wire            pwm_ioctl_ch4_oe_n;     
wire            pwm_ioctl_ch5;          
wire            pwm_ioctl_ch5_oe_n;     
wire            pwm_ioctl_ch6;          
wire            pwm_ioctl_ch6_oe_n;     
wire            pwm_ioctl_ch7;          
wire            pwm_ioctl_ch7_oe_n;     
wire            pwm_ioctl_ch8;          
wire            pwm_ioctl_ch8_oe_n;     
wire            pwm_ioctl_ch9;          
wire            pwm_ioctl_ch9_oe_n;     
wire            pwm_wic_intr;           
wire    [31:0]  rtc_apb1_prdata;        
wire            scan_mode;              
wire    [31:0]  smc_hmain0_s2_hrdata;   
wire            smc_hmain0_s2_hready;   
wire    [1 :0]  smc_hmain0_s2_hresp;    
wire    [31:0]  smc_hmain0_s3_hrdata;   
wire            smc_hmain0_s3_hready;   
wire    [1 :0]  smc_hmain0_s3_hresp;    
wire    [31:0]  smc_hmain0_s4_hrdata;   
wire            smc_hmain0_s4_hready;   
wire    [1 :0]  smc_hmain0_s4_hresp;    
wire            test_mode;              
wire    [1 :0]  tim0_wic_intr;          
wire    [1 :0]  tim1_wic_intr;          
wire    [1 :0]  tim2_wic_intr;          
wire    [1 :0]  tim3_wic_intr;          
wire    [1 :0]  tim4_wic_intr;          
wire    [1 :0]  tim5_wic_intr;          
wire    [1 :0]  tim6_wic_intr;          
wire    [1 :0]  tim7_wic_intr;          
wire            usi0_ioctl_nss_ie_n;    
wire            usi0_ioctl_nss_oe_n;    
wire            usi0_ioctl_nss_out;     
wire            usi0_ioctl_sclk_ie_n;   
wire            usi0_ioctl_sclk_oe_n;   
wire            usi0_ioctl_sclk_out;    
wire            usi0_ioctl_sd0_ie_n;    
wire            usi0_ioctl_sd0_oe_n;    
wire            usi0_ioctl_sd0_out;     
wire            usi0_ioctl_sd1_ie_n;    
wire            usi0_ioctl_sd1_oe_n;    
wire            usi0_ioctl_sd1_out;     
wire            usi0_wic_intr;          
wire            usi1_ioctl_nss_ie_n;    
wire            usi1_ioctl_nss_oe_n;    
wire            usi1_ioctl_nss_out;     
wire            usi1_ioctl_sclk_ie_n;   
wire            usi1_ioctl_sclk_oe_n;   
wire            usi1_ioctl_sclk_out;    
wire            usi1_ioctl_sd0_ie_n;    
wire            usi1_ioctl_sd0_oe_n;    
wire            usi1_ioctl_sd0_out;     
wire            usi1_ioctl_sd1_ie_n;    
wire            usi1_ioctl_sd1_oe_n;    
wire            usi1_ioctl_sd1_out;     
wire            usi1_wic_intr;          
wire            usi2_ioctl_nss_ie_n;    
wire            usi2_ioctl_nss_oe_n;    
wire            usi2_ioctl_nss_out;     
wire            usi2_ioctl_sclk_ie_n;   
wire            usi2_ioctl_sclk_oe_n;   
wire            usi2_ioctl_sclk_out;    
wire            usi2_ioctl_sd0_ie_n;    
wire            usi2_ioctl_sd0_oe_n;    
wire            usi2_ioctl_sd0_out;     
wire            usi2_ioctl_sd1_ie_n;    
wire            usi2_ioctl_sd1_oe_n;    
wire            usi2_ioctl_sd1_out;     
wire            usi2_wic_intr;          
wire            wdt_pmu_rst_b;          
wire            wdt_wic_intr;           
ahb_matrix_top  x_main_bus_top (
  .cpu_hmain0_m0_haddr     (cpu_hmain0_m0_haddr    ),
  .cpu_hmain0_m0_hburst    (cpu_hmain0_m0_hburst   ),
  .cpu_hmain0_m0_hprot     (cpu_hmain0_m0_hprot    ),
  .cpu_hmain0_m0_hsize     (cpu_hmain0_m0_hsize    ),
  .cpu_hmain0_m0_htrans    (cpu_hmain0_m0_htrans   ),
  .cpu_hmain0_m0_hwdata    (cpu_hmain0_m0_hwdata   ),
  .cpu_hmain0_m0_hwrite    (cpu_hmain0_m0_hwrite   ),
  .cpu_hmain0_m1_haddr     (cpu_hmain0_m1_haddr    ),
  .cpu_hmain0_m1_hburst    (cpu_hmain0_m1_hburst   ),
  .cpu_hmain0_m1_hprot     (cpu_hmain0_m1_hprot    ),
  .cpu_hmain0_m1_hsize     (cpu_hmain0_m1_hsize    ),
  .cpu_hmain0_m1_htrans    (cpu_hmain0_m1_htrans   ),
  .cpu_hmain0_m1_hwdata    (cpu_hmain0_m1_hwdata   ),
  .cpu_hmain0_m1_hwrite    (cpu_hmain0_m1_hwrite   ),
  .cpu_hmain0_m2_haddr     (cpu_hmain0_m2_haddr    ),
  .cpu_hmain0_m2_hburst    (cpu_hmain0_m2_hburst   ),
  .cpu_hmain0_m2_hprot     (cpu_hmain0_m2_hprot    ),
  .cpu_hmain0_m2_hsize     (cpu_hmain0_m2_hsize    ),
  .cpu_hmain0_m2_htrans    (cpu_hmain0_m2_htrans   ),
  .cpu_hmain0_m2_hwdata    (cpu_hmain0_m2_hwdata   ),
  .cpu_hmain0_m2_hwrite    (cpu_hmain0_m2_hwrite   ),
  .dmac0_wic_intr          (dmac0_wic_intr         ),
  .hmain0_cpu_m0_hrdata    (hmain0_cpu_m0_hrdata   ),
  .hmain0_cpu_m0_hready    (hmain0_cpu_m0_hready   ),
  .hmain0_cpu_m0_hresp     (hmain0_cpu_m0_hresp    ),
  .hmain0_cpu_m1_hrdata    (hmain0_cpu_m1_hrdata   ),
  .hmain0_cpu_m1_hready    (hmain0_cpu_m1_hready   ),
  .hmain0_cpu_m1_hresp     (hmain0_cpu_m1_hresp    ),
  .hmain0_cpu_m2_hrdata    (hmain0_cpu_m2_hrdata   ),
  .hmain0_cpu_m2_hready    (hmain0_cpu_m2_hready   ),
  .hmain0_cpu_m2_hresp     (hmain0_cpu_m2_hresp    ),
  .hmain0_ismc_s0_haddr    (hmain0_ismc_s0_haddr   ),
  .hmain0_ismc_s0_hprot    (hmain0_ismc_s0_hprot   ),
  .hmain0_ismc_s0_hsel     (hmain0_ismc_s0_hsel    ),
  .hmain0_ismc_s0_hsize    (hmain0_ismc_s0_hsize   ),
  .hmain0_ismc_s0_htrans   (hmain0_ismc_s0_htrans  ),
  .hmain0_ismc_s0_hwdata   (hmain0_ismc_s0_hwdata  ),
  .hmain0_ismc_s0_hwrite   (hmain0_ismc_s0_hwrite  ),
  .hmain0_lsbus_s10_haddr  (hmain0_lsbus_s10_haddr ),
  .hmain0_lsbus_s10_hburst (hmain0_lsbus_s10_hburst),
  .hmain0_lsbus_s10_hprot  (hmain0_lsbus_s10_hprot ),
  .hmain0_lsbus_s10_hsel   (hmain0_lsbus_s10_hsel  ),
  .hmain0_lsbus_s10_hsize  (hmain0_lsbus_s10_hsize ),
  .hmain0_lsbus_s10_htrans (hmain0_lsbus_s10_htrans),
  .hmain0_lsbus_s10_hwdata (hmain0_lsbus_s10_hwdata),
  .hmain0_lsbus_s10_hwrite (hmain0_lsbus_s10_hwrite),
  .hmain0_smc_s2_haddr     (hmain0_smc_s2_haddr    ),
  .hmain0_smc_s2_hprot     (hmain0_smc_s2_hprot    ),
  .hmain0_smc_s2_hsel      (hmain0_smc_s2_hsel     ),
  .hmain0_smc_s2_hsize     (hmain0_smc_s2_hsize    ),
  .hmain0_smc_s2_htrans    (hmain0_smc_s2_htrans   ),
  .hmain0_smc_s2_hwdata    (hmain0_smc_s2_hwdata   ),
  .hmain0_smc_s2_hwrite    (hmain0_smc_s2_hwrite   ),
  .hmain0_smc_s3_haddr     (hmain0_smc_s3_haddr    ),
  .hmain0_smc_s3_hprot     (hmain0_smc_s3_hprot    ),
  .hmain0_smc_s3_hsel      (hmain0_smc_s3_hsel     ),
  .hmain0_smc_s3_hsize     (hmain0_smc_s3_hsize    ),
  .hmain0_smc_s3_htrans    (hmain0_smc_s3_htrans   ),
  .hmain0_smc_s3_hwdata    (hmain0_smc_s3_hwdata   ),
  .hmain0_smc_s3_hwrite    (hmain0_smc_s3_hwrite   ),
  .hmain0_smc_s4_haddr     (hmain0_smc_s4_haddr    ),
  .hmain0_smc_s4_hprot     (hmain0_smc_s4_hprot    ),
  .hmain0_smc_s4_hsel      (hmain0_smc_s4_hsel     ),
  .hmain0_smc_s4_hsize     (hmain0_smc_s4_hsize    ),
  .hmain0_smc_s4_htrans    (hmain0_smc_s4_htrans   ),
  .hmain0_smc_s4_hwdata    (hmain0_smc_s4_hwdata   ),
  .hmain0_smc_s4_hwrite    (hmain0_smc_s4_hwrite   ),
  .ismc_hmain0_s0_hrdata   (ismc_hmain0_s0_hrdata  ),
  .ismc_hmain0_s0_hready   (ismc_hmain0_s0_hready  ),
  .ismc_hmain0_s0_hresp    (ismc_hmain0_s0_hresp   ),
  .lsbus_hmain0_s10_hrdata (lsbus_hmain0_s10_hrdata),
  .lsbus_hmain0_s10_hready (lsbus_hmain0_s10_hready),
  .lsbus_hmain0_s10_hresp  (lsbus_hmain0_s10_hresp ),
  .main_dmemdummy0_intr    (main_dmemdummy0_intr   ),
  .main_dummy0_intr        (main_dummy0_intr       ),
  .main_dummy1_intr        (main_dummy1_intr       ),
  .main_dummy2_intr        (main_dummy2_intr       ),
  .main_dummy3_intr        (main_dummy3_intr       ),
  .main_imemdummy0_intr    (main_imemdummy0_intr   ),
  .pmu_dmac0_hclk          (pmu_dmac0_hclk         ),
  .pmu_dmac0_hrst_b        (pmu_dmac0_hrst_b       ),
  .pmu_dmemdummy0_hclk     (pmu_dmemdummy0_hclk    ),
  .pmu_dmemdummy0_hrst_b   (pmu_dmemdummy0_hrst_b  ),
  .pmu_dummy0_hclk         (pmu_dummy0_hclk        ),
  .pmu_dummy0_hrst_b       (pmu_dummy0_hrst_b      ),
  .pmu_dummy1_hclk         (pmu_dummy1_hclk        ),
  .pmu_dummy1_hrst_b       (pmu_dummy1_hrst_b      ),
  .pmu_dummy2_hclk         (pmu_dummy2_hclk        ),
  .pmu_dummy2_hrst_b       (pmu_dummy2_hrst_b      ),
  .pmu_dummy3_hclk         (pmu_dummy3_hclk        ),
  .pmu_dummy3_hrst_b       (pmu_dummy3_hrst_b      ),
  .pmu_hmain0_hclk         (pmu_hmain0_hclk        ),
  .pmu_hmain0_hrst_b       (pmu_hmain0_hrst_b      ),
  .pmu_imemdummy0_hclk     (pmu_imemdummy0_hclk    ),
  .pmu_imemdummy0_hrst_b   (pmu_imemdummy0_hrst_b  ),
  .pmu_mdummy0_hclk        (pmu_mdummy0_hclk       ),
  .pmu_mdummy0_hrst_b      (pmu_mdummy0_hrst_b     ),
  .pmu_mdummy1_hclk        (pmu_mdummy1_hclk       ),
  .pmu_mdummy1_hrst_b      (pmu_mdummy1_hrst_b     ),
  .pmu_mdummy2_hclk        (pmu_mdummy2_hclk       ),
  .pmu_mdummy2_hrst_b      (pmu_mdummy2_hrst_b     ),
  .smc_hmain0_s2_hrdata    (smc_hmain0_s2_hrdata   ),
  .smc_hmain0_s2_hready    (smc_hmain0_s2_hready   ),
  .smc_hmain0_s2_hresp     (smc_hmain0_s2_hresp    ),
  .smc_hmain0_s3_hrdata    (smc_hmain0_s3_hrdata   ),
  .smc_hmain0_s3_hready    (smc_hmain0_s3_hready   ),
  .smc_hmain0_s3_hresp     (smc_hmain0_s3_hresp    ),
  .smc_hmain0_s4_hrdata    (smc_hmain0_s4_hrdata   ),
  .smc_hmain0_s4_hready    (smc_hmain0_s4_hready   ),
  .smc_hmain0_s4_hresp     (smc_hmain0_s4_hresp    )
);
ls_sub_top  x_sub_ls_top (
  .apb0_lsbus_s2_hrdata    (apb0_lsbus_s2_hrdata   ),
  .apb0_lsbus_s2_hready    (apb0_lsbus_s2_hready   ),
  .apb0_lsbus_s2_hresp     (apb0_lsbus_s2_hresp    ),
  .apb1_lsbus_s3_hrdata    (apb1_lsbus_s3_hrdata   ),
  .apb1_lsbus_s3_hready    (apb1_lsbus_s3_hready   ),
  .apb1_lsbus_s3_hresp     (apb1_lsbus_s3_hresp    ),
  .hmain0_lsbus_s10_haddr  (hmain0_lsbus_s10_haddr ),
  .hmain0_lsbus_s10_hburst (hmain0_lsbus_s10_hburst),
  .hmain0_lsbus_s10_hprot  (hmain0_lsbus_s10_hprot ),
  .hmain0_lsbus_s10_hsel   (hmain0_lsbus_s10_hsel  ),
  .hmain0_lsbus_s10_hsize  (hmain0_lsbus_s10_hsize ),
  .hmain0_lsbus_s10_htrans (hmain0_lsbus_s10_htrans),
  .hmain0_lsbus_s10_hwdata (hmain0_lsbus_s10_hwdata),
  .hmain0_lsbus_s10_hwrite (hmain0_lsbus_s10_hwrite),
  .lsbus_apb0_s2_haddr     (lsbus_apb0_s2_haddr    ),
  .lsbus_apb0_s2_hburst    (lsbus_apb0_s2_hburst   ),
  .lsbus_apb0_s2_hprot     (lsbus_apb0_s2_hprot    ),
  .lsbus_apb0_s2_hsel      (lsbus_apb0_s2_hsel     ),
  .lsbus_apb0_s2_hsize     (lsbus_apb0_s2_hsize    ),
  .lsbus_apb0_s2_htrans    (lsbus_apb0_s2_htrans   ),
  .lsbus_apb0_s2_hwdata    (lsbus_apb0_s2_hwdata   ),
  .lsbus_apb0_s2_hwrite    (lsbus_apb0_s2_hwrite   ),
  .lsbus_apb1_s3_haddr     (lsbus_apb1_s3_haddr    ),
  .lsbus_apb1_s3_hburst    (lsbus_apb1_s3_hburst   ),
  .lsbus_apb1_s3_hprot     (lsbus_apb1_s3_hprot    ),
  .lsbus_apb1_s3_hsel      (lsbus_apb1_s3_hsel     ),
  .lsbus_apb1_s3_hsize     (lsbus_apb1_s3_hsize    ),
  .lsbus_apb1_s3_htrans    (lsbus_apb1_s3_htrans   ),
  .lsbus_apb1_s3_hwdata    (lsbus_apb1_s3_hwdata   ),
  .lsbus_apb1_s3_hwrite    (lsbus_apb1_s3_hwrite   ),
  .lsbus_dummy0_intr       (lsbus_dummy0_intr      ),
  .lsbus_dummy1_intr       (lsbus_dummy1_intr      ),
  .lsbus_dummy2_intr       (lsbus_dummy2_intr      ),
  .lsbus_dummy3_intr       (lsbus_dummy3_intr      ),
  .lsbus_hmain0_s10_hrdata (lsbus_hmain0_s10_hrdata),
  .lsbus_hmain0_s10_hready (lsbus_hmain0_s10_hready),
  .lsbus_hmain0_s10_hresp  (lsbus_hmain0_s10_hresp ),
  .pmu_dummy0_s3clk        (pmu_dummy0_s3clk       ),
  .pmu_dummy0_s3rst_b      (pmu_dummy0_s3rst_b     ),
  .pmu_dummy1_s3clk        (pmu_dummy1_s3clk       ),
  .pmu_dummy1_s3rst_b      (pmu_dummy1_s3rst_b     ),
  .pmu_dummy2_s3clk        (pmu_dummy2_s3clk       ),
  .pmu_dummy2_s3rst_b      (pmu_dummy2_s3rst_b     ),
  .pmu_dummy3_s3clk        (pmu_dummy3_s3clk       ),
  .pmu_dummy3_s3rst_b      (pmu_dummy3_s3rst_b     ),
  .pmu_lsbus_hclk          (pmu_lsbus_hclk         ),
  .pmu_lsbus_hrst_b        (pmu_lsbus_hrst_b       ),
  .pmu_sub3_s3clk          (pmu_sub3_s3clk         ),
  .pmu_sub3_s3rst_b        (pmu_sub3_s3rst_b       )
);
apb0_sub_top  x_sub_apb0_top (
  .apb0_dummy1_intr     (apb0_dummy1_intr    ),
  .apb0_dummy2_intr     (apb0_dummy2_intr    ),
  .apb0_dummy3_intr     (apb0_dummy3_intr    ),
  .apb0_dummy4_intr     (apb0_dummy4_intr    ),
  .apb0_dummy5_intr     (apb0_dummy5_intr    ),
  .apb0_dummy7_intr     (apb0_dummy7_intr    ),
  .apb0_dummy8_intr     (apb0_dummy8_intr    ),
  .apb0_dummy9_intr     (apb0_dummy9_intr    ),
  .apb0_lsbus_s2_hrdata (apb0_lsbus_s2_hrdata),
  .apb0_lsbus_s2_hready (apb0_lsbus_s2_hready),
  .apb0_lsbus_s2_hresp  (apb0_lsbus_s2_hresp ),
  .ioctl_pwm_cap0       (ioctl_pwm_cap0      ),
  .ioctl_pwm_cap10      (ioctl_pwm_cap10     ),
  .ioctl_pwm_cap2       (ioctl_pwm_cap2      ),
  .ioctl_pwm_cap4       (ioctl_pwm_cap4      ),
  .ioctl_pwm_cap6       (ioctl_pwm_cap6      ),
  .ioctl_pwm_cap8       (ioctl_pwm_cap8      ),
  .ioctl_pwm_fault      (ioctl_pwm_fault     ),
  .ioctl_usi0_nss_in    (ioctl_usi0_nss_in   ),
  .ioctl_usi0_sclk_in   (ioctl_usi0_sclk_in  ),
  .ioctl_usi0_sd0_in    (ioctl_usi0_sd0_in   ),
  .ioctl_usi0_sd1_in    (ioctl_usi0_sd1_in   ),
  .ioctl_usi2_nss_in    (ioctl_usi2_nss_in   ),
  .ioctl_usi2_sclk_in   (ioctl_usi2_sclk_in  ),
  .ioctl_usi2_sd0_in    (ioctl_usi2_sd0_in   ),
  .ioctl_usi2_sd1_in    (ioctl_usi2_sd1_in   ),
  .lsbus_apb0_s2_haddr  (lsbus_apb0_s2_haddr ),
  .lsbus_apb0_s2_hburst (lsbus_apb0_s2_hburst),
  .lsbus_apb0_s2_hprot  (lsbus_apb0_s2_hprot ),
  .lsbus_apb0_s2_hsel   (lsbus_apb0_s2_hsel  ),
  .lsbus_apb0_s2_hsize  (lsbus_apb0_s2_hsize ),
  .lsbus_apb0_s2_htrans (lsbus_apb0_s2_htrans),
  .lsbus_apb0_s2_hwdata (lsbus_apb0_s2_hwdata),
  .lsbus_apb0_s2_hwrite (lsbus_apb0_s2_hwrite),
  .pmu_apb0_pclk_en     (pmu_apb0_pclk_en    ),
  .pmu_apb0_s3clk       (pmu_apb0_s3clk      ),
  .pmu_apb0_s3rst_b     (pmu_apb0_s3rst_b    ),
  .pmu_dummy1_p0clk     (pmu_dummy1_p0clk    ),
  .pmu_dummy1_p0rst_b   (pmu_dummy1_p0rst_b  ),
  .pmu_dummy2_p0clk     (pmu_dummy2_p0clk    ),
  .pmu_dummy2_p0rst_b   (pmu_dummy2_p0rst_b  ),
  .pmu_dummy3_p0clk     (pmu_dummy3_p0clk    ),
  .pmu_dummy3_p0rst_b   (pmu_dummy3_p0rst_b  ),
  .pmu_dummy4_p0clk     (pmu_dummy4_p0clk    ),
  .pmu_dummy4_p0rst_b   (pmu_dummy4_p0rst_b  ),
  .pmu_dummy5_p0clk     (pmu_dummy5_p0clk    ),
  .pmu_dummy5_p0rst_b   (pmu_dummy5_p0rst_b  ),
  .pmu_dummy7_p0clk     (pmu_dummy7_p0clk    ),
  .pmu_dummy7_p0rst_b   (pmu_dummy7_p0rst_b  ),
  .pmu_dummy8_p0clk     (pmu_dummy8_p0clk    ),
  .pmu_dummy8_p0rst_b   (pmu_dummy8_p0rst_b  ),
  .pmu_dummy9_p0clk     (pmu_dummy9_p0clk    ),
  .pmu_dummy9_p0rst_b   (pmu_dummy9_p0rst_b  ),
  .pmu_pwm_p0clk        (pmu_pwm_p0clk       ),
  .pmu_pwm_p0rst_b      (pmu_pwm_p0rst_b     ),
  .pmu_tim0_p0clk       (pmu_tim0_p0clk      ),
  .pmu_tim0_p0rst_b     (pmu_tim0_p0rst_b    ),
  .pmu_tim2_p0clk       (pmu_tim2_p0clk      ),
  .pmu_tim2_p0rst_b     (pmu_tim2_p0rst_b    ),
  .pmu_tim4_p0clk       (pmu_tim4_p0clk      ),
  .pmu_tim4_p0rst_b     (pmu_tim4_p0rst_b    ),
  .pmu_tim6_p0clk       (pmu_tim6_p0clk      ),
  .pmu_tim6_p0rst_b     (pmu_tim6_p0rst_b    ),
  .pmu_usi0_p0clk       (pmu_usi0_p0clk      ),
  .pmu_usi0_p0rst_b     (pmu_usi0_p0rst_b    ),
  .pmu_usi2_p0clk       (pmu_usi2_p0clk      ),
  .pmu_usi2_p0rst_b     (pmu_usi2_p0rst_b    ),
  .pmu_wdt_p0clk        (pmu_wdt_p0clk       ),
  .pmu_wdt_p0rst_b      (pmu_wdt_p0rst_b     ),
  .pwm_ioctl_ch0        (pwm_ioctl_ch0       ),
  .pwm_ioctl_ch0_oe_n   (pwm_ioctl_ch0_oe_n  ),
  .pwm_ioctl_ch1        (pwm_ioctl_ch1       ),
  .pwm_ioctl_ch10       (pwm_ioctl_ch10      ),
  .pwm_ioctl_ch10_oe_n  (pwm_ioctl_ch10_oe_n ),
  .pwm_ioctl_ch11       (pwm_ioctl_ch11      ),
  .pwm_ioctl_ch11_oe_n  (pwm_ioctl_ch11_oe_n ),
  .pwm_ioctl_ch1_oe_n   (pwm_ioctl_ch1_oe_n  ),
  .pwm_ioctl_ch2        (pwm_ioctl_ch2       ),
  .pwm_ioctl_ch2_oe_n   (pwm_ioctl_ch2_oe_n  ),
  .pwm_ioctl_ch3        (pwm_ioctl_ch3       ),
  .pwm_ioctl_ch3_oe_n   (pwm_ioctl_ch3_oe_n  ),
  .pwm_ioctl_ch4        (pwm_ioctl_ch4       ),
  .pwm_ioctl_ch4_oe_n   (pwm_ioctl_ch4_oe_n  ),
  .pwm_ioctl_ch5        (pwm_ioctl_ch5       ),
  .pwm_ioctl_ch5_oe_n   (pwm_ioctl_ch5_oe_n  ),
  .pwm_ioctl_ch6        (pwm_ioctl_ch6       ),
  .pwm_ioctl_ch6_oe_n   (pwm_ioctl_ch6_oe_n  ),
  .pwm_ioctl_ch7        (pwm_ioctl_ch7       ),
  .pwm_ioctl_ch7_oe_n   (pwm_ioctl_ch7_oe_n  ),
  .pwm_ioctl_ch8        (pwm_ioctl_ch8       ),
  .pwm_ioctl_ch8_oe_n   (pwm_ioctl_ch8_oe_n  ),
  .pwm_ioctl_ch9        (pwm_ioctl_ch9       ),
  .pwm_ioctl_ch9_oe_n   (pwm_ioctl_ch9_oe_n  ),
  .pwm_wic_intr         (pwm_wic_intr        ),
  .scan_mode            (scan_mode           ),
  .test_mode            (test_mode           ),
  .tim0_wic_intr        (tim0_wic_intr       ),
  .tim2_wic_intr        (tim2_wic_intr       ),
  .tim4_wic_intr        (tim4_wic_intr       ),
  .tim6_wic_intr        (tim6_wic_intr       ),
  .usi0_ioctl_nss_ie_n  (usi0_ioctl_nss_ie_n ),
  .usi0_ioctl_nss_oe_n  (usi0_ioctl_nss_oe_n ),
  .usi0_ioctl_nss_out   (usi0_ioctl_nss_out  ),
  .usi0_ioctl_sclk_ie_n (usi0_ioctl_sclk_ie_n),
  .usi0_ioctl_sclk_oe_n (usi0_ioctl_sclk_oe_n),
  .usi0_ioctl_sclk_out  (usi0_ioctl_sclk_out ),
  .usi0_ioctl_sd0_ie_n  (usi0_ioctl_sd0_ie_n ),
  .usi0_ioctl_sd0_oe_n  (usi0_ioctl_sd0_oe_n ),
  .usi0_ioctl_sd0_out   (usi0_ioctl_sd0_out  ),
  .usi0_ioctl_sd1_ie_n  (usi0_ioctl_sd1_ie_n ),
  .usi0_ioctl_sd1_oe_n  (usi0_ioctl_sd1_oe_n ),
  .usi0_ioctl_sd1_out   (usi0_ioctl_sd1_out  ),
  .usi0_wic_intr        (usi0_wic_intr       ),
  .usi2_ioctl_nss_ie_n  (usi2_ioctl_nss_ie_n ),
  .usi2_ioctl_nss_oe_n  (usi2_ioctl_nss_oe_n ),
  .usi2_ioctl_nss_out   (usi2_ioctl_nss_out  ),
  .usi2_ioctl_sclk_ie_n (usi2_ioctl_sclk_ie_n),
  .usi2_ioctl_sclk_oe_n (usi2_ioctl_sclk_oe_n),
  .usi2_ioctl_sclk_out  (usi2_ioctl_sclk_out ),
  .usi2_ioctl_sd0_ie_n  (usi2_ioctl_sd0_ie_n ),
  .usi2_ioctl_sd0_oe_n  (usi2_ioctl_sd0_oe_n ),
  .usi2_ioctl_sd0_out   (usi2_ioctl_sd0_out  ),
  .usi2_ioctl_sd1_ie_n  (usi2_ioctl_sd1_ie_n ),
  .usi2_ioctl_sd1_oe_n  (usi2_ioctl_sd1_oe_n ),
  .usi2_ioctl_sd1_out   (usi2_ioctl_sd1_out  ),
  .usi2_wic_intr        (usi2_wic_intr       ),
  .wdt_pmu_rst_b        (wdt_pmu_rst_b       ),
  .wdt_wic_intr         (wdt_wic_intr        )
);
apb1_sub_top  x_sub_apb1_top (
  .apb1_dummy1_intr     (apb1_dummy1_intr    ),
  .apb1_dummy2_intr     (apb1_dummy2_intr    ),
  .apb1_dummy3_intr     (apb1_dummy3_intr    ),
  .apb1_dummy4_intr     (apb1_dummy4_intr    ),
  .apb1_dummy5_intr     (apb1_dummy5_intr    ),
  .apb1_dummy6_intr     (apb1_dummy6_intr    ),
  .apb1_dummy7_intr     (apb1_dummy7_intr    ),
  .apb1_dummy8_intr     (apb1_dummy8_intr    ),
  .apb1_gpio_psel_s5    (apb1_gpio_psel_s5   ),
  .apb1_lsbus_s3_hrdata (apb1_lsbus_s3_hrdata),
  .apb1_lsbus_s3_hready (apb1_lsbus_s3_hready),
  .apb1_lsbus_s3_hresp  (apb1_lsbus_s3_hresp ),
  .apb1_pmu_psel_s15    (apb1_pmu_psel_s15   ),
  .apb1_rtc_psel_s6     (apb1_rtc_psel_s6    ),
  .apb1_xx_paddr        (apb1_xx_paddr       ),
  .apb1_xx_penable      (apb1_xx_penable     ),
  .apb1_xx_pprot        (apb1_xx_pprot       ),
  .apb1_xx_pwdata       (apb1_xx_pwdata      ),
  .apb1_xx_pwrite       (apb1_xx_pwrite      ),
  .gpio_apb1_prdata     (gpio_apb1_prdata    ),
  .ioctl_usi1_nss_in    (ioctl_usi1_nss_in   ),
  .ioctl_usi1_sclk_in   (ioctl_usi1_sclk_in  ),
  .ioctl_usi1_sd0_in    (ioctl_usi1_sd0_in   ),
  .ioctl_usi1_sd1_in    (ioctl_usi1_sd1_in   ),
  .lsbus_apb1_s3_haddr  (lsbus_apb1_s3_haddr ),
  .lsbus_apb1_s3_hburst (lsbus_apb1_s3_hburst),
  .lsbus_apb1_s3_hprot  (lsbus_apb1_s3_hprot ),
  .lsbus_apb1_s3_hsel   (lsbus_apb1_s3_hsel  ),
  .lsbus_apb1_s3_hsize  (lsbus_apb1_s3_hsize ),
  .lsbus_apb1_s3_htrans (lsbus_apb1_s3_htrans),
  .lsbus_apb1_s3_hwdata (lsbus_apb1_s3_hwdata),
  .lsbus_apb1_s3_hwrite (lsbus_apb1_s3_hwrite),
  .pmu_apb1_pclk_en     (pmu_apb1_pclk_en    ),
  .pmu_apb1_prdata      (pmu_apb1_prdata     ),
  .pmu_apb1_s3clk       (pmu_apb1_s3clk      ),
  .pmu_apb1_s3rst_b     (pmu_apb1_s3rst_b    ),
  .pmu_dummy1_p1clk     (pmu_dummy1_p1clk    ),
  .pmu_dummy1_p1rst_b   (pmu_dummy1_p1rst_b  ),
  .pmu_dummy2_p1clk     (pmu_dummy2_p1clk    ),
  .pmu_dummy2_p1rst_b   (pmu_dummy2_p1rst_b  ),
  .pmu_dummy3_p1clk     (pmu_dummy3_p1clk    ),
  .pmu_dummy3_p1rst_b   (pmu_dummy3_p1rst_b  ),
  .pmu_dummy4_p1clk     (pmu_dummy4_p1clk    ),
  .pmu_dummy4_p1rst_b   (pmu_dummy4_p1rst_b  ),
  .pmu_dummy5_p1clk     (pmu_dummy5_p1clk    ),
  .pmu_dummy5_p1rst_b   (pmu_dummy5_p1rst_b  ),
  .pmu_dummy6_p1clk     (pmu_dummy6_p1clk    ),
  .pmu_dummy6_p1rst_b   (pmu_dummy6_p1rst_b  ),
  .pmu_dummy7_p1clk     (pmu_dummy7_p1clk    ),
  .pmu_dummy7_p1rst_b   (pmu_dummy7_p1rst_b  ),
  .pmu_dummy8_p1clk     (pmu_dummy8_p1clk    ),
  .pmu_dummy8_p1rst_b   (pmu_dummy8_p1rst_b  ),
  .pmu_tim1_p1clk       (pmu_tim1_p1clk      ),
  .pmu_tim1_p1rst_b     (pmu_tim1_p1rst_b    ),
  .pmu_tim3_p1clk       (pmu_tim3_p1clk      ),
  .pmu_tim3_p1rst_b     (pmu_tim3_p1rst_b    ),
  .pmu_tim5_p1clk       (pmu_tim5_p1clk      ),
  .pmu_tim5_p1rst_b     (pmu_tim5_p1rst_b    ),
  .pmu_tim7_p1clk       (pmu_tim7_p1clk      ),
  .pmu_tim7_p1rst_b     (pmu_tim7_p1rst_b    ),
  .pmu_usi1_p1clk       (pmu_usi1_p1clk      ),
  .pmu_usi1_p1rst_b     (pmu_usi1_p1rst_b    ),
  .rtc_apb1_prdata      (rtc_apb1_prdata     ),
  .scan_mode            (scan_mode           ),
  .tim1_wic_intr        (tim1_wic_intr       ),
  .tim3_wic_intr        (tim3_wic_intr       ),
  .tim5_wic_intr        (tim5_wic_intr       ),
  .tim7_wic_intr        (tim7_wic_intr       ),
  .usi1_ioctl_nss_ie_n  (usi1_ioctl_nss_ie_n ),
  .usi1_ioctl_nss_oe_n  (usi1_ioctl_nss_oe_n ),
  .usi1_ioctl_nss_out   (usi1_ioctl_nss_out  ),
  .usi1_ioctl_sclk_ie_n (usi1_ioctl_sclk_ie_n),
  .usi1_ioctl_sclk_oe_n (usi1_ioctl_sclk_oe_n),
  .usi1_ioctl_sclk_out  (usi1_ioctl_sclk_out ),
  .usi1_ioctl_sd0_ie_n  (usi1_ioctl_sd0_ie_n ),
  .usi1_ioctl_sd0_oe_n  (usi1_ioctl_sd0_oe_n ),
  .usi1_ioctl_sd0_out   (usi1_ioctl_sd0_out  ),
  .usi1_ioctl_sd1_ie_n  (usi1_ioctl_sd1_ie_n ),
  .usi1_ioctl_sd1_oe_n  (usi1_ioctl_sd1_oe_n ),
  .usi1_ioctl_sd1_out   (usi1_ioctl_sd1_out  ),
  .usi1_wic_intr        (usi1_wic_intr       )
);
endmodule
