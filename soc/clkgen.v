/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module pmu_dummy_top(
  cpu_pmu_dfs_ack,
  cpu_pmu_sleep_b,
  dft_clk,
  ehs_pmu_clk,
  els_pmu_clk,
  pad_core_clk,
  pad_core_ctim_refclk,
  pad_core_rst_b,
  pad_mcurst_b,
  paddr,
  penable,
  pmu_apb0_pclk_en,
  pmu_apb0_s3clk,
  pmu_apb0_s3rst_b,
  pmu_apb1_pclk_en,
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
  pmu_gpio_p1clk,
  pmu_gpio_p1rst_b,
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
  pmu_rtc_clk,
  pmu_rtc_p1clk,
  pmu_rtc_p1rst_b,
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
  pprot,
  prdata,
  psel,
  pwdata,
  pwrite,
  wdt_pmu_rst_b
);
input           cpu_pmu_dfs_ack;      
input           cpu_pmu_sleep_b;      
input           ehs_pmu_clk;          
input           els_pmu_clk;          
input           pad_mcurst_b;         
input   [31:0]  paddr;                
input           penable;              
input   [2 :0]  pprot;                
input           psel;                 
input   [31:0]  pwdata;               
input           pwrite;               
input           wdt_pmu_rst_b;        
output          dft_clk;              
output          pad_core_clk;         
output          pad_core_ctim_refclk; 
output          pad_core_rst_b;       
output          pmu_apb0_pclk_en;     
output          pmu_apb0_s3clk;       
output          pmu_apb0_s3rst_b;     
output          pmu_apb1_pclk_en;     
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
output          pmu_gpio_p1clk;       
output          pmu_gpio_p1rst_b;     
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
output          pmu_rtc_clk;          
output          pmu_rtc_p1clk;        
output          pmu_rtc_p1rst_b;      
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
output  [31:0]  prdata;               
wire            dft_clk;              
wire            ehs_pmu_clk;          
wire            els_pmu_clk;          
wire            pad_core_clk;         
wire            pad_core_ctim_refclk; 
wire            pad_core_rst_b;       
wire            pad_mcurst_b;         
wire            pmu_apb0_pclk_en;     
wire            pmu_apb0_s3clk;       
wire            pmu_apb0_s3rst_b;     
wire            pmu_apb1_pclk_en;     
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
wire    [31:0]  prdata;               
wire            soc_hclk;             
wire            soc_hrst_b;           
wire            soc_p0clk;            
wire            soc_p0rst_b;          
wire            soc_p1clk;            
wire            soc_p1rst_b;          
wire            soc_s3clk;            
wire            soc_s3rst_b;          
wire            sys_rst_b;            
wire            wdt_pmu_rst_b;        
assign pmu_cpu_dfs_req = 1'b0;
assign pmu_wic_intr = 1'b0;
assign prdata[31:0] = 32'h0;
assign pmu_apb0_pclk_en = 1'b1;
assign pmu_apb1_pclk_en = 1'b1;
assign pmu_rtc_clk = els_pmu_clk;
assign  soc_hclk = ehs_pmu_clk;
assign  soc_p0clk = ehs_pmu_clk;
assign  soc_p1clk = ehs_pmu_clk;
assign  soc_s3clk = ehs_pmu_clk;
assign  dft_clk = ehs_pmu_clk;
assign sys_rst_b = pad_mcurst_b & wdt_pmu_rst_b;
assign  soc_hrst_b  = sys_rst_b;
assign  soc_p0rst_b = sys_rst_b;
assign  soc_p1rst_b = sys_rst_b;
assign  soc_s3rst_b = sys_rst_b;
assign  pad_core_clk = soc_hclk; 
assign  pad_core_ctim_refclk = soc_hclk;
assign  pmu_dmac0_hclk = soc_hclk;
assign  pmu_imemdummy0_hclk = soc_hclk;
assign  pmu_dmemdummy0_hclk = soc_hclk;
assign  pmu_dummy0_hclk = soc_hclk;
assign  pmu_dummy1_hclk = soc_hclk;
assign  pmu_dummy2_hclk = soc_hclk;
assign  pmu_dummy3_hclk = soc_hclk;
assign  pmu_hmain0_hclk = soc_hclk;
assign  pmu_lsbus_hclk = soc_hclk;
assign  pmu_mdummy0_hclk = soc_hclk;
assign  pmu_mdummy1_hclk = soc_hclk;
assign  pmu_mdummy2_hclk = soc_hclk;
assign  pmu_smc_hclk = soc_hclk;
assign  pmu_apb0_s3clk = soc_s3clk;
assign  pmu_apb1_s3clk = soc_s3clk;
assign  pmu_sub3_s3clk = soc_s3clk;
assign  pmu_dummy0_s3clk = soc_s3clk;
assign  pmu_dummy1_s3clk = soc_s3clk;
assign  pmu_dummy2_s3clk = soc_s3clk;
assign  pmu_dummy3_s3clk = soc_s3clk;
assign  pmu_tim0_p0clk = soc_p0clk;
assign  pmu_tim2_p0clk = soc_p0clk;
assign  pmu_tim4_p0clk = soc_p0clk;
assign  pmu_tim6_p0clk = soc_p0clk;
assign  pmu_usi0_p0clk = soc_p0clk;
assign  pmu_usi2_p0clk = soc_p0clk;
assign  pmu_dummy1_p0clk = soc_p0clk;
assign  pmu_wdt_p0clk = soc_p0clk;
assign  pmu_dummy2_p0clk = soc_p0clk;
assign  pmu_dummy3_p0clk = soc_p0clk;
assign  pmu_dummy4_p0clk = soc_p0clk;
assign  pmu_dummy5_p0clk = soc_p0clk;
assign  pmu_pwm_p0clk = soc_p0clk;
assign  pmu_dummy7_p0clk = soc_p0clk;
assign  pmu_dummy8_p0clk = soc_p0clk;
assign  pmu_dummy9_p0clk = soc_p0clk;
assign  pmu_tim1_p1clk = soc_p1clk;
assign  pmu_tim3_p1clk = soc_p1clk;
assign  pmu_tim5_p1clk = soc_p1clk;
assign  pmu_tim7_p1clk = soc_p1clk;
assign  pmu_usi1_p1clk = soc_p1clk;
assign  pmu_gpio_p1clk = soc_p1clk;
assign  pmu_rtc_p1clk = soc_p1clk;
assign  pmu_dummy1_p1clk = soc_p1clk;
assign  pmu_dummy2_p1clk = soc_p1clk;
assign  pmu_dummy3_p1clk = soc_p1clk;
assign  pmu_dummy4_p1clk = soc_p1clk;
assign  pmu_dummy5_p1clk = soc_p1clk;
assign  pmu_dummy6_p1clk = soc_p1clk;
assign  pmu_dummy7_p1clk = soc_p1clk;
assign  pmu_dummy8_p1clk = soc_p1clk;
assign  pad_core_rst_b = soc_hrst_b;
assign  pmu_dmac0_hrst_b = soc_hrst_b;
assign  pmu_imemdummy0_hrst_b = soc_hrst_b;
assign  pmu_dmemdummy0_hrst_b = soc_hrst_b;
assign  pmu_dummy0_hrst_b = soc_hrst_b;
assign  pmu_dummy1_hrst_b = soc_hrst_b;
assign  pmu_dummy2_hrst_b = soc_hrst_b;
assign  pmu_dummy3_hrst_b = soc_hrst_b;
assign  pmu_hmain0_hrst_b = soc_hrst_b;
assign  pmu_lsbus_hrst_b = soc_hrst_b;
assign  pmu_mdummy0_hrst_b = soc_hrst_b;
assign  pmu_mdummy1_hrst_b = soc_hrst_b;
assign  pmu_mdummy2_hrst_b = soc_hrst_b;
assign  pmu_smc_hrst_b = soc_hrst_b;
assign  pmu_apb0_s3rst_b = soc_s3rst_b;
assign  pmu_apb1_s3rst_b = soc_s3rst_b;
assign  pmu_dummy0_s3rst_b = soc_s3rst_b;
assign  pmu_dummy1_s3rst_b = soc_s3rst_b;
assign  pmu_dummy2_s3rst_b = soc_s3rst_b;
assign  pmu_dummy3_s3rst_b = soc_s3rst_b;
assign  pmu_sub3_s3rst_b = soc_s3rst_b;
assign  pmu_dummy1_p0rst_b = soc_p0rst_b;
assign  pmu_wdt_p0rst_b = soc_p0rst_b;
assign  pmu_dummy2_p0rst_b = soc_p0rst_b;
assign  pmu_dummy3_p0rst_b = soc_p0rst_b;
assign  pmu_dummy4_p0rst_b = soc_p0rst_b;
assign  pmu_dummy5_p0rst_b = soc_p0rst_b;
assign  pmu_pwm_p0rst_b = soc_p0rst_b;
assign  pmu_dummy7_p0rst_b = soc_p0rst_b;
assign  pmu_dummy8_p0rst_b = soc_p0rst_b;
assign  pmu_dummy9_p0rst_b = soc_p0rst_b;
assign  pmu_tim0_p0rst_b = soc_p0rst_b;
assign  pmu_tim2_p0rst_b = soc_p0rst_b;
assign  pmu_tim4_p0rst_b = soc_p0rst_b;
assign  pmu_tim6_p0rst_b = soc_p0rst_b;
assign  pmu_usi0_p0rst_b = soc_p0rst_b;
assign  pmu_usi2_p0rst_b = soc_p0rst_b;
assign  pmu_rtc_p1rst_b = soc_p1rst_b;
assign  pmu_dummy1_p1rst_b = soc_p1rst_b;
assign  pmu_dummy2_p1rst_b = soc_p1rst_b;
assign  pmu_dummy3_p1rst_b = soc_p1rst_b;
assign  pmu_dummy4_p1rst_b = soc_p1rst_b;
assign  pmu_dummy5_p1rst_b = soc_p1rst_b;
assign  pmu_dummy6_p1rst_b = soc_p1rst_b;
assign  pmu_dummy7_p1rst_b = soc_p1rst_b;
assign  pmu_dummy8_p1rst_b = soc_p1rst_b;
assign  pmu_gpio_p1rst_b = soc_p1rst_b;
assign  pmu_tim1_p1rst_b = soc_p1rst_b;
assign  pmu_tim3_p1rst_b = soc_p1rst_b;
assign  pmu_tim5_p1rst_b = soc_p1rst_b;
assign  pmu_tim7_p1rst_b = soc_p1rst_b;
assign  pmu_usi1_p1rst_b = soc_p1rst_b;
endmodule
