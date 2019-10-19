/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


























`define FPGA

module wujian100_open_top(
  PAD_GPIO_0,
  PAD_GPIO_1,
  PAD_GPIO_10,
  PAD_GPIO_11,
  PAD_GPIO_12,
  PAD_GPIO_13,
  PAD_GPIO_14,
  PAD_GPIO_15,
  PAD_GPIO_16,
  PAD_GPIO_17,
  PAD_GPIO_18,
  PAD_GPIO_19,
  PAD_GPIO_2,
  PAD_GPIO_20,
  PAD_GPIO_21,
  PAD_GPIO_22,
  PAD_GPIO_23,
  PAD_GPIO_24,
  PAD_GPIO_25,
  PAD_GPIO_26,
  PAD_GPIO_27,
  PAD_GPIO_28,
  PAD_GPIO_29,
  PAD_GPIO_3,
  PAD_GPIO_30,
  PAD_GPIO_31,
  PAD_GPIO_4,
  PAD_GPIO_5,
  PAD_GPIO_6,
  PAD_GPIO_7,
  PAD_GPIO_8,
  PAD_GPIO_9,
  PAD_JTAG_TCLK,
  PAD_JTAG_TMS,
  PAD_MCURST,
  PAD_PWM_CH0,
  PAD_PWM_CH1,
  PAD_PWM_CH10,
  PAD_PWM_CH11,
  PAD_PWM_CH2,
  PAD_PWM_CH3,
  PAD_PWM_CH4,
  PAD_PWM_CH5,
  PAD_PWM_CH6,
  PAD_PWM_CH7,
  PAD_PWM_CH8,
  PAD_PWM_CH9,
  PAD_PWM_FAULT,
  PAD_USI0_NSS,
  PAD_USI0_SCLK,
  PAD_USI0_SD0,
  PAD_USI0_SD1,
  PAD_USI1_NSS,
  PAD_USI1_SCLK,
  PAD_USI1_SD0,
  PAD_USI1_SD1,
  PAD_USI2_NSS,
  PAD_USI2_SCLK,
  PAD_USI2_SD0,
  PAD_USI2_SD1,
  PIN_EHS,
  POUT_EHS
);


input           PIN_EHS;               

output          POUT_EHS;              

inout           PAD_GPIO_0;            
inout           PAD_GPIO_1;            
inout           PAD_GPIO_10;           
inout           PAD_GPIO_11;           
inout           PAD_GPIO_12;           
inout           PAD_GPIO_13;           
inout           PAD_GPIO_14;           
inout           PAD_GPIO_15;           
inout           PAD_GPIO_16;           
inout           PAD_GPIO_17;           
inout           PAD_GPIO_18;           
inout           PAD_GPIO_19;           
inout           PAD_GPIO_2;            
inout           PAD_GPIO_20;           
inout           PAD_GPIO_21;           
inout           PAD_GPIO_22;           
inout           PAD_GPIO_23;           
inout           PAD_GPIO_24;           
inout           PAD_GPIO_25;           
inout           PAD_GPIO_26;           
inout           PAD_GPIO_27;           
inout           PAD_GPIO_28;           
inout           PAD_GPIO_29;           
inout           PAD_GPIO_3;            
inout           PAD_GPIO_30;           
inout           PAD_GPIO_31;           
inout           PAD_GPIO_4;            
inout           PAD_GPIO_5;            
inout           PAD_GPIO_6;            
inout           PAD_GPIO_7;            
inout           PAD_GPIO_8;            
inout           PAD_GPIO_9;            
inout           PAD_JTAG_TCLK;         
inout           PAD_JTAG_TMS;          
inout           PAD_MCURST;            
inout           PAD_PWM_CH0;           
inout           PAD_PWM_CH1;           
inout           PAD_PWM_CH10;          
inout           PAD_PWM_CH11;          
inout           PAD_PWM_CH2;           
inout           PAD_PWM_CH3;           
inout           PAD_PWM_CH4;           
inout           PAD_PWM_CH5;           
inout           PAD_PWM_CH6;           
inout           PAD_PWM_CH7;           
inout           PAD_PWM_CH8;           
inout           PAD_PWM_CH9;           
inout           PAD_PWM_FAULT;         
inout           PAD_USI0_NSS;          
inout           PAD_USI0_SCLK;         
inout           PAD_USI0_SD0;          
inout           PAD_USI0_SD1;          
inout           PAD_USI1_NSS;          
inout           PAD_USI1_SCLK;         
inout           PAD_USI1_SD0;          
inout           PAD_USI1_SD1;          
inout           PAD_USI2_NSS;          
inout           PAD_USI2_SCLK;         
inout           PAD_USI2_SD0;          
inout           PAD_USI2_SD1;          




wire            PAD_GPIO_0;            
wire            PAD_GPIO_1;            
wire            PAD_GPIO_10;           
wire            PAD_GPIO_11;           
wire            PAD_GPIO_12;           
wire            PAD_GPIO_13;           
wire            PAD_GPIO_14;           
wire            PAD_GPIO_15;           
wire            PAD_GPIO_16;           
wire            PAD_GPIO_17;           
wire            PAD_GPIO_18;           
wire            PAD_GPIO_19;           
wire            PAD_GPIO_2;            
wire            PAD_GPIO_20;           
wire            PAD_GPIO_21;           
wire            PAD_GPIO_22;           
wire            PAD_GPIO_23;           
wire            PAD_GPIO_24;           
wire            PAD_GPIO_25;           
wire            PAD_GPIO_26;           
wire            PAD_GPIO_27;           
wire            PAD_GPIO_28;           
wire            PAD_GPIO_29;           
wire            PAD_GPIO_3;            
wire            PAD_GPIO_30;           
wire            PAD_GPIO_31;           
wire            PAD_GPIO_4;            
wire            PAD_GPIO_5;            
wire            PAD_GPIO_6;            
wire            PAD_GPIO_7;            
wire            PAD_GPIO_8;            
wire            PAD_GPIO_9;            
wire            PAD_JTAG_TCLK;         
wire            PAD_JTAG_TMS;          
wire            PAD_MCURST;            
wire            PAD_PWM_CH0;           
wire            PAD_PWM_CH1;           
wire            PAD_PWM_CH10;          
wire            PAD_PWM_CH11;          
wire            PAD_PWM_CH2;           
wire            PAD_PWM_CH3;           
wire            PAD_PWM_CH4;           
wire            PAD_PWM_CH5;           
wire            PAD_PWM_CH6;           
wire            PAD_PWM_CH7;           
wire            PAD_PWM_CH8;           
wire            PAD_PWM_CH9;           
wire            PAD_PWM_FAULT;         
wire            PAD_USI0_NSS;          
wire            PAD_USI0_SCLK;         
wire            PAD_USI0_SD0;          
wire            PAD_USI0_SD1;          
wire            PAD_USI1_NSS;          
wire            PAD_USI1_SCLK;         
wire            PAD_USI1_SD0;          
wire            PAD_USI1_SD1;          
wire            PAD_USI2_NSS;          
wire            PAD_USI2_SCLK;         
wire            PAD_USI2_SD0;          
wire            PAD_USI2_SD1;          
wire            PIN_EHS;               

wire            POUT_EHS;              

wire            apb0_dummy1_intr;      
wire            apb0_dummy2_intr;      
wire            apb0_dummy3_intr;      
wire            apb0_dummy4_intr;      
wire            apb0_dummy5_intr;      
wire            apb0_dummy7_intr;      
wire            apb0_dummy8_intr;      
wire            apb0_dummy9_intr;      
wire            apb1_dummy1_intr;      
wire            apb1_dummy2_intr;      
wire            apb1_dummy3_intr;      
wire            apb1_dummy4_intr;      
wire            apb1_dummy5_intr;      
wire            apb1_dummy6_intr;      
wire            apb1_dummy7_intr;      
wire            apb1_dummy8_intr;      
wire            apb1_gpio_psel_s5;     
wire            apb1_pmu_psel_s15;     
wire            apb1_rtc_psel_s6;      
wire    [31:0]  apb1_xx_paddr;         
wire            apb1_xx_penable;       
wire    [2 :0]  apb1_xx_pprot;         
wire    [31:0]  apb1_xx_pwdata;        
wire            apb1_xx_pwrite;        
wire            bist0_mode;            
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
wire            cpu_padmux_jtg_tms_ien; 
wire            cpu_padmux_jtg_tms_o;  
wire            cpu_padmux_jtg_tms_oe; 
wire            cpu_padmux_jtg_tms_oen; 
wire            cpu_pmu_dfs_ack;       
wire            cpu_pmu_sleep_b;       
wire            dft_clk;               
wire            dmac0_wic_intr;        
wire            ehs_pmu_clk;           
wire            els_pmu_clk;           
wire    [31:0]  gpio_apb1_prdata;      
wire    [31:0]  gpio_ioctl_porta_dr;   
wire            gpio_wic_intr;         
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
wire    [31:0]  ioctl_gpio_ext_porta;  
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
wire            lsbus_dummy0_intr;     
wire            lsbus_dummy1_intr;     
wire            lsbus_dummy2_intr;     
wire            lsbus_dummy3_intr;     
wire            main_dmemdummy0_intr;  
wire            main_dummy0_intr;      
wire            main_dummy1_intr;      
wire            main_dummy2_intr;      
wire            main_dummy3_intr;      
wire            main_imemdummy0_intr;  
wire            pad_core_clk;          
wire            pad_core_ctim_refclk;  
wire            pad_core_rst_b;        
wire    [31:0]  pad_gpio_ien;          
wire    [31:0]  pad_gpio_oen;          
wire            pad_mcurst_b;          
wire            padmux_cpu_jtg_tclk;   
wire            padmux_cpu_jtg_tms_i;  
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
wire            pwm_indata1;           
wire            pwm_indata11;          
wire            pwm_indata3;           
wire            pwm_indata5;           
wire            pwm_indata7;           
wire            pwm_indata9;           
wire            pwm_ioctl_ch0;         
wire            pwm_ioctl_ch0_ie_n;    
wire            pwm_ioctl_ch0_oe_n;    
wire            pwm_ioctl_ch1;         
wire            pwm_ioctl_ch10;        
wire            pwm_ioctl_ch10_ie_n;   
wire            pwm_ioctl_ch10_oe_n;   
wire            pwm_ioctl_ch11;        
wire            pwm_ioctl_ch11_ie_n;   
wire            pwm_ioctl_ch11_oe_n;   
wire            pwm_ioctl_ch1_ie_n;    
wire            pwm_ioctl_ch1_oe_n;    
wire            pwm_ioctl_ch2;         
wire            pwm_ioctl_ch2_ie_n;    
wire            pwm_ioctl_ch2_oe_n;    
wire            pwm_ioctl_ch3;         
wire            pwm_ioctl_ch3_ie_n;    
wire            pwm_ioctl_ch3_oe_n;    
wire            pwm_ioctl_ch4;         
wire            pwm_ioctl_ch4_ie_n;    
wire            pwm_ioctl_ch4_oe_n;    
wire            pwm_ioctl_ch5;         
wire            pwm_ioctl_ch5_ie_n;    
wire            pwm_ioctl_ch5_oe_n;    
wire            pwm_ioctl_ch6;         
wire            pwm_ioctl_ch6_ie_n;    
wire            pwm_ioctl_ch6_oe_n;    
wire            pwm_ioctl_ch7;         
wire            pwm_ioctl_ch7_ie_n;    
wire            pwm_ioctl_ch7_oe_n;    
wire            pwm_ioctl_ch8;         
wire            pwm_ioctl_ch8_ie_n;    
wire            pwm_ioctl_ch8_oe_n;    
wire            pwm_ioctl_ch9;         
wire            pwm_ioctl_ch9_ie_n;    
wire            pwm_ioctl_ch9_oe_n;    
wire            pwm_wic_intr;          
wire    [31:0]  rtc_apb1_prdata;       
wire            rtc_wic_intr;          
wire            scan_en;               
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



aou_top  x_aou_top (
  .apb1_gpio_psel_s5     (apb1_gpio_psel_s5    ),
  .apb1_pmu_psel_s15     (apb1_pmu_psel_s15    ),
  .apb1_rtc_psel_s6      (apb1_rtc_psel_s6     ),
  .apb1_xx_paddr         (apb1_xx_paddr        ),
  .apb1_xx_penable       (apb1_xx_penable      ),
  .apb1_xx_pprot         (apb1_xx_pprot        ),
  .apb1_xx_pwdata        (apb1_xx_pwdata       ),
  .apb1_xx_pwrite        (apb1_xx_pwrite       ),
  .cpu_pmu_dfs_ack       (cpu_pmu_dfs_ack      ),
  .cpu_pmu_sleep_b       (cpu_pmu_sleep_b      ),
  .dft_clk               (dft_clk              ),
  .ehs_pmu_clk           (ehs_pmu_clk          ),
  .els_pmu_clk           (els_pmu_clk          ),
  .gpio_apb1_prdata      (gpio_apb1_prdata     ),
  .gpio_ioctl_porta_dr   (gpio_ioctl_porta_dr  ),
  .gpio_wic_intr         (gpio_wic_intr        ),
  .ioctl_gpio_ext_porta  (ioctl_gpio_ext_porta ),
  .pad_core_clk          (pad_core_clk         ),
  .pad_core_ctim_refclk  (pad_core_ctim_refclk ),
  .pad_core_rst_b        (pad_core_rst_b       ),
  .pad_gpio_ien          (pad_gpio_ien         ),
  .pad_gpio_oen          (pad_gpio_oen         ),
  .pad_mcurst_b          (pad_mcurst_b         ),
  .pmu_apb0_pclk_en      (pmu_apb0_pclk_en     ),
  .pmu_apb0_s3clk        (pmu_apb0_s3clk       ),
  .pmu_apb0_s3rst_b      (pmu_apb0_s3rst_b     ),
  .pmu_apb1_pclk_en      (pmu_apb1_pclk_en     ),
  .pmu_apb1_prdata       (pmu_apb1_prdata      ),
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
  .rtc_apb1_prdata       (rtc_apb1_prdata      ),
  .rtc_wic_intr          (rtc_wic_intr         ),
  .test_mode             (test_mode            ),
  .wdt_pmu_rst_b         (wdt_pmu_rst_b        )
);



pdu_top  x_pdu_top (
  .apb0_dummy1_intr      (apb0_dummy1_intr     ),
  .apb0_dummy2_intr      (apb0_dummy2_intr     ),
  .apb0_dummy3_intr      (apb0_dummy3_intr     ),
  .apb0_dummy4_intr      (apb0_dummy4_intr     ),
  .apb0_dummy5_intr      (apb0_dummy5_intr     ),
  .apb0_dummy7_intr      (apb0_dummy7_intr     ),
  .apb0_dummy8_intr      (apb0_dummy8_intr     ),
  .apb0_dummy9_intr      (apb0_dummy9_intr     ),
  .apb1_dummy1_intr      (apb1_dummy1_intr     ),
  .apb1_dummy2_intr      (apb1_dummy2_intr     ),
  .apb1_dummy3_intr      (apb1_dummy3_intr     ),
  .apb1_dummy4_intr      (apb1_dummy4_intr     ),
  .apb1_dummy5_intr      (apb1_dummy5_intr     ),
  .apb1_dummy6_intr      (apb1_dummy6_intr     ),
  .apb1_dummy7_intr      (apb1_dummy7_intr     ),
  .apb1_dummy8_intr      (apb1_dummy8_intr     ),
  .apb1_gpio_psel_s5     (apb1_gpio_psel_s5    ),
  .apb1_pmu_psel_s15     (apb1_pmu_psel_s15    ),
  .apb1_rtc_psel_s6      (apb1_rtc_psel_s6     ),
  .apb1_xx_paddr         (apb1_xx_paddr        ),
  .apb1_xx_penable       (apb1_xx_penable      ),
  .apb1_xx_pprot         (apb1_xx_pprot        ),
  .apb1_xx_pwdata        (apb1_xx_pwdata       ),
  .apb1_xx_pwrite        (apb1_xx_pwrite       ),
  .cpu_hmain0_m0_haddr   (cpu_hmain0_m0_haddr  ),
  .cpu_hmain0_m0_hburst  (cpu_hmain0_m0_hburst ),
  .cpu_hmain0_m0_hprot   (cpu_hmain0_m0_hprot  ),
  .cpu_hmain0_m0_hsize   (cpu_hmain0_m0_hsize  ),
  .cpu_hmain0_m0_htrans  (cpu_hmain0_m0_htrans ),
  .cpu_hmain0_m0_hwdata  (cpu_hmain0_m0_hwdata ),
  .cpu_hmain0_m0_hwrite  (cpu_hmain0_m0_hwrite ),
  .cpu_hmain0_m1_haddr   (cpu_hmain0_m1_haddr  ),
  .cpu_hmain0_m1_hburst  (cpu_hmain0_m1_hburst ),
  .cpu_hmain0_m1_hprot   (cpu_hmain0_m1_hprot  ),
  .cpu_hmain0_m1_hsize   (cpu_hmain0_m1_hsize  ),
  .cpu_hmain0_m1_htrans  (cpu_hmain0_m1_htrans ),
  .cpu_hmain0_m1_hwdata  (cpu_hmain0_m1_hwdata ),
  .cpu_hmain0_m1_hwrite  (cpu_hmain0_m1_hwrite ),
  .cpu_hmain0_m2_haddr   (cpu_hmain0_m2_haddr  ),
  .cpu_hmain0_m2_hburst  (cpu_hmain0_m2_hburst ),
  .cpu_hmain0_m2_hprot   (cpu_hmain0_m2_hprot  ),
  .cpu_hmain0_m2_hsize   (cpu_hmain0_m2_hsize  ),
  .cpu_hmain0_m2_htrans  (cpu_hmain0_m2_htrans ),
  .cpu_hmain0_m2_hwdata  (cpu_hmain0_m2_hwdata ),
  .cpu_hmain0_m2_hwrite  (cpu_hmain0_m2_hwrite ),
  .dmac0_wic_intr        (dmac0_wic_intr       ),
  .gpio_apb1_prdata      (gpio_apb1_prdata     ),
  .hmain0_cpu_m0_hrdata  (hmain0_cpu_m0_hrdata ),
  .hmain0_cpu_m0_hready  (hmain0_cpu_m0_hready ),
  .hmain0_cpu_m0_hresp   (hmain0_cpu_m0_hresp  ),
  .hmain0_cpu_m1_hrdata  (hmain0_cpu_m1_hrdata ),
  .hmain0_cpu_m1_hready  (hmain0_cpu_m1_hready ),
  .hmain0_cpu_m1_hresp   (hmain0_cpu_m1_hresp  ),
  .hmain0_cpu_m2_hrdata  (hmain0_cpu_m2_hrdata ),
  .hmain0_cpu_m2_hready  (hmain0_cpu_m2_hready ),
  .hmain0_cpu_m2_hresp   (hmain0_cpu_m2_hresp  ),
  .hmain0_ismc_s0_haddr  (hmain0_ismc_s0_haddr ),
  .hmain0_ismc_s0_hprot  (hmain0_ismc_s0_hprot ),
  .hmain0_ismc_s0_hsel   (hmain0_ismc_s0_hsel  ),
  .hmain0_ismc_s0_hsize  (hmain0_ismc_s0_hsize ),
  .hmain0_ismc_s0_htrans (hmain0_ismc_s0_htrans),
  .hmain0_ismc_s0_hwdata (hmain0_ismc_s0_hwdata),
  .hmain0_ismc_s0_hwrite (hmain0_ismc_s0_hwrite),
  .hmain0_smc_s2_haddr   (hmain0_smc_s2_haddr  ),
  .hmain0_smc_s2_hprot   (hmain0_smc_s2_hprot  ),
  .hmain0_smc_s2_hsel    (hmain0_smc_s2_hsel   ),
  .hmain0_smc_s2_hsize   (hmain0_smc_s2_hsize  ),
  .hmain0_smc_s2_htrans  (hmain0_smc_s2_htrans ),
  .hmain0_smc_s2_hwdata  (hmain0_smc_s2_hwdata ),
  .hmain0_smc_s2_hwrite  (hmain0_smc_s2_hwrite ),
  .hmain0_smc_s3_haddr   (hmain0_smc_s3_haddr  ),
  .hmain0_smc_s3_hprot   (hmain0_smc_s3_hprot  ),
  .hmain0_smc_s3_hsel    (hmain0_smc_s3_hsel   ),
  .hmain0_smc_s3_hsize   (hmain0_smc_s3_hsize  ),
  .hmain0_smc_s3_htrans  (hmain0_smc_s3_htrans ),
  .hmain0_smc_s3_hwdata  (hmain0_smc_s3_hwdata ),
  .hmain0_smc_s3_hwrite  (hmain0_smc_s3_hwrite ),
  .hmain0_smc_s4_haddr   (hmain0_smc_s4_haddr  ),
  .hmain0_smc_s4_hprot   (hmain0_smc_s4_hprot  ),
  .hmain0_smc_s4_hsel    (hmain0_smc_s4_hsel   ),
  .hmain0_smc_s4_hsize   (hmain0_smc_s4_hsize  ),
  .hmain0_smc_s4_htrans  (hmain0_smc_s4_htrans ),
  .hmain0_smc_s4_hwdata  (hmain0_smc_s4_hwdata ),
  .hmain0_smc_s4_hwrite  (hmain0_smc_s4_hwrite ),
  .ioctl_pwm_cap0        (ioctl_pwm_cap0       ),
  .ioctl_pwm_cap10       (ioctl_pwm_cap10      ),
  .ioctl_pwm_cap2        (ioctl_pwm_cap2       ),
  .ioctl_pwm_cap4        (ioctl_pwm_cap4       ),
  .ioctl_pwm_cap6        (ioctl_pwm_cap6       ),
  .ioctl_pwm_cap8        (ioctl_pwm_cap8       ),
  .ioctl_pwm_fault       (ioctl_pwm_fault      ),
  .ioctl_usi0_nss_in     (ioctl_usi0_nss_in    ),
  .ioctl_usi0_sclk_in    (ioctl_usi0_sclk_in   ),
  .ioctl_usi0_sd0_in     (ioctl_usi0_sd0_in    ),
  .ioctl_usi0_sd1_in     (ioctl_usi0_sd1_in    ),
  .ioctl_usi1_nss_in     (ioctl_usi1_nss_in    ),
  .ioctl_usi1_sclk_in    (ioctl_usi1_sclk_in   ),
  .ioctl_usi1_sd0_in     (ioctl_usi1_sd0_in    ),
  .ioctl_usi1_sd1_in     (ioctl_usi1_sd1_in    ),
  .ioctl_usi2_nss_in     (ioctl_usi2_nss_in    ),
  .ioctl_usi2_sclk_in    (ioctl_usi2_sclk_in   ),
  .ioctl_usi2_sd0_in     (ioctl_usi2_sd0_in    ),
  .ioctl_usi2_sd1_in     (ioctl_usi2_sd1_in    ),
  .ismc_hmain0_s0_hrdata (ismc_hmain0_s0_hrdata),
  .ismc_hmain0_s0_hready (ismc_hmain0_s0_hready),
  .ismc_hmain0_s0_hresp  (ismc_hmain0_s0_hresp ),
  .lsbus_dummy0_intr     (lsbus_dummy0_intr    ),
  .lsbus_dummy1_intr     (lsbus_dummy1_intr    ),
  .lsbus_dummy2_intr     (lsbus_dummy2_intr    ),
  .lsbus_dummy3_intr     (lsbus_dummy3_intr    ),
  .main_dmemdummy0_intr  (main_dmemdummy0_intr ),
  .main_dummy0_intr      (main_dummy0_intr     ),
  .main_dummy1_intr      (main_dummy1_intr     ),
  .main_dummy2_intr      (main_dummy2_intr     ),
  .main_dummy3_intr      (main_dummy3_intr     ),
  .main_imemdummy0_intr  (main_imemdummy0_intr ),
  .pmu_apb0_pclk_en      (pmu_apb0_pclk_en     ),
  .pmu_apb0_s3clk        (pmu_apb0_s3clk       ),
  .pmu_apb0_s3rst_b      (pmu_apb0_s3rst_b     ),
  .pmu_apb1_pclk_en      (pmu_apb1_pclk_en     ),
  .pmu_apb1_prdata       (pmu_apb1_prdata      ),
  .pmu_apb1_s3clk        (pmu_apb1_s3clk       ),
  .pmu_apb1_s3rst_b      (pmu_apb1_s3rst_b     ),
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
  .pwm_ioctl_ch0         (pwm_ioctl_ch0        ),
  .pwm_ioctl_ch0_oe_n    (pwm_ioctl_ch0_oe_n   ),
  .pwm_ioctl_ch1         (pwm_ioctl_ch1        ),
  .pwm_ioctl_ch10        (pwm_ioctl_ch10       ),
  .pwm_ioctl_ch10_oe_n   (pwm_ioctl_ch10_oe_n  ),
  .pwm_ioctl_ch11        (pwm_ioctl_ch11       ),
  .pwm_ioctl_ch11_oe_n   (pwm_ioctl_ch11_oe_n  ),
  .pwm_ioctl_ch1_oe_n    (pwm_ioctl_ch1_oe_n   ),
  .pwm_ioctl_ch2         (pwm_ioctl_ch2        ),
  .pwm_ioctl_ch2_oe_n    (pwm_ioctl_ch2_oe_n   ),
  .pwm_ioctl_ch3         (pwm_ioctl_ch3        ),
  .pwm_ioctl_ch3_oe_n    (pwm_ioctl_ch3_oe_n   ),
  .pwm_ioctl_ch4         (pwm_ioctl_ch4        ),
  .pwm_ioctl_ch4_oe_n    (pwm_ioctl_ch4_oe_n   ),
  .pwm_ioctl_ch5         (pwm_ioctl_ch5        ),
  .pwm_ioctl_ch5_oe_n    (pwm_ioctl_ch5_oe_n   ),
  .pwm_ioctl_ch6         (pwm_ioctl_ch6        ),
  .pwm_ioctl_ch6_oe_n    (pwm_ioctl_ch6_oe_n   ),
  .pwm_ioctl_ch7         (pwm_ioctl_ch7        ),
  .pwm_ioctl_ch7_oe_n    (pwm_ioctl_ch7_oe_n   ),
  .pwm_ioctl_ch8         (pwm_ioctl_ch8        ),
  .pwm_ioctl_ch8_oe_n    (pwm_ioctl_ch8_oe_n   ),
  .pwm_ioctl_ch9         (pwm_ioctl_ch9        ),
  .pwm_ioctl_ch9_oe_n    (pwm_ioctl_ch9_oe_n   ),
  .pwm_wic_intr          (pwm_wic_intr         ),
  .rtc_apb1_prdata       (rtc_apb1_prdata      ),
  .scan_mode             (scan_mode            ),
  .smc_hmain0_s2_hrdata  (smc_hmain0_s2_hrdata ),
  .smc_hmain0_s2_hready  (smc_hmain0_s2_hready ),
  .smc_hmain0_s2_hresp   (smc_hmain0_s2_hresp  ),
  .smc_hmain0_s3_hrdata  (smc_hmain0_s3_hrdata ),
  .smc_hmain0_s3_hready  (smc_hmain0_s3_hready ),
  .smc_hmain0_s3_hresp   (smc_hmain0_s3_hresp  ),
  .smc_hmain0_s4_hrdata  (smc_hmain0_s4_hrdata ),
  .smc_hmain0_s4_hready  (smc_hmain0_s4_hready ),
  .smc_hmain0_s4_hresp   (smc_hmain0_s4_hresp  ),
  .test_mode             (test_mode            ),
  .tim0_wic_intr         (tim0_wic_intr        ),
  .tim1_wic_intr         (tim1_wic_intr        ),
  .tim2_wic_intr         (tim2_wic_intr        ),
  .tim3_wic_intr         (tim3_wic_intr        ),
  .tim4_wic_intr         (tim4_wic_intr        ),
  .tim5_wic_intr         (tim5_wic_intr        ),
  .tim6_wic_intr         (tim6_wic_intr        ),
  .tim7_wic_intr         (tim7_wic_intr        ),
  .usi0_ioctl_nss_ie_n   (usi0_ioctl_nss_ie_n  ),
  .usi0_ioctl_nss_oe_n   (usi0_ioctl_nss_oe_n  ),
  .usi0_ioctl_nss_out    (usi0_ioctl_nss_out   ),
  .usi0_ioctl_sclk_ie_n  (usi0_ioctl_sclk_ie_n ),
  .usi0_ioctl_sclk_oe_n  (usi0_ioctl_sclk_oe_n ),
  .usi0_ioctl_sclk_out   (usi0_ioctl_sclk_out  ),
  .usi0_ioctl_sd0_ie_n   (usi0_ioctl_sd0_ie_n  ),
  .usi0_ioctl_sd0_oe_n   (usi0_ioctl_sd0_oe_n  ),
  .usi0_ioctl_sd0_out    (usi0_ioctl_sd0_out   ),
  .usi0_ioctl_sd1_ie_n   (usi0_ioctl_sd1_ie_n  ),
  .usi0_ioctl_sd1_oe_n   (usi0_ioctl_sd1_oe_n  ),
  .usi0_ioctl_sd1_out    (usi0_ioctl_sd1_out   ),
  .usi0_wic_intr         (usi0_wic_intr        ),
  .usi1_ioctl_nss_ie_n   (usi1_ioctl_nss_ie_n  ),
  .usi1_ioctl_nss_oe_n   (usi1_ioctl_nss_oe_n  ),
  .usi1_ioctl_nss_out    (usi1_ioctl_nss_out   ),
  .usi1_ioctl_sclk_ie_n  (usi1_ioctl_sclk_ie_n ),
  .usi1_ioctl_sclk_oe_n  (usi1_ioctl_sclk_oe_n ),
  .usi1_ioctl_sclk_out   (usi1_ioctl_sclk_out  ),
  .usi1_ioctl_sd0_ie_n   (usi1_ioctl_sd0_ie_n  ),
  .usi1_ioctl_sd0_oe_n   (usi1_ioctl_sd0_oe_n  ),
  .usi1_ioctl_sd0_out    (usi1_ioctl_sd0_out   ),
  .usi1_ioctl_sd1_ie_n   (usi1_ioctl_sd1_ie_n  ),
  .usi1_ioctl_sd1_oe_n   (usi1_ioctl_sd1_oe_n  ),
  .usi1_ioctl_sd1_out    (usi1_ioctl_sd1_out   ),
  .usi1_wic_intr         (usi1_wic_intr        ),
  .usi2_ioctl_nss_ie_n   (usi2_ioctl_nss_ie_n  ),
  .usi2_ioctl_nss_oe_n   (usi2_ioctl_nss_oe_n  ),
  .usi2_ioctl_nss_out    (usi2_ioctl_nss_out   ),
  .usi2_ioctl_sclk_ie_n  (usi2_ioctl_sclk_ie_n ),
  .usi2_ioctl_sclk_oe_n  (usi2_ioctl_sclk_oe_n ),
  .usi2_ioctl_sclk_out   (usi2_ioctl_sclk_out  ),
  .usi2_ioctl_sd0_ie_n   (usi2_ioctl_sd0_ie_n  ),
  .usi2_ioctl_sd0_oe_n   (usi2_ioctl_sd0_oe_n  ),
  .usi2_ioctl_sd0_out    (usi2_ioctl_sd0_out   ),
  .usi2_ioctl_sd1_ie_n   (usi2_ioctl_sd1_ie_n  ),
  .usi2_ioctl_sd1_oe_n   (usi2_ioctl_sd1_oe_n  ),
  .usi2_ioctl_sd1_out    (usi2_ioctl_sd1_out   ),
  .usi2_wic_intr         (usi2_wic_intr        ),
  .wdt_pmu_rst_b         (wdt_pmu_rst_b        ),
  .wdt_wic_intr          (wdt_wic_intr         )
);



core_top  x_cpu_top (
  .apb0_dummy1_intr      (apb0_dummy1_intr     ),
  .apb0_dummy2_intr      (apb0_dummy2_intr     ),
  .apb0_dummy3_intr      (apb0_dummy3_intr     ),
  .apb0_dummy4_intr      (apb0_dummy4_intr     ),
  .apb0_dummy5_intr      (apb0_dummy5_intr     ),
  .apb0_dummy7_intr      (apb0_dummy7_intr     ),
  .apb0_dummy8_intr      (apb0_dummy8_intr     ),
  .apb0_dummy9_intr      (apb0_dummy9_intr     ),
  .apb1_dummy1_intr      (apb1_dummy1_intr     ),
  .apb1_dummy2_intr      (apb1_dummy2_intr     ),
  .apb1_dummy3_intr      (apb1_dummy3_intr     ),
  .apb1_dummy4_intr      (apb1_dummy4_intr     ),
  .apb1_dummy5_intr      (apb1_dummy5_intr     ),
  .apb1_dummy6_intr      (apb1_dummy6_intr     ),
  .apb1_dummy7_intr      (apb1_dummy7_intr     ),
  .apb1_dummy8_intr      (apb1_dummy8_intr     ),
  .bist0_mode            (bist0_mode           ),
  .cpu_hmain0_m0_haddr   (cpu_hmain0_m0_haddr  ),
  .cpu_hmain0_m0_hburst  (cpu_hmain0_m0_hburst ),
  .cpu_hmain0_m0_hprot   (cpu_hmain0_m0_hprot  ),
  .cpu_hmain0_m0_hsize   (cpu_hmain0_m0_hsize  ),
  .cpu_hmain0_m0_htrans  (cpu_hmain0_m0_htrans ),
  .cpu_hmain0_m0_hwdata  (cpu_hmain0_m0_hwdata ),
  .cpu_hmain0_m0_hwrite  (cpu_hmain0_m0_hwrite ),
  .cpu_hmain0_m1_haddr   (cpu_hmain0_m1_haddr  ),
  .cpu_hmain0_m1_hburst  (cpu_hmain0_m1_hburst ),
  .cpu_hmain0_m1_hprot   (cpu_hmain0_m1_hprot  ),
  .cpu_hmain0_m1_hsize   (cpu_hmain0_m1_hsize  ),
  .cpu_hmain0_m1_htrans  (cpu_hmain0_m1_htrans ),
  .cpu_hmain0_m1_hwdata  (cpu_hmain0_m1_hwdata ),
  .cpu_hmain0_m1_hwrite  (cpu_hmain0_m1_hwrite ),
  .cpu_hmain0_m2_haddr   (cpu_hmain0_m2_haddr  ),
  .cpu_hmain0_m2_hburst  (cpu_hmain0_m2_hburst ),
  .cpu_hmain0_m2_hprot   (cpu_hmain0_m2_hprot  ),
  .cpu_hmain0_m2_hsize   (cpu_hmain0_m2_hsize  ),
  .cpu_hmain0_m2_htrans  (cpu_hmain0_m2_htrans ),
  .cpu_hmain0_m2_hwdata  (cpu_hmain0_m2_hwdata ),
  .cpu_hmain0_m2_hwrite  (cpu_hmain0_m2_hwrite ),
  .cpu_padmux_jtg_tms_o  (cpu_padmux_jtg_tms_o ),
  .cpu_padmux_jtg_tms_oe (cpu_padmux_jtg_tms_oe),
  .cpu_pmu_dfs_ack       (cpu_pmu_dfs_ack      ),
  .cpu_pmu_sleep_b       (cpu_pmu_sleep_b      ),
  .dft_clk               (dft_clk              ),
  .dmac0_wic_intr        (dmac0_wic_intr       ),
  .gpio_wic_intr         (gpio_wic_intr        ),
  .hmain0_cpu_m0_hrdata  (hmain0_cpu_m0_hrdata ),
  .hmain0_cpu_m0_hready  (hmain0_cpu_m0_hready ),
  .hmain0_cpu_m0_hresp   (hmain0_cpu_m0_hresp  ),
  .hmain0_cpu_m1_hrdata  (hmain0_cpu_m1_hrdata ),
  .hmain0_cpu_m1_hready  (hmain0_cpu_m1_hready ),
  .hmain0_cpu_m1_hresp   (hmain0_cpu_m1_hresp  ),
  .hmain0_cpu_m2_hrdata  (hmain0_cpu_m2_hrdata ),
  .hmain0_cpu_m2_hready  (hmain0_cpu_m2_hready ),
  .hmain0_cpu_m2_hresp   (hmain0_cpu_m2_hresp  ),
  .lsbus_dummy0_intr     (lsbus_dummy0_intr    ),
  .lsbus_dummy1_intr     (lsbus_dummy1_intr    ),
  .lsbus_dummy2_intr     (lsbus_dummy2_intr    ),
  .lsbus_dummy3_intr     (lsbus_dummy3_intr    ),
  .main_dmemdummy0_intr  (main_dmemdummy0_intr ),
  .main_dummy0_intr      (main_dummy0_intr     ),
  .main_dummy1_intr      (main_dummy1_intr     ),
  .main_dummy2_intr      (main_dummy2_intr     ),
  .main_dummy3_intr      (main_dummy3_intr     ),
  .main_imemdummy0_intr  (main_imemdummy0_intr ),
  .pad_core_clk          (pad_core_clk         ),
  .pad_core_ctim_refclk  (pad_core_ctim_refclk ),
  .pad_core_rst_b        (pad_core_rst_b       ),
  .padmux_cpu_jtg_tclk   (padmux_cpu_jtg_tclk  ),
  .padmux_cpu_jtg_tms_i  (padmux_cpu_jtg_tms_i ),
  .pmu_cpu_dfs_req       (pmu_cpu_dfs_req      ),
  .pmu_wic_intr          (pmu_wic_intr         ),
  .pwm_wic_intr          (pwm_wic_intr         ),
  .rtc_wic_intr          (rtc_wic_intr         ),
  .scan_en               (scan_en              ),
  .scan_mode             (scan_mode            ),
  .test_mode             (test_mode            ),
  .tim0_wic_intr         (tim0_wic_intr        ),
  .tim1_wic_intr         (tim1_wic_intr        ),
  .tim2_wic_intr         (tim2_wic_intr        ),
  .tim3_wic_intr         (tim3_wic_intr        ),
  .tim4_wic_intr         (tim4_wic_intr        ),
  .tim5_wic_intr         (tim5_wic_intr        ),
  .tim6_wic_intr         (tim6_wic_intr        ),
  .tim7_wic_intr         (tim7_wic_intr        ),
  .usi0_wic_intr         (usi0_wic_intr        ),
  .usi1_wic_intr         (usi1_wic_intr        ),
  .usi2_wic_intr         (usi2_wic_intr        ),
  .wdt_wic_intr          (wdt_wic_intr         )
);



retu_top  x_retu_top (
  .hmain0_ismc_s0_haddr  (hmain0_ismc_s0_haddr ),
  .hmain0_ismc_s0_hprot  (hmain0_ismc_s0_hprot ),
  .hmain0_ismc_s0_hsel   (hmain0_ismc_s0_hsel  ),
  .hmain0_ismc_s0_hsize  (hmain0_ismc_s0_hsize ),
  .hmain0_ismc_s0_htrans (hmain0_ismc_s0_htrans),
  .hmain0_ismc_s0_hwdata (hmain0_ismc_s0_hwdata),
  .hmain0_ismc_s0_hwrite (hmain0_ismc_s0_hwrite),
  .hmain0_smc_s2_haddr   (hmain0_smc_s2_haddr  ),
  .hmain0_smc_s2_hprot   (hmain0_smc_s2_hprot  ),
  .hmain0_smc_s2_hsel    (hmain0_smc_s2_hsel   ),
  .hmain0_smc_s2_hsize   (hmain0_smc_s2_hsize  ),
  .hmain0_smc_s2_htrans  (hmain0_smc_s2_htrans ),
  .hmain0_smc_s2_hwdata  (hmain0_smc_s2_hwdata ),
  .hmain0_smc_s2_hwrite  (hmain0_smc_s2_hwrite ),
  .hmain0_smc_s3_haddr   (hmain0_smc_s3_haddr  ),
  .hmain0_smc_s3_hprot   (hmain0_smc_s3_hprot  ),
  .hmain0_smc_s3_hsel    (hmain0_smc_s3_hsel   ),
  .hmain0_smc_s3_hsize   (hmain0_smc_s3_hsize  ),
  .hmain0_smc_s3_htrans  (hmain0_smc_s3_htrans ),
  .hmain0_smc_s3_hwdata  (hmain0_smc_s3_hwdata ),
  .hmain0_smc_s3_hwrite  (hmain0_smc_s3_hwrite ),
  .hmain0_smc_s4_haddr   (hmain0_smc_s4_haddr  ),
  .hmain0_smc_s4_hprot   (hmain0_smc_s4_hprot  ),
  .hmain0_smc_s4_hsel    (hmain0_smc_s4_hsel   ),
  .hmain0_smc_s4_hsize   (hmain0_smc_s4_hsize  ),
  .hmain0_smc_s4_htrans  (hmain0_smc_s4_htrans ),
  .hmain0_smc_s4_hwdata  (hmain0_smc_s4_hwdata ),
  .hmain0_smc_s4_hwrite  (hmain0_smc_s4_hwrite ),
  .ismc_hmain0_s0_hrdata (ismc_hmain0_s0_hrdata),
  .ismc_hmain0_s0_hready (ismc_hmain0_s0_hready),
  .ismc_hmain0_s0_hresp  (ismc_hmain0_s0_hresp ),
  .pmu_smc_hclk          (pmu_smc_hclk         ),
  .pmu_smc_hrst_b        (pmu_smc_hrst_b       ),
  .smc_hmain0_s2_hrdata  (smc_hmain0_s2_hrdata ),
  .smc_hmain0_s2_hready  (smc_hmain0_s2_hready ),
  .smc_hmain0_s2_hresp   (smc_hmain0_s2_hresp  ),
  .smc_hmain0_s3_hrdata  (smc_hmain0_s3_hrdata ),
  .smc_hmain0_s3_hready  (smc_hmain0_s3_hready ),
  .smc_hmain0_s3_hresp   (smc_hmain0_s3_hresp  ),
  .smc_hmain0_s4_hrdata  (smc_hmain0_s4_hrdata ),
  .smc_hmain0_s4_hready  (smc_hmain0_s4_hready ),
  .smc_hmain0_s4_hresp   (smc_hmain0_s4_hresp  )
);



PAD_OSC_IO  x_PAD_EHS (
  .CLK         (ehs_pmu_clk),
  .EN          (1'b1       ),
  .XOSC_IN     (PIN_EHS    ),
  .XOSC_OUT    (POUT_EHS   )
);















assign els_pmu_clk = ehs_pmu_clk;








PAD_DIG_IO  x_PAD_MCURST (
  .ID           (pad_mcurst_b),
  .IEN          (1'b0        ),
  .OD           (1'b0        ),
  .OEN          (1'b1        ),
  .PAD          (PAD_MCURST  )
);








assign cpu_padmux_jtg_tms_oen = ~cpu_padmux_jtg_tms_oe;
assign cpu_padmux_jtg_tms_ien = cpu_padmux_jtg_tms_oe;


PAD_DIG_IO  x_PAD_JTAG_TMS (
  .ID                     (padmux_cpu_jtg_tms_i  ),
  .IEN                    (cpu_padmux_jtg_tms_ien),
  .OD                     (cpu_padmux_jtg_tms_o  ),
  .OEN                    (cpu_padmux_jtg_tms_oen),
  .PAD                    (PAD_JTAG_TMS          )
);











PAD_DIG_IO  x_PAD_JTAG_TCLK (
  .ID                  (padmux_cpu_jtg_tclk),
  .IEN                 (1'b0               ),
  .OD                  (1'b0               ),
  .OEN                 (1'b1               ),
  .PAD                 (PAD_JTAG_TCLK      )
);












PAD_DIG_IO  x_PAD_GPIO_0 (
  .ID                      (ioctl_gpio_ext_porta[0]),
  .IEN                     (pad_gpio_ien[0]        ),
  .OD                      (gpio_ioctl_porta_dr[0] ),
  .OEN                     (pad_gpio_oen[0]        ),
  .PAD                     (PAD_GPIO_0             )
);









PAD_DIG_IO  x_PAD_GPIO_1 (
  .ID                      (ioctl_gpio_ext_porta[1]),
  .IEN                     (pad_gpio_ien[1]        ),
  .OD                      (gpio_ioctl_porta_dr[1] ),
  .OEN                     (pad_gpio_oen[1]        ),
  .PAD                     (PAD_GPIO_1             )
);











PAD_DIG_IO  x_PAD_GPIO_2 (
  .ID                      (ioctl_gpio_ext_porta[2]),
  .IEN                     (pad_gpio_ien[2]        ),
  .OD                      (gpio_ioctl_porta_dr[2] ),
  .OEN                     (pad_gpio_oen[2]        ),
  .PAD                     (PAD_GPIO_2             )
);











PAD_DIG_IO  x_PAD_GPIO_3 (
  .ID                      (ioctl_gpio_ext_porta[3]),
  .IEN                     (pad_gpio_ien[3]        ),
  .OD                      (gpio_ioctl_porta_dr[3] ),
  .OEN                     (pad_gpio_oen[3]        ),
  .PAD                     (PAD_GPIO_3             )
);











PAD_DIG_IO  x_PAD_GPIO_4 (
  .ID                      (ioctl_gpio_ext_porta[4]),
  .IEN                     (pad_gpio_ien[4]        ),
  .OD                      (gpio_ioctl_porta_dr[4] ),
  .OEN                     (pad_gpio_oen[4]        ),
  .PAD                     (PAD_GPIO_4             )
);











PAD_DIG_IO  x_PAD_GPIO_5 (
  .ID                      (ioctl_gpio_ext_porta[5]),
  .IEN                     (pad_gpio_ien[5]        ),
  .OD                      (gpio_ioctl_porta_dr[5] ),
  .OEN                     (pad_gpio_oen[5]        ),
  .PAD                     (PAD_GPIO_5             )
);











PAD_DIG_IO  x_PAD_GPIO_6 (
  .ID                      (ioctl_gpio_ext_porta[6]),
  .IEN                     (pad_gpio_ien[6]        ),
  .OD                      (gpio_ioctl_porta_dr[6] ),
  .OEN                     (pad_gpio_oen[6]        ),
  .PAD                     (PAD_GPIO_6             )
);











PAD_DIG_IO  x_PAD_GPIO_7 (
  .ID                      (ioctl_gpio_ext_porta[7]),
  .IEN                     (pad_gpio_ien[7]        ),
  .OD                      (gpio_ioctl_porta_dr[7] ),
  .OEN                     (pad_gpio_oen[7]        ),
  .PAD                     (PAD_GPIO_7             )
);











PAD_DIG_IO  x_PAD_GPIO_8 (
  .ID                      (ioctl_gpio_ext_porta[8]),
  .IEN                     (pad_gpio_ien[8]        ),
  .OD                      (gpio_ioctl_porta_dr[8] ),
  .OEN                     (pad_gpio_oen[8]        ),
  .PAD                     (PAD_GPIO_8             )
);











PAD_DIG_IO  x_PAD_GPIO_9 (
  .ID                      (ioctl_gpio_ext_porta[9]),
  .IEN                     (pad_gpio_ien[9]        ),
  .OD                      (gpio_ioctl_porta_dr[9] ),
  .OEN                     (pad_gpio_oen[9]        ),
  .PAD                     (PAD_GPIO_9             )
);











PAD_DIG_IO  x_PAD_GPIO_10 (
  .ID                       (ioctl_gpio_ext_porta[10]),
  .IEN                      (pad_gpio_ien[10]        ),
  .OD                       (gpio_ioctl_porta_dr[10] ),
  .OEN                      (pad_gpio_oen[10]        ),
  .PAD                      (PAD_GPIO_10             )
);









PAD_DIG_IO  x_PAD_GPIO_11 (
  .ID                       (ioctl_gpio_ext_porta[11]),
  .IEN                      (pad_gpio_ien[11]        ),
  .OD                       (gpio_ioctl_porta_dr[11] ),
  .OEN                      (pad_gpio_oen[11]        ),
  .PAD                      (PAD_GPIO_11             )
);











PAD_DIG_IO  x_PAD_GPIO_12 (
  .ID                       (ioctl_gpio_ext_porta[12]),
  .IEN                      (pad_gpio_ien[12]        ),
  .OD                       (gpio_ioctl_porta_dr[12] ),
  .OEN                      (pad_gpio_oen[12]        ),
  .PAD                      (PAD_GPIO_12             )
);











PAD_DIG_IO  x_PAD_GPIO_13 (
  .ID                       (ioctl_gpio_ext_porta[13]),
  .IEN                      (pad_gpio_ien[13]        ),
  .OD                       (gpio_ioctl_porta_dr[13] ),
  .OEN                      (pad_gpio_oen[13]        ),
  .PAD                      (PAD_GPIO_13             )
);











PAD_DIG_IO  x_PAD_GPIO_14 (
  .ID                       (ioctl_gpio_ext_porta[14]),
  .IEN                      (pad_gpio_ien[14]        ),
  .OD                       (gpio_ioctl_porta_dr[14] ),
  .OEN                      (pad_gpio_oen[14]        ),
  .PAD                      (PAD_GPIO_14             )
);











PAD_DIG_IO  x_PAD_GPIO_15 (
  .ID                       (ioctl_gpio_ext_porta[15]),
  .IEN                      (pad_gpio_ien[15]        ),
  .OD                       (gpio_ioctl_porta_dr[15] ),
  .OEN                      (pad_gpio_oen[15]        ),
  .PAD                      (PAD_GPIO_15             )
);











PAD_DIG_IO  x_PAD_GPIO_16 (
  .ID                       (ioctl_gpio_ext_porta[16]),
  .IEN                      (pad_gpio_ien[16]        ),
  .OD                       (gpio_ioctl_porta_dr[16] ),
  .OEN                      (pad_gpio_oen[16]        ),
  .PAD                      (PAD_GPIO_16             )
);











PAD_DIG_IO  x_PAD_GPIO_17 (
  .ID                       (ioctl_gpio_ext_porta[17]),
  .IEN                      (pad_gpio_ien[17]        ),
  .OD                       (gpio_ioctl_porta_dr[17] ),
  .OEN                      (pad_gpio_oen[17]        ),
  .PAD                      (PAD_GPIO_17             )
);











PAD_DIG_IO  x_PAD_GPIO_18 (
  .ID                       (ioctl_gpio_ext_porta[18]),
  .IEN                      (pad_gpio_ien[18]        ),
  .OD                       (gpio_ioctl_porta_dr[18] ),
  .OEN                      (pad_gpio_oen[18]        ),
  .PAD                      (PAD_GPIO_18             )
);











PAD_DIG_IO  x_PAD_GPIO_19 (
  .ID                       (ioctl_gpio_ext_porta[19]),
  .IEN                      (pad_gpio_ien[19]        ),
  .OD                       (gpio_ioctl_porta_dr[19] ),
  .OEN                      (pad_gpio_oen[19]        ),
  .PAD                      (PAD_GPIO_19             )
);













PAD_DIG_IO  x_PAD_GPIO_20 (
  .ID                       (ioctl_gpio_ext_porta[20]),
  .IEN                      (pad_gpio_ien[20]        ),
  .OD                       (gpio_ioctl_porta_dr[20] ),
  .OEN                      (pad_gpio_oen[20]        ),
  .PAD                      (PAD_GPIO_20             )
);









PAD_DIG_IO  x_PAD_GPIO_21 (
  .ID                       (ioctl_gpio_ext_porta[21]),
  .IEN                      (pad_gpio_ien[21]        ),
  .OD                       (gpio_ioctl_porta_dr[21] ),
  .OEN                      (pad_gpio_oen[21]        ),
  .PAD                      (PAD_GPIO_21             )
);











PAD_DIG_IO  x_PAD_GPIO_22 (
  .ID                       (ioctl_gpio_ext_porta[22]),
  .IEN                      (pad_gpio_ien[22]        ),
  .OD                       (gpio_ioctl_porta_dr[22] ),
  .OEN                      (pad_gpio_oen[22]        ),
  .PAD                      (PAD_GPIO_22             )
);











PAD_DIG_IO  x_PAD_GPIO_23 (
  .ID                       (ioctl_gpio_ext_porta[23]),
  .IEN                      (pad_gpio_ien[23]        ),
  .OD                       (gpio_ioctl_porta_dr[23] ),
  .OEN                      (pad_gpio_oen[23]        ),
  .PAD                      (PAD_GPIO_23             )
);











PAD_DIG_IO  x_PAD_GPIO_24 (
  .ID                       (ioctl_gpio_ext_porta[24]),
  .IEN                      (pad_gpio_ien[24]        ),
  .OD                       (gpio_ioctl_porta_dr[24] ),
  .OEN                      (pad_gpio_oen[24]        ),
  .PAD                      (PAD_GPIO_24             )
);











PAD_DIG_IO  x_PAD_GPIO_25 (
  .ID                       (ioctl_gpio_ext_porta[25]),
  .IEN                      (pad_gpio_ien[25]        ),
  .OD                       (gpio_ioctl_porta_dr[25] ),
  .OEN                      (pad_gpio_oen[25]        ),
  .PAD                      (PAD_GPIO_25             )
);











PAD_DIG_IO  x_PAD_GPIO_26 (
  .ID                       (ioctl_gpio_ext_porta[26]),
  .IEN                      (pad_gpio_ien[26]        ),
  .OD                       (gpio_ioctl_porta_dr[26] ),
  .OEN                      (pad_gpio_oen[26]        ),
  .PAD                      (PAD_GPIO_26             )
);











PAD_DIG_IO  x_PAD_GPIO_27 (
  .ID                       (ioctl_gpio_ext_porta[27]),
  .IEN                      (pad_gpio_ien[27]        ),
  .OD                       (gpio_ioctl_porta_dr[27] ),
  .OEN                      (pad_gpio_oen[27]        ),
  .PAD                      (PAD_GPIO_27             )
);











PAD_DIG_IO  x_PAD_GPIO_28 (
  .ID                       (ioctl_gpio_ext_porta[28]),
  .IEN                      (pad_gpio_ien[28]        ),
  .OD                       (gpio_ioctl_porta_dr[28] ),
  .OEN                      (pad_gpio_oen[28]        ),
  .PAD                      (PAD_GPIO_28             )
);











PAD_DIG_IO  x_PAD_GPIO_29 (
  .ID                       (ioctl_gpio_ext_porta[29]),
  .IEN                      (pad_gpio_ien[29]        ),
  .OD                       (gpio_ioctl_porta_dr[29] ),
  .OEN                      (pad_gpio_oen[29]        ),
  .PAD                      (PAD_GPIO_29             )
);











PAD_DIG_IO  x_PAD_GPIO_30 (
  .ID                       (ioctl_gpio_ext_porta[30]),
  .IEN                      (pad_gpio_ien[30]        ),
  .OD                       (gpio_ioctl_porta_dr[30] ),
  .OEN                      (pad_gpio_oen[30]        ),
  .PAD                      (PAD_GPIO_30             )
);












PAD_DIG_IO  x_PAD_GPIO_31 (
  .ID                       (ioctl_gpio_ext_porta[31]),
  .IEN                      (pad_gpio_ien[31]        ),
  .OD                       (gpio_ioctl_porta_dr[31] ),
  .OEN                      (pad_gpio_oen[31]        ),
  .PAD                      (PAD_GPIO_31             )
);









assign pwm_ioctl_ch0_ie_n = ~pwm_ioctl_ch0_oe_n;
assign pwm_ioctl_ch1_ie_n = ~pwm_ioctl_ch1_oe_n;
assign pwm_ioctl_ch2_ie_n = ~pwm_ioctl_ch2_oe_n;
assign pwm_ioctl_ch3_ie_n = ~pwm_ioctl_ch3_oe_n;
assign pwm_ioctl_ch4_ie_n = ~pwm_ioctl_ch4_oe_n;
assign pwm_ioctl_ch5_ie_n = ~pwm_ioctl_ch5_oe_n;
assign pwm_ioctl_ch6_ie_n = ~pwm_ioctl_ch6_oe_n;
assign pwm_ioctl_ch7_ie_n = ~pwm_ioctl_ch7_oe_n;
assign pwm_ioctl_ch8_ie_n = ~pwm_ioctl_ch8_oe_n;
assign pwm_ioctl_ch9_ie_n = ~pwm_ioctl_ch9_oe_n;
assign pwm_ioctl_ch10_ie_n = ~pwm_ioctl_ch10_oe_n;
assign pwm_ioctl_ch11_ie_n = ~pwm_ioctl_ch11_oe_n;





PAD_DIG_IO  x_PAD_PWM_FAULT (
  .ID              (ioctl_pwm_fault),
  .IEN             (1'b0           ),
  .OD              (1'b0           ),
  .OEN             (1'b1           ),
  .PAD             (PAD_PWM_FAULT  )
);










PAD_DIG_IO  x_PAD_PWM_CH0 (
  .ID                 (ioctl_pwm_cap0    ),
  .IEN                (pwm_ioctl_ch0_ie_n),
  .OD                 (pwm_ioctl_ch0     ),
  .OEN                (pwm_ioctl_ch0_oe_n),
  .PAD                (PAD_PWM_CH0       )
);










PAD_DIG_IO  x_PAD_PWM_CH1 (
  .ID                 (pwm_indata1       ),
  .IEN                (pwm_ioctl_ch1_ie_n),
  .OD                 (pwm_ioctl_ch1     ),
  .OEN                (pwm_ioctl_ch1_oe_n),
  .PAD                (PAD_PWM_CH1       )
);










PAD_DIG_IO  x_PAD_PWM_CH2 (
  .ID                 (ioctl_pwm_cap2    ),
  .IEN                (pwm_ioctl_ch2_ie_n),
  .OD                 (pwm_ioctl_ch2     ),
  .OEN                (pwm_ioctl_ch2_oe_n),
  .PAD                (PAD_PWM_CH2       )
);










PAD_DIG_IO  x_PAD_PWM_CH3 (
  .ID                 (pwm_indata3       ),
  .IEN                (pwm_ioctl_ch3_ie_n),
  .OD                 (pwm_ioctl_ch3     ),
  .OEN                (pwm_ioctl_ch3_oe_n),
  .PAD                (PAD_PWM_CH3       )
);










PAD_DIG_IO  x_PAD_PWM_CH4 (
  .ID                 (ioctl_pwm_cap4    ),
  .IEN                (pwm_ioctl_ch4_ie_n),
  .OD                 (pwm_ioctl_ch4     ),
  .OEN                (pwm_ioctl_ch4_oe_n),
  .PAD                (PAD_PWM_CH4       )
);










PAD_DIG_IO  x_PAD_PWM_CH5 (
  .ID                 (pwm_indata5       ),
  .IEN                (pwm_ioctl_ch5_ie_n),
  .OD                 (pwm_ioctl_ch5     ),
  .OEN                (pwm_ioctl_ch5_oe_n),
  .PAD                (PAD_PWM_CH5       )
);










PAD_DIG_IO  x_PAD_PWM_CH6 (
  .ID                 (ioctl_pwm_cap6    ),
  .IEN                (pwm_ioctl_ch6_ie_n),
  .OD                 (pwm_ioctl_ch6     ),
  .OEN                (pwm_ioctl_ch6_oe_n),
  .PAD                (PAD_PWM_CH6       )
);










PAD_DIG_IO  x_PAD_PWM_CH7 (
  .ID                 (pwm_indata7       ),
  .IEN                (pwm_ioctl_ch7_ie_n),
  .OD                 (pwm_ioctl_ch7     ),
  .OEN                (pwm_ioctl_ch7_oe_n),
  .PAD                (PAD_PWM_CH7       )
);











PAD_DIG_IO  x_PAD_PWM_CH8 (
  .ID                 (ioctl_pwm_cap8    ),
  .IEN                (pwm_ioctl_ch8_ie_n),
  .OD                 (pwm_ioctl_ch8     ),
  .OEN                (pwm_ioctl_ch8_oe_n),
  .PAD                (PAD_PWM_CH8       )
);










PAD_DIG_IO  x_PAD_PWM_CH9 (
  .ID                 (pwm_indata9       ),
  .IEN                (pwm_ioctl_ch9_ie_n),
  .OD                 (pwm_ioctl_ch9     ),
  .OEN                (pwm_ioctl_ch9_oe_n),
  .PAD                (PAD_PWM_CH9       )
);











PAD_DIG_IO  x_PAD_PWM_CH10 (
  .ID                  (ioctl_pwm_cap10    ),
  .IEN                 (pwm_ioctl_ch10_ie_n),
  .OD                  (pwm_ioctl_ch10     ),
  .OEN                 (pwm_ioctl_ch10_oe_n),
  .PAD                 (PAD_PWM_CH10       )
);










PAD_DIG_IO  x_PAD_PWM_CH11 (
  .ID                  (pwm_indata11       ),
  .IEN                 (pwm_ioctl_ch11_ie_n),
  .OD                  (pwm_ioctl_ch11     ),
  .OEN                 (pwm_ioctl_ch11_oe_n),
  .PAD                 (PAD_PWM_CH11       )
);



















PAD_DIG_IO  x_PAD_USI0_SCLK (
  .ID                   (ioctl_usi0_sclk_in  ),
  .IEN                  (usi0_ioctl_sclk_ie_n),
  .OD                   (usi0_ioctl_sclk_out ),
  .OEN                  (usi0_ioctl_sclk_oe_n),
  .PAD                  (PAD_USI0_SCLK       )
);











PAD_DIG_IO  x_PAD_USI0_SD0 (
  .ID                  (ioctl_usi0_sd0_in  ),
  .IEN                 (usi0_ioctl_sd0_ie_n),
  .OD                  (usi0_ioctl_sd0_out ),
  .OEN                 (usi0_ioctl_sd0_oe_n),
  .PAD                 (PAD_USI0_SD0       )
);











PAD_DIG_IO  x_PAD_USI0_SD1 (
  .ID                  (ioctl_usi0_sd1_in  ),
  .IEN                 (usi0_ioctl_sd1_ie_n),
  .OD                  (usi0_ioctl_sd1_out ),
  .OEN                 (usi0_ioctl_sd1_oe_n),
  .PAD                 (PAD_USI0_SD1       )
);











PAD_DIG_IO  x_PAD_USI0_NSS (
  .ID                  (ioctl_usi0_nss_in  ),
  .IEN                 (usi0_ioctl_nss_ie_n),
  .OD                  (usi0_ioctl_nss_out ),
  .OEN                 (usi0_ioctl_nss_oe_n),
  .PAD                 (PAD_USI0_NSS       )
);













PAD_DIG_IO  x_PAD_USI1_SCLK (
  .ID                   (ioctl_usi1_sclk_in  ),
  .IEN                  (usi1_ioctl_sclk_ie_n),
  .OD                   (usi1_ioctl_sclk_out ),
  .OEN                  (usi1_ioctl_sclk_oe_n),
  .PAD                  (PAD_USI1_SCLK       )
);











PAD_DIG_IO  x_PAD_USI1_SD0 (
  .ID                  (ioctl_usi1_sd0_in  ),
  .IEN                 (usi1_ioctl_sd0_ie_n),
  .OD                  (usi1_ioctl_sd0_out ),
  .OEN                 (usi1_ioctl_sd0_oe_n),
  .PAD                 (PAD_USI1_SD0       )
);











PAD_DIG_IO  x_PAD_USI1_SD1 (
  .ID                  (ioctl_usi1_sd1_in  ),
  .IEN                 (usi1_ioctl_sd1_ie_n),
  .OD                  (usi1_ioctl_sd1_out ),
  .OEN                 (usi1_ioctl_sd1_oe_n),
  .PAD                 (PAD_USI1_SD1       )
);











PAD_DIG_IO  x_PAD_USI1_NSS (
  .ID                  (ioctl_usi1_nss_in  ),
  .IEN                 (usi1_ioctl_nss_ie_n),
  .OD                  (usi1_ioctl_nss_out ),
  .OEN                 (usi1_ioctl_nss_oe_n),
  .PAD                 (PAD_USI1_NSS       )
);










PAD_DIG_IO  x_PAD_USI2_SCLK (
  .ID                   (ioctl_usi2_sclk_in  ),
  .IEN                  (usi2_ioctl_sclk_ie_n),
  .OD                   (usi2_ioctl_sclk_out ),
  .OEN                  (usi2_ioctl_sclk_oe_n),
  .PAD                  (PAD_USI2_SCLK       )
);











PAD_DIG_IO  x_PAD_USI2_SD0 (
  .ID                  (ioctl_usi2_sd0_in  ),
  .IEN                 (usi2_ioctl_sd0_ie_n),
  .OD                  (usi2_ioctl_sd0_out ),
  .OEN                 (usi2_ioctl_sd0_oe_n),
  .PAD                 (PAD_USI2_SD0       )
);











PAD_DIG_IO  x_PAD_USI2_SD1 (
  .ID                  (ioctl_usi2_sd1_in  ),
  .IEN                 (usi2_ioctl_sd1_ie_n),
  .OD                  (usi2_ioctl_sd1_out ),
  .OEN                 (usi2_ioctl_sd1_oe_n),
  .PAD                 (PAD_USI2_SD1       )
);











PAD_DIG_IO  x_PAD_USI2_NSS (
  .ID                  (ioctl_usi2_nss_in  ),
  .IEN                 (usi2_ioctl_nss_ie_n),
  .OD                  (usi2_ioctl_nss_out ),
  .OEN                 (usi2_ioctl_nss_oe_n),
  .PAD                 (PAD_USI2_NSS       )
);













assign bist0_mode = 1'b0;














assign scan_en = 1'b0;
assign scan_mode = 1'b0;
assign test_mode = 1'b0;



endmodule


