/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module apb1_sub_top(
  apb1_dummy1_intr,
  apb1_dummy2_intr,
  apb1_dummy3_intr,
  apb1_dummy4_intr,
  apb1_dummy5_intr,
  apb1_dummy6_intr,
  apb1_dummy7_intr,
  apb1_dummy8_intr,
  apb1_gpio_psel_s5,
  apb1_lsbus_s3_hrdata,
  apb1_lsbus_s3_hready,
  apb1_lsbus_s3_hresp,
  apb1_pmu_psel_s15,
  apb1_rtc_psel_s6,
  apb1_xx_paddr,
  apb1_xx_penable,
  apb1_xx_pprot,
  apb1_xx_pwdata,
  apb1_xx_pwrite,
  gpio_apb1_prdata,
  ioctl_usi1_nss_in,
  ioctl_usi1_sclk_in,
  ioctl_usi1_sd0_in,
  ioctl_usi1_sd1_in,
  lsbus_apb1_s3_haddr,
  lsbus_apb1_s3_hburst,
  lsbus_apb1_s3_hprot,
  lsbus_apb1_s3_hsel,
  lsbus_apb1_s3_hsize,
  lsbus_apb1_s3_htrans,
  lsbus_apb1_s3_hwdata,
  lsbus_apb1_s3_hwrite,
  pmu_apb1_pclk_en,
  pmu_apb1_prdata,
  pmu_apb1_s3clk,
  pmu_apb1_s3rst_b,
  pmu_dummy1_p1clk,
  pmu_dummy1_p1rst_b,
  pmu_dummy2_p1clk,
  pmu_dummy2_p1rst_b,
  pmu_dummy3_p1clk,
  pmu_dummy3_p1rst_b,
  pmu_dummy4_p1clk,
  pmu_dummy4_p1rst_b,
  pmu_dummy5_p1clk,
  pmu_dummy5_p1rst_b,
  pmu_dummy6_p1clk,
  pmu_dummy6_p1rst_b,
  pmu_dummy7_p1clk,
  pmu_dummy7_p1rst_b,
  pmu_dummy8_p1clk,
  pmu_dummy8_p1rst_b,
  pmu_tim1_p1clk,
  pmu_tim1_p1rst_b,
  pmu_tim3_p1clk,
  pmu_tim3_p1rst_b,
  pmu_tim5_p1clk,
  pmu_tim5_p1rst_b,
  pmu_tim7_p1clk,
  pmu_tim7_p1rst_b,
  pmu_usi1_p1clk,
  pmu_usi1_p1rst_b,
  rtc_apb1_prdata,
  scan_mode,
  tim1_wic_intr,
  tim3_wic_intr,
  tim5_wic_intr,
  tim7_wic_intr,
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
  usi1_wic_intr
);
input   [31:0]  gpio_apb1_prdata;         
input           ioctl_usi1_nss_in;        
input           ioctl_usi1_sclk_in;       
input           ioctl_usi1_sd0_in;        
input           ioctl_usi1_sd1_in;        
input   [31:0]  lsbus_apb1_s3_haddr;      
input   [2 :0]  lsbus_apb1_s3_hburst;     
input   [3 :0]  lsbus_apb1_s3_hprot;      
input           lsbus_apb1_s3_hsel;       
input   [2 :0]  lsbus_apb1_s3_hsize;      
input   [1 :0]  lsbus_apb1_s3_htrans;     
input   [31:0]  lsbus_apb1_s3_hwdata;     
input           lsbus_apb1_s3_hwrite;     
input           pmu_apb1_pclk_en;         
input   [31:0]  pmu_apb1_prdata;          
input           pmu_apb1_s3clk;           
input           pmu_apb1_s3rst_b;         
input           pmu_dummy1_p1clk;         
input           pmu_dummy1_p1rst_b;       
input           pmu_dummy2_p1clk;         
input           pmu_dummy2_p1rst_b;       
input           pmu_dummy3_p1clk;         
input           pmu_dummy3_p1rst_b;       
input           pmu_dummy4_p1clk;         
input           pmu_dummy4_p1rst_b;       
input           pmu_dummy5_p1clk;         
input           pmu_dummy5_p1rst_b;       
input           pmu_dummy6_p1clk;         
input           pmu_dummy6_p1rst_b;       
input           pmu_dummy7_p1clk;         
input           pmu_dummy7_p1rst_b;       
input           pmu_dummy8_p1clk;         
input           pmu_dummy8_p1rst_b;       
input           pmu_tim1_p1clk;           
input           pmu_tim1_p1rst_b;         
input           pmu_tim3_p1clk;           
input           pmu_tim3_p1rst_b;         
input           pmu_tim5_p1clk;           
input           pmu_tim5_p1rst_b;         
input           pmu_tim7_p1clk;           
input           pmu_tim7_p1rst_b;         
input           pmu_usi1_p1clk;           
input           pmu_usi1_p1rst_b;         
input   [31:0]  rtc_apb1_prdata;          
input           scan_mode;                
output          apb1_dummy1_intr;         
output          apb1_dummy2_intr;         
output          apb1_dummy3_intr;         
output          apb1_dummy4_intr;         
output          apb1_dummy5_intr;         
output          apb1_dummy6_intr;         
output          apb1_dummy7_intr;         
output          apb1_dummy8_intr;         
output          apb1_gpio_psel_s5;        
output  [31:0]  apb1_lsbus_s3_hrdata;     
output          apb1_lsbus_s3_hready;     
output  [1 :0]  apb1_lsbus_s3_hresp;      
output          apb1_pmu_psel_s15;        
output          apb1_rtc_psel_s6;         
output  [31:0]  apb1_xx_paddr;            
output          apb1_xx_penable;          
output  [2 :0]  apb1_xx_pprot;            
output  [31:0]  apb1_xx_pwdata;           
output          apb1_xx_pwrite;           
output  [1 :0]  tim1_wic_intr;            
output  [1 :0]  tim3_wic_intr;            
output  [1 :0]  tim5_wic_intr;            
output  [1 :0]  tim7_wic_intr;            
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
wire    [3 :0]  apb1_burst;               
wire            apb1_dummy1_intr;         
wire            apb1_dummy1_psel_s7;      
wire            apb1_dummy2_intr;         
wire            apb1_dummy2_psel_s8;      
wire            apb1_dummy3_intr;         
wire            apb1_dummy3_psel_s9;      
wire            apb1_dummy4_intr;         
wire            apb1_dummy4_psel_s10;     
wire            apb1_dummy5_intr;         
wire            apb1_dummy5_psel_s11;     
wire            apb1_dummy6_intr;         
wire            apb1_dummy6_psel_s12;     
wire            apb1_dummy7_intr;         
wire            apb1_dummy7_psel_s13;     
wire            apb1_dummy8_intr;         
wire            apb1_dummy8_psel_s14;     
wire            apb1_gpio_psel_s5;        
wire    [31:0]  apb1_lsbus_s3_hrdata;     
wire            apb1_lsbus_s3_hready;     
wire    [1 :0]  apb1_lsbus_s3_hresp;      
wire            apb1_pmu_psel_s15;        
wire            apb1_rtc_psel_s6;         
wire            apb1_sec;                 
wire    [31:0]  apb1_tim1_paddr;          
wire            apb1_tim1_penable;        
wire            apb1_tim1_psel_s0;        
wire    [31:0]  apb1_tim1_pwdata;         
wire            apb1_tim1_pwrite;         
wire    [31:0]  apb1_tim3_paddr;          
wire            apb1_tim3_penable;        
wire            apb1_tim3_psel_s1;        
wire    [31:0]  apb1_tim3_pwdata;         
wire            apb1_tim3_pwrite;         
wire    [31:0]  apb1_tim5_paddr;          
wire            apb1_tim5_penable;        
wire            apb1_tim5_psel_s2;        
wire    [31:0]  apb1_tim5_pwdata;         
wire            apb1_tim5_pwrite;         
wire    [31:0]  apb1_tim7_paddr;          
wire            apb1_tim7_penable;        
wire            apb1_tim7_psel_s3;        
wire    [31:0]  apb1_tim7_pwdata;         
wire            apb1_tim7_pwrite;         
wire    [31:0]  apb1_usi1_paddr;          
wire            apb1_usi1_penable;        
wire            apb1_usi1_psel_s4;        
wire    [31:0]  apb1_usi1_pwdata;         
wire            apb1_usi1_pwrite;         
wire    [31:0]  apb1_xx_paddr;            
wire            apb1_xx_penable;          
wire    [2 :0]  apb1_xx_pprot;            
wire    [3 :0]  apb1_xx_pstrb_s;          
wire    [31:0]  apb1_xx_pwdata;           
wire            apb1_xx_pwrite;           
wire            dmac0_usi1_rx_ack;        
wire            dmac0_usi1_tx_ack;        
wire    [31:0]  dummy1_apb1_prdata;       
wire    [31:0]  dummy2_apb1_prdata;       
wire    [31:0]  dummy3_apb1_prdata;       
wire    [31:0]  dummy4_apb1_prdata;       
wire    [31:0]  dummy5_apb1_prdata;       
wire    [31:0]  dummy6_apb1_prdata;       
wire    [31:0]  dummy7_apb1_prdata;       
wire    [31:0]  dummy8_apb1_prdata;       
wire            etb_tim1_trig_en_off1;    
wire            etb_tim1_trig_en_off2;    
wire            etb_tim1_trig_en_on1;     
wire            etb_tim1_trig_en_on2;     
wire            etb_tim3_trig_en_off1;    
wire            etb_tim3_trig_en_off2;    
wire            etb_tim3_trig_en_on1;     
wire            etb_tim3_trig_en_on2;     
wire            etb_tim5_trig_en_off1;    
wire            etb_tim5_trig_en_off2;    
wire            etb_tim5_trig_en_on1;     
wire            etb_tim5_trig_en_on2;     
wire            etb_tim7_trig_en_off1;    
wire            etb_tim7_trig_en_off2;    
wire            etb_tim7_trig_en_on1;     
wire            etb_tim7_trig_en_on2;     
wire    [31:0]  gpio_apb1_prdata;         
wire            ioctl_usi1_nss_in;        
wire            ioctl_usi1_sclk_in;       
wire            ioctl_usi1_sd0_in;        
wire            ioctl_usi1_sd1_in;        
wire    [31:0]  lsbus_apb1_s3_haddr;      
wire    [2 :0]  lsbus_apb1_s3_hburst;     
wire    [3 :0]  lsbus_apb1_s3_hprot;      
wire            lsbus_apb1_s3_hsel;       
wire    [2 :0]  lsbus_apb1_s3_hsize;      
wire    [1 :0]  lsbus_apb1_s3_htrans;     
wire    [31:0]  lsbus_apb1_s3_hwdata;     
wire            lsbus_apb1_s3_hwrite;     
wire            pmu_apb1_pclk_en;         
wire    [31:0]  pmu_apb1_prdata;          
wire            pmu_apb1_s3clk;           
wire            pmu_apb1_s3rst_b;         
wire            pmu_dummy1_p1clk;         
wire            pmu_dummy1_p1rst_b;       
wire            pmu_dummy2_p1clk;         
wire            pmu_dummy2_p1rst_b;       
wire            pmu_dummy3_p1clk;         
wire            pmu_dummy3_p1rst_b;       
wire            pmu_dummy4_p1clk;         
wire            pmu_dummy4_p1rst_b;       
wire            pmu_dummy5_p1clk;         
wire            pmu_dummy5_p1rst_b;       
wire            pmu_dummy6_p1clk;         
wire            pmu_dummy6_p1rst_b;       
wire            pmu_dummy7_p1clk;         
wire            pmu_dummy7_p1rst_b;       
wire            pmu_dummy8_p1clk;         
wire            pmu_dummy8_p1rst_b;       
wire            pmu_tim1_p1clk;           
wire            pmu_tim1_p1rst_b;         
wire            pmu_tim3_p1clk;           
wire            pmu_tim3_p1rst_b;         
wire            pmu_tim5_p1clk;           
wire            pmu_tim5_p1rst_b;         
wire            pmu_tim7_p1clk;           
wire            pmu_tim7_p1rst_b;         
wire            pmu_usi1_p1clk;           
wire            pmu_usi1_p1rst_b;         
wire    [31:0]  rtc_apb1_prdata;          
wire            scan_mode;                
wire            sec_usi1_dmac0_dma_rx_req; 
wire            sec_usi1_dmac0_dma_tx_req; 
wire    [31:0]  tim1_apb1_prdata;         
wire    [1 :0]  tim1_wic_intr;            
wire    [31:0]  tim3_apb1_prdata;         
wire    [1 :0]  tim3_wic_intr;            
wire    [31:0]  tim5_apb1_prdata;         
wire    [1 :0]  tim5_wic_intr;            
wire    [31:0]  tim7_apb1_prdata;         
wire    [1 :0]  tim7_wic_intr;            
wire            timer1_tim1_etb_trig;     
wire            timer1_tim2_etb_trig;     
wire            timer3_tim1_etb_trig;     
wire            timer3_tim2_etb_trig;     
wire            timer5_tim1_etb_trig;     
wire            timer5_tim2_etb_trig;     
wire            timer7_tim1_etb_trig;     
wire            timer7_tim2_etb_trig;     
wire            tipc_tim1_trust;          
wire            tipc_tim3_trust;          
wire            tipc_tim5_trust;          
wire            tipc_tim7_trust;          
wire            tipc_usi1_trust;          
wire    [31:0]  usi1_apb1_prdata;         
wire            usi1_dmac0_dma_rx_req;    
wire            usi1_dmac0_dma_tx_req;    
wire            usi1_etb_rx_trig;         
wire            usi1_etb_tx_trig;         
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
assign apb1_sec = 1'b1;
assign apb1_burst[3:0] = {1'b0,lsbus_apb1_s3_hburst[2:0]};
csky_apb1_top  x_apb1_sub_top (
  .haddr                (lsbus_apb1_s3_haddr ),
  .hburst               (apb1_burst          ),
  .hclk                 (pmu_apb1_s3clk      ),
  .hprot                (lsbus_apb1_s3_hprot ),
  .hrdata               (apb1_lsbus_s3_hrdata),
  .hreadyin             (1'b1                ),
  .hreadyout            (apb1_lsbus_s3_hready),
  .hresp                (apb1_lsbus_s3_hresp ),
  .hrst_n               (pmu_apb1_s3rst_b    ),
  .hsec                 (apb1_sec            ),
  .hsel                 (lsbus_apb1_s3_hsel  ),
  .hsize                (lsbus_apb1_s3_hsize ),
  .htrans               (lsbus_apb1_s3_htrans),
  .hwdata               (lsbus_apb1_s3_hwdata),
  .hwrite               (lsbus_apb1_s3_hwrite),
  .paddr_s              (apb1_xx_paddr       ),
  .pclk_en              (pmu_apb1_pclk_en    ),
  .penable_s            (apb1_xx_penable     ),
  .pprot_s              (apb1_xx_pprot       ),
  .prdata_s0            (tim1_apb1_prdata    ),
  .prdata_s1            (tim3_apb1_prdata    ),
  .prdata_s10           (dummy4_apb1_prdata  ),
  .prdata_s11           (dummy5_apb1_prdata  ),
  .prdata_s12           (dummy6_apb1_prdata  ),
  .prdata_s13           (dummy7_apb1_prdata  ),
  .prdata_s14           (dummy8_apb1_prdata  ),
  .prdata_s15           (pmu_apb1_prdata     ),
  .prdata_s2            (tim5_apb1_prdata    ),
  .prdata_s3            (tim7_apb1_prdata    ),
  .prdata_s4            (usi1_apb1_prdata    ),
  .prdata_s5            (gpio_apb1_prdata    ),
  .prdata_s6            (rtc_apb1_prdata     ),
  .prdata_s7            (dummy1_apb1_prdata  ),
  .prdata_s8            (dummy2_apb1_prdata  ),
  .prdata_s9            (dummy3_apb1_prdata  ),
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
  .psel_s0              (apb1_tim1_psel_s0   ),
  .psel_s1              (apb1_tim3_psel_s1   ),
  .psel_s10             (apb1_dummy4_psel_s10),
  .psel_s11             (apb1_dummy5_psel_s11),
  .psel_s12             (apb1_dummy6_psel_s12),
  .psel_s13             (apb1_dummy7_psel_s13),
  .psel_s14             (apb1_dummy8_psel_s14),
  .psel_s15             (apb1_pmu_psel_s15   ),
  .psel_s2              (apb1_tim5_psel_s2   ),
  .psel_s3              (apb1_tim7_psel_s3   ),
  .psel_s4              (apb1_usi1_psel_s4   ),
  .psel_s5              (apb1_gpio_psel_s5   ),
  .psel_s6              (apb1_rtc_psel_s6    ),
  .psel_s7              (apb1_dummy1_psel_s7 ),
  .psel_s8              (apb1_dummy2_psel_s8 ),
  .psel_s9              (apb1_dummy3_psel_s9 ),
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
  .pstrb_s              (apb1_xx_pstrb_s     ),
  .pwdata_s             (apb1_xx_pwdata      ),
  .pwrite_s             (apb1_xx_pwrite      )
);
tim1_sec_top  x_tim1_sec_top (
  .etb_tim1_trig_en_off  (etb_tim1_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim1_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim1_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim1_trig_en_on2 ),
  .intr                  (tim1_wic_intr        ),
  .paddr                 (apb1_tim1_paddr      ),
  .pclk                  (pmu_tim1_p1clk       ),
  .penable               (apb1_tim1_penable    ),
  .pprot                 (apb1_xx_pprot        ),
  .prdata                (tim1_apb1_prdata     ),
  .presetn               (pmu_tim1_p1rst_b     ),
  .psel                  (apb1_tim1_psel_s0    ),
  .pwdata                (apb1_tim1_pwdata     ),
  .pwrite                (apb1_tim1_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer1_tim1_etb_trig ),
  .tim2_etb_trig         (timer1_tim2_etb_trig ),
  .tipc_tim1_trust       (tipc_tim1_trust      )
);
tim3_sec_top  x_tim3_sec_top (
  .etb_tim1_trig_en_off  (etb_tim3_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim3_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim3_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim3_trig_en_on2 ),
  .intr                  (tim3_wic_intr        ),
  .paddr                 (apb1_tim3_paddr      ),
  .pclk                  (pmu_tim3_p1clk       ),
  .penable               (apb1_tim3_penable    ),
  .pprot                 (apb1_xx_pprot        ),
  .prdata                (tim3_apb1_prdata     ),
  .presetn               (pmu_tim3_p1rst_b     ),
  .psel                  (apb1_tim3_psel_s1    ),
  .pwdata                (apb1_tim3_pwdata     ),
  .pwrite                (apb1_tim3_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer3_tim1_etb_trig ),
  .tim2_etb_trig         (timer3_tim2_etb_trig ),
  .tipc_tim3_trust       (tipc_tim3_trust      )
);
tim5_sec_top  x_tim5_sec_top (
  .etb_tim1_trig_en_off  (etb_tim5_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim5_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim5_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim5_trig_en_on2 ),
  .intr                  (tim5_wic_intr        ),
  .paddr                 (apb1_tim5_paddr      ),
  .pclk                  (pmu_tim5_p1clk       ),
  .penable               (apb1_tim5_penable    ),
  .pprot                 (apb1_xx_pprot        ),
  .prdata                (tim5_apb1_prdata     ),
  .presetn               (pmu_tim5_p1rst_b     ),
  .psel                  (apb1_tim5_psel_s2    ),
  .pwdata                (apb1_tim5_pwdata     ),
  .pwrite                (apb1_tim5_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer5_tim1_etb_trig ),
  .tim2_etb_trig         (timer5_tim2_etb_trig ),
  .tipc_tim5_trust       (tipc_tim5_trust      )
);
tim7_sec_top  x_tim7_sec_top (
  .etb_tim1_trig_en_off  (etb_tim7_trig_en_off1),
  .etb_tim1_trig_en_on   (etb_tim7_trig_en_on1 ),
  .etb_tim2_trig_en_off  (etb_tim7_trig_en_off2),
  .etb_tim2_trig_en_on   (etb_tim7_trig_en_on2 ),
  .intr                  (tim7_wic_intr        ),
  .paddr                 (apb1_tim7_paddr      ),
  .pclk                  (pmu_tim7_p1clk       ),
  .penable               (apb1_tim7_penable    ),
  .pprot                 (apb1_xx_pprot        ),
  .prdata                (tim7_apb1_prdata     ),
  .presetn               (pmu_tim7_p1rst_b     ),
  .psel                  (apb1_tim7_psel_s3    ),
  .pwdata                (apb1_tim7_pwdata     ),
  .pwrite                (apb1_tim7_pwrite     ),
  .scan_mode             (scan_mode            ),
  .tim1_etb_trig         (timer7_tim1_etb_trig ),
  .tim2_etb_trig         (timer7_tim2_etb_trig ),
  .tipc_tim7_trust       (tipc_tim7_trust      )
);
usi1_sec_top  x_usi1_sec_top (
  .clk                       (pmu_usi1_p1clk           ),
  .dma_ack_rx                (dmac0_usi1_rx_ack        ),
  .dma_ack_tx                (dmac0_usi1_tx_ack        ),
  .dma_req_rx                (usi1_dmac0_dma_rx_req    ),
  .dma_req_tx                (usi1_dmac0_dma_tx_req    ),
  .nss_ie_n                  (usi1_ioctl_nss_ie_n      ),
  .nss_in                    (ioctl_usi1_nss_in        ),
  .nss_oe_n                  (usi1_ioctl_nss_oe_n      ),
  .nss_out                   (usi1_ioctl_nss_out       ),
  .paddr                     (apb1_usi1_paddr          ),
  .penable                   (apb1_usi1_penable        ),
  .pprot                     (apb1_xx_pprot            ),
  .prdata                    (usi1_apb1_prdata         ),
  .psel                      (apb1_usi1_psel_s4        ),
  .pwdata                    (apb1_usi1_pwdata         ),
  .pwrite                    (apb1_usi1_pwrite         ),
  .rst_n                     (pmu_usi1_p1rst_b         ),
  .sclk_ie_n                 (usi1_ioctl_sclk_ie_n     ),
  .sclk_in                   (ioctl_usi1_sclk_in       ),
  .sclk_oe_n                 (usi1_ioctl_sclk_oe_n     ),
  .sclk_out                  (usi1_ioctl_sclk_out      ),
  .sd0_ie_n                  (usi1_ioctl_sd0_ie_n      ),
  .sd0_in                    (ioctl_usi1_sd0_in        ),
  .sd0_oe_n                  (usi1_ioctl_sd0_oe_n      ),
  .sd0_out                   (usi1_ioctl_sd0_out       ),
  .sd1_ie_n                  (usi1_ioctl_sd1_ie_n      ),
  .sd1_in                    (ioctl_usi1_sd1_in        ),
  .sd1_oe_n                  (usi1_ioctl_sd1_oe_n      ),
  .sd1_out                   (usi1_ioctl_sd1_out       ),
  .sec_rx_req                (sec_usi1_dmac0_dma_rx_req),
  .sec_tx_req                (sec_usi1_dmac0_dma_tx_req),
  .tipc_usi1_trust           (tipc_usi1_trust          ),
  .usi_etb_rx_trig           (usi1_etb_rx_trig         ),
  .usi_etb_tx_trig           (usi1_etb_tx_trig         ),
  .usi_intr                  (usi1_wic_intr            )
);
apb_dummy_top  x_apb1_dummy_top1 (
  .intr                (apb1_dummy1_intr   ),
  .paddr               (apb1_xx_paddr      ),
  .pclk                (pmu_dummy1_p1clk   ),
  .penable             (apb1_xx_penable    ),
  .pprot               (apb1_xx_pprot      ),
  .prdata              (dummy1_apb1_prdata ),
  .presetn             (pmu_dummy1_p1rst_b ),
  .psel                (apb1_dummy1_psel_s7),
  .pwdata              (apb1_xx_pwdata     ),
  .pwrite              (apb1_xx_pwrite     )
);
apb_dummy_top  x_apb1_dummy_top2 (
  .intr                (apb1_dummy2_intr   ),
  .paddr               (apb1_xx_paddr      ),
  .pclk                (pmu_dummy2_p1clk   ),
  .penable             (apb1_xx_penable    ),
  .pprot               (apb1_xx_pprot      ),
  .prdata              (dummy2_apb1_prdata ),
  .presetn             (pmu_dummy2_p1rst_b ),
  .psel                (apb1_dummy2_psel_s8),
  .pwdata              (apb1_xx_pwdata     ),
  .pwrite              (apb1_xx_pwrite     )
);
apb_dummy_top  x_apb1_dummy_top3 (
  .intr                (apb1_dummy3_intr   ),
  .paddr               (apb1_xx_paddr      ),
  .pclk                (pmu_dummy3_p1clk   ),
  .penable             (apb1_xx_penable    ),
  .pprot               (apb1_xx_pprot      ),
  .prdata              (dummy3_apb1_prdata ),
  .presetn             (pmu_dummy3_p1rst_b ),
  .psel                (apb1_dummy3_psel_s9),
  .pwdata              (apb1_xx_pwdata     ),
  .pwrite              (apb1_xx_pwrite     )
);
apb_dummy_top  x_apb1_dummy_top4 (
  .intr                 (apb1_dummy4_intr    ),
  .paddr                (apb1_xx_paddr       ),
  .pclk                 (pmu_dummy4_p1clk    ),
  .penable              (apb1_xx_penable     ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (dummy4_apb1_prdata  ),
  .presetn              (pmu_dummy4_p1rst_b  ),
  .psel                 (apb1_dummy4_psel_s10),
  .pwdata               (apb1_xx_pwdata      ),
  .pwrite               (apb1_xx_pwrite      )
);
apb_dummy_top  x_apb1_dummy_top5 (
  .intr                 (apb1_dummy5_intr    ),
  .paddr                (apb1_xx_paddr       ),
  .pclk                 (pmu_dummy5_p1clk    ),
  .penable              (apb1_xx_penable     ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (dummy5_apb1_prdata  ),
  .presetn              (pmu_dummy5_p1rst_b  ),
  .psel                 (apb1_dummy5_psel_s11),
  .pwdata               (apb1_xx_pwdata      ),
  .pwrite               (apb1_xx_pwrite      )
);
apb_dummy_top  x_apb1_dummy_top6 (
  .intr                 (apb1_dummy6_intr    ),
  .paddr                (apb1_xx_paddr       ),
  .pclk                 (pmu_dummy6_p1clk    ),
  .penable              (apb1_xx_penable     ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (dummy6_apb1_prdata  ),
  .presetn              (pmu_dummy6_p1rst_b  ),
  .psel                 (apb1_dummy6_psel_s12),
  .pwdata               (apb1_xx_pwdata      ),
  .pwrite               (apb1_xx_pwrite      )
);
apb_dummy_top  x_apb1_dummy_top7 (
  .intr                 (apb1_dummy7_intr    ),
  .paddr                (apb1_xx_paddr       ),
  .pclk                 (pmu_dummy7_p1clk    ),
  .penable              (apb1_xx_penable     ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (dummy7_apb1_prdata  ),
  .presetn              (pmu_dummy7_p1rst_b  ),
  .psel                 (apb1_dummy7_psel_s13),
  .pwdata               (apb1_xx_pwdata      ),
  .pwrite               (apb1_xx_pwrite      )
);
apb_dummy_top  x_apb1_dummy_top8 (
  .intr                 (apb1_dummy8_intr    ),
  .paddr                (apb1_xx_paddr       ),
  .pclk                 (pmu_dummy8_p1clk    ),
  .penable              (apb1_xx_penable     ),
  .pprot                (apb1_xx_pprot       ),
  .prdata               (dummy8_apb1_prdata  ),
  .presetn              (pmu_dummy8_p1rst_b  ),
  .psel                 (apb1_dummy8_psel_s14),
  .pwdata               (apb1_xx_pwdata      ),
  .pwrite               (apb1_xx_pwrite      )
);
assign apb1_tim1_pwrite   = apb1_xx_pwrite;
assign apb1_tim3_pwrite   = apb1_xx_pwrite;
assign apb1_tim5_pwrite   = apb1_xx_pwrite;
assign apb1_tim7_pwrite   = apb1_xx_pwrite;
assign apb1_usi1_pwrite   = apb1_xx_pwrite;
assign apb1_tim1_penable   = apb1_xx_penable;
assign apb1_tim3_penable   = apb1_xx_penable;
assign apb1_tim5_penable   = apb1_xx_penable;
assign apb1_tim7_penable   = apb1_xx_penable;
assign apb1_usi1_penable   = apb1_xx_penable;
assign apb1_tim1_pwdata[31:0]  = apb1_xx_pwdata[31:0];
assign apb1_tim3_pwdata[31:0]  = apb1_xx_pwdata[31:0];
assign apb1_tim5_pwdata[31:0]  = apb1_xx_pwdata[31:0];
assign apb1_tim7_pwdata[31:0]  = apb1_xx_pwdata[31:0];
assign apb1_usi1_pwdata[31:0]  = apb1_xx_pwdata[31:0];
assign apb1_tim1_paddr[31:0]   = apb1_xx_paddr[31:0];
assign apb1_tim3_paddr[31:0]   = apb1_xx_paddr[31:0];
assign apb1_tim5_paddr[31:0]   = apb1_xx_paddr[31:0];
assign apb1_tim7_paddr[31:0]   = apb1_xx_paddr[31:0];
assign apb1_usi1_paddr[31:0]   = apb1_xx_paddr[31:0];
assign etb_tim1_trig_en_off1 = 1'b0;
assign etb_tim1_trig_en_off2 = 1'b0;
assign etb_tim1_trig_en_on1 = 1'b0;
assign etb_tim1_trig_en_on2 = 1'b0;
assign etb_tim3_trig_en_off1 = 1'b0;
assign etb_tim3_trig_en_off2 = 1'b0;
assign etb_tim3_trig_en_on1 = 1'b0;
assign etb_tim3_trig_en_on2 = 1'b0;
assign etb_tim5_trig_en_off1 = 1'b0;
assign etb_tim5_trig_en_off2 = 1'b0;
assign etb_tim5_trig_en_on1 = 1'b0;
assign etb_tim5_trig_en_on2 = 1'b0;
assign etb_tim7_trig_en_off1 = 1'b0;
assign etb_tim7_trig_en_off2 = 1'b0;
assign etb_tim7_trig_en_on1 = 1'b0;
assign etb_tim7_trig_en_on2 = 1'b0;
assign dmac0_usi1_rx_ack = 1'b0;        
assign dmac0_usi1_tx_ack = 1'b0;     
assign tipc_tim1_trust = 1'b0;
assign tipc_tim3_trust = 1'b0;
assign tipc_tim5_trust = 1'b0;
assign tipc_tim7_trust = 1'b0;
assign tipc_usi1_trust = 1'b0;
endmodule
