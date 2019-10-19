/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module apb0_sub_top(
  apb0_dummy1_intr,
  apb0_dummy2_intr,
  apb0_dummy3_intr,
  apb0_dummy4_intr,
  apb0_dummy5_intr,
  apb0_dummy7_intr,
  apb0_dummy8_intr,
  apb0_dummy9_intr,
  apb0_lsbus_s2_hrdata,
  apb0_lsbus_s2_hready,
  apb0_lsbus_s2_hresp,
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
  ioctl_usi2_nss_in,
  ioctl_usi2_sclk_in,
  ioctl_usi2_sd0_in,
  ioctl_usi2_sd1_in,
  lsbus_apb0_s2_haddr,
  lsbus_apb0_s2_hburst,
  lsbus_apb0_s2_hprot,
  lsbus_apb0_s2_hsel,
  lsbus_apb0_s2_hsize,
  lsbus_apb0_s2_htrans,
  lsbus_apb0_s2_hwdata,
  lsbus_apb0_s2_hwrite,
  pmu_apb0_pclk_en,
  pmu_apb0_s3clk,
  pmu_apb0_s3rst_b,
  pmu_dummy1_p0clk,
  pmu_dummy1_p0rst_b,
  pmu_dummy2_p0clk,
  pmu_dummy2_p0rst_b,
  pmu_dummy3_p0clk,
  pmu_dummy3_p0rst_b,
  pmu_dummy4_p0clk,
  pmu_dummy4_p0rst_b,
  pmu_dummy5_p0clk,
  pmu_dummy5_p0rst_b,
  pmu_dummy7_p0clk,
  pmu_dummy7_p0rst_b,
  pmu_dummy8_p0clk,
  pmu_dummy8_p0rst_b,
  pmu_dummy9_p0clk,
  pmu_dummy9_p0rst_b,
  pmu_pwm_p0clk,
  pmu_pwm_p0rst_b,
  pmu_tim0_p0clk,
  pmu_tim0_p0rst_b,
  pmu_tim2_p0clk,
  pmu_tim2_p0rst_b,
  pmu_tim4_p0clk,
  pmu_tim4_p0rst_b,
  pmu_tim6_p0clk,
  pmu_tim6_p0rst_b,
  pmu_usi0_p0clk,
  pmu_usi0_p0rst_b,
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
  scan_mode,
  test_mode,
  tim0_wic_intr,
  tim2_wic_intr,
  tim4_wic_intr,
  tim6_wic_intr,
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
input           ioctl_usi2_nss_in;        
input           ioctl_usi2_sclk_in;       
input           ioctl_usi2_sd0_in;        
input           ioctl_usi2_sd1_in;        
input   [31:0]  lsbus_apb0_s2_haddr;      
input   [2 :0]  lsbus_apb0_s2_hburst;     
input   [3 :0]  lsbus_apb0_s2_hprot;      
input           lsbus_apb0_s2_hsel;       
input   [2 :0]  lsbus_apb0_s2_hsize;      
input   [1 :0]  lsbus_apb0_s2_htrans;     
input   [31:0]  lsbus_apb0_s2_hwdata;     
input           lsbus_apb0_s2_hwrite;     
input           pmu_apb0_pclk_en;         
input           pmu_apb0_s3clk;           
input           pmu_apb0_s3rst_b;         
input           pmu_dummy1_p0clk;         
input           pmu_dummy1_p0rst_b;       
input           pmu_dummy2_p0clk;         
input           pmu_dummy2_p0rst_b;       
input           pmu_dummy3_p0clk;         
input           pmu_dummy3_p0rst_b;       
input           pmu_dummy4_p0clk;         
input           pmu_dummy4_p0rst_b;       
input           pmu_dummy5_p0clk;         
input           pmu_dummy5_p0rst_b;       
input           pmu_dummy7_p0clk;         
input           pmu_dummy7_p0rst_b;       
input           pmu_dummy8_p0clk;         
input           pmu_dummy8_p0rst_b;       
input           pmu_dummy9_p0clk;         
input           pmu_dummy9_p0rst_b;       
input           pmu_pwm_p0clk;            
input           pmu_pwm_p0rst_b;          
input           pmu_tim0_p0clk;           
input           pmu_tim0_p0rst_b;         
input           pmu_tim2_p0clk;           
input           pmu_tim2_p0rst_b;         
input           pmu_tim4_p0clk;           
input           pmu_tim4_p0rst_b;         
input           pmu_tim6_p0clk;           
input           pmu_tim6_p0rst_b;         
input           pmu_usi0_p0clk;           
input           pmu_usi0_p0rst_b;         
input           pmu_usi2_p0clk;           
input           pmu_usi2_p0rst_b;         
input           pmu_wdt_p0clk;            
input           pmu_wdt_p0rst_b;          
input           scan_mode;                
input           test_mode;                
output          apb0_dummy1_intr;         
output          apb0_dummy2_intr;         
output          apb0_dummy3_intr;         
output          apb0_dummy4_intr;         
output          apb0_dummy5_intr;         
output          apb0_dummy7_intr;         
output          apb0_dummy8_intr;         
output          apb0_dummy9_intr;         
output  [31:0]  apb0_lsbus_s2_hrdata;     
output          apb0_lsbus_s2_hready;     
output  [1 :0]  apb0_lsbus_s2_hresp;      
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
output  [1 :0]  tim2_wic_intr;            
output  [1 :0]  tim4_wic_intr;            
output  [1 :0]  tim6_wic_intr;            
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
wire    [3 :0]  apb0_burst;               
wire            apb0_dummy1_intr;         
wire            apb0_dummy1_psel_s6;      
wire            apb0_dummy2_intr;         
wire            apb0_dummy2_psel_s8;      
wire            apb0_dummy3_intr;         
wire            apb0_dummy3_psel_s9;      
wire            apb0_dummy4_intr;         
wire            apb0_dummy4_psel_s10;     
wire            apb0_dummy5_intr;         
wire            apb0_dummy5_psel_s11;     
wire            apb0_dummy7_intr;         
wire            apb0_dummy7_psel_s13;     
wire            apb0_dummy8_intr;         
wire            apb0_dummy8_psel_s14;     
wire            apb0_dummy9_intr;         
wire            apb0_dummy9_psel_s15;     
wire    [31:0]  apb0_lsbus_s2_hrdata;     
wire            apb0_lsbus_s2_hready;     
wire    [1 :0]  apb0_lsbus_s2_hresp;      
wire    [31:0]  apb0_pwm_paddr;           
wire            apb0_pwm_penable;         
wire            apb0_pwm_psel_s12;        
wire    [31:0]  apb0_pwm_pwdata;          
wire            apb0_pwm_pwrite;          
wire            apb0_sec;                 
wire    [31:0]  apb0_tim0_paddr;          
wire            apb0_tim0_penable;        
wire            apb0_tim0_psel_s0;        
wire    [31:0]  apb0_tim0_pwdata;         
wire            apb0_tim0_pwrite;         
wire    [31:0]  apb0_tim2_paddr;          
wire            apb0_tim2_penable;        
wire            apb0_tim2_psel_s1;        
wire    [31:0]  apb0_tim2_pwdata;         
wire            apb0_tim2_pwrite;         
wire    [31:0]  apb0_tim4_paddr;          
wire            apb0_tim4_penable;        
wire            apb0_tim4_psel_s2;        
wire    [31:0]  apb0_tim4_pwdata;         
wire            apb0_tim4_pwrite;         
wire    [31:0]  apb0_tim6_paddr;          
wire            apb0_tim6_penable;        
wire            apb0_tim6_psel_s3;        
wire    [31:0]  apb0_tim6_pwdata;         
wire            apb0_tim6_pwrite;         
wire    [31:0]  apb0_usi0_paddr;          
wire            apb0_usi0_penable;        
wire            apb0_usi0_psel_s4;        
wire    [31:0]  apb0_usi0_pwdata;         
wire            apb0_usi0_pwrite;         
wire    [31:0]  apb0_usi2_paddr;          
wire            apb0_usi2_penable;        
wire            apb0_usi2_psel_s5;        
wire    [31:0]  apb0_usi2_pwdata;         
wire            apb0_usi2_pwrite;         
wire    [31:0]  apb0_wdt_paddr;           
wire            apb0_wdt_penable;         
wire            apb0_wdt_psel_s7;         
wire    [31:0]  apb0_wdt_pwdata;          
wire            apb0_wdt_pwrite;          
wire    [31:0]  apb0_xx_paddr;            
wire            apb0_xx_penable;          
wire    [2 :0]  apb0_xx_pprot;            
wire    [3 :0]  apb0_xx_pstrb_s;          
wire    [31:0]  apb0_xx_pwdata;           
wire            apb0_xx_pwrite;           
wire            dmac0_usi0_rx_ack;        
wire            dmac0_usi0_tx_ack;        
wire            dmac0_usi2_rx_ack;        
wire            dmac0_usi2_tx_ack;        
wire    [31:0]  dummy1_apb0_prdata;       
wire    [31:0]  dummy2_apb0_prdata;       
wire    [31:0]  dummy3_apb0_prdata;       
wire    [31:0]  dummy4_apb0_prdata;       
wire    [31:0]  dummy5_apb0_prdata;       
wire    [31:0]  dummy7_apb0_prdata;       
wire    [31:0]  dummy8_apb0_prdata;       
wire    [31:0]  dummy9_apb0_prdata;       
wire            etb_tim0_trig_en_off1;    
wire            etb_tim0_trig_en_off2;    
wire            etb_tim0_trig_en_on1;     
wire            etb_tim0_trig_en_on2;     
wire            etb_tim2_trig_en_off1;    
wire            etb_tim2_trig_en_off2;    
wire            etb_tim2_trig_en_on1;     
wire            etb_tim2_trig_en_on2;     
wire            etb_tim4_trig_en_off1;    
wire            etb_tim4_trig_en_off2;    
wire            etb_tim4_trig_en_on1;     
wire            etb_tim4_trig_en_on2;     
wire            etb_tim6_trig_en_off1;    
wire            etb_tim6_trig_en_off2;    
wire            etb_tim6_trig_en_on1;     
wire            etb_tim6_trig_en_on2;     
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
wire            ioctl_usi2_nss_in;        
wire            ioctl_usi2_sclk_in;       
wire            ioctl_usi2_sd0_in;        
wire            ioctl_usi2_sd1_in;        
wire    [31:0]  lsbus_apb0_s2_haddr;      
wire    [2 :0]  lsbus_apb0_s2_hburst;     
wire    [3 :0]  lsbus_apb0_s2_hprot;      
wire            lsbus_apb0_s2_hsel;       
wire    [2 :0]  lsbus_apb0_s2_hsize;      
wire    [1 :0]  lsbus_apb0_s2_htrans;     
wire    [31:0]  lsbus_apb0_s2_hwdata;     
wire            lsbus_apb0_s2_hwrite;     
wire            pmu_apb0_pclk_en;         
wire            pmu_apb0_s3clk;           
wire            pmu_apb0_s3rst_b;         
wire            pmu_dummy1_p0clk;         
wire            pmu_dummy1_p0rst_b;       
wire            pmu_dummy2_p0clk;         
wire            pmu_dummy2_p0rst_b;       
wire            pmu_dummy3_p0clk;         
wire            pmu_dummy3_p0rst_b;       
wire            pmu_dummy4_p0clk;         
wire            pmu_dummy4_p0rst_b;       
wire            pmu_dummy5_p0clk;         
wire            pmu_dummy5_p0rst_b;       
wire            pmu_dummy7_p0clk;         
wire            pmu_dummy7_p0rst_b;       
wire            pmu_dummy8_p0clk;         
wire            pmu_dummy8_p0rst_b;       
wire            pmu_dummy9_p0clk;         
wire            pmu_dummy9_p0rst_b;       
wire            pmu_pwm_p0clk;            
wire            pmu_pwm_p0rst_b;          
wire            pmu_tim0_p0clk;           
wire            pmu_tim0_p0rst_b;         
wire            pmu_tim2_p0clk;           
wire            pmu_tim2_p0rst_b;         
wire            pmu_tim4_p0clk;           
wire            pmu_tim4_p0rst_b;         
wire            pmu_tim6_p0clk;           
wire            pmu_tim6_p0rst_b;         
wire            pmu_usi0_p0clk;           
wire            pmu_usi0_p0rst_b;         
wire            pmu_usi2_p0clk;           
wire            pmu_usi2_p0rst_b;         
wire            pmu_wdt_p0clk;            
wire            pmu_wdt_p0rst_b;          
wire    [31:0]  pwm_apb0_prdata;          
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
wire            pwm_pmu_idle;             
wire            pwm_tim0_etb_trig;        
wire            pwm_tim1_etb_trig;        
wire            pwm_tim2_etb_trig;        
wire            pwm_tim3_etb_trig;        
wire            pwm_tim4_etb_trig;        
wire            pwm_tim5_etb_trig;        
wire            pwm_wic_intr;             
wire            pwm_xx_trig;              
wire            scan_mode;                
wire            sec_usi0_dmac0_dma_rx_req; 
wire            sec_usi0_dmac0_dma_tx_req; 
wire            sec_usi2_dmac0_dma_rx_req; 
wire            sec_usi2_dmac0_dma_tx_req; 
wire            test_mode;                
wire    [31:0]  tim0_apb0_prdata;         
wire    [1 :0]  tim0_wic_intr;            
wire    [31:0]  tim2_apb0_prdata;         
wire    [1 :0]  tim2_wic_intr;            
wire    [31:0]  tim4_apb0_prdata;         
wire    [1 :0]  tim4_wic_intr;            
wire    [31:0]  tim6_apb0_prdata;         
wire    [1 :0]  tim6_wic_intr;            
wire            timer0_tim1_etb_trig;     
wire            timer0_tim2_etb_trig;     
wire            timer2_tim1_etb_trig;     
wire            timer2_tim2_etb_trig;     
wire            timer4_tim1_etb_trig;     
wire            timer4_tim2_etb_trig;     
wire            timer6_tim1_etb_trig;     
wire            timer6_tim2_etb_trig;     
wire            tipc_pwm_trust;           
wire            tipc_tim0_trust;          
wire            tipc_tim2_trust;          
wire            tipc_tim4_trust;          
wire            tipc_tim6_trust;          
wire            tipc_usi0_trust;          
wire            tipc_usi2_trust;          
wire            tipc_wdt_trust;           
wire    [31:0]  usi0_apb0_prdata;         
wire            usi0_dmac0_dma_rx_req;    
wire            usi0_dmac0_dma_tx_req;    
wire            usi0_etb_rx_trig;         
wire            usi0_etb_tx_trig;         
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
wire    [31:0]  usi2_apb0_prdata;         
wire            usi2_dmac0_dma_rx_req;    
wire            usi2_dmac0_dma_tx_req;    
wire            usi2_etb_rx_trig;         
wire            usi2_etb_tx_trig;         
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
wire    [31:0]  wdt_apb0_prdata;          
wire            wdt_pmu_rst_b;            
wire            wdt_wic_intr;             
assign apb0_sec = 1'b1;
assign apb0_burst[3:0] = {1'b0,lsbus_apb0_s2_hburst[2:0]};
csky_apb0_top  x_apb0_sub_top (
  .haddr                (lsbus_apb0_s2_haddr ),
  .hburst               (apb0_burst          ),
  .hclk                 (pmu_apb0_s3clk      ),
  .hprot                (lsbus_apb0_s2_hprot ),
  .hrdata               (apb0_lsbus_s2_hrdata),
  .hreadyin             (1'b1                ),
  .hreadyout            (apb0_lsbus_s2_hready),
  .hresp                (apb0_lsbus_s2_hresp ),
  .hrst_n               (pmu_apb0_s3rst_b    ),
  .hsec                 (apb0_sec            ),
  .hsel                 (lsbus_apb0_s2_hsel  ),
  .hsize                (lsbus_apb0_s2_hsize ),
  .htrans               (lsbus_apb0_s2_htrans),
  .hwdata               (lsbus_apb0_s2_hwdata),
  .hwrite               (lsbus_apb0_s2_hwrite),
  .paddr_s              (apb0_xx_paddr       ),
  .pclk_en              (pmu_apb0_pclk_en    ),
  .penable_s            (apb0_xx_penable     ),
  .pprot_s              (apb0_xx_pprot       ),
  .prdata_s0            (tim0_apb0_prdata    ),
  .prdata_s1            (tim2_apb0_prdata    ),
  .prdata_s10           (dummy4_apb0_prdata  ),
  .prdata_s11           (dummy5_apb0_prdata  ),
  .prdata_s12           (pwm_apb0_prdata     ),
  .prdata_s13           (dummy7_apb0_prdata  ),
  .prdata_s14           (dummy8_apb0_prdata  ),
  .prdata_s15           (dummy9_apb0_prdata  ),
  .prdata_s2            (tim4_apb0_prdata    ),
  .prdata_s3            (tim6_apb0_prdata    ),
  .prdata_s4            (usi0_apb0_prdata    ),
  .prdata_s5            (usi2_apb0_prdata    ),
  .prdata_s6            (dummy1_apb0_prdata  ),
  .prdata_s7            (wdt_apb0_prdata     ),
  .prdata_s8            (dummy2_apb0_prdata  ),
  .prdata_s9            (dummy3_apb0_prdata  ),
  .pready_s0            (1'b1                ),
  .pready_s1            (1'b1                ),
  .pready_s10           (1'b1                ),
  .pready_s11           (1'b1                ),
  .pready_s12           (1'b1                ),
  .pready_s13           (1'b1                ),
  .pready_s14           (1'b1                ),
  .pready_s15           (1'b1                ),
  .pready_s2            (1'b1                ),
  .pready_s3            (1'b1                ),
  .pready_s4            (1'b1                ),
  .pready_s5            (1'b1                ),
  .pready_s6            (1'b1                ),
  .pready_s7            (1'b1                ),
  .pready_s8            (1'b1                ),
  .pready_s9            (1'b1                ),
  .psel_s0              (apb0_tim0_psel_s0   ),
  .psel_s1              (apb0_tim2_psel_s1   ),
  .psel_s10             (apb0_dummy4_psel_s10),
  .psel_s11             (apb0_dummy5_psel_s11),
  .psel_s12             (apb0_pwm_psel_s12   ),
  .psel_s13             (apb0_dummy7_psel_s13),
  .psel_s14             (apb0_dummy8_psel_s14),
  .psel_s15             (apb0_dummy9_psel_s15),
  .psel_s2              (apb0_tim4_psel_s2   ),
  .psel_s3              (apb0_tim6_psel_s3   ),
  .psel_s4              (apb0_usi0_psel_s4   ),
  .psel_s5              (apb0_usi2_psel_s5   ),
  .psel_s6              (apb0_dummy1_psel_s6 ),
  .psel_s7              (apb0_wdt_psel_s7    ),
  .psel_s8              (apb0_dummy2_psel_s8 ),
  .psel_s9              (apb0_dummy3_psel_s9 ),
  .pselverr_s0          (1'b0                ),
  .pselverr_s1          (1'b0                ),
  .pselverr_s10         (1'b0                ),
  .pselverr_s11         (1'b0                ),
  .pselverr_s12         (1'b0                ),
  .pselverr_s13         (1'b0                ),
  .pselverr_s14         (1'b0                ),
  .pselverr_s15         (1'b0                ),
  .pselverr_s2          (1'b0                ),
  .pselverr_s3          (1'b0                ),
  .pselverr_s4          (1'b0                ),
  .pselverr_s5          (1'b0                ),
  .pselverr_s6          (1'b0                ),
  .pselverr_s7          (1'b0                ),
  .pselverr_s8          (1'b0                ),
  .pselverr_s9          (1'b0                ),
  .pstrb_s              (apb0_xx_pstrb_s     ),
  .pwdata_s             (apb0_xx_pwdata      ),
  .pwrite_s             (apb0_xx_pwrite      )
);
tim0_sec_top  x_tim0_sec_top (
  .etb_tim1_trig_en_off  (etb_tim0_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim0_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim0_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim0_trig_en_on2 ),
  .intr                  (tim0_wic_intr        ),
  .paddr                 (apb0_tim0_paddr      ),
  .pclk                  (pmu_tim0_p0clk       ),
  .penable               (apb0_tim0_penable    ),
  .pprot                 (apb0_xx_pprot        ),
  .prdata                (tim0_apb0_prdata     ),
  .presetn               (pmu_tim0_p0rst_b     ),
  .psel                  (apb0_tim0_psel_s0    ),
  .pwdata                (apb0_tim0_pwdata     ),
  .pwrite                (apb0_tim0_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer0_tim1_etb_trig ),
  .tim2_etb_trig         (timer0_tim2_etb_trig ),
  .tipc_tim0_trust       (tipc_tim0_trust      )
);
tim2_sec_top  x_tim2_sec_top (
  .etb_tim1_trig_en_off  (etb_tim2_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim2_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim2_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim2_trig_en_on2 ),
  .intr                  (tim2_wic_intr        ),
  .paddr                 (apb0_tim2_paddr      ),
  .pclk                  (pmu_tim2_p0clk       ),
  .penable               (apb0_tim2_penable    ),
  .pprot                 (apb0_xx_pprot        ),
  .prdata                (tim2_apb0_prdata     ),
  .presetn               (pmu_tim2_p0rst_b     ),
  .psel                  (apb0_tim2_psel_s1    ),
  .pwdata                (apb0_tim2_pwdata     ),
  .pwrite                (apb0_tim2_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer2_tim1_etb_trig ),
  .tim2_etb_trig         (timer2_tim2_etb_trig ),
  .tipc_tim2_trust       (tipc_tim2_trust      )
);
tim4_sec_top  x_tim4_sec_top (
  .etb_tim1_trig_en_off  (etb_tim4_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim4_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim4_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim4_trig_en_on2 ),
  .intr                  (tim4_wic_intr        ),
  .paddr                 (apb0_tim4_paddr      ),
  .pclk                  (pmu_tim4_p0clk       ),
  .penable               (apb0_tim4_penable    ),
  .pprot                 (apb0_xx_pprot        ),
  .prdata                (tim4_apb0_prdata     ),
  .presetn               (pmu_tim4_p0rst_b     ),
  .psel                  (apb0_tim4_psel_s2    ),
  .pwdata                (apb0_tim4_pwdata     ),
  .pwrite                (apb0_tim4_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer4_tim1_etb_trig ),
  .tim2_etb_trig         (timer4_tim2_etb_trig ),
  .tipc_tim4_trust       (tipc_tim4_trust      )
);
tim6_sec_top  x_tim6_sec_top (
  .etb_tim1_trig_en_off  (etb_tim6_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim6_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim6_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim6_trig_en_on2 ),
  .intr                  (tim6_wic_intr        ),
  .paddr                 (apb0_tim6_paddr      ),
  .pclk                  (pmu_tim6_p0clk       ),
  .penable               (apb0_tim6_penable    ),
  .pprot                 (apb0_xx_pprot        ),
  .prdata                (tim6_apb0_prdata     ),
  .presetn               (pmu_tim6_p0rst_b     ),
  .psel                  (apb0_tim6_psel_s3    ),
  .pwdata                (apb0_tim6_pwdata     ),
  .pwrite                (apb0_tim6_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer6_tim1_etb_trig ),
  .tim2_etb_trig         (timer6_tim2_etb_trig ),
  .tipc_tim6_trust       (tipc_tim6_trust      )
);
usi0_sec_top  x_usi0_sec_top (
  .clk                       (pmu_usi0_p0clk           ),
  .dma_ack_rx                (dmac0_usi0_rx_ack        ),
  .dma_ack_tx                (dmac0_usi0_tx_ack        ),
  .dma_req_rx                (usi0_dmac0_dma_rx_req    ),
  .dma_req_tx                (usi0_dmac0_dma_tx_req    ),
  .nss_ie_n                  (usi0_ioctl_nss_ie_n      ),
  .nss_in                    (ioctl_usi0_nss_in        ),
  .nss_oe_n                  (usi0_ioctl_nss_oe_n      ),
  .nss_out                   (usi0_ioctl_nss_out       ),
  .paddr                     (apb0_usi0_paddr          ),
  .penable                   (apb0_usi0_penable        ),
  .pprot                     (apb0_xx_pprot            ),
  .prdata                    (usi0_apb0_prdata         ),
  .psel                      (apb0_usi0_psel_s4        ),
  .pwdata                    (apb0_usi0_pwdata         ),
  .pwrite                    (apb0_usi0_pwrite         ),
  .rst_n                     (pmu_usi0_p0rst_b         ),
  .sclk_ie_n                 (usi0_ioctl_sclk_ie_n     ),
  .sclk_in                   (ioctl_usi0_sclk_in       ),
  .sclk_oe_n                 (usi0_ioctl_sclk_oe_n     ),
  .sclk_out                  (usi0_ioctl_sclk_out      ),
  .sd0_ie_n                  (usi0_ioctl_sd0_ie_n      ),
  .sd0_in                    (ioctl_usi0_sd0_in        ),
  .sd0_oe_n                  (usi0_ioctl_sd0_oe_n      ),
  .sd0_out                   (usi0_ioctl_sd0_out       ),
  .sd1_ie_n                  (usi0_ioctl_sd1_ie_n      ),
  .sd1_in                    (ioctl_usi0_sd1_in        ),
  .sd1_oe_n                  (usi0_ioctl_sd1_oe_n      ),
  .sd1_out                   (usi0_ioctl_sd1_out       ),
  .sec_rx_req                (sec_usi0_dmac0_dma_rx_req),
  .sec_tx_req                (sec_usi0_dmac0_dma_tx_req),
  .tipc_usi0_trust           (tipc_usi0_trust          ),
  .usi_etb_rx_trig           (usi0_etb_rx_trig         ),
  .usi_etb_tx_trig           (usi0_etb_tx_trig         ),
  .usi_intr                  (usi0_wic_intr            )
);
usi2_sec_top  x_usi2_sec_top (
  .clk                       (pmu_usi2_p0clk           ),
  .dma_ack_rx                (dmac0_usi2_rx_ack        ),
  .dma_ack_tx                (dmac0_usi2_tx_ack        ),
  .dma_req_rx                (usi2_dmac0_dma_rx_req    ),
  .dma_req_tx                (usi2_dmac0_dma_tx_req    ),
  .nss_ie_n                  (usi2_ioctl_nss_ie_n      ),
  .nss_in                    (ioctl_usi2_nss_in        ),
  .nss_oe_n                  (usi2_ioctl_nss_oe_n      ),
  .nss_out                   (usi2_ioctl_nss_out       ),
  .paddr                     (apb0_usi2_paddr          ),
  .penable                   (apb0_usi2_penable        ),
  .pprot                     (apb0_xx_pprot            ),
  .prdata                    (usi2_apb0_prdata         ),
  .psel                      (apb0_usi2_psel_s5        ),
  .pwdata                    (apb0_usi2_pwdata         ),
  .pwrite                    (apb0_usi2_pwrite         ),
  .rst_n                     (pmu_usi2_p0rst_b         ),
  .sclk_ie_n                 (usi2_ioctl_sclk_ie_n     ),
  .sclk_in                   (ioctl_usi2_sclk_in       ),
  .sclk_oe_n                 (usi2_ioctl_sclk_oe_n     ),
  .sclk_out                  (usi2_ioctl_sclk_out      ),
  .sd0_ie_n                  (usi2_ioctl_sd0_ie_n      ),
  .sd0_in                    (ioctl_usi2_sd0_in        ),
  .sd0_oe_n                  (usi2_ioctl_sd0_oe_n      ),
  .sd0_out                   (usi2_ioctl_sd0_out       ),
  .sd1_ie_n                  (usi2_ioctl_sd1_ie_n      ),
  .sd1_in                    (ioctl_usi2_sd1_in        ),
  .sd1_oe_n                  (usi2_ioctl_sd1_oe_n      ),
  .sd1_out                   (usi2_ioctl_sd1_out       ),
  .sec_rx_req                (sec_usi2_dmac0_dma_rx_req),
  .sec_tx_req                (sec_usi2_dmac0_dma_tx_req),
  .tipc_usi2_trust           (tipc_usi2_trust          ),
  .usi_etb_rx_trig           (usi2_etb_rx_trig         ),
  .usi_etb_tx_trig           (usi2_etb_tx_trig         ),
  .usi_intr                  (usi2_wic_intr            )
);
apb_dummy_top  x_apb0_dummy_top1 (
  .intr                (apb0_dummy1_intr   ),
  .paddr               (apb0_xx_paddr      ),
  .pclk                (pmu_dummy1_p0clk   ),
  .penable             (apb0_xx_penable    ),
  .pprot               (apb0_xx_pprot      ),
  .prdata              (dummy1_apb0_prdata ),
  .presetn             (pmu_dummy1_p0rst_b ),
  .psel                (apb0_dummy1_psel_s6),
  .pwdata              (apb0_xx_pwdata     ),
  .pwrite              (apb0_xx_pwrite     )
);
wdt_sec_top  x_wdt_sec_top (
  .intr             (wdt_wic_intr    ),
  .paddr            (apb0_wdt_paddr  ),
  .pclk             (pmu_wdt_p0clk   ),
  .penable          (apb0_wdt_penable),
  .pprot            (apb0_xx_pprot   ),
  .prdata           (wdt_apb0_prdata ),
  .prst_b           (pmu_wdt_p0rst_b ),
  .psel             (apb0_wdt_psel_s7),
  .pwdata           (apb0_wdt_pwdata ),
  .pwrite           (apb0_wdt_pwrite ),
  .scan_mode        (scan_mode       ),
  .sys_rst_b        (wdt_pmu_rst_b   ),
  .tipc_wdt_trust   (tipc_wdt_trust  )
);
apb_dummy_top  x_apb0_dummy_top2 (
  .intr                (apb0_dummy2_intr   ),
  .paddr               (apb0_xx_paddr      ),
  .pclk                (pmu_dummy2_p0clk   ),
  .penable             (apb0_xx_penable    ),
  .pprot               (apb0_xx_pprot      ),
  .prdata              (dummy2_apb0_prdata ),
  .presetn             (pmu_dummy2_p0rst_b ),
  .psel                (apb0_dummy2_psel_s8),
  .pwdata              (apb0_xx_pwdata     ),
  .pwrite              (apb0_xx_pwrite     )
);
apb_dummy_top  x_apb0_dummy_top3 (
  .intr                (apb0_dummy3_intr   ),
  .paddr               (apb0_xx_paddr      ),
  .pclk                (pmu_dummy3_p0clk   ),
  .penable             (apb0_xx_penable    ),
  .pprot               (apb0_xx_pprot      ),
  .prdata              (dummy3_apb0_prdata ),
  .presetn             (pmu_dummy3_p0rst_b ),
  .psel                (apb0_dummy3_psel_s9),
  .pwdata              (apb0_xx_pwdata     ),
  .pwrite              (apb0_xx_pwrite     )
);
apb_dummy_top  x_apb0_dummy_top4 (
  .intr                 (apb0_dummy4_intr    ),
  .paddr                (apb0_xx_paddr       ),
  .pclk                 (pmu_dummy4_p0clk    ),
  .penable              (apb0_xx_penable     ),
  .pprot                (apb0_xx_pprot       ),
  .prdata               (dummy4_apb0_prdata  ),
  .presetn              (pmu_dummy4_p0rst_b  ),
  .psel                 (apb0_dummy4_psel_s10),
  .pwdata               (apb0_xx_pwdata      ),
  .pwrite               (apb0_xx_pwrite      )
);
apb_dummy_top  x_apb0_dummy_top5 (
  .intr                 (apb0_dummy5_intr    ),
  .paddr                (apb0_xx_paddr       ),
  .pclk                 (pmu_dummy5_p0clk    ),
  .penable              (apb0_xx_penable     ),
  .pprot                (apb0_xx_pprot       ),
  .prdata               (dummy5_apb0_prdata  ),
  .presetn              (pmu_dummy5_p0rst_b  ),
  .psel                 (apb0_dummy5_psel_s11),
  .pwdata               (apb0_xx_pwdata      ),
  .pwrite               (apb0_xx_pwrite      )
);
pwm_sec_top  x_pwm_sec_top (
  .etb_pwm_trig_tim0_off (1'b0                 ),
  .etb_pwm_trig_tim0_on  (1'b0                 ),
  .etb_pwm_trig_tim1_off (1'b0                 ),
  .etb_pwm_trig_tim1_on  (1'b0                 ),
  .etb_pwm_trig_tim2_off (1'b0                 ),
  .etb_pwm_trig_tim2_on  (1'b0                 ),
  .etb_pwm_trig_tim3_off (1'b0                 ),
  .etb_pwm_trig_tim3_on  (1'b0                 ),
  .etb_pwm_trig_tim4_off (1'b0                 ),
  .etb_pwm_trig_tim4_on  (1'b0                 ),
  .etb_pwm_trig_tim5_off (1'b0                 ),
  .etb_pwm_trig_tim5_on  (1'b0                 ),
  .fault                 (ioctl_pwm_fault      ),
  .i_capedge0            (ioctl_pwm_cap0       ),
  .i_capedge10           (ioctl_pwm_cap10      ),
  .i_capedge2            (ioctl_pwm_cap2       ),
  .i_capedge4            (ioctl_pwm_cap4       ),
  .i_capedge6            (ioctl_pwm_cap6       ),
  .i_capedge8            (ioctl_pwm_cap8       ),
  .o_pwm0                (pwm_ioctl_ch0        ),
  .o_pwm1                (pwm_ioctl_ch1        ),
  .o_pwm10               (pwm_ioctl_ch10       ),
  .o_pwm11               (pwm_ioctl_ch11       ),
  .o_pwm2                (pwm_ioctl_ch2        ),
  .o_pwm3                (pwm_ioctl_ch3        ),
  .o_pwm4                (pwm_ioctl_ch4        ),
  .o_pwm5                (pwm_ioctl_ch5        ),
  .o_pwm6                (pwm_ioctl_ch6        ),
  .o_pwm7                (pwm_ioctl_ch7        ),
  .o_pwm8                (pwm_ioctl_ch8        ),
  .o_pwm9                (pwm_ioctl_ch9        ),
  .paddr                 (apb0_pwm_paddr       ),
  .pclk                  (pmu_pwm_p0clk        ),
  .penable               (apb0_pwm_penable     ),
  .pprot                 (apb0_xx_pprot        ),
  .prdata                (pwm_apb0_prdata      ),
  .presetn               (pmu_pwm_p0rst_b      ),
  .psel                  (apb0_pwm_psel_s12    ),
  .pwdata                (apb0_pwm_pwdata      ),
  .pwm0oe_n              (pwm_ioctl_ch0_oe_n   ),
  .pwm10oe_n             (pwm_ioctl_ch10_oe_n  ),
  .pwm11oe_n             (pwm_ioctl_ch11_oe_n  ),
  .pwm1oe_n              (pwm_ioctl_ch1_oe_n   ),
  .pwm2oe_n              (pwm_ioctl_ch2_oe_n   ),
  .pwm3oe_n              (pwm_ioctl_ch3_oe_n   ),
  .pwm4oe_n              (pwm_ioctl_ch4_oe_n   ),
  .pwm5oe_n              (pwm_ioctl_ch5_oe_n   ),
  .pwm6oe_n              (pwm_ioctl_ch6_oe_n   ),
  .pwm7oe_n              (pwm_ioctl_ch7_oe_n   ),
  .pwm8oe_n              (pwm_ioctl_ch8_oe_n   ),
  .pwm9oe_n              (pwm_ioctl_ch9_oe_n   ),
  .pwm_idle              (pwm_pmu_idle         ),
  .pwm_tim0_etb_trig     (pwm_tim0_etb_trig    ),
  .pwm_tim1_etb_trig     (pwm_tim1_etb_trig    ),
  .pwm_tim2_etb_trig     (pwm_tim2_etb_trig    ),
  .pwm_tim3_etb_trig     (pwm_tim3_etb_trig    ),
  .pwm_tim4_etb_trig     (pwm_tim4_etb_trig    ),
  .pwm_tim5_etb_trig     (pwm_tim5_etb_trig    ),
  .pwm_xx_trig           (pwm_xx_trig          ),
  .pwmint                (pwm_wic_intr         ),
  .pwrite                (apb0_pwm_pwrite      ),
  .test_mode             (test_mode            ),
  .tipc_pwm_trust        (tipc_pwm_trust       )
);
apb_dummy_top  x_apb0_dummy_top7 (
  .intr                 (apb0_dummy7_intr    ),
  .paddr                (apb0_xx_paddr       ),
  .pclk                 (pmu_dummy7_p0clk    ),
  .penable              (apb0_xx_penable     ),
  .pprot                (apb0_xx_pprot       ),
  .prdata               (dummy7_apb0_prdata  ),
  .presetn              (pmu_dummy7_p0rst_b  ),
  .psel                 (apb0_dummy7_psel_s13),
  .pwdata               (apb0_xx_pwdata      ),
  .pwrite               (apb0_xx_pwrite      )
);
apb_dummy_top  x_apb0_dummy_top8 (
  .intr                 (apb0_dummy8_intr    ),
  .paddr                (apb0_xx_paddr       ),
  .pclk                 (pmu_dummy8_p0clk    ),
  .penable              (apb0_xx_penable     ),
  .pprot                (apb0_xx_pprot       ),
  .prdata               (dummy8_apb0_prdata  ),
  .presetn              (pmu_dummy8_p0rst_b  ),
  .psel                 (apb0_dummy8_psel_s14),
  .pwdata               (apb0_xx_pwdata      ),
  .pwrite               (apb0_xx_pwrite      )
);
apb_dummy_top  x_apb0_dummy_top9 (
  .intr                 (apb0_dummy9_intr    ),
  .paddr                (apb0_xx_paddr       ),
  .pclk                 (pmu_dummy9_p0clk    ),
  .penable              (apb0_xx_penable     ),
  .pprot                (apb0_xx_pprot       ),
  .prdata               (dummy9_apb0_prdata  ),
  .presetn              (pmu_dummy9_p0rst_b  ),
  .psel                 (apb0_dummy9_psel_s15),
  .pwdata               (apb0_xx_pwdata      ),
  .pwrite               (apb0_xx_pwrite      )
);
assign apb0_tim0_pwrite   = apb0_xx_pwrite;
assign apb0_tim2_pwrite   = apb0_xx_pwrite;
assign apb0_tim4_pwrite   = apb0_xx_pwrite;
assign apb0_tim6_pwrite   = apb0_xx_pwrite;
assign apb0_usi0_pwrite   = apb0_xx_pwrite;
assign apb0_usi2_pwrite   = apb0_xx_pwrite;
assign apb0_tim0_penable   = apb0_xx_penable;
assign apb0_tim2_penable   = apb0_xx_penable;
assign apb0_tim4_penable   = apb0_xx_penable;
assign apb0_tim6_penable   = apb0_xx_penable;
assign apb0_usi0_penable   = apb0_xx_penable;
assign apb0_usi2_penable   = apb0_xx_penable;
assign apb0_tim0_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_tim2_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_tim4_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_tim6_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_usi0_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_usi2_pwdata[31:0]  = apb0_xx_pwdata[31:0];
assign apb0_tim0_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_tim2_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_tim4_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_tim6_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_usi0_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_usi2_paddr[31:0]   = apb0_xx_paddr[31:0];
assign apb0_wdt_paddr[31:0]  = apb0_xx_paddr[31:0];
assign apb0_wdt_pwdata[31:0] = apb0_xx_pwdata[31:0];
assign apb0_wdt_penable      = apb0_xx_penable;
assign apb0_wdt_pwrite       = apb0_xx_pwrite;
assign apb0_pwm_paddr[31:0]  = apb0_xx_paddr[31:0];
assign apb0_pwm_pwdata[31:0] = apb0_xx_pwdata[31:0];
assign apb0_pwm_penable      = apb0_xx_penable;
assign apb0_pwm_pwrite       = apb0_xx_pwrite;
assign etb_tim0_trig_en_off1 = 1'b0;
assign etb_tim0_trig_en_off2 = 1'b0;
assign etb_tim0_trig_en_on1 = 1'b0;
assign etb_tim0_trig_en_on2 = 1'b0;
assign etb_tim2_trig_en_off1 = 1'b0;
assign etb_tim2_trig_en_off2 = 1'b0;
assign etb_tim2_trig_en_on1 = 1'b0;
assign etb_tim2_trig_en_on2 = 1'b0;
assign etb_tim4_trig_en_off1 = 1'b0;
assign etb_tim4_trig_en_off2 = 1'b0;
assign etb_tim4_trig_en_on1 = 1'b0;
assign etb_tim4_trig_en_on2 = 1'b0;
assign etb_tim6_trig_en_off1 = 1'b0;
assign etb_tim6_trig_en_off2 = 1'b0;
assign etb_tim6_trig_en_on1 = 1'b0;
assign etb_tim6_trig_en_on2 = 1'b0;
assign dmac0_usi0_rx_ack = 1'b0;        
assign dmac0_usi0_tx_ack = 1'b0;        
assign dmac0_usi2_rx_ack = 1'b0;        
assign dmac0_usi2_tx_ack = 1'b0;   
assign tipc_tim0_trust = 1'b0;
assign tipc_tim2_trust = 1'b0;
assign tipc_tim4_trust = 1'b0;
assign tipc_tim6_trust = 1'b0;
assign tipc_wdt_trust = 1'b0;
assign tipc_pwm_trust = 1'b0;
assign tipc_usi0_trust = 1'b0;
assign tipc_usi2_trust = 1'b0;
endmodule
