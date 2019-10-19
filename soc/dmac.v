/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module arb_ctrl(
  arb_bmux_transvld,
  arb_bmux_trgvld,
  busy_chn_code,
  ch0c_gbc_chnen,
  ch0c_gbc_sfwtrg,
  ch0c_gbc_trgclr,
  ch0chgen,
  ch10c_gbc_chnen,
  ch10c_gbc_sfwtrg,
  ch10c_gbc_trgclr,
  ch10chgen,
  ch11c_gbc_chnen,
  ch11c_gbc_sfwtrg,
  ch11c_gbc_trgclr,
  ch11chgen,
  ch12c_gbc_chnen,
  ch12c_gbc_sfwtrg,
  ch12c_gbc_trgclr,
  ch12chgen,
  ch13c_gbc_chnen,
  ch13c_gbc_sfwtrg,
  ch13c_gbc_trgclr,
  ch13chgen,
  ch14c_gbc_chnen,
  ch14c_gbc_sfwtrg,
  ch14c_gbc_trgclr,
  ch14chgen,
  ch15c_gbc_chnen,
  ch15c_gbc_sfwtrg,
  ch15c_gbc_trgclr,
  ch15chgen,
  ch1c_gbc_chnen,
  ch1c_gbc_sfwtrg,
  ch1c_gbc_trgclr,
  ch1chgen,
  ch2c_gbc_chnen,
  ch2c_gbc_sfwtrg,
  ch2c_gbc_trgclr,
  ch2chgen,
  ch3c_gbc_chnen,
  ch3c_gbc_sfwtrg,
  ch3c_gbc_trgclr,
  ch3chgen,
  ch4c_gbc_chnen,
  ch4c_gbc_sfwtrg,
  ch4c_gbc_trgclr,
  ch4chgen,
  ch5c_gbc_chnen,
  ch5c_gbc_sfwtrg,
  ch5c_gbc_trgclr,
  ch5chgen,
  ch6c_gbc_chnen,
  ch6c_gbc_sfwtrg,
  ch6c_gbc_trgclr,
  ch6chgen,
  ch7c_gbc_chnen,
  ch7c_gbc_sfwtrg,
  ch7c_gbc_trgclr,
  ch7chgen,
  ch8c_gbc_chnen,
  ch8c_gbc_sfwtrg,
  ch8c_gbc_trgclr,
  ch8chgen,
  ch9c_gbc_chnen,
  ch9c_gbc_sfwtrg,
  ch9c_gbc_trgclr,
  ch9chgen,
  chreq0,
  chreq1,
  chreq10,
  chreq11,
  chreq12,
  chreq13,
  chreq14,
  chreq15,
  chreq2,
  chreq3,
  chreq4,
  chreq5,
  chreq6,
  chreq7,
  chreq8,
  chreq9,
  etb_dmacch0_trg,
  etb_dmacch10_trg,
  etb_dmacch11_trg,
  etb_dmacch12_trg,
  etb_dmacch13_trg,
  etb_dmacch14_trg,
  etb_dmacch15_trg,
  etb_dmacch1_trg,
  etb_dmacch2_trg,
  etb_dmacch3_trg,
  etb_dmacch4_trg,
  etb_dmacch5_trg,
  etb_dmacch6_trg,
  etb_dmacch7_trg,
  etb_dmacch8_trg,
  etb_dmacch9_trg,
  hclk,
  hpreq0,
  hpreq1,
  hpreq10,
  hpreq11,
  hpreq12,
  hpreq13,
  hpreq14,
  hpreq15,
  hpreq2,
  hpreq3,
  hpreq4,
  hpreq5,
  hpreq6,
  hpreq7,
  hpreq8,
  hpreq9,
  hrst_n
);
input           ch0c_gbc_chnen;   
input           ch0c_gbc_sfwtrg;  
input           ch0c_gbc_trgclr;  
input           ch0chgen;         
input           ch10c_gbc_chnen;  
input           ch10c_gbc_sfwtrg; 
input           ch10c_gbc_trgclr; 
input           ch10chgen;        
input           ch11c_gbc_chnen;  
input           ch11c_gbc_sfwtrg; 
input           ch11c_gbc_trgclr; 
input           ch11chgen;        
input           ch12c_gbc_chnen;  
input           ch12c_gbc_sfwtrg; 
input           ch12c_gbc_trgclr; 
input           ch12chgen;        
input           ch13c_gbc_chnen;  
input           ch13c_gbc_sfwtrg; 
input           ch13c_gbc_trgclr; 
input           ch13chgen;        
input           ch14c_gbc_chnen;  
input           ch14c_gbc_sfwtrg; 
input           ch14c_gbc_trgclr; 
input           ch14chgen;        
input           ch15c_gbc_chnen;  
input           ch15c_gbc_sfwtrg; 
input           ch15c_gbc_trgclr; 
input           ch15chgen;        
input           ch1c_gbc_chnen;   
input           ch1c_gbc_sfwtrg;  
input           ch1c_gbc_trgclr;  
input           ch1chgen;         
input           ch2c_gbc_chnen;   
input           ch2c_gbc_sfwtrg;  
input           ch2c_gbc_trgclr;  
input           ch2chgen;         
input           ch3c_gbc_chnen;   
input           ch3c_gbc_sfwtrg;  
input           ch3c_gbc_trgclr;  
input           ch3chgen;         
input           ch4c_gbc_chnen;   
input           ch4c_gbc_sfwtrg;  
input           ch4c_gbc_trgclr;  
input           ch4chgen;         
input           ch5c_gbc_chnen;   
input           ch5c_gbc_sfwtrg;  
input           ch5c_gbc_trgclr;  
input           ch5chgen;         
input           ch6c_gbc_chnen;   
input           ch6c_gbc_sfwtrg;  
input           ch6c_gbc_trgclr;  
input           ch6chgen;         
input           ch7c_gbc_chnen;   
input           ch7c_gbc_sfwtrg;  
input           ch7c_gbc_trgclr;  
input           ch7chgen;         
input           ch8c_gbc_chnen;   
input           ch8c_gbc_sfwtrg;  
input           ch8c_gbc_trgclr;  
input           ch8chgen;         
input           ch9c_gbc_chnen;   
input           ch9c_gbc_sfwtrg;  
input           ch9c_gbc_trgclr;  
input           ch9chgen;         
input           etb_dmacch0_trg;  
input           etb_dmacch10_trg; 
input           etb_dmacch11_trg; 
input           etb_dmacch12_trg; 
input           etb_dmacch13_trg; 
input           etb_dmacch14_trg; 
input           etb_dmacch15_trg; 
input           etb_dmacch1_trg;  
input           etb_dmacch2_trg;  
input           etb_dmacch3_trg;  
input           etb_dmacch4_trg;  
input           etb_dmacch5_trg;  
input           etb_dmacch6_trg;  
input           etb_dmacch7_trg;  
input           etb_dmacch8_trg;  
input           etb_dmacch9_trg;  
input           hclk;             
input           hrst_n;           
output          arb_bmux_transvld; 
output          arb_bmux_trgvld;  
output  [15:0]  busy_chn_code;    
output          chreq0;           
output          chreq1;           
output          chreq10;          
output          chreq11;          
output          chreq12;          
output          chreq13;          
output          chreq14;          
output          chreq15;          
output          chreq2;           
output          chreq3;           
output          chreq4;           
output          chreq5;           
output          chreq6;           
output          chreq7;           
output          chreq8;           
output          chreq9;           
output          hpreq0;           
output          hpreq1;           
output          hpreq10;          
output          hpreq11;          
output          hpreq12;          
output          hpreq13;          
output          hpreq14;          
output          hpreq15;          
output          hpreq2;           
output          hpreq3;           
output          hpreq4;           
output          hpreq5;           
output          hpreq6;           
output          hpreq7;           
output          hpreq8;           
output          hpreq9;           
reg     [15:0]  busy_chn_cod;     
reg             trg_req_d0;       
wire    [15:0]  actv_chn_cod;     
wire            arb_bmux_transvld; 
wire            arb_bmux_trgvld;  
wire    [15:0]  busy_chn_code;    
wire            ch0c_gbc_chnen;   
wire            ch0c_gbc_sfwtrg;  
wire            ch0c_gbc_trgclr;  
wire            ch0chgen;         
wire            ch0trg_latch;     
wire            ch10c_gbc_chnen;  
wire            ch10c_gbc_sfwtrg; 
wire            ch10c_gbc_trgclr; 
wire            ch10chgen;        
wire            ch10trg_latch;    
wire            ch11c_gbc_chnen;  
wire            ch11c_gbc_sfwtrg; 
wire            ch11c_gbc_trgclr; 
wire            ch11chgen;        
wire            ch11trg_latch;    
wire            ch12c_gbc_chnen;  
wire            ch12c_gbc_sfwtrg; 
wire            ch12c_gbc_trgclr; 
wire            ch12chgen;        
wire            ch12trg_latch;    
wire            ch13c_gbc_chnen;  
wire            ch13c_gbc_sfwtrg; 
wire            ch13c_gbc_trgclr; 
wire            ch13chgen;        
wire            ch13trg_latch;    
wire            ch14c_gbc_chnen;  
wire            ch14c_gbc_sfwtrg; 
wire            ch14c_gbc_trgclr; 
wire            ch14chgen;        
wire            ch14trg_latch;    
wire            ch15c_gbc_chnen;  
wire            ch15c_gbc_sfwtrg; 
wire            ch15c_gbc_trgclr; 
wire            ch15chgen;        
wire            ch15trg_latch;    
wire            ch1c_gbc_chnen;   
wire            ch1c_gbc_sfwtrg;  
wire            ch1c_gbc_trgclr;  
wire            ch1chgen;         
wire            ch1trg_latch;     
wire            ch2c_gbc_chnen;   
wire            ch2c_gbc_sfwtrg;  
wire            ch2c_gbc_trgclr;  
wire            ch2chgen;         
wire            ch2trg_latch;     
wire            ch3c_gbc_chnen;   
wire            ch3c_gbc_sfwtrg;  
wire            ch3c_gbc_trgclr;  
wire            ch3chgen;         
wire            ch3trg_latch;     
wire            ch4c_gbc_chnen;   
wire            ch4c_gbc_sfwtrg;  
wire            ch4c_gbc_trgclr;  
wire            ch4chgen;         
wire            ch4trg_latch;     
wire            ch5c_gbc_chnen;   
wire            ch5c_gbc_sfwtrg;  
wire            ch5c_gbc_trgclr;  
wire            ch5chgen;         
wire            ch5trg_latch;     
wire            ch6c_gbc_chnen;   
wire            ch6c_gbc_sfwtrg;  
wire            ch6c_gbc_trgclr;  
wire            ch6chgen;         
wire            ch6trg_latch;     
wire            ch7c_gbc_chnen;   
wire            ch7c_gbc_sfwtrg;  
wire            ch7c_gbc_trgclr;  
wire            ch7chgen;         
wire            ch7trg_latch;     
wire            ch8c_gbc_chnen;   
wire            ch8c_gbc_sfwtrg;  
wire            ch8c_gbc_trgclr;  
wire            ch8chgen;         
wire            ch8trg_latch;     
wire            ch9c_gbc_chnen;   
wire            ch9c_gbc_sfwtrg;  
wire            ch9c_gbc_trgclr;  
wire            ch9chgen;         
wire            ch9trg_latch;     
wire            chchgen;          
wire    [15:0]  chntrg_all;       
wire            chreq0;           
wire            chreq1;           
wire            chreq10;          
wire            chreq11;          
wire            chreq12;          
wire            chreq13;          
wire            chreq14;          
wire            chreq15;          
wire            chreq2;           
wire            chreq3;           
wire            chreq4;           
wire            chreq5;           
wire            chreq6;           
wire            chreq7;           
wire            chreq8;           
wire            chreq9;           
wire            etb_dmacch0_trg;  
wire            etb_dmacch10_trg; 
wire            etb_dmacch11_trg; 
wire            etb_dmacch12_trg; 
wire            etb_dmacch13_trg; 
wire            etb_dmacch14_trg; 
wire            etb_dmacch15_trg; 
wire            etb_dmacch1_trg;  
wire            etb_dmacch2_trg;  
wire            etb_dmacch3_trg;  
wire            etb_dmacch4_trg;  
wire            etb_dmacch5_trg;  
wire            etb_dmacch6_trg;  
wire            etb_dmacch7_trg;  
wire            etb_dmacch8_trg;  
wire            etb_dmacch9_trg;  
wire            hclk;             
wire            hpreq0;           
wire            hpreq1;           
wire            hpreq10;          
wire            hpreq11;          
wire            hpreq12;          
wire            hpreq13;          
wire            hpreq14;          
wire            hpreq15;          
wire            hpreq2;           
wire            hpreq3;           
wire            hpreq4;           
wire            hpreq5;           
wire            hpreq6;           
wire            hpreq7;           
wire            hpreq8;           
wire            hpreq9;           
wire            hrst_n;           
wire            trg_req;          
wire            trg_req_latch;    
chntrg_latch  U_CH0TRGLATCH (
  .chnc_gbc_chnen  (ch0c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch0c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch0c_gbc_trgclr),
  .chntrg_latch    (ch0trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch0_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
chntrg_latch  U_CH1TRGLATCH (
  .chnc_gbc_chnen  (ch1c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch1c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch1c_gbc_trgclr),
  .chntrg_latch    (ch1trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch1_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`ifndef    CH2_OFF    
chntrg_latch  U_CH2TRGLATCH (
  .chnc_gbc_chnen  (ch2c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch2c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch2c_gbc_trgclr),
  .chntrg_latch    (ch2trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch2_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH3_OFF    
chntrg_latch  U_CH3TRGLATCH (
  .chnc_gbc_chnen  (ch3c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch3c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch3c_gbc_trgclr),
  .chntrg_latch    (ch3trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch3_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH4_OFF    
chntrg_latch  U_CH4TRGLATCH (
  .chnc_gbc_chnen  (ch4c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch4c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch4c_gbc_trgclr),
  .chntrg_latch    (ch4trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch4_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH5_OFF    
chntrg_latch  U_CH5TRGLATCH (
  .chnc_gbc_chnen  (ch5c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch5c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch5c_gbc_trgclr),
  .chntrg_latch    (ch5trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch5_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH6_OFF    
chntrg_latch  U_CH6TRGLATCH (
  .chnc_gbc_chnen  (ch6c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch6c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch6c_gbc_trgclr),
  .chntrg_latch    (ch6trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch6_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH7_OFF    
chntrg_latch  U_CH7TRGLATCH (
  .chnc_gbc_chnen  (ch7c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch7c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch7c_gbc_trgclr),
  .chntrg_latch    (ch7trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch7_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH8_OFF    
chntrg_latch  U_CH8TRGLATCH (
  .chnc_gbc_chnen  (ch8c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch8c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch8c_gbc_trgclr),
  .chntrg_latch    (ch8trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch8_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH9_OFF    
chntrg_latch  U_CH9TRGLATCH (
  .chnc_gbc_chnen  (ch9c_gbc_chnen ),
  .chnc_gbc_sfwtrg (ch9c_gbc_sfwtrg),
  .chnc_gbc_trgclr (ch9c_gbc_trgclr),
  .chntrg_latch    (ch9trg_latch   ),
  .etb_dmacchn_trg (etb_dmacch9_trg),
  .hclk            (hclk           ),
  .hrst_n          (hrst_n         )
);
`endif    
`ifndef    CH10_OFF    
chntrg_latch  U_CH10TRGLATCH (
  .chnc_gbc_chnen   (ch10c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch10c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch10c_gbc_trgclr),
  .chntrg_latch     (ch10trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch10_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH11_OFF    
chntrg_latch  U_CH11TRGLATCH (
  .chnc_gbc_chnen   (ch11c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch11c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch11c_gbc_trgclr),
  .chntrg_latch     (ch11trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch11_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH12_OFF    
chntrg_latch  U_CH12TRGLATCH (
  .chnc_gbc_chnen   (ch12c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch12c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch12c_gbc_trgclr),
  .chntrg_latch     (ch12trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch12_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH13_OFF    
chntrg_latch  U_CH13TRGLATCH (
  .chnc_gbc_chnen   (ch13c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch13c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch13c_gbc_trgclr),
  .chntrg_latch     (ch13trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch13_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH14_OFF    
chntrg_latch  U_CH14TRGLATCH (
  .chnc_gbc_chnen   (ch14c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch14c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch14c_gbc_trgclr),
  .chntrg_latch     (ch14trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch14_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
`ifndef    CH15_OFF    
chntrg_latch  U_CH15TRGLATCH (
  .chnc_gbc_chnen   (ch15c_gbc_chnen ),
  .chnc_gbc_sfwtrg  (ch15c_gbc_sfwtrg),
  .chnc_gbc_trgclr  (ch15c_gbc_trgclr),
  .chntrg_latch     (ch15trg_latch   ),
  .etb_dmacchn_trg  (etb_dmacch15_trg),
  .hclk             (hclk            ),
  .hrst_n           (hrst_n          )
);
`endif    
assign    chntrg_all[15:0] = { (ch15trg_latch&(~ch15c_gbc_trgclr) )   , (ch14trg_latch&(~ch14c_gbc_trgclr))   , (ch13trg_latch&(~ch13c_gbc_trgclr) )   , (ch12trg_latch&(~ch12c_gbc_trgclr))  , 
                               (ch11trg_latch&(~ch11c_gbc_trgclr) )   , (ch10trg_latch&(~ch10c_gbc_trgclr))   , (ch9trg_latch &(~ch9c_gbc_trgclr ) )   , (ch8trg_latch &(~ch8c_gbc_trgclr ))   , 
                               (ch7trg_latch &(~ch7c_gbc_trgclr ) )   , (ch6trg_latch &(~ch6c_gbc_trgclr ))   ,  (ch5trg_latch&(~ch5c_gbc_trgclr ) )   , (ch4trg_latch &(~ch4c_gbc_trgclr ))   , 
                               (ch3trg_latch &(~ch3c_gbc_trgclr ) )   , (ch2trg_latch &(~ch2c_gbc_trgclr ))   ,  (ch1trg_latch&(~ch1c_gbc_trgclr ) )   , (ch0trg_latch &(~ch0c_gbc_trgclr ))     } ;
assign   arb_bmux_trgvld = | { ch0trg_latch ,ch2trg_latch ,ch4trg_latch ,ch6trg_latch ,ch8trg_latch ,ch10trg_latch ,ch12trg_latch ,ch14trg_latch ,
                               ch1trg_latch ,ch3trg_latch ,ch5trg_latch ,ch7trg_latch ,ch9trg_latch ,ch11trg_latch ,ch13trg_latch ,ch15trg_latch    } ;
assign   arb_bmux_transvld = |{(ch0trg_latch&busy_chn_cod[0]),   (ch1trg_latch&busy_chn_cod[1]),   (ch2trg_latch&busy_chn_cod[2]),   (ch3trg_latch&busy_chn_cod[3]),
                               (ch4trg_latch&busy_chn_cod[4]),   (ch5trg_latch&busy_chn_cod[5]),   (ch6trg_latch&busy_chn_cod[6]),   (ch7trg_latch&busy_chn_cod[7]),
                               (ch8trg_latch&busy_chn_cod[8]),   (ch9trg_latch&busy_chn_cod[9]),   (ch10trg_latch&busy_chn_cod[10]), (ch11trg_latch&busy_chn_cod[11]),
                               (ch12trg_latch&busy_chn_cod[12]), (ch13trg_latch&busy_chn_cod[13]), (ch14trg_latch&busy_chn_cod[14]), (ch15trg_latch&busy_chn_cod[15])};
hpchn_decd  U_HPCHNS (
  .actv_chn_cod (actv_chn_cod),
  .chntrg_all   (chntrg_all  )
);
assign   chchgen = |{(ch0chgen&busy_chn_cod[0]),   (ch1chgen&busy_chn_cod[1]),   (ch2chgen&busy_chn_cod[2]),   (ch3chgen&busy_chn_cod[3]),
                     (ch4chgen&busy_chn_cod[4]),   (ch5chgen&busy_chn_cod[5]),   (ch6chgen&busy_chn_cod[6]),   (ch7chgen&busy_chn_cod[7]),
                     (ch8chgen&busy_chn_cod[8]),   (ch9chgen&busy_chn_cod[9]),   (ch10chgen&busy_chn_cod[10]), (ch11chgen&busy_chn_cod[11]),
                     (ch12chgen&busy_chn_cod[12]), (ch13chgen&busy_chn_cod[13]), (ch14chgen&busy_chn_cod[14]), (ch15chgen&busy_chn_cod[15])};
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        busy_chn_cod[15:0] <= 16'b0 ;
    end
    else    if(chchgen | trg_req_latch)  begin
        busy_chn_cod[15:0] <= actv_chn_cod[15:0] ;
    end
end
assign    busy_chn_code[15:0] = busy_chn_cod[15:0] ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin   
        trg_req_d0 <= 1'b0 ;
    end
    else    begin 
        trg_req_d0 <= trg_req ;
    end 
end 
assign    trg_req = |chntrg_all[15:0] ;
assign    trg_req_latch = trg_req & ( ~trg_req_d0 ) ;
assign    chreq15 = busy_chn_cod[15] & ch15trg_latch ;
assign    chreq14 = busy_chn_cod[14] & ch14trg_latch  ;
assign    chreq13 = busy_chn_cod[13] & ch13trg_latch ;
assign    chreq12 = busy_chn_cod[12] & ch12trg_latch  ;
assign    chreq11 = busy_chn_cod[11] & ch11trg_latch ;
assign    chreq10 = busy_chn_cod[10] &  ch10trg_latch ;
assign    chreq9 = busy_chn_cod[9] & ch9trg_latch ;
assign    chreq8 = busy_chn_cod[8] & ch8trg_latch  ;
assign    chreq7 = busy_chn_cod[7] & ch7trg_latch ;
assign    chreq6 = busy_chn_cod[6] & ch6trg_latch ;
assign    chreq5 = busy_chn_cod[5] & ch5trg_latch ;
assign    chreq4 = busy_chn_cod[4] & ch4trg_latch ;
assign    chreq3 = busy_chn_cod[3] & ch3trg_latch ;
assign    chreq2 = busy_chn_cod[2] & ch2trg_latch  ;
assign    chreq1 = busy_chn_cod[1] & ch1trg_latch ;
assign    chreq0  = busy_chn_cod[0] & ch0trg_latch ;
assign    hpreq0  = ch0c_gbc_trgclr & ( ~actv_chn_cod[0]) & trg_req  ;
assign    hpreq1  = ( ~actv_chn_cod[1])  & trg_req  ;
assign    hpreq2  = ( ~actv_chn_cod[2])  & trg_req  ;
assign    hpreq3  = ( ~actv_chn_cod[3])  & trg_req  ;
assign    hpreq4  = ( ~actv_chn_cod[4])  & trg_req  ;
assign    hpreq5  = ( ~actv_chn_cod[5])  & trg_req  ;
assign    hpreq6  = ( ~actv_chn_cod[6])  & trg_req  ;
assign    hpreq7  = ( ~actv_chn_cod[7])  & trg_req  ;
assign    hpreq8  = ( ~actv_chn_cod[8])  & trg_req  ;
assign    hpreq9  = ( ~actv_chn_cod[9])  & trg_req  ;
assign    hpreq10 = ( ~actv_chn_cod[10]) & trg_req  ;
assign    hpreq11 = ( ~actv_chn_cod[11]) & trg_req  ;
assign    hpreq12 = ( ~actv_chn_cod[12]) & trg_req  ;
assign    hpreq13 = ( ~actv_chn_cod[13]) & trg_req  ;
assign    hpreq14 = ( ~actv_chn_cod[14]) & trg_req  ;
assign    hpreq15 = ( ~actv_chn_cod[15]) & trg_req  ;
endmodule
module bmux_ctrl(
  arb_bmux_transvld,
  arb_bmux_trgvld,
  busy_chn_code,
  gbc_chnc_dmacen,
  hclk,
  hready,
  hrst_n,
  m_addr_ch0,
  m_addr_ch1,
  m_addr_ch10,
  m_addr_ch11,
  m_addr_ch12,
  m_addr_ch13,
  m_addr_ch14,
  m_addr_ch15,
  m_addr_ch2,
  m_addr_ch3,
  m_addr_ch4,
  m_addr_ch5,
  m_addr_ch6,
  m_addr_ch7,
  m_addr_ch8,
  m_addr_ch9,
  m_haddr,
  m_hburst,
  m_hbusreq,
  m_hgrant,
  m_hlock,
  m_hprot,
  m_hready,
  m_hsize,
  m_hsize_ch0,
  m_hsize_ch1,
  m_hsize_ch10,
  m_hsize_ch11,
  m_hsize_ch12,
  m_hsize_ch13,
  m_hsize_ch14,
  m_hsize_ch15,
  m_hsize_ch2,
  m_hsize_ch3,
  m_hsize_ch4,
  m_hsize_ch5,
  m_hsize_ch6,
  m_hsize_ch7,
  m_hsize_ch8,
  m_hsize_ch9,
  m_htrans,
  m_hwdata,
  m_hwdata_ch0,
  m_hwdata_ch1,
  m_hwdata_ch10,
  m_hwdata_ch11,
  m_hwdata_ch12,
  m_hwdata_ch13,
  m_hwdata_ch14,
  m_hwdata_ch15,
  m_hwdata_ch2,
  m_hwdata_ch3,
  m_hwdata_ch4,
  m_hwdata_ch5,
  m_hwdata_ch6,
  m_hwdata_ch7,
  m_hwdata_ch8,
  m_hwdata_ch9,
  m_hwrite,
  m_hwrite_ch0,
  m_hwrite_ch1,
  m_hwrite_ch10,
  m_hwrite_ch11,
  m_hwrite_ch12,
  m_hwrite_ch13,
  m_hwrite_ch14,
  m_hwrite_ch15,
  m_hwrite_ch2,
  m_hwrite_ch3,
  m_hwrite_ch4,
  m_hwrite_ch5,
  m_hwrite_ch6,
  m_hwrite_ch7,
  m_hwrite_ch8,
  m_hwrite_ch9,
  m_prot_ch0,
  m_prot_ch1,
  m_prot_ch10,
  m_prot_ch11,
  m_prot_ch12,
  m_prot_ch13,
  m_prot_ch14,
  m_prot_ch15,
  m_prot_ch2,
  m_prot_ch3,
  m_prot_ch4,
  m_prot_ch5,
  m_prot_ch6,
  m_prot_ch7,
  m_prot_ch8,
  m_prot_ch9
);
input           arb_bmux_transvld; 
input           arb_bmux_trgvld;  
input   [15:0]  busy_chn_code;    
input           gbc_chnc_dmacen;  
input           hclk;             
input           hrst_n;           
input   [31:0]  m_addr_ch0;       
input   [31:0]  m_addr_ch1;       
input   [31:0]  m_addr_ch10;      
input   [31:0]  m_addr_ch11;      
input   [31:0]  m_addr_ch12;      
input   [31:0]  m_addr_ch13;      
input   [31:0]  m_addr_ch14;      
input   [31:0]  m_addr_ch15;      
input   [31:0]  m_addr_ch2;       
input   [31:0]  m_addr_ch3;       
input   [31:0]  m_addr_ch4;       
input   [31:0]  m_addr_ch5;       
input   [31:0]  m_addr_ch6;       
input   [31:0]  m_addr_ch7;       
input   [31:0]  m_addr_ch8;       
input   [31:0]  m_addr_ch9;       
input           m_hgrant;         
input           m_hready;         
input   [2 :0]  m_hsize_ch0;      
input   [2 :0]  m_hsize_ch1;      
input   [2 :0]  m_hsize_ch10;     
input   [2 :0]  m_hsize_ch11;     
input   [2 :0]  m_hsize_ch12;     
input   [2 :0]  m_hsize_ch13;     
input   [2 :0]  m_hsize_ch14;     
input   [2 :0]  m_hsize_ch15;     
input   [2 :0]  m_hsize_ch2;      
input   [2 :0]  m_hsize_ch3;      
input   [2 :0]  m_hsize_ch4;      
input   [2 :0]  m_hsize_ch5;      
input   [2 :0]  m_hsize_ch6;      
input   [2 :0]  m_hsize_ch7;      
input   [2 :0]  m_hsize_ch8;      
input   [2 :0]  m_hsize_ch9;      
input   [31:0]  m_hwdata_ch0;     
input   [31:0]  m_hwdata_ch1;     
input   [31:0]  m_hwdata_ch10;    
input   [31:0]  m_hwdata_ch11;    
input   [31:0]  m_hwdata_ch12;    
input   [31:0]  m_hwdata_ch13;    
input   [31:0]  m_hwdata_ch14;    
input   [31:0]  m_hwdata_ch15;    
input   [31:0]  m_hwdata_ch2;     
input   [31:0]  m_hwdata_ch3;     
input   [31:0]  m_hwdata_ch4;     
input   [31:0]  m_hwdata_ch5;     
input   [31:0]  m_hwdata_ch6;     
input   [31:0]  m_hwdata_ch7;     
input   [31:0]  m_hwdata_ch8;     
input   [31:0]  m_hwdata_ch9;     
input           m_hwrite_ch0;     
input           m_hwrite_ch1;     
input           m_hwrite_ch10;    
input           m_hwrite_ch11;    
input           m_hwrite_ch12;    
input           m_hwrite_ch13;    
input           m_hwrite_ch14;    
input           m_hwrite_ch15;    
input           m_hwrite_ch2;     
input           m_hwrite_ch3;     
input           m_hwrite_ch4;     
input           m_hwrite_ch5;     
input           m_hwrite_ch6;     
input           m_hwrite_ch7;     
input           m_hwrite_ch8;     
input           m_hwrite_ch9;     
input   [3 :0]  m_prot_ch0;       
input   [3 :0]  m_prot_ch1;       
input   [3 :0]  m_prot_ch10;      
input   [3 :0]  m_prot_ch11;      
input   [3 :0]  m_prot_ch12;      
input   [3 :0]  m_prot_ch13;      
input   [3 :0]  m_prot_ch14;      
input   [3 :0]  m_prot_ch15;      
input   [3 :0]  m_prot_ch2;       
input   [3 :0]  m_prot_ch3;       
input   [3 :0]  m_prot_ch4;       
input   [3 :0]  m_prot_ch5;       
input   [3 :0]  m_prot_ch6;       
input   [3 :0]  m_prot_ch7;       
input   [3 :0]  m_prot_ch8;       
input   [3 :0]  m_prot_ch9;       
output          hready;           
output  [31:0]  m_haddr;          
output  [2 :0]  m_hburst;         
output          m_hbusreq;        
output          m_hlock;          
output  [3 :0]  m_hprot;          
output  [2 :0]  m_hsize;          
output  [1 :0]  m_htrans;         
output  [31:0]  m_hwdata;         
output          m_hwrite;         
reg     [15:0]  data_chnl_cd;     
reg     [31:0]  m_haddr;          
reg             m_hbusreq;        
reg             m_hgrant_d1;      
reg     [3 :0]  m_hprot;          
reg     [2 :0]  m_hsize;          
reg     [31:0]  m_hwdata;         
reg             m_hwrite_i;       
wire            arb_bmux_transvld; 
wire            arb_bmux_trgvld;  
wire            bus_grant_det;    
wire    [15:0]  busy_chn_code;    
wire    [15:0]  data_chnl_cd_nxt; 
wire            gbc_chnc_dmacen;  
wire            hclk;             
wire            hready;           
wire            hrst_n;           
wire    [31:0]  m_addr_ch0;       
wire    [31:0]  m_addr_ch1;       
wire    [31:0]  m_addr_ch10;      
wire    [31:0]  m_addr_ch11;      
wire    [31:0]  m_addr_ch12;      
wire    [31:0]  m_addr_ch13;      
wire    [31:0]  m_addr_ch14;      
wire    [31:0]  m_addr_ch15;      
wire    [31:0]  m_addr_ch2;       
wire    [31:0]  m_addr_ch3;       
wire    [31:0]  m_addr_ch4;       
wire    [31:0]  m_addr_ch5;       
wire    [31:0]  m_addr_ch6;       
wire    [31:0]  m_addr_ch7;       
wire    [31:0]  m_addr_ch8;       
wire    [31:0]  m_addr_ch9;       
wire    [2 :0]  m_hburst;         
wire            m_hgrant;         
wire            m_hlock;          
wire            m_hready;         
wire    [2 :0]  m_hsize_ch0;      
wire    [2 :0]  m_hsize_ch1;      
wire    [2 :0]  m_hsize_ch10;     
wire    [2 :0]  m_hsize_ch11;     
wire    [2 :0]  m_hsize_ch12;     
wire    [2 :0]  m_hsize_ch13;     
wire    [2 :0]  m_hsize_ch14;     
wire    [2 :0]  m_hsize_ch15;     
wire    [2 :0]  m_hsize_ch2;      
wire    [2 :0]  m_hsize_ch3;      
wire    [2 :0]  m_hsize_ch4;      
wire    [2 :0]  m_hsize_ch5;      
wire    [2 :0]  m_hsize_ch6;      
wire    [2 :0]  m_hsize_ch7;      
wire    [2 :0]  m_hsize_ch8;      
wire    [2 :0]  m_hsize_ch9;      
wire    [1 :0]  m_htrans;         
wire    [31:0]  m_hwdata_ch0;     
wire    [31:0]  m_hwdata_ch1;     
wire    [31:0]  m_hwdata_ch10;    
wire    [31:0]  m_hwdata_ch11;    
wire    [31:0]  m_hwdata_ch12;    
wire    [31:0]  m_hwdata_ch13;    
wire    [31:0]  m_hwdata_ch14;    
wire    [31:0]  m_hwdata_ch15;    
wire    [31:0]  m_hwdata_ch2;     
wire    [31:0]  m_hwdata_ch3;     
wire    [31:0]  m_hwdata_ch4;     
wire    [31:0]  m_hwdata_ch5;     
wire    [31:0]  m_hwdata_ch6;     
wire    [31:0]  m_hwdata_ch7;     
wire    [31:0]  m_hwdata_ch8;     
wire    [31:0]  m_hwdata_ch9;     
wire            m_hwrite;         
wire            m_hwrite_ch0;     
wire            m_hwrite_ch1;     
wire            m_hwrite_ch10;    
wire            m_hwrite_ch11;    
wire            m_hwrite_ch12;    
wire            m_hwrite_ch13;    
wire            m_hwrite_ch14;    
wire            m_hwrite_ch15;    
wire            m_hwrite_ch2;     
wire            m_hwrite_ch3;     
wire            m_hwrite_ch4;     
wire            m_hwrite_ch5;     
wire            m_hwrite_ch6;     
wire            m_hwrite_ch7;     
wire            m_hwrite_ch8;     
wire            m_hwrite_ch9;     
wire    [3 :0]  m_prot_ch0;       
wire    [3 :0]  m_prot_ch1;       
wire    [3 :0]  m_prot_ch10;      
wire    [3 :0]  m_prot_ch11;      
wire    [3 :0]  m_prot_ch12;      
wire    [3 :0]  m_prot_ch13;      
wire    [3 :0]  m_prot_ch14;      
wire    [3 :0]  m_prot_ch15;      
wire    [3 :0]  m_prot_ch2;       
wire    [3 :0]  m_prot_ch3;       
wire    [3 :0]  m_prot_ch4;       
wire    [3 :0]  m_prot_ch5;       
wire    [3 :0]  m_prot_ch6;       
wire    [3 :0]  m_prot_ch7;       
wire    [3 :0]  m_prot_ch8;       
wire    [3 :0]  m_prot_ch9;       
always @(*) begin
    case(data_chnl_cd)  // synopsys parallel_case
        16'h0001: m_hwdata[31:0] = m_hwdata_ch0[31:0];
        16'h0002: m_hwdata[31:0] = m_hwdata_ch1[31:0];
        16'h0004: m_hwdata[31:0] = m_hwdata_ch2[31:0];
        16'h0008: m_hwdata[31:0] = m_hwdata_ch3[31:0];
        16'h0010: m_hwdata[31:0] = m_hwdata_ch4[31:0];
        16'h0020: m_hwdata[31:0] = m_hwdata_ch5[31:0];
        16'h0040: m_hwdata[31:0] = m_hwdata_ch6[31:0];
        16'h0080: m_hwdata[31:0] = m_hwdata_ch7[31:0];
        16'h0100: m_hwdata[31:0] = m_hwdata_ch8[31:0];
        16'h0200: m_hwdata[31:0] = m_hwdata_ch9[31:0];
        16'h0400: m_hwdata[31:0] = m_hwdata_ch10[31:0];
        16'h0800: m_hwdata[31:0] = m_hwdata_ch11[31:0];
        16'h1000: m_hwdata[31:0] = m_hwdata_ch12[31:0];
        16'h2000: m_hwdata[31:0] = m_hwdata_ch13[31:0];
        16'h4000: m_hwdata[31:0] = m_hwdata_ch14[31:0];
        16'h8000: m_hwdata[31:0] = m_hwdata_ch15[31:0];
        default : m_hwdata[31:0] = 32'hxxxxxxxx;
    endcase
end
assign  data_chnl_cd_nxt[15:0] = hready ? busy_chn_code[15:0] : data_chnl_cd[15:0] ; 
always@(posedge  hclk or negedge hrst_n)   
begin 
    if(~hrst_n)     begin 
        //data_chnl_cd[3:0] <= 4'b00 ; 
        data_chnl_cd[15:0] <= 16'h0 ; 
    end 
    else    begin 
        data_chnl_cd[15:0] <= data_chnl_cd_nxt[15:0] ;
    end 
end  
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hprot[3:0] = m_prot_ch0[3:0];
        16'h0002: m_hprot[3:0] = m_prot_ch1[3:0];
        16'h0004: m_hprot[3:0] = m_prot_ch2[3:0];
        16'h0008: m_hprot[3:0] = m_prot_ch3[3:0];
        16'h0010: m_hprot[3:0] = m_prot_ch4[3:0];
        16'h0020: m_hprot[3:0] = m_prot_ch5[3:0];
        16'h0040: m_hprot[3:0] = m_prot_ch6[3:0];
        16'h0080: m_hprot[3:0] = m_prot_ch7[3:0];
        16'h0100: m_hprot[3:0] = m_prot_ch8[3:0];
        16'h0200: m_hprot[3:0] = m_prot_ch9[3:0];
        16'h0400: m_hprot[3:0] = m_prot_ch10[3:0];
        16'h0800: m_hprot[3:0] = m_prot_ch11[3:0];
        16'h1000: m_hprot[3:0] = m_prot_ch12[3:0];
        16'h2000: m_hprot[3:0] = m_prot_ch13[3:0];
        16'h4000: m_hprot[3:0] = m_prot_ch14[3:0];
        16'h8000: m_hprot[3:0] = m_prot_ch15[3:0];
        default : m_hprot[3:0] = 4'hx;
    endcase
end
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hsize[2:0] = m_hsize_ch0[2:0];
        16'h0002: m_hsize[2:0] = m_hsize_ch1[2:0];
        16'h0004: m_hsize[2:0] = m_hsize_ch2[2:0];
        16'h0008: m_hsize[2:0] = m_hsize_ch3[2:0];
        16'h0010: m_hsize[2:0] = m_hsize_ch4[2:0];
        16'h0020: m_hsize[2:0] = m_hsize_ch5[2:0];
        16'h0040: m_hsize[2:0] = m_hsize_ch6[2:0];
        16'h0080: m_hsize[2:0] = m_hsize_ch7[2:0];
        16'h0100: m_hsize[2:0] = m_hsize_ch8[2:0];
        16'h0200: m_hsize[2:0] = m_hsize_ch9[2:0];
        16'h0400: m_hsize[2:0] = m_hsize_ch10[2:0];
        16'h0800: m_hsize[2:0] = m_hsize_ch11[2:0];
        16'h1000: m_hsize[2:0] = m_hsize_ch12[2:0];
        16'h2000: m_hsize[2:0] = m_hsize_ch13[2:0];
        16'h4000: m_hsize[2:0] = m_hsize_ch14[2:0];
        16'h8000: m_hsize[2:0] = m_hsize_ch15[2:0];
        default : m_hsize[2:0] = 3'bxxx;
    endcase
end
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_hwrite_i = m_hwrite_ch0;
        16'h0002: m_hwrite_i = m_hwrite_ch1;
        16'h0004: m_hwrite_i = m_hwrite_ch2;
        16'h0008: m_hwrite_i = m_hwrite_ch3;
        16'h0010: m_hwrite_i = m_hwrite_ch4;
        16'h0020: m_hwrite_i = m_hwrite_ch5;
        16'h0040: m_hwrite_i = m_hwrite_ch6;
        16'h0080: m_hwrite_i = m_hwrite_ch7;
        16'h0100: m_hwrite_i = m_hwrite_ch8;
        16'h0200: m_hwrite_i = m_hwrite_ch9;
        16'h0400: m_hwrite_i = m_hwrite_ch10;
        16'h0800: m_hwrite_i = m_hwrite_ch11;
        16'h1000: m_hwrite_i = m_hwrite_ch12;
        16'h2000: m_hwrite_i = m_hwrite_ch13;
        16'h4000: m_hwrite_i = m_hwrite_ch14;
        16'h8000: m_hwrite_i = m_hwrite_ch15;
        default : m_hwrite_i = 1'bx;
    endcase
end
assign    m_hwrite = m_hwrite_i & bus_grant_det ;
always @ (*) begin
    case(busy_chn_code)  // synopsys parallel_case
        16'h0001: m_haddr[31:0] = m_addr_ch0[31:0];
        16'h0002: m_haddr[31:0] = m_addr_ch1[31:0];
        16'h0004: m_haddr[31:0] = m_addr_ch2[31:0];
        16'h0008: m_haddr[31:0] = m_addr_ch3[31:0];
        16'h0010: m_haddr[31:0] = m_addr_ch4[31:0];
        16'h0020: m_haddr[31:0] = m_addr_ch5[31:0];
        16'h0040: m_haddr[31:0] = m_addr_ch6[31:0];
        16'h0080: m_haddr[31:0] = m_addr_ch7[31:0];
        16'h0100: m_haddr[31:0] = m_addr_ch8[31:0];
        16'h0200: m_haddr[31:0] = m_addr_ch9[31:0];
        16'h0400: m_haddr[31:0] = m_addr_ch10[31:0];
        16'h0800: m_haddr[31:0] = m_addr_ch11[31:0];
        16'h1000: m_haddr[31:0] = m_addr_ch12[31:0];
        16'h2000: m_haddr[31:0] = m_addr_ch13[31:0];
        16'h4000: m_haddr[31:0] = m_addr_ch14[31:0];
        16'h8000: m_haddr[31:0] = m_addr_ch15[31:0];
        default : m_haddr[31:0] = 32'hxxxxxxxx;
    endcase
end
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin  
        m_hbusreq <= 1'b0 ;
    end
    else if (arb_bmux_trgvld)
        m_hbusreq <= 1'b1 ;
    else if(~arb_bmux_trgvld & m_hready)
        m_hbusreq <= 1'b0 ;
    else
        m_hbusreq <= m_hbusreq ;
end
assign   bus_grant_det = (m_htrans[1:0] == 2'b10 ) ;
assign   hready = m_hready & m_hgrant_d1 & m_hbusreq ; 
assign   m_hburst[2:0] = 3'b000 ; 
assign   m_hlock       = 1'b0 ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin  
        m_hgrant_d1 <= 1'b0 ;
    end
    else if(m_hgrant&m_hready) 
        m_hgrant_d1 <= 1'b1 ;
    else if (~m_hgrant)
        m_hgrant_d1 <= 1'b0 ;
end
assign     m_htrans[1:0] = arb_bmux_transvld&m_hgrant_d1&gbc_chnc_dmacen&m_hbusreq ?  2'b10 : 2'b00 ; 
endmodule
module ch_ctrl(
  busy_chn_code,
  ch0_etb_evtdone,
  ch0_etb_htfrdone,
  ch0_etb_tfrdone,
  ch0c_gbc_chbsy,
  ch0c_gbc_chnen,
  ch0c_gbc_trgclr,
  ch0chgen,
  ch10_etb_evtdone,
  ch10_etb_htfrdone,
  ch10_etb_tfrdone,
  ch10c_gbc_chbsy,
  ch10c_gbc_chnen,
  ch10c_gbc_trgclr,
  ch10chgen,
  ch11_etb_evtdone,
  ch11_etb_htfrdone,
  ch11_etb_tfrdone,
  ch11c_gbc_chbsy,
  ch11c_gbc_chnen,
  ch11c_gbc_trgclr,
  ch11chgen,
  ch12_etb_evtdone,
  ch12_etb_htfrdone,
  ch12_etb_tfrdone,
  ch12c_gbc_chbsy,
  ch12c_gbc_chnen,
  ch12c_gbc_trgclr,
  ch12chgen,
  ch13_etb_evtdone,
  ch13_etb_htfrdone,
  ch13_etb_tfrdone,
  ch13c_gbc_chbsy,
  ch13c_gbc_chnen,
  ch13c_gbc_trgclr,
  ch13chgen,
  ch14_etb_evtdone,
  ch14_etb_htfrdone,
  ch14_etb_tfrdone,
  ch14c_gbc_chbsy,
  ch14c_gbc_chnen,
  ch14c_gbc_trgclr,
  ch14chgen,
  ch15_etb_evtdone,
  ch15_etb_htfrdone,
  ch15_etb_tfrdone,
  ch15c_gbc_chbsy,
  ch15c_gbc_chnen,
  ch15c_gbc_trgclr,
  ch15chgen,
  ch1_etb_evtdone,
  ch1_etb_htfrdone,
  ch1_etb_tfrdone,
  ch1c_gbc_chbsy,
  ch1c_gbc_chnen,
  ch1c_gbc_trgclr,
  ch1chgen,
  ch2_etb_evtdone,
  ch2_etb_htfrdone,
  ch2_etb_tfrdone,
  ch2c_gbc_chbsy,
  ch2c_gbc_chnen,
  ch2c_gbc_trgclr,
  ch2chgen,
  ch3_etb_evtdone,
  ch3_etb_htfrdone,
  ch3_etb_tfrdone,
  ch3c_gbc_chbsy,
  ch3c_gbc_chnen,
  ch3c_gbc_trgclr,
  ch3chgen,
  ch4_etb_evtdone,
  ch4_etb_htfrdone,
  ch4_etb_tfrdone,
  ch4c_gbc_chbsy,
  ch4c_gbc_chnen,
  ch4c_gbc_trgclr,
  ch4chgen,
  ch5_etb_evtdone,
  ch5_etb_htfrdone,
  ch5_etb_tfrdone,
  ch5c_gbc_chbsy,
  ch5c_gbc_chnen,
  ch5c_gbc_trgclr,
  ch5chgen,
  ch6_etb_evtdone,
  ch6_etb_htfrdone,
  ch6_etb_tfrdone,
  ch6c_gbc_chbsy,
  ch6c_gbc_chnen,
  ch6c_gbc_trgclr,
  ch6chgen,
  ch7_etb_evtdone,
  ch7_etb_htfrdone,
  ch7_etb_tfrdone,
  ch7c_gbc_chbsy,
  ch7c_gbc_chnen,
  ch7c_gbc_trgclr,
  ch7chgen,
  ch8_etb_evtdone,
  ch8_etb_htfrdone,
  ch8_etb_tfrdone,
  ch8c_gbc_chbsy,
  ch8c_gbc_chnen,
  ch8c_gbc_trgclr,
  ch8chgen,
  ch9_etb_evtdone,
  ch9_etb_htfrdone,
  ch9_etb_tfrdone,
  ch9c_gbc_chbsy,
  ch9c_gbc_chnen,
  ch9c_gbc_trgclr,
  ch9chgen,
  chregc0_fsmc_block_tl,
  chregc0_fsmc_chintmdc,
  chregc0_fsmc_darn,
  chregc0_fsmc_dgrpaddrc,
  chregc0_fsmc_dinc,
  chregc0_fsmc_dst_tr_width,
  chregc0_fsmc_endlan,
  chregc0_fsmc_group_len,
  chregc0_fsmc_grpmc,
  chregc0_fsmc_protctl,
  chregc0_fsmc_sarn,
  chregc0_fsmc_sgrpaddrc,
  chregc0_fsmc_sinc,
  chregc0_fsmc_src_tr_width,
  chregc0_fsmc_trgtmdc,
  chregc10_fsmc_block_tl,
  chregc10_fsmc_chintmdc,
  chregc10_fsmc_darn,
  chregc10_fsmc_dgrpaddrc,
  chregc10_fsmc_dinc,
  chregc10_fsmc_dst_tr_width,
  chregc10_fsmc_endlan,
  chregc10_fsmc_group_len,
  chregc10_fsmc_grpmc,
  chregc10_fsmc_protctl,
  chregc10_fsmc_sarn,
  chregc10_fsmc_sgrpaddrc,
  chregc10_fsmc_sinc,
  chregc10_fsmc_src_tr_width,
  chregc10_fsmc_trgtmdc,
  chregc11_fsmc_block_tl,
  chregc11_fsmc_chintmdc,
  chregc11_fsmc_darn,
  chregc11_fsmc_dgrpaddrc,
  chregc11_fsmc_dinc,
  chregc11_fsmc_dst_tr_width,
  chregc11_fsmc_endlan,
  chregc11_fsmc_group_len,
  chregc11_fsmc_grpmc,
  chregc11_fsmc_protctl,
  chregc11_fsmc_sarn,
  chregc11_fsmc_sgrpaddrc,
  chregc11_fsmc_sinc,
  chregc11_fsmc_src_tr_width,
  chregc11_fsmc_trgtmdc,
  chregc12_fsmc_block_tl,
  chregc12_fsmc_chintmdc,
  chregc12_fsmc_darn,
  chregc12_fsmc_dgrpaddrc,
  chregc12_fsmc_dinc,
  chregc12_fsmc_dst_tr_width,
  chregc12_fsmc_endlan,
  chregc12_fsmc_group_len,
  chregc12_fsmc_grpmc,
  chregc12_fsmc_protctl,
  chregc12_fsmc_sarn,
  chregc12_fsmc_sgrpaddrc,
  chregc12_fsmc_sinc,
  chregc12_fsmc_src_tr_width,
  chregc12_fsmc_trgtmdc,
  chregc13_fsmc_block_tl,
  chregc13_fsmc_chintmdc,
  chregc13_fsmc_darn,
  chregc13_fsmc_dgrpaddrc,
  chregc13_fsmc_dinc,
  chregc13_fsmc_dst_tr_width,
  chregc13_fsmc_endlan,
  chregc13_fsmc_group_len,
  chregc13_fsmc_grpmc,
  chregc13_fsmc_protctl,
  chregc13_fsmc_sarn,
  chregc13_fsmc_sgrpaddrc,
  chregc13_fsmc_sinc,
  chregc13_fsmc_src_tr_width,
  chregc13_fsmc_trgtmdc,
  chregc14_fsmc_block_tl,
  chregc14_fsmc_chintmdc,
  chregc14_fsmc_darn,
  chregc14_fsmc_dgrpaddrc,
  chregc14_fsmc_dinc,
  chregc14_fsmc_dst_tr_width,
  chregc14_fsmc_endlan,
  chregc14_fsmc_group_len,
  chregc14_fsmc_grpmc,
  chregc14_fsmc_protctl,
  chregc14_fsmc_sarn,
  chregc14_fsmc_sgrpaddrc,
  chregc14_fsmc_sinc,
  chregc14_fsmc_src_tr_width,
  chregc14_fsmc_trgtmdc,
  chregc15_fsmc_block_tl,
  chregc15_fsmc_chintmdc,
  chregc15_fsmc_darn,
  chregc15_fsmc_dgrpaddrc,
  chregc15_fsmc_dinc,
  chregc15_fsmc_dst_tr_width,
  chregc15_fsmc_endlan,
  chregc15_fsmc_group_len,
  chregc15_fsmc_grpmc,
  chregc15_fsmc_protctl,
  chregc15_fsmc_sarn,
  chregc15_fsmc_sgrpaddrc,
  chregc15_fsmc_sinc,
  chregc15_fsmc_src_tr_width,
  chregc15_fsmc_trgtmdc,
  chregc1_fsmc_block_tl,
  chregc1_fsmc_chintmdc,
  chregc1_fsmc_darn,
  chregc1_fsmc_dgrpaddrc,
  chregc1_fsmc_dinc,
  chregc1_fsmc_dst_tr_width,
  chregc1_fsmc_endlan,
  chregc1_fsmc_group_len,
  chregc1_fsmc_grpmc,
  chregc1_fsmc_protctl,
  chregc1_fsmc_sarn,
  chregc1_fsmc_sgrpaddrc,
  chregc1_fsmc_sinc,
  chregc1_fsmc_src_tr_width,
  chregc1_fsmc_trgtmdc,
  chregc2_fsmc_block_tl,
  chregc2_fsmc_chintmdc,
  chregc2_fsmc_darn,
  chregc2_fsmc_dgrpaddrc,
  chregc2_fsmc_dinc,
  chregc2_fsmc_dst_tr_width,
  chregc2_fsmc_endlan,
  chregc2_fsmc_group_len,
  chregc2_fsmc_grpmc,
  chregc2_fsmc_protctl,
  chregc2_fsmc_sarn,
  chregc2_fsmc_sgrpaddrc,
  chregc2_fsmc_sinc,
  chregc2_fsmc_src_tr_width,
  chregc2_fsmc_trgtmdc,
  chregc3_fsmc_block_tl,
  chregc3_fsmc_chintmdc,
  chregc3_fsmc_darn,
  chregc3_fsmc_dgrpaddrc,
  chregc3_fsmc_dinc,
  chregc3_fsmc_dst_tr_width,
  chregc3_fsmc_endlan,
  chregc3_fsmc_group_len,
  chregc3_fsmc_grpmc,
  chregc3_fsmc_protctl,
  chregc3_fsmc_sarn,
  chregc3_fsmc_sgrpaddrc,
  chregc3_fsmc_sinc,
  chregc3_fsmc_src_tr_width,
  chregc3_fsmc_trgtmdc,
  chregc4_fsmc_block_tl,
  chregc4_fsmc_chintmdc,
  chregc4_fsmc_darn,
  chregc4_fsmc_dgrpaddrc,
  chregc4_fsmc_dinc,
  chregc4_fsmc_dst_tr_width,
  chregc4_fsmc_endlan,
  chregc4_fsmc_group_len,
  chregc4_fsmc_grpmc,
  chregc4_fsmc_protctl,
  chregc4_fsmc_sarn,
  chregc4_fsmc_sgrpaddrc,
  chregc4_fsmc_sinc,
  chregc4_fsmc_src_tr_width,
  chregc4_fsmc_trgtmdc,
  chregc5_fsmc_block_tl,
  chregc5_fsmc_chintmdc,
  chregc5_fsmc_darn,
  chregc5_fsmc_dgrpaddrc,
  chregc5_fsmc_dinc,
  chregc5_fsmc_dst_tr_width,
  chregc5_fsmc_endlan,
  chregc5_fsmc_group_len,
  chregc5_fsmc_grpmc,
  chregc5_fsmc_protctl,
  chregc5_fsmc_sarn,
  chregc5_fsmc_sgrpaddrc,
  chregc5_fsmc_sinc,
  chregc5_fsmc_src_tr_width,
  chregc5_fsmc_trgtmdc,
  chregc6_fsmc_block_tl,
  chregc6_fsmc_chintmdc,
  chregc6_fsmc_darn,
  chregc6_fsmc_dgrpaddrc,
  chregc6_fsmc_dinc,
  chregc6_fsmc_dst_tr_width,
  chregc6_fsmc_endlan,
  chregc6_fsmc_group_len,
  chregc6_fsmc_grpmc,
  chregc6_fsmc_protctl,
  chregc6_fsmc_sarn,
  chregc6_fsmc_sgrpaddrc,
  chregc6_fsmc_sinc,
  chregc6_fsmc_src_tr_width,
  chregc6_fsmc_trgtmdc,
  chregc7_fsmc_block_tl,
  chregc7_fsmc_chintmdc,
  chregc7_fsmc_darn,
  chregc7_fsmc_dgrpaddrc,
  chregc7_fsmc_dinc,
  chregc7_fsmc_dst_tr_width,
  chregc7_fsmc_endlan,
  chregc7_fsmc_group_len,
  chregc7_fsmc_grpmc,
  chregc7_fsmc_protctl,
  chregc7_fsmc_sarn,
  chregc7_fsmc_sgrpaddrc,
  chregc7_fsmc_sinc,
  chregc7_fsmc_src_tr_width,
  chregc7_fsmc_trgtmdc,
  chregc8_fsmc_block_tl,
  chregc8_fsmc_chintmdc,
  chregc8_fsmc_darn,
  chregc8_fsmc_dgrpaddrc,
  chregc8_fsmc_dinc,
  chregc8_fsmc_dst_tr_width,
  chregc8_fsmc_endlan,
  chregc8_fsmc_group_len,
  chregc8_fsmc_grpmc,
  chregc8_fsmc_protctl,
  chregc8_fsmc_sarn,
  chregc8_fsmc_sgrpaddrc,
  chregc8_fsmc_sinc,
  chregc8_fsmc_src_tr_width,
  chregc8_fsmc_trgtmdc,
  chregc9_fsmc_block_tl,
  chregc9_fsmc_chintmdc,
  chregc9_fsmc_darn,
  chregc9_fsmc_dgrpaddrc,
  chregc9_fsmc_dinc,
  chregc9_fsmc_dst_tr_width,
  chregc9_fsmc_endlan,
  chregc9_fsmc_group_len,
  chregc9_fsmc_grpmc,
  chregc9_fsmc_protctl,
  chregc9_fsmc_sarn,
  chregc9_fsmc_sgrpaddrc,
  chregc9_fsmc_sinc,
  chregc9_fsmc_src_tr_width,
  chregc9_fsmc_trgtmdc,
  fsmc_chregc0_err_vld,
  fsmc_chregc0_htfr_vld,
  fsmc_chregc0_tfr_vld,
  fsmc_chregc0_trgetcmp_vld,
  fsmc_chregc10_err_vld,
  fsmc_chregc10_htfr_vld,
  fsmc_chregc10_tfr_vld,
  fsmc_chregc10_trgetcmp_vld,
  fsmc_chregc11_err_vld,
  fsmc_chregc11_htfr_vld,
  fsmc_chregc11_tfr_vld,
  fsmc_chregc11_trgetcmp_vld,
  fsmc_chregc12_err_vld,
  fsmc_chregc12_htfr_vld,
  fsmc_chregc12_tfr_vld,
  fsmc_chregc12_trgetcmp_vld,
  fsmc_chregc13_err_vld,
  fsmc_chregc13_htfr_vld,
  fsmc_chregc13_tfr_vld,
  fsmc_chregc13_trgetcmp_vld,
  fsmc_chregc14_err_vld,
  fsmc_chregc14_htfr_vld,
  fsmc_chregc14_tfr_vld,
  fsmc_chregc14_trgetcmp_vld,
  fsmc_chregc15_err_vld,
  fsmc_chregc15_htfr_vld,
  fsmc_chregc15_tfr_vld,
  fsmc_chregc15_trgetcmp_vld,
  fsmc_chregc1_err_vld,
  fsmc_chregc1_htfr_vld,
  fsmc_chregc1_tfr_vld,
  fsmc_chregc1_trgetcmp_vld,
  fsmc_chregc2_err_vld,
  fsmc_chregc2_htfr_vld,
  fsmc_chregc2_tfr_vld,
  fsmc_chregc2_trgetcmp_vld,
  fsmc_chregc3_err_vld,
  fsmc_chregc3_htfr_vld,
  fsmc_chregc3_tfr_vld,
  fsmc_chregc3_trgetcmp_vld,
  fsmc_chregc4_err_vld,
  fsmc_chregc4_htfr_vld,
  fsmc_chregc4_tfr_vld,
  fsmc_chregc4_trgetcmp_vld,
  fsmc_chregc5_err_vld,
  fsmc_chregc5_htfr_vld,
  fsmc_chregc5_tfr_vld,
  fsmc_chregc5_trgetcmp_vld,
  fsmc_chregc6_err_vld,
  fsmc_chregc6_htfr_vld,
  fsmc_chregc6_tfr_vld,
  fsmc_chregc6_trgetcmp_vld,
  fsmc_chregc7_err_vld,
  fsmc_chregc7_htfr_vld,
  fsmc_chregc7_tfr_vld,
  fsmc_chregc7_trgetcmp_vld,
  fsmc_chregc8_err_vld,
  fsmc_chregc8_htfr_vld,
  fsmc_chregc8_tfr_vld,
  fsmc_chregc8_trgetcmp_vld,
  fsmc_chregc9_err_vld,
  fsmc_chregc9_htfr_vld,
  fsmc_chregc9_tfr_vld,
  fsmc_chregc9_trgetcmp_vld,
  fsmc_chregc_pdvld_ch0,
  fsmc_chregc_pdvld_ch1,
  fsmc_chregc_pdvld_ch10,
  fsmc_chregc_pdvld_ch11,
  fsmc_chregc_pdvld_ch12,
  fsmc_chregc_pdvld_ch13,
  fsmc_chregc_pdvld_ch14,
  fsmc_chregc_pdvld_ch15,
  fsmc_chregc_pdvld_ch2,
  fsmc_chregc_pdvld_ch3,
  fsmc_chregc_pdvld_ch4,
  fsmc_chregc_pdvld_ch5,
  fsmc_chregc_pdvld_ch6,
  fsmc_chregc_pdvld_ch7,
  fsmc_chregc_pdvld_ch8,
  fsmc_chregc_pdvld_ch9,
  fsmc_regc_ch0en_clr,
  fsmc_regc_ch10en_clr,
  fsmc_regc_ch11en_clr,
  fsmc_regc_ch12en_clr,
  fsmc_regc_ch13en_clr,
  fsmc_regc_ch14en_clr,
  fsmc_regc_ch15en_clr,
  fsmc_regc_ch1en_clr,
  fsmc_regc_ch2en_clr,
  fsmc_regc_ch3en_clr,
  fsmc_regc_ch4en_clr,
  fsmc_regc_ch5en_clr,
  fsmc_regc_ch6en_clr,
  fsmc_regc_ch7en_clr,
  fsmc_regc_ch8en_clr,
  fsmc_regc_ch9en_clr,
  gbc_ch0c_hpreqvld,
  gbc_ch0c_reqvld,
  gbc_ch10c_hpreqvld,
  gbc_ch10c_reqvld,
  gbc_ch11c_hpreqvld,
  gbc_ch11c_reqvld,
  gbc_ch12c_hpreqvld,
  gbc_ch12c_reqvld,
  gbc_ch13c_hpreqvld,
  gbc_ch13c_reqvld,
  gbc_ch14c_hpreqvld,
  gbc_ch14c_reqvld,
  gbc_ch15c_hpreqvld,
  gbc_ch15c_reqvld,
  gbc_ch1c_hpreqvld,
  gbc_ch1c_reqvld,
  gbc_ch2c_hpreqvld,
  gbc_ch2c_reqvld,
  gbc_ch3c_hpreqvld,
  gbc_ch3c_reqvld,
  gbc_ch4c_hpreqvld,
  gbc_ch4c_reqvld,
  gbc_ch5c_hpreqvld,
  gbc_ch5c_reqvld,
  gbc_ch6c_hpreqvld,
  gbc_ch6c_reqvld,
  gbc_ch7c_hpreqvld,
  gbc_ch7c_reqvld,
  gbc_ch8c_hpreqvld,
  gbc_ch8c_reqvld,
  gbc_ch9c_hpreqvld,
  gbc_ch9c_reqvld,
  gbc_chnc_dmacen,
  hclk,
  hready,
  hrst_n,
  m_addr_ch0,
  m_addr_ch1,
  m_addr_ch10,
  m_addr_ch11,
  m_addr_ch12,
  m_addr_ch13,
  m_addr_ch14,
  m_addr_ch15,
  m_addr_ch2,
  m_addr_ch3,
  m_addr_ch4,
  m_addr_ch5,
  m_addr_ch6,
  m_addr_ch7,
  m_addr_ch8,
  m_addr_ch9,
  m_hrdata,
  m_hresp,
  m_hsize_ch0,
  m_hsize_ch1,
  m_hsize_ch10,
  m_hsize_ch11,
  m_hsize_ch12,
  m_hsize_ch13,
  m_hsize_ch14,
  m_hsize_ch15,
  m_hsize_ch2,
  m_hsize_ch3,
  m_hsize_ch4,
  m_hsize_ch5,
  m_hsize_ch6,
  m_hsize_ch7,
  m_hsize_ch8,
  m_hsize_ch9,
  m_hwdata_ch0,
  m_hwdata_ch1,
  m_hwdata_ch10,
  m_hwdata_ch11,
  m_hwdata_ch12,
  m_hwdata_ch13,
  m_hwdata_ch14,
  m_hwdata_ch15,
  m_hwdata_ch2,
  m_hwdata_ch3,
  m_hwdata_ch4,
  m_hwdata_ch5,
  m_hwdata_ch6,
  m_hwdata_ch7,
  m_hwdata_ch8,
  m_hwdata_ch9,
  m_hwrite_ch0,
  m_hwrite_ch1,
  m_hwrite_ch10,
  m_hwrite_ch11,
  m_hwrite_ch12,
  m_hwrite_ch13,
  m_hwrite_ch14,
  m_hwrite_ch15,
  m_hwrite_ch2,
  m_hwrite_ch3,
  m_hwrite_ch4,
  m_hwrite_ch5,
  m_hwrite_ch6,
  m_hwrite_ch7,
  m_hwrite_ch8,
  m_hwrite_ch9,
  m_prot_ch0,
  m_prot_ch1,
  m_prot_ch10,
  m_prot_ch11,
  m_prot_ch12,
  m_prot_ch13,
  m_prot_ch14,
  m_prot_ch15,
  m_prot_ch2,
  m_prot_ch3,
  m_prot_ch4,
  m_prot_ch5,
  m_prot_ch6,
  m_prot_ch7,
  m_prot_ch8,
  m_prot_ch9,
  regc_fsmc_ch0_srcdtlgc,
  regc_fsmc_ch10_srcdtlgc,
  regc_fsmc_ch11_srcdtlgc,
  regc_fsmc_ch12_srcdtlgc,
  regc_fsmc_ch13_srcdtlgc,
  regc_fsmc_ch14_srcdtlgc,
  regc_fsmc_ch15_srcdtlgc,
  regc_fsmc_ch1_srcdtlgc,
  regc_fsmc_ch2_srcdtlgc,
  regc_fsmc_ch3_srcdtlgc,
  regc_fsmc_ch4_srcdtlgc,
  regc_fsmc_ch5_srcdtlgc,
  regc_fsmc_ch6_srcdtlgc,
  regc_fsmc_ch7_srcdtlgc,
  regc_fsmc_ch8_srcdtlgc,
  regc_fsmc_ch9_srcdtlgc
);
input   [15:0]  busy_chn_code;             
input           ch0c_gbc_chnen;            
input           ch10c_gbc_chnen;           
input           ch11c_gbc_chnen;           
input           ch12c_gbc_chnen;           
input           ch13c_gbc_chnen;           
input           ch14c_gbc_chnen;           
input           ch15c_gbc_chnen;           
input           ch1c_gbc_chnen;            
input           ch2c_gbc_chnen;            
input           ch3c_gbc_chnen;            
input           ch4c_gbc_chnen;            
input           ch5c_gbc_chnen;            
input           ch6c_gbc_chnen;            
input           ch7c_gbc_chnen;            
input           ch8c_gbc_chnen;            
input           ch9c_gbc_chnen;            
input   [11:0]  chregc0_fsmc_block_tl;     
input   [2 :0]  chregc0_fsmc_chintmdc;     
input   [31:0]  chregc0_fsmc_darn;         
input           chregc0_fsmc_dgrpaddrc;    
input   [1 :0]  chregc0_fsmc_dinc;         
input   [1 :0]  chregc0_fsmc_dst_tr_width; 
input           chregc0_fsmc_endlan;       
input   [5 :0]  chregc0_fsmc_group_len;    
input           chregc0_fsmc_grpmc;        
input   [3 :0]  chregc0_fsmc_protctl;      
input   [31:0]  chregc0_fsmc_sarn;         
input           chregc0_fsmc_sgrpaddrc;    
input   [1 :0]  chregc0_fsmc_sinc;         
input   [1 :0]  chregc0_fsmc_src_tr_width; 
input   [1 :0]  chregc0_fsmc_trgtmdc;      
input   [11:0]  chregc10_fsmc_block_tl;    
input   [2 :0]  chregc10_fsmc_chintmdc;    
input   [31:0]  chregc10_fsmc_darn;        
input           chregc10_fsmc_dgrpaddrc;   
input   [1 :0]  chregc10_fsmc_dinc;        
input   [1 :0]  chregc10_fsmc_dst_tr_width; 
input           chregc10_fsmc_endlan;      
input   [5 :0]  chregc10_fsmc_group_len;   
input           chregc10_fsmc_grpmc;       
input   [3 :0]  chregc10_fsmc_protctl;     
input   [31:0]  chregc10_fsmc_sarn;        
input           chregc10_fsmc_sgrpaddrc;   
input   [1 :0]  chregc10_fsmc_sinc;        
input   [1 :0]  chregc10_fsmc_src_tr_width; 
input   [1 :0]  chregc10_fsmc_trgtmdc;     
input   [11:0]  chregc11_fsmc_block_tl;    
input   [2 :0]  chregc11_fsmc_chintmdc;    
input   [31:0]  chregc11_fsmc_darn;        
input           chregc11_fsmc_dgrpaddrc;   
input   [1 :0]  chregc11_fsmc_dinc;        
input   [1 :0]  chregc11_fsmc_dst_tr_width; 
input           chregc11_fsmc_endlan;      
input   [5 :0]  chregc11_fsmc_group_len;   
input           chregc11_fsmc_grpmc;       
input   [3 :0]  chregc11_fsmc_protctl;     
input   [31:0]  chregc11_fsmc_sarn;        
input           chregc11_fsmc_sgrpaddrc;   
input   [1 :0]  chregc11_fsmc_sinc;        
input   [1 :0]  chregc11_fsmc_src_tr_width; 
input   [1 :0]  chregc11_fsmc_trgtmdc;     
input   [11:0]  chregc12_fsmc_block_tl;    
input   [2 :0]  chregc12_fsmc_chintmdc;    
input   [31:0]  chregc12_fsmc_darn;        
input           chregc12_fsmc_dgrpaddrc;   
input   [1 :0]  chregc12_fsmc_dinc;        
input   [1 :0]  chregc12_fsmc_dst_tr_width; 
input           chregc12_fsmc_endlan;      
input   [5 :0]  chregc12_fsmc_group_len;   
input           chregc12_fsmc_grpmc;       
input   [3 :0]  chregc12_fsmc_protctl;     
input   [31:0]  chregc12_fsmc_sarn;        
input           chregc12_fsmc_sgrpaddrc;   
input   [1 :0]  chregc12_fsmc_sinc;        
input   [1 :0]  chregc12_fsmc_src_tr_width; 
input   [1 :0]  chregc12_fsmc_trgtmdc;     
input   [11:0]  chregc13_fsmc_block_tl;    
input   [2 :0]  chregc13_fsmc_chintmdc;    
input   [31:0]  chregc13_fsmc_darn;        
input           chregc13_fsmc_dgrpaddrc;   
input   [1 :0]  chregc13_fsmc_dinc;        
input   [1 :0]  chregc13_fsmc_dst_tr_width; 
input           chregc13_fsmc_endlan;      
input   [5 :0]  chregc13_fsmc_group_len;   
input           chregc13_fsmc_grpmc;       
input   [3 :0]  chregc13_fsmc_protctl;     
input   [31:0]  chregc13_fsmc_sarn;        
input           chregc13_fsmc_sgrpaddrc;   
input   [1 :0]  chregc13_fsmc_sinc;        
input   [1 :0]  chregc13_fsmc_src_tr_width; 
input   [1 :0]  chregc13_fsmc_trgtmdc;     
input   [11:0]  chregc14_fsmc_block_tl;    
input   [2 :0]  chregc14_fsmc_chintmdc;    
input   [31:0]  chregc14_fsmc_darn;        
input           chregc14_fsmc_dgrpaddrc;   
input   [1 :0]  chregc14_fsmc_dinc;        
input   [1 :0]  chregc14_fsmc_dst_tr_width; 
input           chregc14_fsmc_endlan;      
input   [5 :0]  chregc14_fsmc_group_len;   
input           chregc14_fsmc_grpmc;       
input   [3 :0]  chregc14_fsmc_protctl;     
input   [31:0]  chregc14_fsmc_sarn;        
input           chregc14_fsmc_sgrpaddrc;   
input   [1 :0]  chregc14_fsmc_sinc;        
input   [1 :0]  chregc14_fsmc_src_tr_width; 
input   [1 :0]  chregc14_fsmc_trgtmdc;     
input   [11:0]  chregc15_fsmc_block_tl;    
input   [2 :0]  chregc15_fsmc_chintmdc;    
input   [31:0]  chregc15_fsmc_darn;        
input           chregc15_fsmc_dgrpaddrc;   
input   [1 :0]  chregc15_fsmc_dinc;        
input   [1 :0]  chregc15_fsmc_dst_tr_width; 
input           chregc15_fsmc_endlan;      
input   [5 :0]  chregc15_fsmc_group_len;   
input           chregc15_fsmc_grpmc;       
input   [3 :0]  chregc15_fsmc_protctl;     
input   [31:0]  chregc15_fsmc_sarn;        
input           chregc15_fsmc_sgrpaddrc;   
input   [1 :0]  chregc15_fsmc_sinc;        
input   [1 :0]  chregc15_fsmc_src_tr_width; 
input   [1 :0]  chregc15_fsmc_trgtmdc;     
input   [11:0]  chregc1_fsmc_block_tl;     
input   [2 :0]  chregc1_fsmc_chintmdc;     
input   [31:0]  chregc1_fsmc_darn;         
input           chregc1_fsmc_dgrpaddrc;    
input   [1 :0]  chregc1_fsmc_dinc;         
input   [1 :0]  chregc1_fsmc_dst_tr_width; 
input           chregc1_fsmc_endlan;       
input   [5 :0]  chregc1_fsmc_group_len;    
input           chregc1_fsmc_grpmc;        
input   [3 :0]  chregc1_fsmc_protctl;      
input   [31:0]  chregc1_fsmc_sarn;         
input           chregc1_fsmc_sgrpaddrc;    
input   [1 :0]  chregc1_fsmc_sinc;         
input   [1 :0]  chregc1_fsmc_src_tr_width; 
input   [1 :0]  chregc1_fsmc_trgtmdc;      
input   [11:0]  chregc2_fsmc_block_tl;     
input   [2 :0]  chregc2_fsmc_chintmdc;     
input   [31:0]  chregc2_fsmc_darn;         
input           chregc2_fsmc_dgrpaddrc;    
input   [1 :0]  chregc2_fsmc_dinc;         
input   [1 :0]  chregc2_fsmc_dst_tr_width; 
input           chregc2_fsmc_endlan;       
input   [5 :0]  chregc2_fsmc_group_len;    
input           chregc2_fsmc_grpmc;        
input   [3 :0]  chregc2_fsmc_protctl;      
input   [31:0]  chregc2_fsmc_sarn;         
input           chregc2_fsmc_sgrpaddrc;    
input   [1 :0]  chregc2_fsmc_sinc;         
input   [1 :0]  chregc2_fsmc_src_tr_width; 
input   [1 :0]  chregc2_fsmc_trgtmdc;      
input   [11:0]  chregc3_fsmc_block_tl;     
input   [2 :0]  chregc3_fsmc_chintmdc;     
input   [31:0]  chregc3_fsmc_darn;         
input           chregc3_fsmc_dgrpaddrc;    
input   [1 :0]  chregc3_fsmc_dinc;         
input   [1 :0]  chregc3_fsmc_dst_tr_width; 
input           chregc3_fsmc_endlan;       
input   [5 :0]  chregc3_fsmc_group_len;    
input           chregc3_fsmc_grpmc;        
input   [3 :0]  chregc3_fsmc_protctl;      
input   [31:0]  chregc3_fsmc_sarn;         
input           chregc3_fsmc_sgrpaddrc;    
input   [1 :0]  chregc3_fsmc_sinc;         
input   [1 :0]  chregc3_fsmc_src_tr_width; 
input   [1 :0]  chregc3_fsmc_trgtmdc;      
input   [11:0]  chregc4_fsmc_block_tl;     
input   [2 :0]  chregc4_fsmc_chintmdc;     
input   [31:0]  chregc4_fsmc_darn;         
input           chregc4_fsmc_dgrpaddrc;    
input   [1 :0]  chregc4_fsmc_dinc;         
input   [1 :0]  chregc4_fsmc_dst_tr_width; 
input           chregc4_fsmc_endlan;       
input   [5 :0]  chregc4_fsmc_group_len;    
input           chregc4_fsmc_grpmc;        
input   [3 :0]  chregc4_fsmc_protctl;      
input   [31:0]  chregc4_fsmc_sarn;         
input           chregc4_fsmc_sgrpaddrc;    
input   [1 :0]  chregc4_fsmc_sinc;         
input   [1 :0]  chregc4_fsmc_src_tr_width; 
input   [1 :0]  chregc4_fsmc_trgtmdc;      
input   [11:0]  chregc5_fsmc_block_tl;     
input   [2 :0]  chregc5_fsmc_chintmdc;     
input   [31:0]  chregc5_fsmc_darn;         
input           chregc5_fsmc_dgrpaddrc;    
input   [1 :0]  chregc5_fsmc_dinc;         
input   [1 :0]  chregc5_fsmc_dst_tr_width; 
input           chregc5_fsmc_endlan;       
input   [5 :0]  chregc5_fsmc_group_len;    
input           chregc5_fsmc_grpmc;        
input   [3 :0]  chregc5_fsmc_protctl;      
input   [31:0]  chregc5_fsmc_sarn;         
input           chregc5_fsmc_sgrpaddrc;    
input   [1 :0]  chregc5_fsmc_sinc;         
input   [1 :0]  chregc5_fsmc_src_tr_width; 
input   [1 :0]  chregc5_fsmc_trgtmdc;      
input   [11:0]  chregc6_fsmc_block_tl;     
input   [2 :0]  chregc6_fsmc_chintmdc;     
input   [31:0]  chregc6_fsmc_darn;         
input           chregc6_fsmc_dgrpaddrc;    
input   [1 :0]  chregc6_fsmc_dinc;         
input   [1 :0]  chregc6_fsmc_dst_tr_width; 
input           chregc6_fsmc_endlan;       
input   [5 :0]  chregc6_fsmc_group_len;    
input           chregc6_fsmc_grpmc;        
input   [3 :0]  chregc6_fsmc_protctl;      
input   [31:0]  chregc6_fsmc_sarn;         
input           chregc6_fsmc_sgrpaddrc;    
input   [1 :0]  chregc6_fsmc_sinc;         
input   [1 :0]  chregc6_fsmc_src_tr_width; 
input   [1 :0]  chregc6_fsmc_trgtmdc;      
input   [11:0]  chregc7_fsmc_block_tl;     
input   [2 :0]  chregc7_fsmc_chintmdc;     
input   [31:0]  chregc7_fsmc_darn;         
input           chregc7_fsmc_dgrpaddrc;    
input   [1 :0]  chregc7_fsmc_dinc;         
input   [1 :0]  chregc7_fsmc_dst_tr_width; 
input           chregc7_fsmc_endlan;       
input   [5 :0]  chregc7_fsmc_group_len;    
input           chregc7_fsmc_grpmc;        
input   [3 :0]  chregc7_fsmc_protctl;      
input   [31:0]  chregc7_fsmc_sarn;         
input           chregc7_fsmc_sgrpaddrc;    
input   [1 :0]  chregc7_fsmc_sinc;         
input   [1 :0]  chregc7_fsmc_src_tr_width; 
input   [1 :0]  chregc7_fsmc_trgtmdc;      
input   [11:0]  chregc8_fsmc_block_tl;     
input   [2 :0]  chregc8_fsmc_chintmdc;     
input   [31:0]  chregc8_fsmc_darn;         
input           chregc8_fsmc_dgrpaddrc;    
input   [1 :0]  chregc8_fsmc_dinc;         
input   [1 :0]  chregc8_fsmc_dst_tr_width; 
input           chregc8_fsmc_endlan;       
input   [5 :0]  chregc8_fsmc_group_len;    
input           chregc8_fsmc_grpmc;        
input   [3 :0]  chregc8_fsmc_protctl;      
input   [31:0]  chregc8_fsmc_sarn;         
input           chregc8_fsmc_sgrpaddrc;    
input   [1 :0]  chregc8_fsmc_sinc;         
input   [1 :0]  chregc8_fsmc_src_tr_width; 
input   [1 :0]  chregc8_fsmc_trgtmdc;      
input   [11:0]  chregc9_fsmc_block_tl;     
input   [2 :0]  chregc9_fsmc_chintmdc;     
input   [31:0]  chregc9_fsmc_darn;         
input           chregc9_fsmc_dgrpaddrc;    
input   [1 :0]  chregc9_fsmc_dinc;         
input   [1 :0]  chregc9_fsmc_dst_tr_width; 
input           chregc9_fsmc_endlan;       
input   [5 :0]  chregc9_fsmc_group_len;    
input           chregc9_fsmc_grpmc;        
input   [3 :0]  chregc9_fsmc_protctl;      
input   [31:0]  chregc9_fsmc_sarn;         
input           chregc9_fsmc_sgrpaddrc;    
input   [1 :0]  chregc9_fsmc_sinc;         
input   [1 :0]  chregc9_fsmc_src_tr_width; 
input   [1 :0]  chregc9_fsmc_trgtmdc;      
input           gbc_ch0c_hpreqvld;         
input           gbc_ch0c_reqvld;           
input           gbc_ch10c_hpreqvld;        
input           gbc_ch10c_reqvld;          
input           gbc_ch11c_hpreqvld;        
input           gbc_ch11c_reqvld;          
input           gbc_ch12c_hpreqvld;        
input           gbc_ch12c_reqvld;          
input           gbc_ch13c_hpreqvld;        
input           gbc_ch13c_reqvld;          
input           gbc_ch14c_hpreqvld;        
input           gbc_ch14c_reqvld;          
input           gbc_ch15c_hpreqvld;        
input           gbc_ch15c_reqvld;          
input           gbc_ch1c_hpreqvld;         
input           gbc_ch1c_reqvld;           
input           gbc_ch2c_hpreqvld;         
input           gbc_ch2c_reqvld;           
input           gbc_ch3c_hpreqvld;         
input           gbc_ch3c_reqvld;           
input           gbc_ch4c_hpreqvld;         
input           gbc_ch4c_reqvld;           
input           gbc_ch5c_hpreqvld;         
input           gbc_ch5c_reqvld;           
input           gbc_ch6c_hpreqvld;         
input           gbc_ch6c_reqvld;           
input           gbc_ch7c_hpreqvld;         
input           gbc_ch7c_reqvld;           
input           gbc_ch8c_hpreqvld;         
input           gbc_ch8c_reqvld;           
input           gbc_ch9c_hpreqvld;         
input           gbc_ch9c_reqvld;           
input           gbc_chnc_dmacen;           
input           hclk;                      
input           hready;                    
input           hrst_n;                    
input   [31:0]  m_hrdata;                  
input   [1 :0]  m_hresp;                   
input           regc_fsmc_ch0_srcdtlgc;    
input           regc_fsmc_ch10_srcdtlgc;   
input           regc_fsmc_ch11_srcdtlgc;   
input           regc_fsmc_ch12_srcdtlgc;   
input           regc_fsmc_ch13_srcdtlgc;   
input           regc_fsmc_ch14_srcdtlgc;   
input           regc_fsmc_ch15_srcdtlgc;   
input           regc_fsmc_ch1_srcdtlgc;    
input           regc_fsmc_ch2_srcdtlgc;    
input           regc_fsmc_ch3_srcdtlgc;    
input           regc_fsmc_ch4_srcdtlgc;    
input           regc_fsmc_ch5_srcdtlgc;    
input           regc_fsmc_ch6_srcdtlgc;    
input           regc_fsmc_ch7_srcdtlgc;    
input           regc_fsmc_ch8_srcdtlgc;    
input           regc_fsmc_ch9_srcdtlgc;    
output          ch0_etb_evtdone;           
output          ch0_etb_htfrdone;          
output          ch0_etb_tfrdone;           
output          ch0c_gbc_chbsy;            
output          ch0c_gbc_trgclr;           
output          ch0chgen;                  
output          ch10_etb_evtdone;          
output          ch10_etb_htfrdone;         
output          ch10_etb_tfrdone;          
output          ch10c_gbc_chbsy;           
output          ch10c_gbc_trgclr;          
output          ch10chgen;                 
output          ch11_etb_evtdone;          
output          ch11_etb_htfrdone;         
output          ch11_etb_tfrdone;          
output          ch11c_gbc_chbsy;           
output          ch11c_gbc_trgclr;          
output          ch11chgen;                 
output          ch12_etb_evtdone;          
output          ch12_etb_htfrdone;         
output          ch12_etb_tfrdone;          
output          ch12c_gbc_chbsy;           
output          ch12c_gbc_trgclr;          
output          ch12chgen;                 
output          ch13_etb_evtdone;          
output          ch13_etb_htfrdone;         
output          ch13_etb_tfrdone;          
output          ch13c_gbc_chbsy;           
output          ch13c_gbc_trgclr;          
output          ch13chgen;                 
output          ch14_etb_evtdone;          
output          ch14_etb_htfrdone;         
output          ch14_etb_tfrdone;          
output          ch14c_gbc_chbsy;           
output          ch14c_gbc_trgclr;          
output          ch14chgen;                 
output          ch15_etb_evtdone;          
output          ch15_etb_htfrdone;         
output          ch15_etb_tfrdone;          
output          ch15c_gbc_chbsy;           
output          ch15c_gbc_trgclr;          
output          ch15chgen;                 
output          ch1_etb_evtdone;           
output          ch1_etb_htfrdone;          
output          ch1_etb_tfrdone;           
output          ch1c_gbc_chbsy;            
output          ch1c_gbc_trgclr;           
output          ch1chgen;                  
output          ch2_etb_evtdone;           
output          ch2_etb_htfrdone;          
output          ch2_etb_tfrdone;           
output          ch2c_gbc_chbsy;            
output          ch2c_gbc_trgclr;           
output          ch2chgen;                  
output          ch3_etb_evtdone;           
output          ch3_etb_htfrdone;          
output          ch3_etb_tfrdone;           
output          ch3c_gbc_chbsy;            
output          ch3c_gbc_trgclr;           
output          ch3chgen;                  
output          ch4_etb_evtdone;           
output          ch4_etb_htfrdone;          
output          ch4_etb_tfrdone;           
output          ch4c_gbc_chbsy;            
output          ch4c_gbc_trgclr;           
output          ch4chgen;                  
output          ch5_etb_evtdone;           
output          ch5_etb_htfrdone;          
output          ch5_etb_tfrdone;           
output          ch5c_gbc_chbsy;            
output          ch5c_gbc_trgclr;           
output          ch5chgen;                  
output          ch6_etb_evtdone;           
output          ch6_etb_htfrdone;          
output          ch6_etb_tfrdone;           
output          ch6c_gbc_chbsy;            
output          ch6c_gbc_trgclr;           
output          ch6chgen;                  
output          ch7_etb_evtdone;           
output          ch7_etb_htfrdone;          
output          ch7_etb_tfrdone;           
output          ch7c_gbc_chbsy;            
output          ch7c_gbc_trgclr;           
output          ch7chgen;                  
output          ch8_etb_evtdone;           
output          ch8_etb_htfrdone;          
output          ch8_etb_tfrdone;           
output          ch8c_gbc_chbsy;            
output          ch8c_gbc_trgclr;           
output          ch8chgen;                  
output          ch9_etb_evtdone;           
output          ch9_etb_htfrdone;          
output          ch9_etb_tfrdone;           
output          ch9c_gbc_chbsy;            
output          ch9c_gbc_trgclr;           
output          ch9chgen;                  
output          fsmc_chregc0_err_vld;      
output          fsmc_chregc0_htfr_vld;     
output          fsmc_chregc0_tfr_vld;      
output          fsmc_chregc0_trgetcmp_vld; 
output          fsmc_chregc10_err_vld;     
output          fsmc_chregc10_htfr_vld;    
output          fsmc_chregc10_tfr_vld;     
output          fsmc_chregc10_trgetcmp_vld; 
output          fsmc_chregc11_err_vld;     
output          fsmc_chregc11_htfr_vld;    
output          fsmc_chregc11_tfr_vld;     
output          fsmc_chregc11_trgetcmp_vld; 
output          fsmc_chregc12_err_vld;     
output          fsmc_chregc12_htfr_vld;    
output          fsmc_chregc12_tfr_vld;     
output          fsmc_chregc12_trgetcmp_vld; 
output          fsmc_chregc13_err_vld;     
output          fsmc_chregc13_htfr_vld;    
output          fsmc_chregc13_tfr_vld;     
output          fsmc_chregc13_trgetcmp_vld; 
output          fsmc_chregc14_err_vld;     
output          fsmc_chregc14_htfr_vld;    
output          fsmc_chregc14_tfr_vld;     
output          fsmc_chregc14_trgetcmp_vld; 
output          fsmc_chregc15_err_vld;     
output          fsmc_chregc15_htfr_vld;    
output          fsmc_chregc15_tfr_vld;     
output          fsmc_chregc15_trgetcmp_vld; 
output          fsmc_chregc1_err_vld;      
output          fsmc_chregc1_htfr_vld;     
output          fsmc_chregc1_tfr_vld;      
output          fsmc_chregc1_trgetcmp_vld; 
output          fsmc_chregc2_err_vld;      
output          fsmc_chregc2_htfr_vld;     
output          fsmc_chregc2_tfr_vld;      
output          fsmc_chregc2_trgetcmp_vld; 
output          fsmc_chregc3_err_vld;      
output          fsmc_chregc3_htfr_vld;     
output          fsmc_chregc3_tfr_vld;      
output          fsmc_chregc3_trgetcmp_vld; 
output          fsmc_chregc4_err_vld;      
output          fsmc_chregc4_htfr_vld;     
output          fsmc_chregc4_tfr_vld;      
output          fsmc_chregc4_trgetcmp_vld; 
output          fsmc_chregc5_err_vld;      
output          fsmc_chregc5_htfr_vld;     
output          fsmc_chregc5_tfr_vld;      
output          fsmc_chregc5_trgetcmp_vld; 
output          fsmc_chregc6_err_vld;      
output          fsmc_chregc6_htfr_vld;     
output          fsmc_chregc6_tfr_vld;      
output          fsmc_chregc6_trgetcmp_vld; 
output          fsmc_chregc7_err_vld;      
output          fsmc_chregc7_htfr_vld;     
output          fsmc_chregc7_tfr_vld;      
output          fsmc_chregc7_trgetcmp_vld; 
output          fsmc_chregc8_err_vld;      
output          fsmc_chregc8_htfr_vld;     
output          fsmc_chregc8_tfr_vld;      
output          fsmc_chregc8_trgetcmp_vld; 
output          fsmc_chregc9_err_vld;      
output          fsmc_chregc9_htfr_vld;     
output          fsmc_chregc9_tfr_vld;      
output          fsmc_chregc9_trgetcmp_vld; 
output          fsmc_chregc_pdvld_ch0;     
output          fsmc_chregc_pdvld_ch1;     
output          fsmc_chregc_pdvld_ch10;    
output          fsmc_chregc_pdvld_ch11;    
output          fsmc_chregc_pdvld_ch12;    
output          fsmc_chregc_pdvld_ch13;    
output          fsmc_chregc_pdvld_ch14;    
output          fsmc_chregc_pdvld_ch15;    
output          fsmc_chregc_pdvld_ch2;     
output          fsmc_chregc_pdvld_ch3;     
output          fsmc_chregc_pdvld_ch4;     
output          fsmc_chregc_pdvld_ch5;     
output          fsmc_chregc_pdvld_ch6;     
output          fsmc_chregc_pdvld_ch7;     
output          fsmc_chregc_pdvld_ch8;     
output          fsmc_chregc_pdvld_ch9;     
output          fsmc_regc_ch0en_clr;       
output          fsmc_regc_ch10en_clr;      
output          fsmc_regc_ch11en_clr;      
output          fsmc_regc_ch12en_clr;      
output          fsmc_regc_ch13en_clr;      
output          fsmc_regc_ch14en_clr;      
output          fsmc_regc_ch15en_clr;      
output          fsmc_regc_ch1en_clr;       
output          fsmc_regc_ch2en_clr;       
output          fsmc_regc_ch3en_clr;       
output          fsmc_regc_ch4en_clr;       
output          fsmc_regc_ch5en_clr;       
output          fsmc_regc_ch6en_clr;       
output          fsmc_regc_ch7en_clr;       
output          fsmc_regc_ch8en_clr;       
output          fsmc_regc_ch9en_clr;       
output  [31:0]  m_addr_ch0;                
output  [31:0]  m_addr_ch1;                
output  [31:0]  m_addr_ch10;               
output  [31:0]  m_addr_ch11;               
output  [31:0]  m_addr_ch12;               
output  [31:0]  m_addr_ch13;               
output  [31:0]  m_addr_ch14;               
output  [31:0]  m_addr_ch15;               
output  [31:0]  m_addr_ch2;                
output  [31:0]  m_addr_ch3;                
output  [31:0]  m_addr_ch4;                
output  [31:0]  m_addr_ch5;                
output  [31:0]  m_addr_ch6;                
output  [31:0]  m_addr_ch7;                
output  [31:0]  m_addr_ch8;                
output  [31:0]  m_addr_ch9;                
output  [2 :0]  m_hsize_ch0;               
output  [2 :0]  m_hsize_ch1;               
output  [2 :0]  m_hsize_ch10;              
output  [2 :0]  m_hsize_ch11;              
output  [2 :0]  m_hsize_ch12;              
output  [2 :0]  m_hsize_ch13;              
output  [2 :0]  m_hsize_ch14;              
output  [2 :0]  m_hsize_ch15;              
output  [2 :0]  m_hsize_ch2;               
output  [2 :0]  m_hsize_ch3;               
output  [2 :0]  m_hsize_ch4;               
output  [2 :0]  m_hsize_ch5;               
output  [2 :0]  m_hsize_ch6;               
output  [2 :0]  m_hsize_ch7;               
output  [2 :0]  m_hsize_ch8;               
output  [2 :0]  m_hsize_ch9;               
output  [31:0]  m_hwdata_ch0;              
output  [31:0]  m_hwdata_ch1;              
output  [31:0]  m_hwdata_ch10;             
output  [31:0]  m_hwdata_ch11;             
output  [31:0]  m_hwdata_ch12;             
output  [31:0]  m_hwdata_ch13;             
output  [31:0]  m_hwdata_ch14;             
output  [31:0]  m_hwdata_ch15;             
output  [31:0]  m_hwdata_ch2;              
output  [31:0]  m_hwdata_ch3;              
output  [31:0]  m_hwdata_ch4;              
output  [31:0]  m_hwdata_ch5;              
output  [31:0]  m_hwdata_ch6;              
output  [31:0]  m_hwdata_ch7;              
output  [31:0]  m_hwdata_ch8;              
output  [31:0]  m_hwdata_ch9;              
output          m_hwrite_ch0;              
output          m_hwrite_ch1;              
output          m_hwrite_ch10;             
output          m_hwrite_ch11;             
output          m_hwrite_ch12;             
output          m_hwrite_ch13;             
output          m_hwrite_ch14;             
output          m_hwrite_ch15;             
output          m_hwrite_ch2;              
output          m_hwrite_ch3;              
output          m_hwrite_ch4;              
output          m_hwrite_ch5;              
output          m_hwrite_ch6;              
output          m_hwrite_ch7;              
output          m_hwrite_ch8;              
output          m_hwrite_ch9;              
output  [3 :0]  m_prot_ch0;                
output  [3 :0]  m_prot_ch1;                
output  [3 :0]  m_prot_ch10;               
output  [3 :0]  m_prot_ch11;               
output  [3 :0]  m_prot_ch12;               
output  [3 :0]  m_prot_ch13;               
output  [3 :0]  m_prot_ch14;               
output  [3 :0]  m_prot_ch15;               
output  [3 :0]  m_prot_ch2;                
output  [3 :0]  m_prot_ch3;                
output  [3 :0]  m_prot_ch4;                
output  [3 :0]  m_prot_ch5;                
output  [3 :0]  m_prot_ch6;                
output  [3 :0]  m_prot_ch7;                
output  [3 :0]  m_prot_ch8;                
output  [3 :0]  m_prot_ch9;                
wire    [15:0]  busy_chn_code;             
wire            ch0_etb_evtdone;           
wire            ch0_etb_htfrdone;          
wire            ch0_etb_tfrdone;           
wire            ch0c_gbc_chbsy;            
wire            ch0c_gbc_chnen;            
wire            ch0c_gbc_trgclr;           
wire            ch0chgen;                  
wire            ch10_etb_evtdone;          
wire            ch10_etb_htfrdone;         
wire            ch10_etb_tfrdone;          
wire            ch10c_gbc_chbsy;           
wire            ch10c_gbc_chnen;           
wire            ch10c_gbc_trgclr;          
wire            ch10chgen;                 
wire            ch11_etb_evtdone;          
wire            ch11_etb_htfrdone;         
wire            ch11_etb_tfrdone;          
wire            ch11c_gbc_chbsy;           
wire            ch11c_gbc_chnen;           
wire            ch11c_gbc_trgclr;          
wire            ch11chgen;                 
wire            ch12_etb_evtdone;          
wire            ch12_etb_htfrdone;         
wire            ch12_etb_tfrdone;          
wire            ch12c_gbc_chbsy;           
wire            ch12c_gbc_chnen;           
wire            ch12c_gbc_trgclr;          
wire            ch12chgen;                 
wire            ch13_etb_evtdone;          
wire            ch13_etb_htfrdone;         
wire            ch13_etb_tfrdone;          
wire            ch13c_gbc_chbsy;           
wire            ch13c_gbc_chnen;           
wire            ch13c_gbc_trgclr;          
wire            ch13chgen;                 
wire            ch14_etb_evtdone;          
wire            ch14_etb_htfrdone;         
wire            ch14_etb_tfrdone;          
wire            ch14c_gbc_chbsy;           
wire            ch14c_gbc_chnen;           
wire            ch14c_gbc_trgclr;          
wire            ch14chgen;                 
wire            ch15_etb_evtdone;          
wire            ch15_etb_htfrdone;         
wire            ch15_etb_tfrdone;          
wire            ch15c_gbc_chbsy;           
wire            ch15c_gbc_chnen;           
wire            ch15c_gbc_trgclr;          
wire            ch15chgen;                 
wire            ch1_etb_evtdone;           
wire            ch1_etb_htfrdone;          
wire            ch1_etb_tfrdone;           
wire            ch1c_gbc_chbsy;            
wire            ch1c_gbc_chnen;            
wire            ch1c_gbc_trgclr;           
wire            ch1chgen;                  
wire            ch2_etb_evtdone;           
wire            ch2_etb_htfrdone;          
wire            ch2_etb_tfrdone;           
wire            ch2c_gbc_chbsy;            
wire            ch2c_gbc_chnen;            
wire            ch2c_gbc_trgclr;           
wire            ch2chgen;                  
wire            ch3_etb_evtdone;           
wire            ch3_etb_htfrdone;          
wire            ch3_etb_tfrdone;           
wire            ch3c_gbc_chbsy;            
wire            ch3c_gbc_chnen;            
wire            ch3c_gbc_trgclr;           
wire            ch3chgen;                  
wire            ch4_etb_evtdone;           
wire            ch4_etb_htfrdone;          
wire            ch4_etb_tfrdone;           
wire            ch4c_gbc_chbsy;            
wire            ch4c_gbc_chnen;            
wire            ch4c_gbc_trgclr;           
wire            ch4chgen;                  
wire            ch5_etb_evtdone;           
wire            ch5_etb_htfrdone;          
wire            ch5_etb_tfrdone;           
wire            ch5c_gbc_chbsy;            
wire            ch5c_gbc_chnen;            
wire            ch5c_gbc_trgclr;           
wire            ch5chgen;                  
wire            ch6_etb_evtdone;           
wire            ch6_etb_htfrdone;          
wire            ch6_etb_tfrdone;           
wire            ch6c_gbc_chbsy;            
wire            ch6c_gbc_chnen;            
wire            ch6c_gbc_trgclr;           
wire            ch6chgen;                  
wire            ch7_etb_evtdone;           
wire            ch7_etb_htfrdone;          
wire            ch7_etb_tfrdone;           
wire            ch7c_gbc_chbsy;            
wire            ch7c_gbc_chnen;            
wire            ch7c_gbc_trgclr;           
wire            ch7chgen;                  
wire            ch8_etb_evtdone;           
wire            ch8_etb_htfrdone;          
wire            ch8_etb_tfrdone;           
wire            ch8c_gbc_chbsy;            
wire            ch8c_gbc_chnen;            
wire            ch8c_gbc_trgclr;           
wire            ch8chgen;                  
wire            ch9_etb_evtdone;           
wire            ch9_etb_htfrdone;          
wire            ch9_etb_tfrdone;           
wire            ch9c_gbc_chbsy;            
wire            ch9c_gbc_chnen;            
wire            ch9c_gbc_trgclr;           
wire            ch9chgen;                  
wire    [11:0]  chregc0_fsmc_block_tl;     
wire    [2 :0]  chregc0_fsmc_chintmdc;     
wire    [31:0]  chregc0_fsmc_darn;         
wire            chregc0_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_dinc;         
wire    [1 :0]  chregc0_fsmc_dst_tr_width; 
wire            chregc0_fsmc_endlan;       
wire    [5 :0]  chregc0_fsmc_group_len;    
wire            chregc0_fsmc_grpmc;        
wire    [3 :0]  chregc0_fsmc_protctl;      
wire    [31:0]  chregc0_fsmc_sarn;         
wire            chregc0_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_sinc;         
wire    [1 :0]  chregc0_fsmc_src_tr_width; 
wire    [1 :0]  chregc0_fsmc_trgtmdc;      
wire    [11:0]  chregc10_fsmc_block_tl;    
wire    [2 :0]  chregc10_fsmc_chintmdc;    
wire    [31:0]  chregc10_fsmc_darn;        
wire            chregc10_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_dinc;        
wire    [1 :0]  chregc10_fsmc_dst_tr_width; 
wire            chregc10_fsmc_endlan;      
wire    [5 :0]  chregc10_fsmc_group_len;   
wire            chregc10_fsmc_grpmc;       
wire    [3 :0]  chregc10_fsmc_protctl;     
wire    [31:0]  chregc10_fsmc_sarn;        
wire            chregc10_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_sinc;        
wire    [1 :0]  chregc10_fsmc_src_tr_width; 
wire    [1 :0]  chregc10_fsmc_trgtmdc;     
wire    [11:0]  chregc11_fsmc_block_tl;    
wire    [2 :0]  chregc11_fsmc_chintmdc;    
wire    [31:0]  chregc11_fsmc_darn;        
wire            chregc11_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_dinc;        
wire    [1 :0]  chregc11_fsmc_dst_tr_width; 
wire            chregc11_fsmc_endlan;      
wire    [5 :0]  chregc11_fsmc_group_len;   
wire            chregc11_fsmc_grpmc;       
wire    [3 :0]  chregc11_fsmc_protctl;     
wire    [31:0]  chregc11_fsmc_sarn;        
wire            chregc11_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_sinc;        
wire    [1 :0]  chregc11_fsmc_src_tr_width; 
wire    [1 :0]  chregc11_fsmc_trgtmdc;     
wire    [11:0]  chregc12_fsmc_block_tl;    
wire    [2 :0]  chregc12_fsmc_chintmdc;    
wire    [31:0]  chregc12_fsmc_darn;        
wire            chregc12_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_dinc;        
wire    [1 :0]  chregc12_fsmc_dst_tr_width; 
wire            chregc12_fsmc_endlan;      
wire    [5 :0]  chregc12_fsmc_group_len;   
wire            chregc12_fsmc_grpmc;       
wire    [3 :0]  chregc12_fsmc_protctl;     
wire    [31:0]  chregc12_fsmc_sarn;        
wire            chregc12_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_sinc;        
wire    [1 :0]  chregc12_fsmc_src_tr_width; 
wire    [1 :0]  chregc12_fsmc_trgtmdc;     
wire    [11:0]  chregc13_fsmc_block_tl;    
wire    [2 :0]  chregc13_fsmc_chintmdc;    
wire    [31:0]  chregc13_fsmc_darn;        
wire            chregc13_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_dinc;        
wire    [1 :0]  chregc13_fsmc_dst_tr_width; 
wire            chregc13_fsmc_endlan;      
wire    [5 :0]  chregc13_fsmc_group_len;   
wire            chregc13_fsmc_grpmc;       
wire    [3 :0]  chregc13_fsmc_protctl;     
wire    [31:0]  chregc13_fsmc_sarn;        
wire            chregc13_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_sinc;        
wire    [1 :0]  chregc13_fsmc_src_tr_width; 
wire    [1 :0]  chregc13_fsmc_trgtmdc;     
wire    [11:0]  chregc14_fsmc_block_tl;    
wire    [2 :0]  chregc14_fsmc_chintmdc;    
wire    [31:0]  chregc14_fsmc_darn;        
wire            chregc14_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_dinc;        
wire    [1 :0]  chregc14_fsmc_dst_tr_width; 
wire            chregc14_fsmc_endlan;      
wire    [5 :0]  chregc14_fsmc_group_len;   
wire            chregc14_fsmc_grpmc;       
wire    [3 :0]  chregc14_fsmc_protctl;     
wire    [31:0]  chregc14_fsmc_sarn;        
wire            chregc14_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_sinc;        
wire    [1 :0]  chregc14_fsmc_src_tr_width; 
wire    [1 :0]  chregc14_fsmc_trgtmdc;     
wire    [11:0]  chregc15_fsmc_block_tl;    
wire    [2 :0]  chregc15_fsmc_chintmdc;    
wire    [31:0]  chregc15_fsmc_darn;        
wire            chregc15_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_dinc;        
wire    [1 :0]  chregc15_fsmc_dst_tr_width; 
wire            chregc15_fsmc_endlan;      
wire    [5 :0]  chregc15_fsmc_group_len;   
wire            chregc15_fsmc_grpmc;       
wire    [3 :0]  chregc15_fsmc_protctl;     
wire    [31:0]  chregc15_fsmc_sarn;        
wire            chregc15_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_sinc;        
wire    [1 :0]  chregc15_fsmc_src_tr_width; 
wire    [1 :0]  chregc15_fsmc_trgtmdc;     
wire    [11:0]  chregc1_fsmc_block_tl;     
wire    [2 :0]  chregc1_fsmc_chintmdc;     
wire    [31:0]  chregc1_fsmc_darn;         
wire            chregc1_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_dinc;         
wire    [1 :0]  chregc1_fsmc_dst_tr_width; 
wire            chregc1_fsmc_endlan;       
wire    [5 :0]  chregc1_fsmc_group_len;    
wire            chregc1_fsmc_grpmc;        
wire    [3 :0]  chregc1_fsmc_protctl;      
wire    [31:0]  chregc1_fsmc_sarn;         
wire            chregc1_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_sinc;         
wire    [1 :0]  chregc1_fsmc_src_tr_width; 
wire    [1 :0]  chregc1_fsmc_trgtmdc;      
wire    [11:0]  chregc2_fsmc_block_tl;     
wire    [2 :0]  chregc2_fsmc_chintmdc;     
wire    [31:0]  chregc2_fsmc_darn;         
wire            chregc2_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_dinc;         
wire    [1 :0]  chregc2_fsmc_dst_tr_width; 
wire            chregc2_fsmc_endlan;       
wire    [5 :0]  chregc2_fsmc_group_len;    
wire            chregc2_fsmc_grpmc;        
wire    [3 :0]  chregc2_fsmc_protctl;      
wire    [31:0]  chregc2_fsmc_sarn;         
wire            chregc2_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_sinc;         
wire    [1 :0]  chregc2_fsmc_src_tr_width; 
wire    [1 :0]  chregc2_fsmc_trgtmdc;      
wire    [11:0]  chregc3_fsmc_block_tl;     
wire    [2 :0]  chregc3_fsmc_chintmdc;     
wire    [31:0]  chregc3_fsmc_darn;         
wire            chregc3_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_dinc;         
wire    [1 :0]  chregc3_fsmc_dst_tr_width; 
wire            chregc3_fsmc_endlan;       
wire    [5 :0]  chregc3_fsmc_group_len;    
wire            chregc3_fsmc_grpmc;        
wire    [3 :0]  chregc3_fsmc_protctl;      
wire    [31:0]  chregc3_fsmc_sarn;         
wire            chregc3_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_sinc;         
wire    [1 :0]  chregc3_fsmc_src_tr_width; 
wire    [1 :0]  chregc3_fsmc_trgtmdc;      
wire    [11:0]  chregc4_fsmc_block_tl;     
wire    [2 :0]  chregc4_fsmc_chintmdc;     
wire    [31:0]  chregc4_fsmc_darn;         
wire            chregc4_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_dinc;         
wire    [1 :0]  chregc4_fsmc_dst_tr_width; 
wire            chregc4_fsmc_endlan;       
wire    [5 :0]  chregc4_fsmc_group_len;    
wire            chregc4_fsmc_grpmc;        
wire    [3 :0]  chregc4_fsmc_protctl;      
wire    [31:0]  chregc4_fsmc_sarn;         
wire            chregc4_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_sinc;         
wire    [1 :0]  chregc4_fsmc_src_tr_width; 
wire    [1 :0]  chregc4_fsmc_trgtmdc;      
wire    [11:0]  chregc5_fsmc_block_tl;     
wire    [2 :0]  chregc5_fsmc_chintmdc;     
wire    [31:0]  chregc5_fsmc_darn;         
wire            chregc5_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_dinc;         
wire    [1 :0]  chregc5_fsmc_dst_tr_width; 
wire            chregc5_fsmc_endlan;       
wire    [5 :0]  chregc5_fsmc_group_len;    
wire            chregc5_fsmc_grpmc;        
wire    [3 :0]  chregc5_fsmc_protctl;      
wire    [31:0]  chregc5_fsmc_sarn;         
wire            chregc5_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_sinc;         
wire    [1 :0]  chregc5_fsmc_src_tr_width; 
wire    [1 :0]  chregc5_fsmc_trgtmdc;      
wire    [11:0]  chregc6_fsmc_block_tl;     
wire    [2 :0]  chregc6_fsmc_chintmdc;     
wire    [31:0]  chregc6_fsmc_darn;         
wire            chregc6_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_dinc;         
wire    [1 :0]  chregc6_fsmc_dst_tr_width; 
wire            chregc6_fsmc_endlan;       
wire    [5 :0]  chregc6_fsmc_group_len;    
wire            chregc6_fsmc_grpmc;        
wire    [3 :0]  chregc6_fsmc_protctl;      
wire    [31:0]  chregc6_fsmc_sarn;         
wire            chregc6_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_sinc;         
wire    [1 :0]  chregc6_fsmc_src_tr_width; 
wire    [1 :0]  chregc6_fsmc_trgtmdc;      
wire    [11:0]  chregc7_fsmc_block_tl;     
wire    [2 :0]  chregc7_fsmc_chintmdc;     
wire    [31:0]  chregc7_fsmc_darn;         
wire            chregc7_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_dinc;         
wire    [1 :0]  chregc7_fsmc_dst_tr_width; 
wire            chregc7_fsmc_endlan;       
wire    [5 :0]  chregc7_fsmc_group_len;    
wire            chregc7_fsmc_grpmc;        
wire    [3 :0]  chregc7_fsmc_protctl;      
wire    [31:0]  chregc7_fsmc_sarn;         
wire            chregc7_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_sinc;         
wire    [1 :0]  chregc7_fsmc_src_tr_width; 
wire    [1 :0]  chregc7_fsmc_trgtmdc;      
wire    [11:0]  chregc8_fsmc_block_tl;     
wire    [2 :0]  chregc8_fsmc_chintmdc;     
wire    [31:0]  chregc8_fsmc_darn;         
wire            chregc8_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_dinc;         
wire    [1 :0]  chregc8_fsmc_dst_tr_width; 
wire            chregc8_fsmc_endlan;       
wire    [5 :0]  chregc8_fsmc_group_len;    
wire            chregc8_fsmc_grpmc;        
wire    [3 :0]  chregc8_fsmc_protctl;      
wire    [31:0]  chregc8_fsmc_sarn;         
wire            chregc8_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_sinc;         
wire    [1 :0]  chregc8_fsmc_src_tr_width; 
wire    [1 :0]  chregc8_fsmc_trgtmdc;      
wire    [11:0]  chregc9_fsmc_block_tl;     
wire    [2 :0]  chregc9_fsmc_chintmdc;     
wire    [31:0]  chregc9_fsmc_darn;         
wire            chregc9_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_dinc;         
wire    [1 :0]  chregc9_fsmc_dst_tr_width; 
wire            chregc9_fsmc_endlan;       
wire    [5 :0]  chregc9_fsmc_group_len;    
wire            chregc9_fsmc_grpmc;        
wire    [3 :0]  chregc9_fsmc_protctl;      
wire    [31:0]  chregc9_fsmc_sarn;         
wire            chregc9_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_sinc;         
wire    [1 :0]  chregc9_fsmc_src_tr_width; 
wire    [1 :0]  chregc9_fsmc_trgtmdc;      
wire            fsmc_chregc0_err_vld;      
wire            fsmc_chregc0_htfr_vld;     
wire            fsmc_chregc0_tfr_vld;      
wire            fsmc_chregc0_trgetcmp_vld; 
wire            fsmc_chregc10_err_vld;     
wire            fsmc_chregc10_htfr_vld;    
wire            fsmc_chregc10_tfr_vld;     
wire            fsmc_chregc10_trgetcmp_vld; 
wire            fsmc_chregc11_err_vld;     
wire            fsmc_chregc11_htfr_vld;    
wire            fsmc_chregc11_tfr_vld;     
wire            fsmc_chregc11_trgetcmp_vld; 
wire            fsmc_chregc12_err_vld;     
wire            fsmc_chregc12_htfr_vld;    
wire            fsmc_chregc12_tfr_vld;     
wire            fsmc_chregc12_trgetcmp_vld; 
wire            fsmc_chregc13_err_vld;     
wire            fsmc_chregc13_htfr_vld;    
wire            fsmc_chregc13_tfr_vld;     
wire            fsmc_chregc13_trgetcmp_vld; 
wire            fsmc_chregc14_err_vld;     
wire            fsmc_chregc14_htfr_vld;    
wire            fsmc_chregc14_tfr_vld;     
wire            fsmc_chregc14_trgetcmp_vld; 
wire            fsmc_chregc15_err_vld;     
wire            fsmc_chregc15_htfr_vld;    
wire            fsmc_chregc15_tfr_vld;     
wire            fsmc_chregc15_trgetcmp_vld; 
wire            fsmc_chregc1_err_vld;      
wire            fsmc_chregc1_htfr_vld;     
wire            fsmc_chregc1_tfr_vld;      
wire            fsmc_chregc1_trgetcmp_vld; 
wire            fsmc_chregc2_err_vld;      
wire            fsmc_chregc2_htfr_vld;     
wire            fsmc_chregc2_tfr_vld;      
wire            fsmc_chregc2_trgetcmp_vld; 
wire            fsmc_chregc3_err_vld;      
wire            fsmc_chregc3_htfr_vld;     
wire            fsmc_chregc3_tfr_vld;      
wire            fsmc_chregc3_trgetcmp_vld; 
wire            fsmc_chregc4_err_vld;      
wire            fsmc_chregc4_htfr_vld;     
wire            fsmc_chregc4_tfr_vld;      
wire            fsmc_chregc4_trgetcmp_vld; 
wire            fsmc_chregc5_err_vld;      
wire            fsmc_chregc5_htfr_vld;     
wire            fsmc_chregc5_tfr_vld;      
wire            fsmc_chregc5_trgetcmp_vld; 
wire            fsmc_chregc6_err_vld;      
wire            fsmc_chregc6_htfr_vld;     
wire            fsmc_chregc6_tfr_vld;      
wire            fsmc_chregc6_trgetcmp_vld; 
wire            fsmc_chregc7_err_vld;      
wire            fsmc_chregc7_htfr_vld;     
wire            fsmc_chregc7_tfr_vld;      
wire            fsmc_chregc7_trgetcmp_vld; 
wire            fsmc_chregc8_err_vld;      
wire            fsmc_chregc8_htfr_vld;     
wire            fsmc_chregc8_tfr_vld;      
wire            fsmc_chregc8_trgetcmp_vld; 
wire            fsmc_chregc9_err_vld;      
wire            fsmc_chregc9_htfr_vld;     
wire            fsmc_chregc9_tfr_vld;      
wire            fsmc_chregc9_trgetcmp_vld; 
wire            fsmc_chregc_pdvld_ch0;     
wire            fsmc_chregc_pdvld_ch1;     
wire            fsmc_chregc_pdvld_ch10;    
wire            fsmc_chregc_pdvld_ch11;    
wire            fsmc_chregc_pdvld_ch12;    
wire            fsmc_chregc_pdvld_ch13;    
wire            fsmc_chregc_pdvld_ch14;    
wire            fsmc_chregc_pdvld_ch15;    
wire            fsmc_chregc_pdvld_ch2;     
wire            fsmc_chregc_pdvld_ch3;     
wire            fsmc_chregc_pdvld_ch4;     
wire            fsmc_chregc_pdvld_ch5;     
wire            fsmc_chregc_pdvld_ch6;     
wire            fsmc_chregc_pdvld_ch7;     
wire            fsmc_chregc_pdvld_ch8;     
wire            fsmc_chregc_pdvld_ch9;     
wire            fsmc_regc_ch0en_clr;       
wire            fsmc_regc_ch10en_clr;      
wire            fsmc_regc_ch11en_clr;      
wire            fsmc_regc_ch12en_clr;      
wire            fsmc_regc_ch13en_clr;      
wire            fsmc_regc_ch14en_clr;      
wire            fsmc_regc_ch15en_clr;      
wire            fsmc_regc_ch1en_clr;       
wire            fsmc_regc_ch2en_clr;       
wire            fsmc_regc_ch3en_clr;       
wire            fsmc_regc_ch4en_clr;       
wire            fsmc_regc_ch5en_clr;       
wire            fsmc_regc_ch6en_clr;       
wire            fsmc_regc_ch7en_clr;       
wire            fsmc_regc_ch8en_clr;       
wire            fsmc_regc_ch9en_clr;       
wire            gbc_ch0c_hpreqvld;         
wire            gbc_ch0c_reqvld;           
wire            gbc_ch10c_hpreqvld;        
wire            gbc_ch10c_reqvld;          
wire            gbc_ch11c_hpreqvld;        
wire            gbc_ch11c_reqvld;          
wire            gbc_ch12c_hpreqvld;        
wire            gbc_ch12c_reqvld;          
wire            gbc_ch13c_hpreqvld;        
wire            gbc_ch13c_reqvld;          
wire            gbc_ch14c_hpreqvld;        
wire            gbc_ch14c_reqvld;          
wire            gbc_ch15c_hpreqvld;        
wire            gbc_ch15c_reqvld;          
wire            gbc_ch1c_hpreqvld;         
wire            gbc_ch1c_reqvld;           
wire            gbc_ch2c_hpreqvld;         
wire            gbc_ch2c_reqvld;           
wire            gbc_ch3c_hpreqvld;         
wire            gbc_ch3c_reqvld;           
wire            gbc_ch4c_hpreqvld;         
wire            gbc_ch4c_reqvld;           
wire            gbc_ch5c_hpreqvld;         
wire            gbc_ch5c_reqvld;           
wire            gbc_ch6c_hpreqvld;         
wire            gbc_ch6c_reqvld;           
wire            gbc_ch7c_hpreqvld;         
wire            gbc_ch7c_reqvld;           
wire            gbc_ch8c_hpreqvld;         
wire            gbc_ch8c_reqvld;           
wire            gbc_ch9c_hpreqvld;         
wire            gbc_ch9c_reqvld;           
wire            gbc_chnc_dmacen;           
wire            hclk;                      
wire            hready;                    
wire            hrst_n;                    
wire    [31:0]  m_addr_ch0;                
wire    [31:0]  m_addr_ch1;                
wire    [31:0]  m_addr_ch10;               
wire    [31:0]  m_addr_ch11;               
wire    [31:0]  m_addr_ch12;               
wire    [31:0]  m_addr_ch13;               
wire    [31:0]  m_addr_ch14;               
wire    [31:0]  m_addr_ch15;               
wire    [31:0]  m_addr_ch2;                
wire    [31:0]  m_addr_ch3;                
wire    [31:0]  m_addr_ch4;                
wire    [31:0]  m_addr_ch5;                
wire    [31:0]  m_addr_ch6;                
wire    [31:0]  m_addr_ch7;                
wire    [31:0]  m_addr_ch8;                
wire    [31:0]  m_addr_ch9;                
wire    [31:0]  m_hrdata;                  
wire    [1 :0]  m_hresp;                   
wire    [2 :0]  m_hsize_ch0;               
wire    [2 :0]  m_hsize_ch1;               
wire    [2 :0]  m_hsize_ch10;              
wire    [2 :0]  m_hsize_ch11;              
wire    [2 :0]  m_hsize_ch12;              
wire    [2 :0]  m_hsize_ch13;              
wire    [2 :0]  m_hsize_ch14;              
wire    [2 :0]  m_hsize_ch15;              
wire    [2 :0]  m_hsize_ch2;               
wire    [2 :0]  m_hsize_ch3;               
wire    [2 :0]  m_hsize_ch4;               
wire    [2 :0]  m_hsize_ch5;               
wire    [2 :0]  m_hsize_ch6;               
wire    [2 :0]  m_hsize_ch7;               
wire    [2 :0]  m_hsize_ch8;               
wire    [2 :0]  m_hsize_ch9;               
wire    [31:0]  m_hwdata_ch0;              
wire    [31:0]  m_hwdata_ch1;              
wire    [31:0]  m_hwdata_ch10;             
wire    [31:0]  m_hwdata_ch11;             
wire    [31:0]  m_hwdata_ch12;             
wire    [31:0]  m_hwdata_ch13;             
wire    [31:0]  m_hwdata_ch14;             
wire    [31:0]  m_hwdata_ch15;             
wire    [31:0]  m_hwdata_ch2;              
wire    [31:0]  m_hwdata_ch3;              
wire    [31:0]  m_hwdata_ch4;              
wire    [31:0]  m_hwdata_ch5;              
wire    [31:0]  m_hwdata_ch6;              
wire    [31:0]  m_hwdata_ch7;              
wire    [31:0]  m_hwdata_ch8;              
wire    [31:0]  m_hwdata_ch9;              
wire            m_hwrite_ch0;              
wire            m_hwrite_ch1;              
wire            m_hwrite_ch10;             
wire            m_hwrite_ch11;             
wire            m_hwrite_ch12;             
wire            m_hwrite_ch13;             
wire            m_hwrite_ch14;             
wire            m_hwrite_ch15;             
wire            m_hwrite_ch2;              
wire            m_hwrite_ch3;              
wire            m_hwrite_ch4;              
wire            m_hwrite_ch5;              
wire            m_hwrite_ch6;              
wire            m_hwrite_ch7;              
wire            m_hwrite_ch8;              
wire            m_hwrite_ch9;              
wire    [3 :0]  m_prot_ch0;                
wire    [3 :0]  m_prot_ch1;                
wire    [3 :0]  m_prot_ch10;               
wire    [3 :0]  m_prot_ch11;               
wire    [3 :0]  m_prot_ch12;               
wire    [3 :0]  m_prot_ch13;               
wire    [3 :0]  m_prot_ch14;               
wire    [3 :0]  m_prot_ch15;               
wire    [3 :0]  m_prot_ch2;                
wire    [3 :0]  m_prot_ch3;                
wire    [3 :0]  m_prot_ch4;                
wire    [3 :0]  m_prot_ch5;                
wire    [3 :0]  m_prot_ch6;                
wire    [3 :0]  m_prot_ch7;                
wire    [3 :0]  m_prot_ch8;                
wire    [3 :0]  m_prot_ch9;                
wire            regc_fsmc_ch0_srcdtlgc;    
wire            regc_fsmc_ch10_srcdtlgc;   
wire            regc_fsmc_ch11_srcdtlgc;   
wire            regc_fsmc_ch12_srcdtlgc;   
wire            regc_fsmc_ch13_srcdtlgc;   
wire            regc_fsmc_ch14_srcdtlgc;   
wire            regc_fsmc_ch15_srcdtlgc;   
wire            regc_fsmc_ch1_srcdtlgc;    
wire            regc_fsmc_ch2_srcdtlgc;    
wire            regc_fsmc_ch3_srcdtlgc;    
wire            regc_fsmc_ch4_srcdtlgc;    
wire            regc_fsmc_ch5_srcdtlgc;    
wire            regc_fsmc_ch6_srcdtlgc;    
wire            regc_fsmc_ch7_srcdtlgc;    
wire            regc_fsmc_ch8_srcdtlgc;    
wire            regc_fsmc_ch9_srcdtlgc;    
fsmc  x_fsmc0 (
  .busy_chn_code_x           (busy_chn_code[0]         ),
  .chn_etb_htfr_done         (ch0_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch0_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch0_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch0c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch0chgen                 ),
  .chnc_gbc_chnen            (ch0c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch0c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc0_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc0_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc0_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc0_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc0_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc0_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc0_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc0_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc0_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc0_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc0_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc0_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch0    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc0_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch0en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch0c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch0c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch0               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch0              ),
  .m_hwdata_chn              (m_hwdata_ch0             ),
  .m_hwrite_chn              (m_hwrite_ch0             ),
  .m_prot_chn                (m_prot_ch0               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch0_srcdtlgc   )
);
fsmc  x_fsmc1 (
  .busy_chn_code_x           (busy_chn_code[1]         ),
  .chn_etb_htfr_done         (ch1_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch1_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch1_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch1c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch1chgen                 ),
  .chnc_gbc_chnen            (ch1c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch1c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc1_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc1_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc1_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc1_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc1_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc1_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc1_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc1_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc1_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc1_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc1_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc1_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch1    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc1_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch1en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch1c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch1c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch1               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch1              ),
  .m_hwdata_chn              (m_hwdata_ch1             ),
  .m_hwrite_chn              (m_hwrite_ch1             ),
  .m_prot_chn                (m_prot_ch1               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch1_srcdtlgc   )
);
fsmc  x_fsmc2 (
  .busy_chn_code_x           (busy_chn_code[2]         ),
  .chn_etb_htfr_done         (ch2_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch2_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch2_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch2c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch2chgen                 ),
  .chnc_gbc_chnen            (ch2c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch2c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc2_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc2_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc2_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc2_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc2_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc2_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc2_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc2_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc2_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc2_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc2_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc2_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch2    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc2_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch2en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch2c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch2c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch2               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch2              ),
  .m_hwdata_chn              (m_hwdata_ch2             ),
  .m_hwrite_chn              (m_hwrite_ch2             ),
  .m_prot_chn                (m_prot_ch2               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch2_srcdtlgc   )
);
fsmc  x_fsmc3 (
  .busy_chn_code_x           (busy_chn_code[3]         ),
  .chn_etb_htfr_done         (ch3_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch3_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch3_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch3c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch3chgen                 ),
  .chnc_gbc_chnen            (ch3c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch3c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc3_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc3_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc3_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc3_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc3_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc3_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc3_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc3_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc3_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc3_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc3_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc3_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch3    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc3_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch3en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch3c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch3c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch3               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch3              ),
  .m_hwdata_chn              (m_hwdata_ch3             ),
  .m_hwrite_chn              (m_hwrite_ch3             ),
  .m_prot_chn                (m_prot_ch3               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch3_srcdtlgc   )
);
fsmc  x_fsmc4 (
  .busy_chn_code_x           (busy_chn_code[4]         ),
  .chn_etb_htfr_done         (ch4_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch4_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch4_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch4c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch4chgen                 ),
  .chnc_gbc_chnen            (ch4c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch4c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc4_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc4_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc4_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc4_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc4_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc4_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc4_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc4_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc4_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc4_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc4_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc4_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch4    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc4_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch4en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch4c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch4c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch4               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch4              ),
  .m_hwdata_chn              (m_hwdata_ch4             ),
  .m_hwrite_chn              (m_hwrite_ch4             ),
  .m_prot_chn                (m_prot_ch4               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch4_srcdtlgc   )
);
fsmc  x_fsmc5 (
  .busy_chn_code_x           (busy_chn_code[5]         ),
  .chn_etb_htfr_done         (ch5_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch5_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch5_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch5c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch5chgen                 ),
  .chnc_gbc_chnen            (ch5c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch5c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc5_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc5_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc5_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc5_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc5_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc5_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc5_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc5_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc5_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc5_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc5_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc5_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch5    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc5_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch5en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch5c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch5c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch5               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch5              ),
  .m_hwdata_chn              (m_hwdata_ch5             ),
  .m_hwrite_chn              (m_hwrite_ch5             ),
  .m_prot_chn                (m_prot_ch5               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch5_srcdtlgc   )
);
fsmc  x_fsmc6 (
  .busy_chn_code_x           (busy_chn_code[6]         ),
  .chn_etb_htfr_done         (ch6_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch6_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch6_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch6c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch6chgen                 ),
  .chnc_gbc_chnen            (ch6c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch6c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc6_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc6_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc6_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc6_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc6_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc6_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc6_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc6_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc6_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc6_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc6_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc6_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch6    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc6_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch6en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch6c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch6c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch6               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch6              ),
  .m_hwdata_chn              (m_hwdata_ch6             ),
  .m_hwrite_chn              (m_hwrite_ch6             ),
  .m_prot_chn                (m_prot_ch6               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch6_srcdtlgc   )
);
fsmc  x_fsmc7 (
  .busy_chn_code_x           (busy_chn_code[7]         ),
  .chn_etb_htfr_done         (ch7_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch7_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch7_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch7c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch7chgen                 ),
  .chnc_gbc_chnen            (ch7c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch7c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc7_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc7_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc7_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc7_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc7_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc7_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc7_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc7_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc7_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc7_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc7_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc7_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch7    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc7_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch7en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch7c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch7c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch7               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch7              ),
  .m_hwdata_chn              (m_hwdata_ch7             ),
  .m_hwrite_chn              (m_hwrite_ch7             ),
  .m_prot_chn                (m_prot_ch7               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch7_srcdtlgc   )
);
fsmc  x_fsmc8 (
  .busy_chn_code_x           (busy_chn_code[8]         ),
  .chn_etb_htfr_done         (ch8_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch8_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch8_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch8c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch8chgen                 ),
  .chnc_gbc_chnen            (ch8c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch8c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc8_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc8_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc8_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc8_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc8_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc8_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc8_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc8_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc8_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc8_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc8_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc8_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch8    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc8_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch8en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch8c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch8c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch8               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch8              ),
  .m_hwdata_chn              (m_hwdata_ch8             ),
  .m_hwrite_chn              (m_hwrite_ch8             ),
  .m_prot_chn                (m_prot_ch8               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch8_srcdtlgc   )
);
fsmc  x_fsmc9 (
  .busy_chn_code_x           (busy_chn_code[9]         ),
  .chn_etb_htfr_done         (ch9_etb_htfrdone         ),
  .chn_etb_tfr_done          (ch9_etb_tfrdone          ),
  .chn_etb_trgevt_done       (ch9_etb_evtdone          ),
  .chnc_gbc_chbsy            (ch9c_gbc_chbsy           ),
  .chnc_gbc_chnchgen         (ch9chgen                 ),
  .chnc_gbc_chnen            (ch9c_gbc_chnen           ),
  .chnc_gbc_trgclr           (ch9c_gbc_trgclr          ),
  .chregc_fsmc_block_tl      (chregc9_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc9_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc9_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc9_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc9_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc9_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc9_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc9_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc9_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc9_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc9_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc9_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch9    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc9_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch9en_clr      ),
  .gbc_chnc_dmacen           (gbc_chnc_dmacen          ),
  .gbc_chnc_hpreqvld         (gbc_ch9c_hpreqvld        ),
  .gbc_chnc_reqvld           (gbc_ch9c_reqvld          ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .m_addr_chn                (m_addr_ch9               ),
  .m_hrdata                  (m_hrdata                 ),
  .m_hready                  (hready                   ),
  .m_hresp                   (m_hresp                  ),
  .m_hsize_chn               (m_hsize_ch9              ),
  .m_hwdata_chn              (m_hwdata_ch9             ),
  .m_hwrite_chn              (m_hwrite_ch9             ),
  .m_prot_chn                (m_prot_ch9               ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch9_srcdtlgc   )
);
fsmc  x_fsmc10 (
  .busy_chn_code_x            (busy_chn_code[10]         ),
  .chn_etb_htfr_done          (ch10_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch10_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch10_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch10c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch10chgen                 ),
  .chnc_gbc_chnen             (ch10c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch10c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc10_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc10_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc10_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc10_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc10_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc10_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc10_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc10_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc10_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc10_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc10_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc10_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc10_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc10_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc10_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc10_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc10_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch10en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch10c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch10c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch10               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch10              ),
  .m_hwdata_chn               (m_hwdata_ch10             ),
  .m_hwrite_chn               (m_hwrite_ch10             ),
  .m_prot_chn                 (m_prot_ch10               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch10_srcdtlgc   )
);
fsmc  x_fsmc11 (
  .busy_chn_code_x            (busy_chn_code[11]         ),
  .chn_etb_htfr_done          (ch11_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch11_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch11_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch11c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch11chgen                 ),
  .chnc_gbc_chnen             (ch11c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch11c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc11_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc11_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc11_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc11_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc11_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc11_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc11_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc11_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc11_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc11_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc11_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc11_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc11_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc11_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc11_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc11_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc11_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch11en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch11c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch11c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch11               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch11              ),
  .m_hwdata_chn               (m_hwdata_ch11             ),
  .m_hwrite_chn               (m_hwrite_ch11             ),
  .m_prot_chn                 (m_prot_ch11               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch11_srcdtlgc   )
);
fsmc  x_fsmc12 (
  .busy_chn_code_x            (busy_chn_code[12]         ),
  .chn_etb_htfr_done          (ch12_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch12_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch12_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch12c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch12chgen                 ),
  .chnc_gbc_chnen             (ch12c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch12c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc12_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc12_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc12_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc12_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc12_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc12_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc12_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc12_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc12_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc12_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc12_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc12_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc12_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc12_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc12_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc12_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc12_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch12en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch12c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch12c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch12               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch12              ),
  .m_hwdata_chn               (m_hwdata_ch12             ),
  .m_hwrite_chn               (m_hwrite_ch12             ),
  .m_prot_chn                 (m_prot_ch12               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch12_srcdtlgc   )
);
fsmc  x_fsmc13 (
  .busy_chn_code_x            (busy_chn_code[13]         ),
  .chn_etb_htfr_done          (ch13_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch13_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch13_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch13c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch13chgen                 ),
  .chnc_gbc_chnen             (ch13c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch13c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc13_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc13_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc13_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc13_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc13_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc13_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc13_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc13_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc13_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc13_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc13_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc13_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc13_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc13_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc13_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc13_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc13_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch13en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch13c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch13c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch13               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch13              ),
  .m_hwdata_chn               (m_hwdata_ch13             ),
  .m_hwrite_chn               (m_hwrite_ch13             ),
  .m_prot_chn                 (m_prot_ch13               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch13_srcdtlgc   )
);
fsmc  x_fsmc14 (
  .busy_chn_code_x            (busy_chn_code[14]         ),
  .chn_etb_htfr_done          (ch14_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch14_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch14_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch14c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch14chgen                 ),
  .chnc_gbc_chnen             (ch14c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch14c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc14_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc14_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc14_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc14_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc14_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc14_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc14_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc14_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc14_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc14_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc14_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc14_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc14_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc14_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc14_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc14_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc14_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch14en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch14c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch14c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch14               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch14              ),
  .m_hwdata_chn               (m_hwdata_ch14             ),
  .m_hwrite_chn               (m_hwrite_ch14             ),
  .m_prot_chn                 (m_prot_ch14               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch14_srcdtlgc   )
);
fsmc  x_fsmc15 (
  .busy_chn_code_x            (busy_chn_code[15]         ),
  .chn_etb_htfr_done          (ch15_etb_htfrdone         ),
  .chn_etb_tfr_done           (ch15_etb_tfrdone          ),
  .chn_etb_trgevt_done        (ch15_etb_evtdone          ),
  .chnc_gbc_chbsy             (ch15c_gbc_chbsy           ),
  .chnc_gbc_chnchgen          (ch15chgen                 ),
  .chnc_gbc_chnen             (ch15c_gbc_chnen           ),
  .chnc_gbc_trgclr            (ch15c_gbc_trgclr          ),
  .chregc_fsmc_block_tl       (chregc15_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc15_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc15_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc15_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc15_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc15_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc15_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc15_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc15_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc15_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc15_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc15_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc15_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc15_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc15_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc15_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc15_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch15en_clr      ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .gbc_chnc_hpreqvld          (gbc_ch15c_hpreqvld        ),
  .gbc_chnc_reqvld            (gbc_ch15c_reqvld          ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_chn                 (m_addr_ch15               ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hready                   (hready                    ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_chn                (m_hsize_ch15              ),
  .m_hwdata_chn               (m_hwdata_ch15             ),
  .m_hwrite_chn               (m_hwrite_ch15             ),
  .m_prot_chn                 (m_prot_ch15               ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch15_srcdtlgc   )
);
endmodule
module chntrg_latch(
  chnc_gbc_chnen,
  chnc_gbc_sfwtrg,
  chnc_gbc_trgclr,
  chntrg_latch,
  etb_dmacchn_trg,
  hclk,
  hrst_n
);
input        chnc_gbc_chnen;  
input        chnc_gbc_sfwtrg; 
input        chnc_gbc_trgclr; 
input        etb_dmacchn_trg; 
input        hclk;            
input        hrst_n;          
output       chntrg_latch;    
reg          chntrg_latch;    
wire         chnc_gbc_chnen;  
wire         chnc_gbc_sfwtrg; 
wire         chnc_gbc_trgclr; 
wire         chntrg_latch_set; 
wire         etb_dmacchn_trg; 
wire         hclk;            
wire         hrst_n;          
assign    chntrg_latch_set = ( etb_dmacchn_trg | chnc_gbc_sfwtrg ) & chnc_gbc_chnen ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chntrg_latch <= 1'b0 ;
    end
    else if(~chnc_gbc_chnen)
        chntrg_latch <= 1'b0 ;
    else  if(chntrg_latch_set) 
        chntrg_latch <= 1'b1 ;
    else if(chnc_gbc_trgclr)
        chntrg_latch <= 1'b0 ;
end
endmodule
module chregc0(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc10(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h1E0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc11(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h210  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc12(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h240  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc13(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h270  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc14(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h2A0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc15(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h2D0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc1(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h30  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc2(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h60  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc3(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h90  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc4(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'hC0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc5(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'hF0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc6(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h120  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc7(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h150  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc8(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h180  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module chregc9(
  chn_prot_out,
  chnc_gbc_chnen,
  chnc_gbc_pdvld,
  chnc_gbc_sfwtrg,
  chnregc_gbc_chiif,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  hclk,
  hrst_n,
  regc_fsmc_chn_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           fsmc_chregc_err_vld;     
input           fsmc_chregc_htfr_vld;    
input           fsmc_chregc_pdvld;       
input           fsmc_chregc_tfr_vld;     
input           fsmc_chregc_trgetcmp_vld; 
input           fsmc_regc_chnen_clr;     
input           hclk;                    
input           hrst_n;                  
input   [31:0]  s_haddr;                 
input   [3 :0]  s_hprot;                 
input           s_hsel;                  
input   [1 :0]  s_htrans;                
input   [31:0]  s_hwdata;                
input           s_hwrite;                
output          chn_prot_out;            
output          chnc_gbc_chnen;          
output          chnc_gbc_pdvld;          
output          chnc_gbc_sfwtrg;         
output          chnregc_gbc_chiif;       
output  [11:0]  chregc_fsmc_block_tl;    
output  [2 :0]  chregc_fsmc_chintmdc;    
output  [31:0]  chregc_fsmc_darn;        
output          chregc_fsmc_dgrpaddrc;   
output  [1 :0]  chregc_fsmc_dinc;        
output  [1 :0]  chregc_fsmc_dst_tr_width; 
output          chregc_fsmc_endlan;      
output  [5 :0]  chregc_fsmc_group_len;   
output          chregc_fsmc_grpmc;       
output  [3 :0]  chregc_fsmc_protctl;     
output  [31:0]  chregc_fsmc_sarn;        
output          chregc_fsmc_sgrpaddrc;   
output  [1 :0]  chregc_fsmc_sinc;        
output  [1 :0]  chregc_fsmc_src_tr_width; 
output  [1 :0]  chregc_fsmc_trgtmdc;     
output          regc_fsmc_chn_srcdtlgc;  
output  [31:0]  s_hrdata_chn;            
reg     [11:0]  block_tl;                
reg     [2 :0]  chintmdc;                
reg             chn_ctrl_a_re;           
reg             chn_ctrl_a_we;           
reg             chn_ctrl_b_re;           
reg             chn_ctrl_b_we;           
reg             chn_en;                  
reg             chn_en_re;               
reg             chn_en_we;               
reg             chn_grplen_ext_re;       
reg             chn_grplen_ext_we;       
reg             chn_int_clear_we;        
reg             chn_int_mask_re;         
reg             chn_int_mask_we;         
reg             chn_int_status_re;       
reg             chn_soft_req_we;         
reg             clearerr;                
reg             clearhtfr;               
reg             clearpend;               
reg             cleartfr;                
reg             cleartrgetcmpfr;         
reg     [31:0]  darn;                    
reg             darn_re;                 
reg             darn_we;                 
reg             dgrpaddrc;               
reg     [1 :0]  dinc;                    
reg     [1 :0]  dst_tr_width;            
reg             endlan;                  
reg     [5 :0]  group_len;               
reg             grpmc;                   
reg             int_en;                  
reg             maskerr;                 
reg             maskhtfr;                
reg             maskpend;                
reg             masktfr;                 
reg             masktrgetcmpfr;          
reg     [3 :0]  protctl;                 
reg     [31:0]  sarn;                    
reg             sarn_re;                 
reg             sarn_we;                 
reg             sgrpaddrc;               
reg     [1 :0]  sinc;                    
reg             soft_req;                
reg     [1 :0]  src_tr_width;            
reg             srcdtlgc;                
reg             statuserr;               
reg             statushtfr;              
reg             statuspend;              
reg             statustfr;               
reg             statustrgetcmpfr;        
reg     [1 :0]  trgtmdc;                 
reg             we_prot;                 
wire            a_nonseq;                
wire            a_seq;                   
wire    [31:0]  chn_ctrl_a_r;            
wire            chn_ctrl_a_re_nxt;       
wire            chn_ctrl_a_we_nxt;       
wire    [31:0]  chn_ctrl_b_r;            
wire            chn_ctrl_b_re_nxt;       
wire            chn_ctrl_b_we_nxt;       
wire    [31:0]  chn_en_r;                
wire            chn_en_re_nxt;           
wire            chn_en_we_nxt;           
wire    [31:0]  chn_grplen_ext_r;        
wire            chn_grplen_ext_re_nxt;   
wire            chn_grplen_ext_we_nxt;   
wire            chn_int_clear_we_nxt;    
wire    [31:0]  chn_int_mask_r;          
wire            chn_int_mask_re_nxt;     
wire            chn_int_mask_we_nxt;     
wire    [31:0]  chn_int_status_r;        
wire            chn_int_status_re_nxt;   
wire            chn_prot_out;            
wire            chn_soft_req_we_nxt;     
wire            chnc_gbc_chnen;          
wire            chnc_gbc_pdvld;          
wire            chnc_gbc_sfwtrg;         
wire            chnregc_chie;            
wire            chnregc_gbc_chiif;       
wire    [11:0]  chregc_fsmc_block_tl;    
wire    [2 :0]  chregc_fsmc_chintmdc;    
wire    [31:0]  chregc_fsmc_darn;        
wire            chregc_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc_fsmc_dinc;        
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;      
wire    [5 :0]  chregc_fsmc_group_len;   
wire            chregc_fsmc_grpmc;       
wire    [3 :0]  chregc_fsmc_protctl;     
wire    [31:0]  chregc_fsmc_sarn;        
wire            chregc_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc_fsmc_sinc;        
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;     
wire    [31:0]  darn_r;                  
wire            darn_re_nxt;             
wire            darn_we_nxt;             
wire            fsmc_chregc_err_vld;     
wire            fsmc_chregc_htfr_vld;    
wire            fsmc_chregc_pdvld;       
wire            fsmc_chregc_tfr_vld;     
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;     
wire            hclk;                    
wire            hrst_n;                  
wire            proten_s;                
wire            reg_burst;               
wire            regc_fsmc_chn_srcdtlgc;  
wire    [31:0]  s_haddr;                 
wire    [3 :0]  s_hprot;                 
wire    [31:0]  s_hrdata_chn;            
wire            s_hsel;                  
wire    [1 :0]  s_htrans;                
wire    [31:0]  s_hwdata;                
wire            s_hwrite;                
wire    [31:0]  sarn_r;                  
wire            sarn_re_nxt;             
wire            sarn_we_nxt;             
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CHN_BAS_ADR      =   10'h1B0  ;
parameter     SARN_ADR                =   CHN_BAS_ADR + 10'h00  ; 
parameter     DARN_ADR                =   CHN_BAS_ADR + 10'h04  ; 
parameter     CHN_CTRL_A_ADR          =   CHN_BAS_ADR + 10'h08  ; 
parameter     CHN_CTRL_B_ADR          =   CHN_BAS_ADR + 10'h0C  ; 
parameter     CHN_INT_MASK_ADR        =   CHN_BAS_ADR + 10'h10  ; 
parameter     CHN_INT_STATUS_ADR      =   CHN_BAS_ADR + 10'h14  ; 
parameter     CHN_INT_CLEAR_ADR       =   CHN_BAS_ADR + 10'h18  ; 
parameter     CHN_SOFT_REQ_ADR        =   CHN_BAS_ADR + 10'h1C  ; 
parameter     CHN_EN_ADR              =   CHN_BAS_ADR + 10'h20  ; 
parameter     CHN_GRP_LEN_EXT         =   CHN_BAS_ADR + 10'h24  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ);
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign proten_s = 1'b1 ;
assign  sarn_we_nxt = (s_haddr[9:0] == SARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  sarn_re_nxt = (s_haddr[9:0] == SARN_ADR) & (~s_hwrite) & reg_burst  & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        sarn_we <= 1'b0 ;
        sarn_re <= 1'b0 ;
    end
    else    begin   
        sarn_we <= sarn_we_nxt ;
        sarn_re <= sarn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        sarn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(sarn_we)
            sarn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_sarn[31:0] = sarn[31:0] ;
assign   sarn_r[31:0]           = sarn[31:0] ;
assign  darn_we_nxt = (s_haddr[9:0] == DARN_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  darn_re_nxt = (s_haddr[9:0] == DARN_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn_we <= 1'b0 ;
        darn_re <= 1'b0 ;
    end
    else    begin
        darn_we <= darn_we_nxt ;
        darn_re <= darn_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        darn[31:0] <= 32'h0 ; 
    end
    else    begin  
        if(darn_we)
            darn[31:0] <= s_hwdata[31:0] ;
    end
end
assign   chregc_fsmc_darn[31:0] = darn[31:0] ;
assign   darn_r[31:0]           = darn[31:0] ;
assign  chn_ctrl_a_we_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_ctrl_a_re_nxt = (s_haddr[9:0] == CHN_CTRL_A_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_ctrl_a_we <= 1'b0 ;
        chn_ctrl_a_re <= 1'b0 ;
    end
    else    begin  
        chn_ctrl_a_we <= chn_ctrl_a_we_nxt ;
        chn_ctrl_a_re <= chn_ctrl_a_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        dgrpaddrc      <= 1'h0 ; 
        sgrpaddrc      <= 1'h0 ;
        grpmc          <= 1'h0 ;
        chintmdc[2:0]  <= 3'h0 ;
        block_tl[11:0] <= 12'h0 ;
        group_len[3:0] <= 4'h0  ;
        sinc[1:0]      <= 2'h0  ;
        dinc[1:0]      <= 2'h0  ;
        src_tr_width[1:0] <= 2'h0 ;
        dst_tr_width[1:0] <= 2'h0 ;
    end
    else    begin   
        if(chn_ctrl_a_we)    begin   
            dgrpaddrc      <= s_hwdata[31] ;
            sgrpaddrc      <= s_hwdata[29] ;
            grpmc          <= s_hwdata[28] ;
            chintmdc[2:0]  <= s_hwdata[26:24] ;
            block_tl[11:0] <= s_hwdata[23:12] ;
            group_len[3:0] <= s_hwdata[11:8]  ;
            sinc[1:0]      <= s_hwdata[7:6]   ;
            dinc[1:0]      <= s_hwdata[5:4]   ;
            src_tr_width[1:0] <= s_hwdata[3:2] ;
            dst_tr_width[1:0] <= s_hwdata[1:0] ;
        end
    end
end
assign   chregc_fsmc_dgrpaddrc         = dgrpaddrc ;
assign   chregc_fsmc_sgrpaddrc         = sgrpaddrc ;
assign   chregc_fsmc_grpmc             = grpmc ;
assign   chregc_fsmc_chintmdc[2:0]     = chintmdc[2:0] ;
assign   chregc_fsmc_block_tl[11:0]    =  block_tl[11:0] ;
assign   chregc_fsmc_group_len[5:0]    =  group_len[5:0]; 
assign   chregc_fsmc_sinc[1:0]         = sinc[1:0] ;
assign   chregc_fsmc_dinc[1:0]         = dinc[1:0] ;
assign   chregc_fsmc_src_tr_width[1:0] = src_tr_width[1:0] ;
assign   chregc_fsmc_dst_tr_width[1:0] = dst_tr_width[1:0] ;
assign   chn_ctrl_a_r[31:0]  =  {dgrpaddrc,1'h0,sgrpaddrc ,grpmc,1'b0,chintmdc[2:0],block_tl[11:0],group_len[3:0],
                                sinc[1:0] ,dinc[1:0] ,src_tr_width[1:0],dst_tr_width[1:0]} ;
assign  chn_grplen_ext_we_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & ( s_hwrite) & reg_burst & (~ chn_en) & proten_s ;
assign  chn_grplen_ext_re_nxt = (s_haddr[9:0] == CHN_GRP_LEN_EXT) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
        chn_grplen_ext_we <= 1'b0 ;
        chn_grplen_ext_re <= 1'b0 ;
    end
    else    begin  
        chn_grplen_ext_we <= chn_grplen_ext_we_nxt;
        chn_grplen_ext_re <= chn_grplen_ext_re_nxt;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        group_len[5:4] <= 2'h0  ;
    end
    else    begin   
        if(chn_grplen_ext_we)    begin   
            group_len[5:4] <= s_hwdata[1:0]  ;
        end
    end
end
assign   chn_grplen_ext_r[31:0]  =  {30'h0,group_len[5:4]};
assign  chn_ctrl_b_we_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & ( s_hwrite) & reg_burst & (~chn_en) & proten_s;
assign  chn_ctrl_b_re_nxt = (s_haddr[9:0] == CHN_CTRL_B_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_ctrl_b_we <= 1'b0 ;
        chn_ctrl_b_re <= 1'b0 ;
        we_prot       <= 1'b1 ; 
    end
    else    begin   
        chn_ctrl_b_we <= chn_ctrl_b_we_nxt ;
        chn_ctrl_b_re <= chn_ctrl_b_re_nxt ;
        we_prot       <= 1'b1        ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        protctl[3:0]   <= 4'h0 ; 
    end
    else    begin
        if( chn_ctrl_b_we & we_prot )    begin
            protctl[3:0]  <= s_hwdata[18:15]  ;
        end
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        endlan         <= 1'h0 ;
        trgtmdc[1:0]   <= 2'h0 ;
        int_en         <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            endlan        <= s_hwdata[14]     ;
            trgtmdc[1:0]  <= s_hwdata[2:1]    ;
            int_en        <= s_hwdata[0]      ;
        end
    end
end
assign   chregc_fsmc_protctl[3:0]    = protctl[3:0] ; 
assign   chregc_fsmc_endlan          = endlan       ;
assign   chregc_fsmc_trgtmdc[1:0]    = trgtmdc[1:0] ;
assign   chnregc_chie            = int_en       ;
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin
        srcdtlgc <= 1'h0 ;
    end
    else    begin
        if(chn_ctrl_b_we)    begin
            srcdtlgc <= s_hwdata[13]      ;
        end
    end
end
assign   regc_fsmc_chn_srcdtlgc      = srcdtlgc     ;
assign   chn_ctrl_b_r[31:0]  =  { 13'h0 , protctl[3:0] , endlan , srcdtlgc ,10'h0 , trgtmdc[1:0] , int_en } ;
assign   chn_prot_out = protctl[2];
assign  chn_int_mask_we_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_int_mask_re_nxt = (s_haddr[9:0] == CHN_INT_MASK_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin  
        chn_int_mask_re <= 1'b0 ;
        chn_int_mask_we <= 1'b0 ;
    end
    else    begin  
        chn_int_mask_re <= chn_int_mask_re_nxt ;
        chn_int_mask_we <= chn_int_mask_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         maskpend        <= 1'h0 ; 
         masktrgetcmpfr  <= 1'h0 ; 
         maskhtfr        <= 1'h0 ;
         masktfr         <= 1'h0 ;
         maskerr         <= 1'h0 ;
    end
    else    begin  
        if(chn_int_mask_we)    begin  
             maskpend        <= s_hwdata[4]  ;
             masktrgetcmpfr  <= s_hwdata[3]  ;
             maskhtfr        <= s_hwdata[2]  ;
             masktfr         <= s_hwdata[1]  ;
             maskerr         <= s_hwdata[0]  ;
         end
    end
end
assign   chn_int_mask_r = {27'h0,maskpend , masktrgetcmpfr , maskhtfr  , masktfr , maskerr } ;
assign  chn_int_status_re_nxt = (s_haddr[9:0] == CHN_INT_STATUS_ADR) & (~s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_int_status_re <= 1'b0 ;
    end
    else    begin  
        chn_int_status_re <= chn_int_status_re_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statustrgetcmpfr  <= 1'h0 ; 
    end
    else    begin
        if(fsmc_chregc_trgetcmp_vld)
             statustrgetcmpfr  <= 1'b1 ;   
        else    if(cleartrgetcmpfr )
             statustrgetcmpfr  <= 1'b0 ; 
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statushtfr        <= 1'h0 ;
    end
    else    begin   
        if(fsmc_chregc_htfr_vld)
             statushtfr        <= 1'b1  ;   
        else   if(clearhtfr)
             statushtfr        <= 1'b0  ;      
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         statustfr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_tfr_vld)
             statustfr         <= 1'b1  ;         
         else   if( cleartfr )
             statustfr         <= 1'b0  ;         
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuserr         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_err_vld)
             statuserr         <= 1'b1  ;  
        else   if ( clearerr )
             statuserr         <= 1'b0  ;  
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin  
    if(~hrst_n)     begin  
         statuspend         <= 1'h0 ;
    end
    else    begin  
        if(fsmc_chregc_pdvld)
             statuspend         <= 1'b1  ;  
        else   if ( clearpend )
             statuspend         <= 1'b0  ;  
    end
end
assign   chnc_gbc_pdvld = statuspend ;
assign   chn_int_status_r = {28'h0, statustrgetcmpfr , statushtfr  , statustfr , statuserr } ;
assign   chnregc_gbc_chiif = ( (statustrgetcmpfr & masktrgetcmpfr) | (statushtfr & maskhtfr) |  
                               (statustfr & masktfr) | (statuserr & maskerr) | (statuspend & maskpend )  ) & chnregc_chie ; 
assign  chn_int_clear_we_nxt = (s_haddr[9:0] == CHN_INT_CLEAR_ADR) & ( s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
        chn_int_clear_we <= 1'b0 ;
    end
    else    begin
        chn_int_clear_we <= chn_int_clear_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         cleartrgetcmpfr  <= 1'h0 ; 
         clearhtfr        <= 1'h0 ;
         cleartfr         <= 1'h0 ;
         clearerr         <= 1'h0 ;
         clearpend        <= 1'h0 ;
    end
    else    begin
        if(chn_int_clear_we)    begin
             clearpend        <= s_hwdata[4]  ;
             cleartrgetcmpfr  <= s_hwdata[3]  ;
             clearhtfr        <= s_hwdata[2]  ;
             cleartfr         <= s_hwdata[1]  ;
             clearerr         <= s_hwdata[0]  ;
         end
          else    begin
             clearpend        <= 1'b0  ;
             cleartrgetcmpfr  <= 1'b0  ;
             clearhtfr        <= 1'b0  ;
             cleartfr         <= 1'b0  ;
             clearerr         <= 1'b0  ;
          end
    end
end
assign  chn_soft_req_we_nxt = (s_haddr[9:0] == CHN_SOFT_REQ_ADR) & ( s_hwrite) & reg_burst & proten_s ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
        chn_soft_req_we <= 1'b0 ;
    end
    else    begin
        chn_soft_req_we <= chn_soft_req_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin
         soft_req <= 1'b0 ;
     end
     else   begin
         soft_req <= chn_soft_req_we & s_hwdata[0] ;
     end
end
assign    chnc_gbc_sfwtrg = soft_req ;
assign  chn_en_we_nxt = (s_haddr[9:0] == CHN_EN_ADR) & ( s_hwrite) & reg_burst & proten_s ;
assign  chn_en_re_nxt = (s_haddr[9:0] == CHN_EN_ADR) & (~s_hwrite) & reg_burst  & proten_s;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin
        chn_en_re <= 1'b0 ;
        chn_en_we <= 1'b0 ;
    end
    else    begin
        chn_en_re <= chn_en_re_nxt ;
        chn_en_we <= chn_en_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chn_en <= 1'b0 ;
     end
     else   begin
         if(chn_en_we)
              chn_en <= s_hwdata[0] ;
         else if(fsmc_regc_chnen_clr)
              chn_en <= 1'b0 ;
     end
end
assign    chn_en_r = {31'h0,chn_en} ;
assign    chnc_gbc_chnen = chn_en   ;
assign   s_hrdata_chn[31:0]  = sarn_re           ?     sarn_r[31:0]             :    
                               darn_re           ?     darn_r[31:0]             :    
                               chn_ctrl_a_re     ?     chn_ctrl_a_r[31:0]       :    
                               chn_grplen_ext_re ?     chn_grplen_ext_r[31:0]   :  
                               chn_ctrl_b_re     ?     chn_ctrl_b_r[31:0]       :    
                               chn_int_mask_re   ?     chn_int_mask_r[31:0]    :    
                               chn_int_status_re ?     chn_int_status_r[31:0]  :    
                               chn_en_re         ?     chn_en_r[31:0]           :   32'h0 ;       
endmodule
module dmac_top(
  ch0_etb_evtdone,
  ch0_etb_htfrdone,
  ch0_etb_tfrdone,
  ch0_prot_out,
  ch10_etb_evtdone,
  ch10_etb_htfrdone,
  ch10_etb_tfrdone,
  ch10_prot_out,
  ch11_etb_evtdone,
  ch11_etb_htfrdone,
  ch11_etb_tfrdone,
  ch11_prot_out,
  ch12_etb_evtdone,
  ch12_etb_htfrdone,
  ch12_etb_tfrdone,
  ch12_prot_out,
  ch13_etb_evtdone,
  ch13_etb_htfrdone,
  ch13_etb_tfrdone,
  ch13_prot_out,
  ch14_etb_evtdone,
  ch14_etb_htfrdone,
  ch14_etb_tfrdone,
  ch14_prot_out,
  ch15_etb_evtdone,
  ch15_etb_htfrdone,
  ch15_etb_tfrdone,
  ch15_prot_out,
  ch1_etb_evtdone,
  ch1_etb_htfrdone,
  ch1_etb_tfrdone,
  ch1_prot_out,
  ch2_etb_evtdone,
  ch2_etb_htfrdone,
  ch2_etb_tfrdone,
  ch2_prot_out,
  ch3_etb_evtdone,
  ch3_etb_htfrdone,
  ch3_etb_tfrdone,
  ch3_prot_out,
  ch4_etb_evtdone,
  ch4_etb_htfrdone,
  ch4_etb_tfrdone,
  ch4_prot_out,
  ch5_etb_evtdone,
  ch5_etb_htfrdone,
  ch5_etb_tfrdone,
  ch5_prot_out,
  ch6_etb_evtdone,
  ch6_etb_htfrdone,
  ch6_etb_tfrdone,
  ch6_prot_out,
  ch7_etb_evtdone,
  ch7_etb_htfrdone,
  ch7_etb_tfrdone,
  ch7_prot_out,
  ch8_etb_evtdone,
  ch8_etb_htfrdone,
  ch8_etb_tfrdone,
  ch8_prot_out,
  ch9_etb_evtdone,
  ch9_etb_htfrdone,
  ch9_etb_tfrdone,
  ch9_prot_out,
  dmac_vic_if,
  etb_dmacch0_trg,
  etb_dmacch10_trg,
  etb_dmacch11_trg,
  etb_dmacch12_trg,
  etb_dmacch13_trg,
  etb_dmacch14_trg,
  etb_dmacch15_trg,
  etb_dmacch1_trg,
  etb_dmacch2_trg,
  etb_dmacch3_trg,
  etb_dmacch4_trg,
  etb_dmacch5_trg,
  etb_dmacch6_trg,
  etb_dmacch7_trg,
  etb_dmacch8_trg,
  etb_dmacch9_trg,
  hclk,
  hrst_n,
  m_haddr,
  m_hburst,
  m_hbusreq,
  m_hgrant,
  m_hlock,
  m_hprot,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hsize,
  m_htrans,
  m_hwdata,
  m_hwrite,
  s_haddr,
  s_hprot,
  s_hrdata,
  s_hready,
  s_hresp,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           etb_dmacch0_trg;           
input           etb_dmacch10_trg;          
input           etb_dmacch11_trg;          
input           etb_dmacch12_trg;          
input           etb_dmacch13_trg;          
input           etb_dmacch14_trg;          
input           etb_dmacch15_trg;          
input           etb_dmacch1_trg;           
input           etb_dmacch2_trg;           
input           etb_dmacch3_trg;           
input           etb_dmacch4_trg;           
input           etb_dmacch5_trg;           
input           etb_dmacch6_trg;           
input           etb_dmacch7_trg;           
input           etb_dmacch8_trg;           
input           etb_dmacch9_trg;           
input           hclk;                      
input           hrst_n;                    
input           m_hgrant;                  
input   [31:0]  m_hrdata;                  
input           m_hready;                  
input   [1 :0]  m_hresp;                   
input   [31:0]  s_haddr;                   
input   [3 :0]  s_hprot;                   
input           s_hsel;                    
input   [1 :0]  s_htrans;                  
input   [31:0]  s_hwdata;                  
input           s_hwrite;                  
output          ch0_etb_evtdone;           
output          ch0_etb_htfrdone;          
output          ch0_etb_tfrdone;           
output          ch0_prot_out;              
output          ch10_etb_evtdone;          
output          ch10_etb_htfrdone;         
output          ch10_etb_tfrdone;          
output          ch10_prot_out;             
output          ch11_etb_evtdone;          
output          ch11_etb_htfrdone;         
output          ch11_etb_tfrdone;          
output          ch11_prot_out;             
output          ch12_etb_evtdone;          
output          ch12_etb_htfrdone;         
output          ch12_etb_tfrdone;          
output          ch12_prot_out;             
output          ch13_etb_evtdone;          
output          ch13_etb_htfrdone;         
output          ch13_etb_tfrdone;          
output          ch13_prot_out;             
output          ch14_etb_evtdone;          
output          ch14_etb_htfrdone;         
output          ch14_etb_tfrdone;          
output          ch14_prot_out;             
output          ch15_etb_evtdone;          
output          ch15_etb_htfrdone;         
output          ch15_etb_tfrdone;          
output          ch15_prot_out;             
output          ch1_etb_evtdone;           
output          ch1_etb_htfrdone;          
output          ch1_etb_tfrdone;           
output          ch1_prot_out;              
output          ch2_etb_evtdone;           
output          ch2_etb_htfrdone;          
output          ch2_etb_tfrdone;           
output          ch2_prot_out;              
output          ch3_etb_evtdone;           
output          ch3_etb_htfrdone;          
output          ch3_etb_tfrdone;           
output          ch3_prot_out;              
output          ch4_etb_evtdone;           
output          ch4_etb_htfrdone;          
output          ch4_etb_tfrdone;           
output          ch4_prot_out;              
output          ch5_etb_evtdone;           
output          ch5_etb_htfrdone;          
output          ch5_etb_tfrdone;           
output          ch5_prot_out;              
output          ch6_etb_evtdone;           
output          ch6_etb_htfrdone;          
output          ch6_etb_tfrdone;           
output          ch6_prot_out;              
output          ch7_etb_evtdone;           
output          ch7_etb_htfrdone;          
output          ch7_etb_tfrdone;           
output          ch7_prot_out;              
output          ch8_etb_evtdone;           
output          ch8_etb_htfrdone;          
output          ch8_etb_tfrdone;           
output          ch8_prot_out;              
output          ch9_etb_evtdone;           
output          ch9_etb_htfrdone;          
output          ch9_etb_tfrdone;           
output          ch9_prot_out;              
output          dmac_vic_if;               
output  [31:0]  m_haddr;                   
output  [2 :0]  m_hburst;                  
output          m_hbusreq;                 
output          m_hlock;                   
output  [3 :0]  m_hprot;                   
output  [2 :0]  m_hsize;                   
output  [1 :0]  m_htrans;                  
output  [31:0]  m_hwdata;                  
output          m_hwrite;                  
output  [31:0]  s_hrdata;                  
output          s_hready;                  
output  [1 :0]  s_hresp;                   
wire            arb_bmux_transvld;         
wire            arb_bmux_trgvld;           
wire    [15:0]  busy_chn_code;             
wire            ch0_etb_evtdone;           
wire            ch0_etb_htfrdone;          
wire            ch0_etb_tfrdone;           
wire            ch0_prot_out;              
wire            ch0c_gbc_chbsy;            
wire            ch0c_gbc_chnen;            
wire            ch0c_gbc_sfwtrg;           
wire            ch0c_gbc_trgclr;           
wire            ch0chgen;                  
wire            ch10_etb_evtdone;          
wire            ch10_etb_htfrdone;         
wire            ch10_etb_tfrdone;          
wire            ch10_prot_out;             
wire            ch10c_gbc_chbsy;           
wire            ch10c_gbc_chnen;           
wire            ch10c_gbc_sfwtrg;          
wire            ch10c_gbc_trgclr;          
wire            ch10chgen;                 
wire            ch11_etb_evtdone;          
wire            ch11_etb_htfrdone;         
wire            ch11_etb_tfrdone;          
wire            ch11_prot_out;             
wire            ch11c_gbc_chbsy;           
wire            ch11c_gbc_chnen;           
wire            ch11c_gbc_sfwtrg;          
wire            ch11c_gbc_trgclr;          
wire            ch11chgen;                 
wire            ch12_etb_evtdone;          
wire            ch12_etb_htfrdone;         
wire            ch12_etb_tfrdone;          
wire            ch12_prot_out;             
wire            ch12c_gbc_chbsy;           
wire            ch12c_gbc_chnen;           
wire            ch12c_gbc_sfwtrg;          
wire            ch12c_gbc_trgclr;          
wire            ch12chgen;                 
wire            ch13_etb_evtdone;          
wire            ch13_etb_htfrdone;         
wire            ch13_etb_tfrdone;          
wire            ch13_prot_out;             
wire            ch13c_gbc_chbsy;           
wire            ch13c_gbc_chnen;           
wire            ch13c_gbc_sfwtrg;          
wire            ch13c_gbc_trgclr;          
wire            ch13chgen;                 
wire            ch14_etb_evtdone;          
wire            ch14_etb_htfrdone;         
wire            ch14_etb_tfrdone;          
wire            ch14_prot_out;             
wire            ch14c_gbc_chbsy;           
wire            ch14c_gbc_chnen;           
wire            ch14c_gbc_sfwtrg;          
wire            ch14c_gbc_trgclr;          
wire            ch14chgen;                 
wire            ch15_etb_evtdone;          
wire            ch15_etb_htfrdone;         
wire            ch15_etb_tfrdone;          
wire            ch15_prot_out;             
wire            ch15c_gbc_chbsy;           
wire            ch15c_gbc_chnen;           
wire            ch15c_gbc_sfwtrg;          
wire            ch15c_gbc_trgclr;          
wire            ch15chgen;                 
wire            ch1_etb_evtdone;           
wire            ch1_etb_htfrdone;          
wire            ch1_etb_tfrdone;           
wire            ch1_prot_out;              
wire            ch1c_gbc_chbsy;            
wire            ch1c_gbc_chnen;            
wire            ch1c_gbc_sfwtrg;           
wire            ch1c_gbc_trgclr;           
wire            ch1chgen;                  
wire            ch2_etb_evtdone;           
wire            ch2_etb_htfrdone;          
wire            ch2_etb_tfrdone;           
wire            ch2_prot_out;              
wire            ch2c_gbc_chbsy;            
wire            ch2c_gbc_chnen;            
wire            ch2c_gbc_sfwtrg;           
wire            ch2c_gbc_trgclr;           
wire            ch2chgen;                  
wire            ch3_etb_evtdone;           
wire            ch3_etb_htfrdone;          
wire            ch3_etb_tfrdone;           
wire            ch3_prot_out;              
wire            ch3c_gbc_chbsy;            
wire            ch3c_gbc_chnen;            
wire            ch3c_gbc_sfwtrg;           
wire            ch3c_gbc_trgclr;           
wire            ch3chgen;                  
wire            ch4_etb_evtdone;           
wire            ch4_etb_htfrdone;          
wire            ch4_etb_tfrdone;           
wire            ch4_prot_out;              
wire            ch4c_gbc_chbsy;            
wire            ch4c_gbc_chnen;            
wire            ch4c_gbc_sfwtrg;           
wire            ch4c_gbc_trgclr;           
wire            ch4chgen;                  
wire            ch5_etb_evtdone;           
wire            ch5_etb_htfrdone;          
wire            ch5_etb_tfrdone;           
wire            ch5_prot_out;              
wire            ch5c_gbc_chbsy;            
wire            ch5c_gbc_chnen;            
wire            ch5c_gbc_sfwtrg;           
wire            ch5c_gbc_trgclr;           
wire            ch5chgen;                  
wire            ch6_etb_evtdone;           
wire            ch6_etb_htfrdone;          
wire            ch6_etb_tfrdone;           
wire            ch6_prot_out;              
wire            ch6c_gbc_chbsy;            
wire            ch6c_gbc_chnen;            
wire            ch6c_gbc_sfwtrg;           
wire            ch6c_gbc_trgclr;           
wire            ch6chgen;                  
wire            ch7_etb_evtdone;           
wire            ch7_etb_htfrdone;          
wire            ch7_etb_tfrdone;           
wire            ch7_prot_out;              
wire            ch7c_gbc_chbsy;            
wire            ch7c_gbc_chnen;            
wire            ch7c_gbc_sfwtrg;           
wire            ch7c_gbc_trgclr;           
wire            ch7chgen;                  
wire            ch8_etb_evtdone;           
wire            ch8_etb_htfrdone;          
wire            ch8_etb_tfrdone;           
wire            ch8_prot_out;              
wire            ch8c_gbc_chbsy;            
wire            ch8c_gbc_chnen;            
wire            ch8c_gbc_sfwtrg;           
wire            ch8c_gbc_trgclr;           
wire            ch8chgen;                  
wire            ch9_etb_evtdone;           
wire            ch9_etb_htfrdone;          
wire            ch9_etb_tfrdone;           
wire            ch9_prot_out;              
wire            ch9c_gbc_chbsy;            
wire            ch9c_gbc_chnen;            
wire            ch9c_gbc_sfwtrg;           
wire            ch9c_gbc_trgclr;           
wire            ch9chgen;                  
wire    [11:0]  chregc0_fsmc_block_tl;     
wire    [2 :0]  chregc0_fsmc_chintmdc;     
wire    [31:0]  chregc0_fsmc_darn;         
wire            chregc0_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_dinc;         
wire    [1 :0]  chregc0_fsmc_dst_tr_width; 
wire            chregc0_fsmc_endlan;       
wire    [5 :0]  chregc0_fsmc_group_len;    
wire            chregc0_fsmc_grpmc;        
wire    [3 :0]  chregc0_fsmc_protctl;      
wire    [31:0]  chregc0_fsmc_sarn;         
wire            chregc0_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_sinc;         
wire    [1 :0]  chregc0_fsmc_src_tr_width; 
wire    [1 :0]  chregc0_fsmc_trgtmdc;      
wire    [11:0]  chregc10_fsmc_block_tl;    
wire    [2 :0]  chregc10_fsmc_chintmdc;    
wire    [31:0]  chregc10_fsmc_darn;        
wire            chregc10_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_dinc;        
wire    [1 :0]  chregc10_fsmc_dst_tr_width; 
wire            chregc10_fsmc_endlan;      
wire    [5 :0]  chregc10_fsmc_group_len;   
wire            chregc10_fsmc_grpmc;       
wire    [3 :0]  chregc10_fsmc_protctl;     
wire    [31:0]  chregc10_fsmc_sarn;        
wire            chregc10_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_sinc;        
wire    [1 :0]  chregc10_fsmc_src_tr_width; 
wire    [1 :0]  chregc10_fsmc_trgtmdc;     
wire    [11:0]  chregc11_fsmc_block_tl;    
wire    [2 :0]  chregc11_fsmc_chintmdc;    
wire    [31:0]  chregc11_fsmc_darn;        
wire            chregc11_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_dinc;        
wire    [1 :0]  chregc11_fsmc_dst_tr_width; 
wire            chregc11_fsmc_endlan;      
wire    [5 :0]  chregc11_fsmc_group_len;   
wire            chregc11_fsmc_grpmc;       
wire    [3 :0]  chregc11_fsmc_protctl;     
wire    [31:0]  chregc11_fsmc_sarn;        
wire            chregc11_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_sinc;        
wire    [1 :0]  chregc11_fsmc_src_tr_width; 
wire    [1 :0]  chregc11_fsmc_trgtmdc;     
wire    [11:0]  chregc12_fsmc_block_tl;    
wire    [2 :0]  chregc12_fsmc_chintmdc;    
wire    [31:0]  chregc12_fsmc_darn;        
wire            chregc12_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_dinc;        
wire    [1 :0]  chregc12_fsmc_dst_tr_width; 
wire            chregc12_fsmc_endlan;      
wire    [5 :0]  chregc12_fsmc_group_len;   
wire            chregc12_fsmc_grpmc;       
wire    [3 :0]  chregc12_fsmc_protctl;     
wire    [31:0]  chregc12_fsmc_sarn;        
wire            chregc12_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_sinc;        
wire    [1 :0]  chregc12_fsmc_src_tr_width; 
wire    [1 :0]  chregc12_fsmc_trgtmdc;     
wire    [11:0]  chregc13_fsmc_block_tl;    
wire    [2 :0]  chregc13_fsmc_chintmdc;    
wire    [31:0]  chregc13_fsmc_darn;        
wire            chregc13_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_dinc;        
wire    [1 :0]  chregc13_fsmc_dst_tr_width; 
wire            chregc13_fsmc_endlan;      
wire    [5 :0]  chregc13_fsmc_group_len;   
wire            chregc13_fsmc_grpmc;       
wire    [3 :0]  chregc13_fsmc_protctl;     
wire    [31:0]  chregc13_fsmc_sarn;        
wire            chregc13_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_sinc;        
wire    [1 :0]  chregc13_fsmc_src_tr_width; 
wire    [1 :0]  chregc13_fsmc_trgtmdc;     
wire    [11:0]  chregc14_fsmc_block_tl;    
wire    [2 :0]  chregc14_fsmc_chintmdc;    
wire    [31:0]  chregc14_fsmc_darn;        
wire            chregc14_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_dinc;        
wire    [1 :0]  chregc14_fsmc_dst_tr_width; 
wire            chregc14_fsmc_endlan;      
wire    [5 :0]  chregc14_fsmc_group_len;   
wire            chregc14_fsmc_grpmc;       
wire    [3 :0]  chregc14_fsmc_protctl;     
wire    [31:0]  chregc14_fsmc_sarn;        
wire            chregc14_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_sinc;        
wire    [1 :0]  chregc14_fsmc_src_tr_width; 
wire    [1 :0]  chregc14_fsmc_trgtmdc;     
wire    [11:0]  chregc15_fsmc_block_tl;    
wire    [2 :0]  chregc15_fsmc_chintmdc;    
wire    [31:0]  chregc15_fsmc_darn;        
wire            chregc15_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_dinc;        
wire    [1 :0]  chregc15_fsmc_dst_tr_width; 
wire            chregc15_fsmc_endlan;      
wire    [5 :0]  chregc15_fsmc_group_len;   
wire            chregc15_fsmc_grpmc;       
wire    [3 :0]  chregc15_fsmc_protctl;     
wire    [31:0]  chregc15_fsmc_sarn;        
wire            chregc15_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_sinc;        
wire    [1 :0]  chregc15_fsmc_src_tr_width; 
wire    [1 :0]  chregc15_fsmc_trgtmdc;     
wire    [11:0]  chregc1_fsmc_block_tl;     
wire    [2 :0]  chregc1_fsmc_chintmdc;     
wire    [31:0]  chregc1_fsmc_darn;         
wire            chregc1_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_dinc;         
wire    [1 :0]  chregc1_fsmc_dst_tr_width; 
wire            chregc1_fsmc_endlan;       
wire    [5 :0]  chregc1_fsmc_group_len;    
wire            chregc1_fsmc_grpmc;        
wire    [3 :0]  chregc1_fsmc_protctl;      
wire    [31:0]  chregc1_fsmc_sarn;         
wire            chregc1_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_sinc;         
wire    [1 :0]  chregc1_fsmc_src_tr_width; 
wire    [1 :0]  chregc1_fsmc_trgtmdc;      
wire    [11:0]  chregc2_fsmc_block_tl;     
wire    [2 :0]  chregc2_fsmc_chintmdc;     
wire    [31:0]  chregc2_fsmc_darn;         
wire            chregc2_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_dinc;         
wire    [1 :0]  chregc2_fsmc_dst_tr_width; 
wire            chregc2_fsmc_endlan;       
wire    [5 :0]  chregc2_fsmc_group_len;    
wire            chregc2_fsmc_grpmc;        
wire    [3 :0]  chregc2_fsmc_protctl;      
wire    [31:0]  chregc2_fsmc_sarn;         
wire            chregc2_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_sinc;         
wire    [1 :0]  chregc2_fsmc_src_tr_width; 
wire    [1 :0]  chregc2_fsmc_trgtmdc;      
wire    [11:0]  chregc3_fsmc_block_tl;     
wire    [2 :0]  chregc3_fsmc_chintmdc;     
wire    [31:0]  chregc3_fsmc_darn;         
wire            chregc3_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_dinc;         
wire    [1 :0]  chregc3_fsmc_dst_tr_width; 
wire            chregc3_fsmc_endlan;       
wire    [5 :0]  chregc3_fsmc_group_len;    
wire            chregc3_fsmc_grpmc;        
wire    [3 :0]  chregc3_fsmc_protctl;      
wire    [31:0]  chregc3_fsmc_sarn;         
wire            chregc3_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_sinc;         
wire    [1 :0]  chregc3_fsmc_src_tr_width; 
wire    [1 :0]  chregc3_fsmc_trgtmdc;      
wire    [11:0]  chregc4_fsmc_block_tl;     
wire    [2 :0]  chregc4_fsmc_chintmdc;     
wire    [31:0]  chregc4_fsmc_darn;         
wire            chregc4_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_dinc;         
wire    [1 :0]  chregc4_fsmc_dst_tr_width; 
wire            chregc4_fsmc_endlan;       
wire    [5 :0]  chregc4_fsmc_group_len;    
wire            chregc4_fsmc_grpmc;        
wire    [3 :0]  chregc4_fsmc_protctl;      
wire    [31:0]  chregc4_fsmc_sarn;         
wire            chregc4_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_sinc;         
wire    [1 :0]  chregc4_fsmc_src_tr_width; 
wire    [1 :0]  chregc4_fsmc_trgtmdc;      
wire    [11:0]  chregc5_fsmc_block_tl;     
wire    [2 :0]  chregc5_fsmc_chintmdc;     
wire    [31:0]  chregc5_fsmc_darn;         
wire            chregc5_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_dinc;         
wire    [1 :0]  chregc5_fsmc_dst_tr_width; 
wire            chregc5_fsmc_endlan;       
wire    [5 :0]  chregc5_fsmc_group_len;    
wire            chregc5_fsmc_grpmc;        
wire    [3 :0]  chregc5_fsmc_protctl;      
wire    [31:0]  chregc5_fsmc_sarn;         
wire            chregc5_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_sinc;         
wire    [1 :0]  chregc5_fsmc_src_tr_width; 
wire    [1 :0]  chregc5_fsmc_trgtmdc;      
wire    [11:0]  chregc6_fsmc_block_tl;     
wire    [2 :0]  chregc6_fsmc_chintmdc;     
wire    [31:0]  chregc6_fsmc_darn;         
wire            chregc6_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_dinc;         
wire    [1 :0]  chregc6_fsmc_dst_tr_width; 
wire            chregc6_fsmc_endlan;       
wire    [5 :0]  chregc6_fsmc_group_len;    
wire            chregc6_fsmc_grpmc;        
wire    [3 :0]  chregc6_fsmc_protctl;      
wire    [31:0]  chregc6_fsmc_sarn;         
wire            chregc6_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_sinc;         
wire    [1 :0]  chregc6_fsmc_src_tr_width; 
wire    [1 :0]  chregc6_fsmc_trgtmdc;      
wire    [11:0]  chregc7_fsmc_block_tl;     
wire    [2 :0]  chregc7_fsmc_chintmdc;     
wire    [31:0]  chregc7_fsmc_darn;         
wire            chregc7_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_dinc;         
wire    [1 :0]  chregc7_fsmc_dst_tr_width; 
wire            chregc7_fsmc_endlan;       
wire    [5 :0]  chregc7_fsmc_group_len;    
wire            chregc7_fsmc_grpmc;        
wire    [3 :0]  chregc7_fsmc_protctl;      
wire    [31:0]  chregc7_fsmc_sarn;         
wire            chregc7_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_sinc;         
wire    [1 :0]  chregc7_fsmc_src_tr_width; 
wire    [1 :0]  chregc7_fsmc_trgtmdc;      
wire    [11:0]  chregc8_fsmc_block_tl;     
wire    [2 :0]  chregc8_fsmc_chintmdc;     
wire    [31:0]  chregc8_fsmc_darn;         
wire            chregc8_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_dinc;         
wire    [1 :0]  chregc8_fsmc_dst_tr_width; 
wire            chregc8_fsmc_endlan;       
wire    [5 :0]  chregc8_fsmc_group_len;    
wire            chregc8_fsmc_grpmc;        
wire    [3 :0]  chregc8_fsmc_protctl;      
wire    [31:0]  chregc8_fsmc_sarn;         
wire            chregc8_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_sinc;         
wire    [1 :0]  chregc8_fsmc_src_tr_width; 
wire    [1 :0]  chregc8_fsmc_trgtmdc;      
wire    [11:0]  chregc9_fsmc_block_tl;     
wire    [2 :0]  chregc9_fsmc_chintmdc;     
wire    [31:0]  chregc9_fsmc_darn;         
wire            chregc9_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_dinc;         
wire    [1 :0]  chregc9_fsmc_dst_tr_width; 
wire            chregc9_fsmc_endlan;       
wire    [5 :0]  chregc9_fsmc_group_len;    
wire            chregc9_fsmc_grpmc;        
wire    [3 :0]  chregc9_fsmc_protctl;      
wire    [31:0]  chregc9_fsmc_sarn;         
wire            chregc9_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_sinc;         
wire    [1 :0]  chregc9_fsmc_src_tr_width; 
wire    [1 :0]  chregc9_fsmc_trgtmdc;      
wire            dmac_vic_if;               
wire            etb_dmacch0_trg;           
wire            etb_dmacch10_trg;          
wire            etb_dmacch11_trg;          
wire            etb_dmacch12_trg;          
wire            etb_dmacch13_trg;          
wire            etb_dmacch14_trg;          
wire            etb_dmacch15_trg;          
wire            etb_dmacch1_trg;           
wire            etb_dmacch2_trg;           
wire            etb_dmacch3_trg;           
wire            etb_dmacch4_trg;           
wire            etb_dmacch5_trg;           
wire            etb_dmacch6_trg;           
wire            etb_dmacch7_trg;           
wire            etb_dmacch8_trg;           
wire            etb_dmacch9_trg;           
wire            fsmc_chregc0_err_vld;      
wire            fsmc_chregc0_htfr_vld;     
wire            fsmc_chregc0_tfr_vld;      
wire            fsmc_chregc0_trgetcmp_vld; 
wire            fsmc_chregc10_err_vld;     
wire            fsmc_chregc10_htfr_vld;    
wire            fsmc_chregc10_tfr_vld;     
wire            fsmc_chregc10_trgetcmp_vld; 
wire            fsmc_chregc11_err_vld;     
wire            fsmc_chregc11_htfr_vld;    
wire            fsmc_chregc11_tfr_vld;     
wire            fsmc_chregc11_trgetcmp_vld; 
wire            fsmc_chregc12_err_vld;     
wire            fsmc_chregc12_htfr_vld;    
wire            fsmc_chregc12_tfr_vld;     
wire            fsmc_chregc12_trgetcmp_vld; 
wire            fsmc_chregc13_err_vld;     
wire            fsmc_chregc13_htfr_vld;    
wire            fsmc_chregc13_tfr_vld;     
wire            fsmc_chregc13_trgetcmp_vld; 
wire            fsmc_chregc14_err_vld;     
wire            fsmc_chregc14_htfr_vld;    
wire            fsmc_chregc14_tfr_vld;     
wire            fsmc_chregc14_trgetcmp_vld; 
wire            fsmc_chregc15_err_vld;     
wire            fsmc_chregc15_htfr_vld;    
wire            fsmc_chregc15_tfr_vld;     
wire            fsmc_chregc15_trgetcmp_vld; 
wire            fsmc_chregc1_err_vld;      
wire            fsmc_chregc1_htfr_vld;     
wire            fsmc_chregc1_tfr_vld;      
wire            fsmc_chregc1_trgetcmp_vld; 
wire            fsmc_chregc2_err_vld;      
wire            fsmc_chregc2_htfr_vld;     
wire            fsmc_chregc2_tfr_vld;      
wire            fsmc_chregc2_trgetcmp_vld; 
wire            fsmc_chregc3_err_vld;      
wire            fsmc_chregc3_htfr_vld;     
wire            fsmc_chregc3_tfr_vld;      
wire            fsmc_chregc3_trgetcmp_vld; 
wire            fsmc_chregc4_err_vld;      
wire            fsmc_chregc4_htfr_vld;     
wire            fsmc_chregc4_tfr_vld;      
wire            fsmc_chregc4_trgetcmp_vld; 
wire            fsmc_chregc5_err_vld;      
wire            fsmc_chregc5_htfr_vld;     
wire            fsmc_chregc5_tfr_vld;      
wire            fsmc_chregc5_trgetcmp_vld; 
wire            fsmc_chregc6_err_vld;      
wire            fsmc_chregc6_htfr_vld;     
wire            fsmc_chregc6_tfr_vld;      
wire            fsmc_chregc6_trgetcmp_vld; 
wire            fsmc_chregc7_err_vld;      
wire            fsmc_chregc7_htfr_vld;     
wire            fsmc_chregc7_tfr_vld;      
wire            fsmc_chregc7_trgetcmp_vld; 
wire            fsmc_chregc8_err_vld;      
wire            fsmc_chregc8_htfr_vld;     
wire            fsmc_chregc8_tfr_vld;      
wire            fsmc_chregc8_trgetcmp_vld; 
wire            fsmc_chregc9_err_vld;      
wire            fsmc_chregc9_htfr_vld;     
wire            fsmc_chregc9_tfr_vld;      
wire            fsmc_chregc9_trgetcmp_vld; 
wire            fsmc_chregc_pdvld_ch0;     
wire            fsmc_chregc_pdvld_ch1;     
wire            fsmc_chregc_pdvld_ch10;    
wire            fsmc_chregc_pdvld_ch11;    
wire            fsmc_chregc_pdvld_ch12;    
wire            fsmc_chregc_pdvld_ch13;    
wire            fsmc_chregc_pdvld_ch14;    
wire            fsmc_chregc_pdvld_ch15;    
wire            fsmc_chregc_pdvld_ch2;     
wire            fsmc_chregc_pdvld_ch3;     
wire            fsmc_chregc_pdvld_ch4;     
wire            fsmc_chregc_pdvld_ch5;     
wire            fsmc_chregc_pdvld_ch6;     
wire            fsmc_chregc_pdvld_ch7;     
wire            fsmc_chregc_pdvld_ch8;     
wire            fsmc_chregc_pdvld_ch9;     
wire            fsmc_regc_ch0en_clr;       
wire            fsmc_regc_ch10en_clr;      
wire            fsmc_regc_ch11en_clr;      
wire            fsmc_regc_ch12en_clr;      
wire            fsmc_regc_ch13en_clr;      
wire            fsmc_regc_ch14en_clr;      
wire            fsmc_regc_ch15en_clr;      
wire            fsmc_regc_ch1en_clr;       
wire            fsmc_regc_ch2en_clr;       
wire            fsmc_regc_ch3en_clr;       
wire            fsmc_regc_ch4en_clr;       
wire            fsmc_regc_ch5en_clr;       
wire            fsmc_regc_ch6en_clr;       
wire            fsmc_regc_ch7en_clr;       
wire            fsmc_regc_ch8en_clr;       
wire            fsmc_regc_ch9en_clr;       
wire            gbc_ch0c_hpreqvld;         
wire            gbc_ch0c_reqvld;           
wire            gbc_ch10c_hpreqvld;        
wire            gbc_ch10c_reqvld;          
wire            gbc_ch11c_hpreqvld;        
wire            gbc_ch11c_reqvld;          
wire            gbc_ch12c_hpreqvld;        
wire            gbc_ch12c_reqvld;          
wire            gbc_ch13c_hpreqvld;        
wire            gbc_ch13c_reqvld;          
wire            gbc_ch14c_hpreqvld;        
wire            gbc_ch14c_reqvld;          
wire            gbc_ch15c_hpreqvld;        
wire            gbc_ch15c_reqvld;          
wire            gbc_ch1c_hpreqvld;         
wire            gbc_ch1c_reqvld;           
wire            gbc_ch2c_hpreqvld;         
wire            gbc_ch2c_reqvld;           
wire            gbc_ch3c_hpreqvld;         
wire            gbc_ch3c_reqvld;           
wire            gbc_ch4c_hpreqvld;         
wire            gbc_ch4c_reqvld;           
wire            gbc_ch5c_hpreqvld;         
wire            gbc_ch5c_reqvld;           
wire            gbc_ch6c_hpreqvld;         
wire            gbc_ch6c_reqvld;           
wire            gbc_ch7c_hpreqvld;         
wire            gbc_ch7c_reqvld;           
wire            gbc_ch8c_hpreqvld;         
wire            gbc_ch8c_reqvld;           
wire            gbc_ch9c_hpreqvld;         
wire            gbc_ch9c_reqvld;           
wire            gbc_chnc_dmacen;           
wire            hclk;                      
wire            hready;                    
wire            hrst_n;                    
wire    [31:0]  m_addr_ch0;                
wire    [31:0]  m_addr_ch1;                
wire    [31:0]  m_addr_ch10;               
wire    [31:0]  m_addr_ch11;               
wire    [31:0]  m_addr_ch12;               
wire    [31:0]  m_addr_ch13;               
wire    [31:0]  m_addr_ch14;               
wire    [31:0]  m_addr_ch15;               
wire    [31:0]  m_addr_ch2;                
wire    [31:0]  m_addr_ch3;                
wire    [31:0]  m_addr_ch4;                
wire    [31:0]  m_addr_ch5;                
wire    [31:0]  m_addr_ch6;                
wire    [31:0]  m_addr_ch7;                
wire    [31:0]  m_addr_ch8;                
wire    [31:0]  m_addr_ch9;                
wire    [31:0]  m_haddr;                   
wire    [2 :0]  m_hburst;                  
wire            m_hbusreq;                 
wire            m_hgrant;                  
wire            m_hlock;                   
wire    [3 :0]  m_hprot;                   
wire    [31:0]  m_hrdata;                  
wire            m_hready;                  
wire    [1 :0]  m_hresp;                   
wire    [2 :0]  m_hsize;                   
wire    [2 :0]  m_hsize_ch0;               
wire    [2 :0]  m_hsize_ch1;               
wire    [2 :0]  m_hsize_ch10;              
wire    [2 :0]  m_hsize_ch11;              
wire    [2 :0]  m_hsize_ch12;              
wire    [2 :0]  m_hsize_ch13;              
wire    [2 :0]  m_hsize_ch14;              
wire    [2 :0]  m_hsize_ch15;              
wire    [2 :0]  m_hsize_ch2;               
wire    [2 :0]  m_hsize_ch3;               
wire    [2 :0]  m_hsize_ch4;               
wire    [2 :0]  m_hsize_ch5;               
wire    [2 :0]  m_hsize_ch6;               
wire    [2 :0]  m_hsize_ch7;               
wire    [2 :0]  m_hsize_ch8;               
wire    [2 :0]  m_hsize_ch9;               
wire    [1 :0]  m_htrans;                  
wire    [31:0]  m_hwdata;                  
wire    [31:0]  m_hwdata_ch0;              
wire    [31:0]  m_hwdata_ch1;              
wire    [31:0]  m_hwdata_ch10;             
wire    [31:0]  m_hwdata_ch11;             
wire    [31:0]  m_hwdata_ch12;             
wire    [31:0]  m_hwdata_ch13;             
wire    [31:0]  m_hwdata_ch14;             
wire    [31:0]  m_hwdata_ch15;             
wire    [31:0]  m_hwdata_ch2;              
wire    [31:0]  m_hwdata_ch3;              
wire    [31:0]  m_hwdata_ch4;              
wire    [31:0]  m_hwdata_ch5;              
wire    [31:0]  m_hwdata_ch6;              
wire    [31:0]  m_hwdata_ch7;              
wire    [31:0]  m_hwdata_ch8;              
wire    [31:0]  m_hwdata_ch9;              
wire            m_hwrite;                  
wire            m_hwrite_ch0;              
wire            m_hwrite_ch1;              
wire            m_hwrite_ch10;             
wire            m_hwrite_ch11;             
wire            m_hwrite_ch12;             
wire            m_hwrite_ch13;             
wire            m_hwrite_ch14;             
wire            m_hwrite_ch15;             
wire            m_hwrite_ch2;              
wire            m_hwrite_ch3;              
wire            m_hwrite_ch4;              
wire            m_hwrite_ch5;              
wire            m_hwrite_ch6;              
wire            m_hwrite_ch7;              
wire            m_hwrite_ch8;              
wire            m_hwrite_ch9;              
wire    [3 :0]  m_prot_ch0;                
wire    [3 :0]  m_prot_ch1;                
wire    [3 :0]  m_prot_ch10;               
wire    [3 :0]  m_prot_ch11;               
wire    [3 :0]  m_prot_ch12;               
wire    [3 :0]  m_prot_ch13;               
wire    [3 :0]  m_prot_ch14;               
wire    [3 :0]  m_prot_ch15;               
wire    [3 :0]  m_prot_ch2;                
wire    [3 :0]  m_prot_ch3;                
wire    [3 :0]  m_prot_ch4;                
wire    [3 :0]  m_prot_ch5;                
wire    [3 :0]  m_prot_ch6;                
wire    [3 :0]  m_prot_ch7;                
wire    [3 :0]  m_prot_ch8;                
wire    [3 :0]  m_prot_ch9;                
wire            regc_fsmc_ch0_srcdtlgc;    
wire            regc_fsmc_ch10_srcdtlgc;   
wire            regc_fsmc_ch11_srcdtlgc;   
wire            regc_fsmc_ch12_srcdtlgc;   
wire            regc_fsmc_ch13_srcdtlgc;   
wire            regc_fsmc_ch14_srcdtlgc;   
wire            regc_fsmc_ch15_srcdtlgc;   
wire            regc_fsmc_ch1_srcdtlgc;    
wire            regc_fsmc_ch2_srcdtlgc;    
wire            regc_fsmc_ch3_srcdtlgc;    
wire            regc_fsmc_ch4_srcdtlgc;    
wire            regc_fsmc_ch5_srcdtlgc;    
wire            regc_fsmc_ch6_srcdtlgc;    
wire            regc_fsmc_ch7_srcdtlgc;    
wire            regc_fsmc_ch8_srcdtlgc;    
wire            regc_fsmc_ch9_srcdtlgc;    
wire    [31:0]  s_haddr;                   
wire    [3 :0]  s_hprot;                   
wire    [31:0]  s_hrdata;                  
wire            s_hready;                  
wire    [1 :0]  s_hresp;                   
wire            s_hsel;                    
wire    [1 :0]  s_htrans;                  
wire    [31:0]  s_hwdata;                  
wire            s_hwrite;                  
bmux_ctrl  x_ahbbusmux_ctrl (
  .arb_bmux_transvld (arb_bmux_transvld),
  .arb_bmux_trgvld   (arb_bmux_trgvld  ),
  .busy_chn_code     (busy_chn_code    ),
  .gbc_chnc_dmacen   (gbc_chnc_dmacen  ),
  .hclk              (hclk             ),
  .hready            (hready           ),
  .hrst_n            (hrst_n           ),
  .m_addr_ch0        (m_addr_ch0       ),
  .m_addr_ch1        (m_addr_ch1       ),
  .m_addr_ch10       (m_addr_ch10      ),
  .m_addr_ch11       (m_addr_ch11      ),
  .m_addr_ch12       (m_addr_ch12      ),
  .m_addr_ch13       (m_addr_ch13      ),
  .m_addr_ch14       (m_addr_ch14      ),
  .m_addr_ch15       (m_addr_ch15      ),
  .m_addr_ch2        (m_addr_ch2       ),
  .m_addr_ch3        (m_addr_ch3       ),
  .m_addr_ch4        (m_addr_ch4       ),
  .m_addr_ch5        (m_addr_ch5       ),
  .m_addr_ch6        (m_addr_ch6       ),
  .m_addr_ch7        (m_addr_ch7       ),
  .m_addr_ch8        (m_addr_ch8       ),
  .m_addr_ch9        (m_addr_ch9       ),
  .m_haddr           (m_haddr          ),
  .m_hburst          (m_hburst         ),
  .m_hbusreq         (m_hbusreq        ),
  .m_hgrant          (m_hgrant         ),
  .m_hlock           (m_hlock          ),
  .m_hprot           (m_hprot          ),
  .m_hready          (m_hready         ),
  .m_hsize           (m_hsize          ),
  .m_hsize_ch0       (m_hsize_ch0      ),
  .m_hsize_ch1       (m_hsize_ch1      ),
  .m_hsize_ch10      (m_hsize_ch10     ),
  .m_hsize_ch11      (m_hsize_ch11     ),
  .m_hsize_ch12      (m_hsize_ch12     ),
  .m_hsize_ch13      (m_hsize_ch13     ),
  .m_hsize_ch14      (m_hsize_ch14     ),
  .m_hsize_ch15      (m_hsize_ch15     ),
  .m_hsize_ch2       (m_hsize_ch2      ),
  .m_hsize_ch3       (m_hsize_ch3      ),
  .m_hsize_ch4       (m_hsize_ch4      ),
  .m_hsize_ch5       (m_hsize_ch5      ),
  .m_hsize_ch6       (m_hsize_ch6      ),
  .m_hsize_ch7       (m_hsize_ch7      ),
  .m_hsize_ch8       (m_hsize_ch8      ),
  .m_hsize_ch9       (m_hsize_ch9      ),
  .m_htrans          (m_htrans         ),
  .m_hwdata          (m_hwdata         ),
  .m_hwdata_ch0      (m_hwdata_ch0     ),
  .m_hwdata_ch1      (m_hwdata_ch1     ),
  .m_hwdata_ch10     (m_hwdata_ch10    ),
  .m_hwdata_ch11     (m_hwdata_ch11    ),
  .m_hwdata_ch12     (m_hwdata_ch12    ),
  .m_hwdata_ch13     (m_hwdata_ch13    ),
  .m_hwdata_ch14     (m_hwdata_ch14    ),
  .m_hwdata_ch15     (m_hwdata_ch15    ),
  .m_hwdata_ch2      (m_hwdata_ch2     ),
  .m_hwdata_ch3      (m_hwdata_ch3     ),
  .m_hwdata_ch4      (m_hwdata_ch4     ),
  .m_hwdata_ch5      (m_hwdata_ch5     ),
  .m_hwdata_ch6      (m_hwdata_ch6     ),
  .m_hwdata_ch7      (m_hwdata_ch7     ),
  .m_hwdata_ch8      (m_hwdata_ch8     ),
  .m_hwdata_ch9      (m_hwdata_ch9     ),
  .m_hwrite          (m_hwrite         ),
  .m_hwrite_ch0      (m_hwrite_ch0     ),
  .m_hwrite_ch1      (m_hwrite_ch1     ),
  .m_hwrite_ch10     (m_hwrite_ch10    ),
  .m_hwrite_ch11     (m_hwrite_ch11    ),
  .m_hwrite_ch12     (m_hwrite_ch12    ),
  .m_hwrite_ch13     (m_hwrite_ch13    ),
  .m_hwrite_ch14     (m_hwrite_ch14    ),
  .m_hwrite_ch15     (m_hwrite_ch15    ),
  .m_hwrite_ch2      (m_hwrite_ch2     ),
  .m_hwrite_ch3      (m_hwrite_ch3     ),
  .m_hwrite_ch4      (m_hwrite_ch4     ),
  .m_hwrite_ch5      (m_hwrite_ch5     ),
  .m_hwrite_ch6      (m_hwrite_ch6     ),
  .m_hwrite_ch7      (m_hwrite_ch7     ),
  .m_hwrite_ch8      (m_hwrite_ch8     ),
  .m_hwrite_ch9      (m_hwrite_ch9     ),
  .m_prot_ch0        (m_prot_ch0       ),
  .m_prot_ch1        (m_prot_ch1       ),
  .m_prot_ch10       (m_prot_ch10      ),
  .m_prot_ch11       (m_prot_ch11      ),
  .m_prot_ch12       (m_prot_ch12      ),
  .m_prot_ch13       (m_prot_ch13      ),
  .m_prot_ch14       (m_prot_ch14      ),
  .m_prot_ch15       (m_prot_ch15      ),
  .m_prot_ch2        (m_prot_ch2       ),
  .m_prot_ch3        (m_prot_ch3       ),
  .m_prot_ch4        (m_prot_ch4       ),
  .m_prot_ch5        (m_prot_ch5       ),
  .m_prot_ch6        (m_prot_ch6       ),
  .m_prot_ch7        (m_prot_ch7       ),
  .m_prot_ch8        (m_prot_ch8       ),
  .m_prot_ch9        (m_prot_ch9       )
);
reg_ctrl  x_reg_ctrl (
  .ch0_prot_out               (ch0_prot_out              ),
  .ch0c_gbc_chbsy             (ch0c_gbc_chbsy            ),
  .ch0c_gbc_chnen             (ch0c_gbc_chnen            ),
  .ch0c_gbc_sfwtrg            (ch0c_gbc_sfwtrg           ),
  .ch10_prot_out              (ch10_prot_out             ),
  .ch10c_gbc_chbsy            (ch10c_gbc_chbsy           ),
  .ch10c_gbc_chnen            (ch10c_gbc_chnen           ),
  .ch10c_gbc_sfwtrg           (ch10c_gbc_sfwtrg          ),
  .ch11_prot_out              (ch11_prot_out             ),
  .ch11c_gbc_chbsy            (ch11c_gbc_chbsy           ),
  .ch11c_gbc_chnen            (ch11c_gbc_chnen           ),
  .ch11c_gbc_sfwtrg           (ch11c_gbc_sfwtrg          ),
  .ch12_prot_out              (ch12_prot_out             ),
  .ch12c_gbc_chbsy            (ch12c_gbc_chbsy           ),
  .ch12c_gbc_chnen            (ch12c_gbc_chnen           ),
  .ch12c_gbc_sfwtrg           (ch12c_gbc_sfwtrg          ),
  .ch13_prot_out              (ch13_prot_out             ),
  .ch13c_gbc_chbsy            (ch13c_gbc_chbsy           ),
  .ch13c_gbc_chnen            (ch13c_gbc_chnen           ),
  .ch13c_gbc_sfwtrg           (ch13c_gbc_sfwtrg          ),
  .ch14_prot_out              (ch14_prot_out             ),
  .ch14c_gbc_chbsy            (ch14c_gbc_chbsy           ),
  .ch14c_gbc_chnen            (ch14c_gbc_chnen           ),
  .ch14c_gbc_sfwtrg           (ch14c_gbc_sfwtrg          ),
  .ch15_prot_out              (ch15_prot_out             ),
  .ch15c_gbc_chbsy            (ch15c_gbc_chbsy           ),
  .ch15c_gbc_chnen            (ch15c_gbc_chnen           ),
  .ch15c_gbc_sfwtrg           (ch15c_gbc_sfwtrg          ),
  .ch1_prot_out               (ch1_prot_out              ),
  .ch1c_gbc_chbsy             (ch1c_gbc_chbsy            ),
  .ch1c_gbc_chnen             (ch1c_gbc_chnen            ),
  .ch1c_gbc_sfwtrg            (ch1c_gbc_sfwtrg           ),
  .ch2_prot_out               (ch2_prot_out              ),
  .ch2c_gbc_chbsy             (ch2c_gbc_chbsy            ),
  .ch2c_gbc_chnen             (ch2c_gbc_chnen            ),
  .ch2c_gbc_sfwtrg            (ch2c_gbc_sfwtrg           ),
  .ch3_prot_out               (ch3_prot_out              ),
  .ch3c_gbc_chbsy             (ch3c_gbc_chbsy            ),
  .ch3c_gbc_chnen             (ch3c_gbc_chnen            ),
  .ch3c_gbc_sfwtrg            (ch3c_gbc_sfwtrg           ),
  .ch4_prot_out               (ch4_prot_out              ),
  .ch4c_gbc_chbsy             (ch4c_gbc_chbsy            ),
  .ch4c_gbc_chnen             (ch4c_gbc_chnen            ),
  .ch4c_gbc_sfwtrg            (ch4c_gbc_sfwtrg           ),
  .ch5_prot_out               (ch5_prot_out              ),
  .ch5c_gbc_chbsy             (ch5c_gbc_chbsy            ),
  .ch5c_gbc_chnen             (ch5c_gbc_chnen            ),
  .ch5c_gbc_sfwtrg            (ch5c_gbc_sfwtrg           ),
  .ch6_prot_out               (ch6_prot_out              ),
  .ch6c_gbc_chbsy             (ch6c_gbc_chbsy            ),
  .ch6c_gbc_chnen             (ch6c_gbc_chnen            ),
  .ch6c_gbc_sfwtrg            (ch6c_gbc_sfwtrg           ),
  .ch7_prot_out               (ch7_prot_out              ),
  .ch7c_gbc_chbsy             (ch7c_gbc_chbsy            ),
  .ch7c_gbc_chnen             (ch7c_gbc_chnen            ),
  .ch7c_gbc_sfwtrg            (ch7c_gbc_sfwtrg           ),
  .ch8_prot_out               (ch8_prot_out              ),
  .ch8c_gbc_chbsy             (ch8c_gbc_chbsy            ),
  .ch8c_gbc_chnen             (ch8c_gbc_chnen            ),
  .ch8c_gbc_sfwtrg            (ch8c_gbc_sfwtrg           ),
  .ch9_prot_out               (ch9_prot_out              ),
  .ch9c_gbc_chbsy             (ch9c_gbc_chbsy            ),
  .ch9c_gbc_chnen             (ch9c_gbc_chnen            ),
  .ch9c_gbc_sfwtrg            (ch9c_gbc_sfwtrg           ),
  .chregc0_fsmc_block_tl      (chregc0_fsmc_block_tl     ),
  .chregc0_fsmc_chintmdc      (chregc0_fsmc_chintmdc     ),
  .chregc0_fsmc_darn          (chregc0_fsmc_darn         ),
  .chregc0_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc    ),
  .chregc0_fsmc_dinc          (chregc0_fsmc_dinc         ),
  .chregc0_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width ),
  .chregc0_fsmc_endlan        (chregc0_fsmc_endlan       ),
  .chregc0_fsmc_group_len     (chregc0_fsmc_group_len    ),
  .chregc0_fsmc_grpmc         (chregc0_fsmc_grpmc        ),
  .chregc0_fsmc_protctl       (chregc0_fsmc_protctl      ),
  .chregc0_fsmc_sarn          (chregc0_fsmc_sarn         ),
  .chregc0_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc    ),
  .chregc0_fsmc_sinc          (chregc0_fsmc_sinc         ),
  .chregc0_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width ),
  .chregc0_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc      ),
  .chregc10_fsmc_block_tl     (chregc10_fsmc_block_tl    ),
  .chregc10_fsmc_chintmdc     (chregc10_fsmc_chintmdc    ),
  .chregc10_fsmc_darn         (chregc10_fsmc_darn        ),
  .chregc10_fsmc_dgrpaddrc    (chregc10_fsmc_dgrpaddrc   ),
  .chregc10_fsmc_dinc         (chregc10_fsmc_dinc        ),
  .chregc10_fsmc_dst_tr_width (chregc10_fsmc_dst_tr_width),
  .chregc10_fsmc_endlan       (chregc10_fsmc_endlan      ),
  .chregc10_fsmc_group_len    (chregc10_fsmc_group_len   ),
  .chregc10_fsmc_grpmc        (chregc10_fsmc_grpmc       ),
  .chregc10_fsmc_protctl      (chregc10_fsmc_protctl     ),
  .chregc10_fsmc_sarn         (chregc10_fsmc_sarn        ),
  .chregc10_fsmc_sgrpaddrc    (chregc10_fsmc_sgrpaddrc   ),
  .chregc10_fsmc_sinc         (chregc10_fsmc_sinc        ),
  .chregc10_fsmc_src_tr_width (chregc10_fsmc_src_tr_width),
  .chregc10_fsmc_trgtmdc      (chregc10_fsmc_trgtmdc     ),
  .chregc11_fsmc_block_tl     (chregc11_fsmc_block_tl    ),
  .chregc11_fsmc_chintmdc     (chregc11_fsmc_chintmdc    ),
  .chregc11_fsmc_darn         (chregc11_fsmc_darn        ),
  .chregc11_fsmc_dgrpaddrc    (chregc11_fsmc_dgrpaddrc   ),
  .chregc11_fsmc_dinc         (chregc11_fsmc_dinc        ),
  .chregc11_fsmc_dst_tr_width (chregc11_fsmc_dst_tr_width),
  .chregc11_fsmc_endlan       (chregc11_fsmc_endlan      ),
  .chregc11_fsmc_group_len    (chregc11_fsmc_group_len   ),
  .chregc11_fsmc_grpmc        (chregc11_fsmc_grpmc       ),
  .chregc11_fsmc_protctl      (chregc11_fsmc_protctl     ),
  .chregc11_fsmc_sarn         (chregc11_fsmc_sarn        ),
  .chregc11_fsmc_sgrpaddrc    (chregc11_fsmc_sgrpaddrc   ),
  .chregc11_fsmc_sinc         (chregc11_fsmc_sinc        ),
  .chregc11_fsmc_src_tr_width (chregc11_fsmc_src_tr_width),
  .chregc11_fsmc_trgtmdc      (chregc11_fsmc_trgtmdc     ),
  .chregc12_fsmc_block_tl     (chregc12_fsmc_block_tl    ),
  .chregc12_fsmc_chintmdc     (chregc12_fsmc_chintmdc    ),
  .chregc12_fsmc_darn         (chregc12_fsmc_darn        ),
  .chregc12_fsmc_dgrpaddrc    (chregc12_fsmc_dgrpaddrc   ),
  .chregc12_fsmc_dinc         (chregc12_fsmc_dinc        ),
  .chregc12_fsmc_dst_tr_width (chregc12_fsmc_dst_tr_width),
  .chregc12_fsmc_endlan       (chregc12_fsmc_endlan      ),
  .chregc12_fsmc_group_len    (chregc12_fsmc_group_len   ),
  .chregc12_fsmc_grpmc        (chregc12_fsmc_grpmc       ),
  .chregc12_fsmc_protctl      (chregc12_fsmc_protctl     ),
  .chregc12_fsmc_sarn         (chregc12_fsmc_sarn        ),
  .chregc12_fsmc_sgrpaddrc    (chregc12_fsmc_sgrpaddrc   ),
  .chregc12_fsmc_sinc         (chregc12_fsmc_sinc        ),
  .chregc12_fsmc_src_tr_width (chregc12_fsmc_src_tr_width),
  .chregc12_fsmc_trgtmdc      (chregc12_fsmc_trgtmdc     ),
  .chregc13_fsmc_block_tl     (chregc13_fsmc_block_tl    ),
  .chregc13_fsmc_chintmdc     (chregc13_fsmc_chintmdc    ),
  .chregc13_fsmc_darn         (chregc13_fsmc_darn        ),
  .chregc13_fsmc_dgrpaddrc    (chregc13_fsmc_dgrpaddrc   ),
  .chregc13_fsmc_dinc         (chregc13_fsmc_dinc        ),
  .chregc13_fsmc_dst_tr_width (chregc13_fsmc_dst_tr_width),
  .chregc13_fsmc_endlan       (chregc13_fsmc_endlan      ),
  .chregc13_fsmc_group_len    (chregc13_fsmc_group_len   ),
  .chregc13_fsmc_grpmc        (chregc13_fsmc_grpmc       ),
  .chregc13_fsmc_protctl      (chregc13_fsmc_protctl     ),
  .chregc13_fsmc_sarn         (chregc13_fsmc_sarn        ),
  .chregc13_fsmc_sgrpaddrc    (chregc13_fsmc_sgrpaddrc   ),
  .chregc13_fsmc_sinc         (chregc13_fsmc_sinc        ),
  .chregc13_fsmc_src_tr_width (chregc13_fsmc_src_tr_width),
  .chregc13_fsmc_trgtmdc      (chregc13_fsmc_trgtmdc     ),
  .chregc14_fsmc_block_tl     (chregc14_fsmc_block_tl    ),
  .chregc14_fsmc_chintmdc     (chregc14_fsmc_chintmdc    ),
  .chregc14_fsmc_darn         (chregc14_fsmc_darn        ),
  .chregc14_fsmc_dgrpaddrc    (chregc14_fsmc_dgrpaddrc   ),
  .chregc14_fsmc_dinc         (chregc14_fsmc_dinc        ),
  .chregc14_fsmc_dst_tr_width (chregc14_fsmc_dst_tr_width),
  .chregc14_fsmc_endlan       (chregc14_fsmc_endlan      ),
  .chregc14_fsmc_group_len    (chregc14_fsmc_group_len   ),
  .chregc14_fsmc_grpmc        (chregc14_fsmc_grpmc       ),
  .chregc14_fsmc_protctl      (chregc14_fsmc_protctl     ),
  .chregc14_fsmc_sarn         (chregc14_fsmc_sarn        ),
  .chregc14_fsmc_sgrpaddrc    (chregc14_fsmc_sgrpaddrc   ),
  .chregc14_fsmc_sinc         (chregc14_fsmc_sinc        ),
  .chregc14_fsmc_src_tr_width (chregc14_fsmc_src_tr_width),
  .chregc14_fsmc_trgtmdc      (chregc14_fsmc_trgtmdc     ),
  .chregc15_fsmc_block_tl     (chregc15_fsmc_block_tl    ),
  .chregc15_fsmc_chintmdc     (chregc15_fsmc_chintmdc    ),
  .chregc15_fsmc_darn         (chregc15_fsmc_darn        ),
  .chregc15_fsmc_dgrpaddrc    (chregc15_fsmc_dgrpaddrc   ),
  .chregc15_fsmc_dinc         (chregc15_fsmc_dinc        ),
  .chregc15_fsmc_dst_tr_width (chregc15_fsmc_dst_tr_width),
  .chregc15_fsmc_endlan       (chregc15_fsmc_endlan      ),
  .chregc15_fsmc_group_len    (chregc15_fsmc_group_len   ),
  .chregc15_fsmc_grpmc        (chregc15_fsmc_grpmc       ),
  .chregc15_fsmc_protctl      (chregc15_fsmc_protctl     ),
  .chregc15_fsmc_sarn         (chregc15_fsmc_sarn        ),
  .chregc15_fsmc_sgrpaddrc    (chregc15_fsmc_sgrpaddrc   ),
  .chregc15_fsmc_sinc         (chregc15_fsmc_sinc        ),
  .chregc15_fsmc_src_tr_width (chregc15_fsmc_src_tr_width),
  .chregc15_fsmc_trgtmdc      (chregc15_fsmc_trgtmdc     ),
  .chregc1_fsmc_block_tl      (chregc1_fsmc_block_tl     ),
  .chregc1_fsmc_chintmdc      (chregc1_fsmc_chintmdc     ),
  .chregc1_fsmc_darn          (chregc1_fsmc_darn         ),
  .chregc1_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc    ),
  .chregc1_fsmc_dinc          (chregc1_fsmc_dinc         ),
  .chregc1_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width ),
  .chregc1_fsmc_endlan        (chregc1_fsmc_endlan       ),
  .chregc1_fsmc_group_len     (chregc1_fsmc_group_len    ),
  .chregc1_fsmc_grpmc         (chregc1_fsmc_grpmc        ),
  .chregc1_fsmc_protctl       (chregc1_fsmc_protctl      ),
  .chregc1_fsmc_sarn          (chregc1_fsmc_sarn         ),
  .chregc1_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc    ),
  .chregc1_fsmc_sinc          (chregc1_fsmc_sinc         ),
  .chregc1_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width ),
  .chregc1_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc      ),
  .chregc2_fsmc_block_tl      (chregc2_fsmc_block_tl     ),
  .chregc2_fsmc_chintmdc      (chregc2_fsmc_chintmdc     ),
  .chregc2_fsmc_darn          (chregc2_fsmc_darn         ),
  .chregc2_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc    ),
  .chregc2_fsmc_dinc          (chregc2_fsmc_dinc         ),
  .chregc2_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width ),
  .chregc2_fsmc_endlan        (chregc2_fsmc_endlan       ),
  .chregc2_fsmc_group_len     (chregc2_fsmc_group_len    ),
  .chregc2_fsmc_grpmc         (chregc2_fsmc_grpmc        ),
  .chregc2_fsmc_protctl       (chregc2_fsmc_protctl      ),
  .chregc2_fsmc_sarn          (chregc2_fsmc_sarn         ),
  .chregc2_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc    ),
  .chregc2_fsmc_sinc          (chregc2_fsmc_sinc         ),
  .chregc2_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width ),
  .chregc2_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc      ),
  .chregc3_fsmc_block_tl      (chregc3_fsmc_block_tl     ),
  .chregc3_fsmc_chintmdc      (chregc3_fsmc_chintmdc     ),
  .chregc3_fsmc_darn          (chregc3_fsmc_darn         ),
  .chregc3_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc    ),
  .chregc3_fsmc_dinc          (chregc3_fsmc_dinc         ),
  .chregc3_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width ),
  .chregc3_fsmc_endlan        (chregc3_fsmc_endlan       ),
  .chregc3_fsmc_group_len     (chregc3_fsmc_group_len    ),
  .chregc3_fsmc_grpmc         (chregc3_fsmc_grpmc        ),
  .chregc3_fsmc_protctl       (chregc3_fsmc_protctl      ),
  .chregc3_fsmc_sarn          (chregc3_fsmc_sarn         ),
  .chregc3_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc    ),
  .chregc3_fsmc_sinc          (chregc3_fsmc_sinc         ),
  .chregc3_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width ),
  .chregc3_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc      ),
  .chregc4_fsmc_block_tl      (chregc4_fsmc_block_tl     ),
  .chregc4_fsmc_chintmdc      (chregc4_fsmc_chintmdc     ),
  .chregc4_fsmc_darn          (chregc4_fsmc_darn         ),
  .chregc4_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc    ),
  .chregc4_fsmc_dinc          (chregc4_fsmc_dinc         ),
  .chregc4_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width ),
  .chregc4_fsmc_endlan        (chregc4_fsmc_endlan       ),
  .chregc4_fsmc_group_len     (chregc4_fsmc_group_len    ),
  .chregc4_fsmc_grpmc         (chregc4_fsmc_grpmc        ),
  .chregc4_fsmc_protctl       (chregc4_fsmc_protctl      ),
  .chregc4_fsmc_sarn          (chregc4_fsmc_sarn         ),
  .chregc4_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc    ),
  .chregc4_fsmc_sinc          (chregc4_fsmc_sinc         ),
  .chregc4_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width ),
  .chregc4_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc      ),
  .chregc5_fsmc_block_tl      (chregc5_fsmc_block_tl     ),
  .chregc5_fsmc_chintmdc      (chregc5_fsmc_chintmdc     ),
  .chregc5_fsmc_darn          (chregc5_fsmc_darn         ),
  .chregc5_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc    ),
  .chregc5_fsmc_dinc          (chregc5_fsmc_dinc         ),
  .chregc5_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width ),
  .chregc5_fsmc_endlan        (chregc5_fsmc_endlan       ),
  .chregc5_fsmc_group_len     (chregc5_fsmc_group_len    ),
  .chregc5_fsmc_grpmc         (chregc5_fsmc_grpmc        ),
  .chregc5_fsmc_protctl       (chregc5_fsmc_protctl      ),
  .chregc5_fsmc_sarn          (chregc5_fsmc_sarn         ),
  .chregc5_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc    ),
  .chregc5_fsmc_sinc          (chregc5_fsmc_sinc         ),
  .chregc5_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width ),
  .chregc5_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc      ),
  .chregc6_fsmc_block_tl      (chregc6_fsmc_block_tl     ),
  .chregc6_fsmc_chintmdc      (chregc6_fsmc_chintmdc     ),
  .chregc6_fsmc_darn          (chregc6_fsmc_darn         ),
  .chregc6_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc    ),
  .chregc6_fsmc_dinc          (chregc6_fsmc_dinc         ),
  .chregc6_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width ),
  .chregc6_fsmc_endlan        (chregc6_fsmc_endlan       ),
  .chregc6_fsmc_group_len     (chregc6_fsmc_group_len    ),
  .chregc6_fsmc_grpmc         (chregc6_fsmc_grpmc        ),
  .chregc6_fsmc_protctl       (chregc6_fsmc_protctl      ),
  .chregc6_fsmc_sarn          (chregc6_fsmc_sarn         ),
  .chregc6_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc    ),
  .chregc6_fsmc_sinc          (chregc6_fsmc_sinc         ),
  .chregc6_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width ),
  .chregc6_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc      ),
  .chregc7_fsmc_block_tl      (chregc7_fsmc_block_tl     ),
  .chregc7_fsmc_chintmdc      (chregc7_fsmc_chintmdc     ),
  .chregc7_fsmc_darn          (chregc7_fsmc_darn         ),
  .chregc7_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc    ),
  .chregc7_fsmc_dinc          (chregc7_fsmc_dinc         ),
  .chregc7_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width ),
  .chregc7_fsmc_endlan        (chregc7_fsmc_endlan       ),
  .chregc7_fsmc_group_len     (chregc7_fsmc_group_len    ),
  .chregc7_fsmc_grpmc         (chregc7_fsmc_grpmc        ),
  .chregc7_fsmc_protctl       (chregc7_fsmc_protctl      ),
  .chregc7_fsmc_sarn          (chregc7_fsmc_sarn         ),
  .chregc7_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc    ),
  .chregc7_fsmc_sinc          (chregc7_fsmc_sinc         ),
  .chregc7_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width ),
  .chregc7_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc      ),
  .chregc8_fsmc_block_tl      (chregc8_fsmc_block_tl     ),
  .chregc8_fsmc_chintmdc      (chregc8_fsmc_chintmdc     ),
  .chregc8_fsmc_darn          (chregc8_fsmc_darn         ),
  .chregc8_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc    ),
  .chregc8_fsmc_dinc          (chregc8_fsmc_dinc         ),
  .chregc8_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width ),
  .chregc8_fsmc_endlan        (chregc8_fsmc_endlan       ),
  .chregc8_fsmc_group_len     (chregc8_fsmc_group_len    ),
  .chregc8_fsmc_grpmc         (chregc8_fsmc_grpmc        ),
  .chregc8_fsmc_protctl       (chregc8_fsmc_protctl      ),
  .chregc8_fsmc_sarn          (chregc8_fsmc_sarn         ),
  .chregc8_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc    ),
  .chregc8_fsmc_sinc          (chregc8_fsmc_sinc         ),
  .chregc8_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width ),
  .chregc8_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc      ),
  .chregc9_fsmc_block_tl      (chregc9_fsmc_block_tl     ),
  .chregc9_fsmc_chintmdc      (chregc9_fsmc_chintmdc     ),
  .chregc9_fsmc_darn          (chregc9_fsmc_darn         ),
  .chregc9_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc    ),
  .chregc9_fsmc_dinc          (chregc9_fsmc_dinc         ),
  .chregc9_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width ),
  .chregc9_fsmc_endlan        (chregc9_fsmc_endlan       ),
  .chregc9_fsmc_group_len     (chregc9_fsmc_group_len    ),
  .chregc9_fsmc_grpmc         (chregc9_fsmc_grpmc        ),
  .chregc9_fsmc_protctl       (chregc9_fsmc_protctl      ),
  .chregc9_fsmc_sarn          (chregc9_fsmc_sarn         ),
  .chregc9_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc    ),
  .chregc9_fsmc_sinc          (chregc9_fsmc_sinc         ),
  .chregc9_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width ),
  .chregc9_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc      ),
  .dmac_vic_if                (dmac_vic_if               ),
  .fsmc_chregc0_err_vld       (fsmc_chregc0_err_vld      ),
  .fsmc_chregc0_htfr_vld      (fsmc_chregc0_htfr_vld     ),
  .fsmc_chregc0_tfr_vld       (fsmc_chregc0_tfr_vld      ),
  .fsmc_chregc0_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld ),
  .fsmc_chregc10_err_vld      (fsmc_chregc10_err_vld     ),
  .fsmc_chregc10_htfr_vld     (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc10_tfr_vld      (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc10_trgetcmp_vld (fsmc_chregc10_trgetcmp_vld),
  .fsmc_chregc11_err_vld      (fsmc_chregc11_err_vld     ),
  .fsmc_chregc11_htfr_vld     (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc11_tfr_vld      (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc11_trgetcmp_vld (fsmc_chregc11_trgetcmp_vld),
  .fsmc_chregc12_err_vld      (fsmc_chregc12_err_vld     ),
  .fsmc_chregc12_htfr_vld     (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc12_tfr_vld      (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc12_trgetcmp_vld (fsmc_chregc12_trgetcmp_vld),
  .fsmc_chregc13_err_vld      (fsmc_chregc13_err_vld     ),
  .fsmc_chregc13_htfr_vld     (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc13_tfr_vld      (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc13_trgetcmp_vld (fsmc_chregc13_trgetcmp_vld),
  .fsmc_chregc14_err_vld      (fsmc_chregc14_err_vld     ),
  .fsmc_chregc14_htfr_vld     (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc14_tfr_vld      (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc14_trgetcmp_vld (fsmc_chregc14_trgetcmp_vld),
  .fsmc_chregc15_err_vld      (fsmc_chregc15_err_vld     ),
  .fsmc_chregc15_htfr_vld     (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc15_tfr_vld      (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc15_trgetcmp_vld (fsmc_chregc15_trgetcmp_vld),
  .fsmc_chregc1_err_vld       (fsmc_chregc1_err_vld      ),
  .fsmc_chregc1_htfr_vld      (fsmc_chregc1_htfr_vld     ),
  .fsmc_chregc1_tfr_vld       (fsmc_chregc1_tfr_vld      ),
  .fsmc_chregc1_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld ),
  .fsmc_chregc2_err_vld       (fsmc_chregc2_err_vld      ),
  .fsmc_chregc2_htfr_vld      (fsmc_chregc2_htfr_vld     ),
  .fsmc_chregc2_tfr_vld       (fsmc_chregc2_tfr_vld      ),
  .fsmc_chregc2_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld ),
  .fsmc_chregc3_err_vld       (fsmc_chregc3_err_vld      ),
  .fsmc_chregc3_htfr_vld      (fsmc_chregc3_htfr_vld     ),
  .fsmc_chregc3_tfr_vld       (fsmc_chregc3_tfr_vld      ),
  .fsmc_chregc3_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld ),
  .fsmc_chregc4_err_vld       (fsmc_chregc4_err_vld      ),
  .fsmc_chregc4_htfr_vld      (fsmc_chregc4_htfr_vld     ),
  .fsmc_chregc4_tfr_vld       (fsmc_chregc4_tfr_vld      ),
  .fsmc_chregc4_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld ),
  .fsmc_chregc5_err_vld       (fsmc_chregc5_err_vld      ),
  .fsmc_chregc5_htfr_vld      (fsmc_chregc5_htfr_vld     ),
  .fsmc_chregc5_tfr_vld       (fsmc_chregc5_tfr_vld      ),
  .fsmc_chregc5_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld ),
  .fsmc_chregc6_err_vld       (fsmc_chregc6_err_vld      ),
  .fsmc_chregc6_htfr_vld      (fsmc_chregc6_htfr_vld     ),
  .fsmc_chregc6_tfr_vld       (fsmc_chregc6_tfr_vld      ),
  .fsmc_chregc6_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld ),
  .fsmc_chregc7_err_vld       (fsmc_chregc7_err_vld      ),
  .fsmc_chregc7_htfr_vld      (fsmc_chregc7_htfr_vld     ),
  .fsmc_chregc7_tfr_vld       (fsmc_chregc7_tfr_vld      ),
  .fsmc_chregc7_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld ),
  .fsmc_chregc8_err_vld       (fsmc_chregc8_err_vld      ),
  .fsmc_chregc8_htfr_vld      (fsmc_chregc8_htfr_vld     ),
  .fsmc_chregc8_tfr_vld       (fsmc_chregc8_tfr_vld      ),
  .fsmc_chregc8_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld ),
  .fsmc_chregc9_err_vld       (fsmc_chregc9_err_vld      ),
  .fsmc_chregc9_htfr_vld      (fsmc_chregc9_htfr_vld     ),
  .fsmc_chregc9_tfr_vld       (fsmc_chregc9_tfr_vld      ),
  .fsmc_chregc9_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld ),
  .fsmc_chregc_pdvld_ch0      (fsmc_chregc_pdvld_ch0     ),
  .fsmc_chregc_pdvld_ch1      (fsmc_chregc_pdvld_ch1     ),
  .fsmc_chregc_pdvld_ch10     (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_pdvld_ch11     (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_pdvld_ch12     (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_pdvld_ch13     (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_pdvld_ch14     (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_pdvld_ch15     (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_pdvld_ch2      (fsmc_chregc_pdvld_ch2     ),
  .fsmc_chregc_pdvld_ch3      (fsmc_chregc_pdvld_ch3     ),
  .fsmc_chregc_pdvld_ch4      (fsmc_chregc_pdvld_ch4     ),
  .fsmc_chregc_pdvld_ch5      (fsmc_chregc_pdvld_ch5     ),
  .fsmc_chregc_pdvld_ch6      (fsmc_chregc_pdvld_ch6     ),
  .fsmc_chregc_pdvld_ch7      (fsmc_chregc_pdvld_ch7     ),
  .fsmc_chregc_pdvld_ch8      (fsmc_chregc_pdvld_ch8     ),
  .fsmc_chregc_pdvld_ch9      (fsmc_chregc_pdvld_ch9     ),
  .fsmc_regc_ch0en_clr        (fsmc_regc_ch0en_clr       ),
  .fsmc_regc_ch10en_clr       (fsmc_regc_ch10en_clr      ),
  .fsmc_regc_ch11en_clr       (fsmc_regc_ch11en_clr      ),
  .fsmc_regc_ch12en_clr       (fsmc_regc_ch12en_clr      ),
  .fsmc_regc_ch13en_clr       (fsmc_regc_ch13en_clr      ),
  .fsmc_regc_ch14en_clr       (fsmc_regc_ch14en_clr      ),
  .fsmc_regc_ch15en_clr       (fsmc_regc_ch15en_clr      ),
  .fsmc_regc_ch1en_clr        (fsmc_regc_ch1en_clr       ),
  .fsmc_regc_ch2en_clr        (fsmc_regc_ch2en_clr       ),
  .fsmc_regc_ch3en_clr        (fsmc_regc_ch3en_clr       ),
  .fsmc_regc_ch4en_clr        (fsmc_regc_ch4en_clr       ),
  .fsmc_regc_ch5en_clr        (fsmc_regc_ch5en_clr       ),
  .fsmc_regc_ch6en_clr        (fsmc_regc_ch6en_clr       ),
  .fsmc_regc_ch7en_clr        (fsmc_regc_ch7en_clr       ),
  .fsmc_regc_ch8en_clr        (fsmc_regc_ch8en_clr       ),
  .fsmc_regc_ch9en_clr        (fsmc_regc_ch9en_clr       ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_ch0_srcdtlgc     (regc_fsmc_ch0_srcdtlgc    ),
  .regc_fsmc_ch10_srcdtlgc    (regc_fsmc_ch10_srcdtlgc   ),
  .regc_fsmc_ch11_srcdtlgc    (regc_fsmc_ch11_srcdtlgc   ),
  .regc_fsmc_ch12_srcdtlgc    (regc_fsmc_ch12_srcdtlgc   ),
  .regc_fsmc_ch13_srcdtlgc    (regc_fsmc_ch13_srcdtlgc   ),
  .regc_fsmc_ch14_srcdtlgc    (regc_fsmc_ch14_srcdtlgc   ),
  .regc_fsmc_ch15_srcdtlgc    (regc_fsmc_ch15_srcdtlgc   ),
  .regc_fsmc_ch1_srcdtlgc     (regc_fsmc_ch1_srcdtlgc    ),
  .regc_fsmc_ch2_srcdtlgc     (regc_fsmc_ch2_srcdtlgc    ),
  .regc_fsmc_ch3_srcdtlgc     (regc_fsmc_ch3_srcdtlgc    ),
  .regc_fsmc_ch4_srcdtlgc     (regc_fsmc_ch4_srcdtlgc    ),
  .regc_fsmc_ch5_srcdtlgc     (regc_fsmc_ch5_srcdtlgc    ),
  .regc_fsmc_ch6_srcdtlgc     (regc_fsmc_ch6_srcdtlgc    ),
  .regc_fsmc_ch7_srcdtlgc     (regc_fsmc_ch7_srcdtlgc    ),
  .regc_fsmc_ch8_srcdtlgc     (regc_fsmc_ch8_srcdtlgc    ),
  .regc_fsmc_ch9_srcdtlgc     (regc_fsmc_ch9_srcdtlgc    ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata                   (s_hrdata                  ),
  .s_hready                   (s_hready                  ),
  .s_hresp                    (s_hresp                   ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
arb_ctrl  x_arb_ctrl (
  .arb_bmux_transvld  (arb_bmux_transvld ),
  .arb_bmux_trgvld    (arb_bmux_trgvld   ),
  .busy_chn_code      (busy_chn_code     ),
  .ch0c_gbc_chnen     (ch0c_gbc_chnen    ),
  .ch0c_gbc_sfwtrg    (ch0c_gbc_sfwtrg   ),
  .ch0c_gbc_trgclr    (ch0c_gbc_trgclr   ),
  .ch0chgen           (ch0chgen          ),
  .ch10c_gbc_chnen    (ch10c_gbc_chnen   ),
  .ch10c_gbc_sfwtrg   (ch10c_gbc_sfwtrg  ),
  .ch10c_gbc_trgclr   (ch10c_gbc_trgclr  ),
  .ch10chgen          (ch10chgen         ),
  .ch11c_gbc_chnen    (ch11c_gbc_chnen   ),
  .ch11c_gbc_sfwtrg   (ch11c_gbc_sfwtrg  ),
  .ch11c_gbc_trgclr   (ch11c_gbc_trgclr  ),
  .ch11chgen          (ch11chgen         ),
  .ch12c_gbc_chnen    (ch12c_gbc_chnen   ),
  .ch12c_gbc_sfwtrg   (ch12c_gbc_sfwtrg  ),
  .ch12c_gbc_trgclr   (ch12c_gbc_trgclr  ),
  .ch12chgen          (ch12chgen         ),
  .ch13c_gbc_chnen    (ch13c_gbc_chnen   ),
  .ch13c_gbc_sfwtrg   (ch13c_gbc_sfwtrg  ),
  .ch13c_gbc_trgclr   (ch13c_gbc_trgclr  ),
  .ch13chgen          (ch13chgen         ),
  .ch14c_gbc_chnen    (ch14c_gbc_chnen   ),
  .ch14c_gbc_sfwtrg   (ch14c_gbc_sfwtrg  ),
  .ch14c_gbc_trgclr   (ch14c_gbc_trgclr  ),
  .ch14chgen          (ch14chgen         ),
  .ch15c_gbc_chnen    (ch15c_gbc_chnen   ),
  .ch15c_gbc_sfwtrg   (ch15c_gbc_sfwtrg  ),
  .ch15c_gbc_trgclr   (ch15c_gbc_trgclr  ),
  .ch15chgen          (ch15chgen         ),
  .ch1c_gbc_chnen     (ch1c_gbc_chnen    ),
  .ch1c_gbc_sfwtrg    (ch1c_gbc_sfwtrg   ),
  .ch1c_gbc_trgclr    (ch1c_gbc_trgclr   ),
  .ch1chgen           (ch1chgen          ),
  .ch2c_gbc_chnen     (ch2c_gbc_chnen    ),
  .ch2c_gbc_sfwtrg    (ch2c_gbc_sfwtrg   ),
  .ch2c_gbc_trgclr    (ch2c_gbc_trgclr   ),
  .ch2chgen           (ch2chgen          ),
  .ch3c_gbc_chnen     (ch3c_gbc_chnen    ),
  .ch3c_gbc_sfwtrg    (ch3c_gbc_sfwtrg   ),
  .ch3c_gbc_trgclr    (ch3c_gbc_trgclr   ),
  .ch3chgen           (ch3chgen          ),
  .ch4c_gbc_chnen     (ch4c_gbc_chnen    ),
  .ch4c_gbc_sfwtrg    (ch4c_gbc_sfwtrg   ),
  .ch4c_gbc_trgclr    (ch4c_gbc_trgclr   ),
  .ch4chgen           (ch4chgen          ),
  .ch5c_gbc_chnen     (ch5c_gbc_chnen    ),
  .ch5c_gbc_sfwtrg    (ch5c_gbc_sfwtrg   ),
  .ch5c_gbc_trgclr    (ch5c_gbc_trgclr   ),
  .ch5chgen           (ch5chgen          ),
  .ch6c_gbc_chnen     (ch6c_gbc_chnen    ),
  .ch6c_gbc_sfwtrg    (ch6c_gbc_sfwtrg   ),
  .ch6c_gbc_trgclr    (ch6c_gbc_trgclr   ),
  .ch6chgen           (ch6chgen          ),
  .ch7c_gbc_chnen     (ch7c_gbc_chnen    ),
  .ch7c_gbc_sfwtrg    (ch7c_gbc_sfwtrg   ),
  .ch7c_gbc_trgclr    (ch7c_gbc_trgclr   ),
  .ch7chgen           (ch7chgen          ),
  .ch8c_gbc_chnen     (ch8c_gbc_chnen    ),
  .ch8c_gbc_sfwtrg    (ch8c_gbc_sfwtrg   ),
  .ch8c_gbc_trgclr    (ch8c_gbc_trgclr   ),
  .ch8chgen           (ch8chgen          ),
  .ch9c_gbc_chnen     (ch9c_gbc_chnen    ),
  .ch9c_gbc_sfwtrg    (ch9c_gbc_sfwtrg   ),
  .ch9c_gbc_trgclr    (ch9c_gbc_trgclr   ),
  .ch9chgen           (ch9chgen          ),
  .chreq0             (gbc_ch0c_reqvld   ),
  .chreq1             (gbc_ch1c_reqvld   ),
  .chreq10            (gbc_ch10c_reqvld  ),
  .chreq11            (gbc_ch11c_reqvld  ),
  .chreq12            (gbc_ch12c_reqvld  ),
  .chreq13            (gbc_ch13c_reqvld  ),
  .chreq14            (gbc_ch14c_reqvld  ),
  .chreq15            (gbc_ch15c_reqvld  ),
  .chreq2             (gbc_ch2c_reqvld   ),
  .chreq3             (gbc_ch3c_reqvld   ),
  .chreq4             (gbc_ch4c_reqvld   ),
  .chreq5             (gbc_ch5c_reqvld   ),
  .chreq6             (gbc_ch6c_reqvld   ),
  .chreq7             (gbc_ch7c_reqvld   ),
  .chreq8             (gbc_ch8c_reqvld   ),
  .chreq9             (gbc_ch9c_reqvld   ),
  .etb_dmacch0_trg    (etb_dmacch0_trg   ),
  .etb_dmacch10_trg   (etb_dmacch10_trg  ),
  .etb_dmacch11_trg   (etb_dmacch11_trg  ),
  .etb_dmacch12_trg   (etb_dmacch12_trg  ),
  .etb_dmacch13_trg   (etb_dmacch13_trg  ),
  .etb_dmacch14_trg   (etb_dmacch14_trg  ),
  .etb_dmacch15_trg   (etb_dmacch15_trg  ),
  .etb_dmacch1_trg    (etb_dmacch1_trg   ),
  .etb_dmacch2_trg    (etb_dmacch2_trg   ),
  .etb_dmacch3_trg    (etb_dmacch3_trg   ),
  .etb_dmacch4_trg    (etb_dmacch4_trg   ),
  .etb_dmacch5_trg    (etb_dmacch5_trg   ),
  .etb_dmacch6_trg    (etb_dmacch6_trg   ),
  .etb_dmacch7_trg    (etb_dmacch7_trg   ),
  .etb_dmacch8_trg    (etb_dmacch8_trg   ),
  .etb_dmacch9_trg    (etb_dmacch9_trg   ),
  .hclk               (hclk              ),
  .hpreq0             (gbc_ch0c_hpreqvld ),
  .hpreq1             (gbc_ch1c_hpreqvld ),
  .hpreq10            (gbc_ch10c_hpreqvld),
  .hpreq11            (gbc_ch11c_hpreqvld),
  .hpreq12            (gbc_ch12c_hpreqvld),
  .hpreq13            (gbc_ch13c_hpreqvld),
  .hpreq14            (gbc_ch14c_hpreqvld),
  .hpreq15            (gbc_ch15c_hpreqvld),
  .hpreq2             (gbc_ch2c_hpreqvld ),
  .hpreq3             (gbc_ch3c_hpreqvld ),
  .hpreq4             (gbc_ch4c_hpreqvld ),
  .hpreq5             (gbc_ch5c_hpreqvld ),
  .hpreq6             (gbc_ch6c_hpreqvld ),
  .hpreq7             (gbc_ch7c_hpreqvld ),
  .hpreq8             (gbc_ch8c_hpreqvld ),
  .hpreq9             (gbc_ch9c_hpreqvld ),
  .hrst_n             (hrst_n            )
);
ch_ctrl  x_chfsm_ctrl (
  .busy_chn_code              (busy_chn_code             ),
  .ch0_etb_evtdone            (ch0_etb_evtdone           ),
  .ch0_etb_htfrdone           (ch0_etb_htfrdone          ),
  .ch0_etb_tfrdone            (ch0_etb_tfrdone           ),
  .ch0c_gbc_chbsy             (ch0c_gbc_chbsy            ),
  .ch0c_gbc_chnen             (ch0c_gbc_chnen            ),
  .ch0c_gbc_trgclr            (ch0c_gbc_trgclr           ),
  .ch0chgen                   (ch0chgen                  ),
  .ch10_etb_evtdone           (ch10_etb_evtdone          ),
  .ch10_etb_htfrdone          (ch10_etb_htfrdone         ),
  .ch10_etb_tfrdone           (ch10_etb_tfrdone          ),
  .ch10c_gbc_chbsy            (ch10c_gbc_chbsy           ),
  .ch10c_gbc_chnen            (ch10c_gbc_chnen           ),
  .ch10c_gbc_trgclr           (ch10c_gbc_trgclr          ),
  .ch10chgen                  (ch10chgen                 ),
  .ch11_etb_evtdone           (ch11_etb_evtdone          ),
  .ch11_etb_htfrdone          (ch11_etb_htfrdone         ),
  .ch11_etb_tfrdone           (ch11_etb_tfrdone          ),
  .ch11c_gbc_chbsy            (ch11c_gbc_chbsy           ),
  .ch11c_gbc_chnen            (ch11c_gbc_chnen           ),
  .ch11c_gbc_trgclr           (ch11c_gbc_trgclr          ),
  .ch11chgen                  (ch11chgen                 ),
  .ch12_etb_evtdone           (ch12_etb_evtdone          ),
  .ch12_etb_htfrdone          (ch12_etb_htfrdone         ),
  .ch12_etb_tfrdone           (ch12_etb_tfrdone          ),
  .ch12c_gbc_chbsy            (ch12c_gbc_chbsy           ),
  .ch12c_gbc_chnen            (ch12c_gbc_chnen           ),
  .ch12c_gbc_trgclr           (ch12c_gbc_trgclr          ),
  .ch12chgen                  (ch12chgen                 ),
  .ch13_etb_evtdone           (ch13_etb_evtdone          ),
  .ch13_etb_htfrdone          (ch13_etb_htfrdone         ),
  .ch13_etb_tfrdone           (ch13_etb_tfrdone          ),
  .ch13c_gbc_chbsy            (ch13c_gbc_chbsy           ),
  .ch13c_gbc_chnen            (ch13c_gbc_chnen           ),
  .ch13c_gbc_trgclr           (ch13c_gbc_trgclr          ),
  .ch13chgen                  (ch13chgen                 ),
  .ch14_etb_evtdone           (ch14_etb_evtdone          ),
  .ch14_etb_htfrdone          (ch14_etb_htfrdone         ),
  .ch14_etb_tfrdone           (ch14_etb_tfrdone          ),
  .ch14c_gbc_chbsy            (ch14c_gbc_chbsy           ),
  .ch14c_gbc_chnen            (ch14c_gbc_chnen           ),
  .ch14c_gbc_trgclr           (ch14c_gbc_trgclr          ),
  .ch14chgen                  (ch14chgen                 ),
  .ch15_etb_evtdone           (ch15_etb_evtdone          ),
  .ch15_etb_htfrdone          (ch15_etb_htfrdone         ),
  .ch15_etb_tfrdone           (ch15_etb_tfrdone          ),
  .ch15c_gbc_chbsy            (ch15c_gbc_chbsy           ),
  .ch15c_gbc_chnen            (ch15c_gbc_chnen           ),
  .ch15c_gbc_trgclr           (ch15c_gbc_trgclr          ),
  .ch15chgen                  (ch15chgen                 ),
  .ch1_etb_evtdone            (ch1_etb_evtdone           ),
  .ch1_etb_htfrdone           (ch1_etb_htfrdone          ),
  .ch1_etb_tfrdone            (ch1_etb_tfrdone           ),
  .ch1c_gbc_chbsy             (ch1c_gbc_chbsy            ),
  .ch1c_gbc_chnen             (ch1c_gbc_chnen            ),
  .ch1c_gbc_trgclr            (ch1c_gbc_trgclr           ),
  .ch1chgen                   (ch1chgen                  ),
  .ch2_etb_evtdone            (ch2_etb_evtdone           ),
  .ch2_etb_htfrdone           (ch2_etb_htfrdone          ),
  .ch2_etb_tfrdone            (ch2_etb_tfrdone           ),
  .ch2c_gbc_chbsy             (ch2c_gbc_chbsy            ),
  .ch2c_gbc_chnen             (ch2c_gbc_chnen            ),
  .ch2c_gbc_trgclr            (ch2c_gbc_trgclr           ),
  .ch2chgen                   (ch2chgen                  ),
  .ch3_etb_evtdone            (ch3_etb_evtdone           ),
  .ch3_etb_htfrdone           (ch3_etb_htfrdone          ),
  .ch3_etb_tfrdone            (ch3_etb_tfrdone           ),
  .ch3c_gbc_chbsy             (ch3c_gbc_chbsy            ),
  .ch3c_gbc_chnen             (ch3c_gbc_chnen            ),
  .ch3c_gbc_trgclr            (ch3c_gbc_trgclr           ),
  .ch3chgen                   (ch3chgen                  ),
  .ch4_etb_evtdone            (ch4_etb_evtdone           ),
  .ch4_etb_htfrdone           (ch4_etb_htfrdone          ),
  .ch4_etb_tfrdone            (ch4_etb_tfrdone           ),
  .ch4c_gbc_chbsy             (ch4c_gbc_chbsy            ),
  .ch4c_gbc_chnen             (ch4c_gbc_chnen            ),
  .ch4c_gbc_trgclr            (ch4c_gbc_trgclr           ),
  .ch4chgen                   (ch4chgen                  ),
  .ch5_etb_evtdone            (ch5_etb_evtdone           ),
  .ch5_etb_htfrdone           (ch5_etb_htfrdone          ),
  .ch5_etb_tfrdone            (ch5_etb_tfrdone           ),
  .ch5c_gbc_chbsy             (ch5c_gbc_chbsy            ),
  .ch5c_gbc_chnen             (ch5c_gbc_chnen            ),
  .ch5c_gbc_trgclr            (ch5c_gbc_trgclr           ),
  .ch5chgen                   (ch5chgen                  ),
  .ch6_etb_evtdone            (ch6_etb_evtdone           ),
  .ch6_etb_htfrdone           (ch6_etb_htfrdone          ),
  .ch6_etb_tfrdone            (ch6_etb_tfrdone           ),
  .ch6c_gbc_chbsy             (ch6c_gbc_chbsy            ),
  .ch6c_gbc_chnen             (ch6c_gbc_chnen            ),
  .ch6c_gbc_trgclr            (ch6c_gbc_trgclr           ),
  .ch6chgen                   (ch6chgen                  ),
  .ch7_etb_evtdone            (ch7_etb_evtdone           ),
  .ch7_etb_htfrdone           (ch7_etb_htfrdone          ),
  .ch7_etb_tfrdone            (ch7_etb_tfrdone           ),
  .ch7c_gbc_chbsy             (ch7c_gbc_chbsy            ),
  .ch7c_gbc_chnen             (ch7c_gbc_chnen            ),
  .ch7c_gbc_trgclr            (ch7c_gbc_trgclr           ),
  .ch7chgen                   (ch7chgen                  ),
  .ch8_etb_evtdone            (ch8_etb_evtdone           ),
  .ch8_etb_htfrdone           (ch8_etb_htfrdone          ),
  .ch8_etb_tfrdone            (ch8_etb_tfrdone           ),
  .ch8c_gbc_chbsy             (ch8c_gbc_chbsy            ),
  .ch8c_gbc_chnen             (ch8c_gbc_chnen            ),
  .ch8c_gbc_trgclr            (ch8c_gbc_trgclr           ),
  .ch8chgen                   (ch8chgen                  ),
  .ch9_etb_evtdone            (ch9_etb_evtdone           ),
  .ch9_etb_htfrdone           (ch9_etb_htfrdone          ),
  .ch9_etb_tfrdone            (ch9_etb_tfrdone           ),
  .ch9c_gbc_chbsy             (ch9c_gbc_chbsy            ),
  .ch9c_gbc_chnen             (ch9c_gbc_chnen            ),
  .ch9c_gbc_trgclr            (ch9c_gbc_trgclr           ),
  .ch9chgen                   (ch9chgen                  ),
  .chregc0_fsmc_block_tl      (chregc0_fsmc_block_tl     ),
  .chregc0_fsmc_chintmdc      (chregc0_fsmc_chintmdc     ),
  .chregc0_fsmc_darn          (chregc0_fsmc_darn         ),
  .chregc0_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc    ),
  .chregc0_fsmc_dinc          (chregc0_fsmc_dinc         ),
  .chregc0_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width ),
  .chregc0_fsmc_endlan        (chregc0_fsmc_endlan       ),
  .chregc0_fsmc_group_len     (chregc0_fsmc_group_len    ),
  .chregc0_fsmc_grpmc         (chregc0_fsmc_grpmc        ),
  .chregc0_fsmc_protctl       (chregc0_fsmc_protctl      ),
  .chregc0_fsmc_sarn          (chregc0_fsmc_sarn         ),
  .chregc0_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc    ),
  .chregc0_fsmc_sinc          (chregc0_fsmc_sinc         ),
  .chregc0_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width ),
  .chregc0_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc      ),
  .chregc10_fsmc_block_tl     (chregc10_fsmc_block_tl    ),
  .chregc10_fsmc_chintmdc     (chregc10_fsmc_chintmdc    ),
  .chregc10_fsmc_darn         (chregc10_fsmc_darn        ),
  .chregc10_fsmc_dgrpaddrc    (chregc10_fsmc_dgrpaddrc   ),
  .chregc10_fsmc_dinc         (chregc10_fsmc_dinc        ),
  .chregc10_fsmc_dst_tr_width (chregc10_fsmc_dst_tr_width),
  .chregc10_fsmc_endlan       (chregc10_fsmc_endlan      ),
  .chregc10_fsmc_group_len    (chregc10_fsmc_group_len   ),
  .chregc10_fsmc_grpmc        (chregc10_fsmc_grpmc       ),
  .chregc10_fsmc_protctl      (chregc10_fsmc_protctl     ),
  .chregc10_fsmc_sarn         (chregc10_fsmc_sarn        ),
  .chregc10_fsmc_sgrpaddrc    (chregc10_fsmc_sgrpaddrc   ),
  .chregc10_fsmc_sinc         (chregc10_fsmc_sinc        ),
  .chregc10_fsmc_src_tr_width (chregc10_fsmc_src_tr_width),
  .chregc10_fsmc_trgtmdc      (chregc10_fsmc_trgtmdc     ),
  .chregc11_fsmc_block_tl     (chregc11_fsmc_block_tl    ),
  .chregc11_fsmc_chintmdc     (chregc11_fsmc_chintmdc    ),
  .chregc11_fsmc_darn         (chregc11_fsmc_darn        ),
  .chregc11_fsmc_dgrpaddrc    (chregc11_fsmc_dgrpaddrc   ),
  .chregc11_fsmc_dinc         (chregc11_fsmc_dinc        ),
  .chregc11_fsmc_dst_tr_width (chregc11_fsmc_dst_tr_width),
  .chregc11_fsmc_endlan       (chregc11_fsmc_endlan      ),
  .chregc11_fsmc_group_len    (chregc11_fsmc_group_len   ),
  .chregc11_fsmc_grpmc        (chregc11_fsmc_grpmc       ),
  .chregc11_fsmc_protctl      (chregc11_fsmc_protctl     ),
  .chregc11_fsmc_sarn         (chregc11_fsmc_sarn        ),
  .chregc11_fsmc_sgrpaddrc    (chregc11_fsmc_sgrpaddrc   ),
  .chregc11_fsmc_sinc         (chregc11_fsmc_sinc        ),
  .chregc11_fsmc_src_tr_width (chregc11_fsmc_src_tr_width),
  .chregc11_fsmc_trgtmdc      (chregc11_fsmc_trgtmdc     ),
  .chregc12_fsmc_block_tl     (chregc12_fsmc_block_tl    ),
  .chregc12_fsmc_chintmdc     (chregc12_fsmc_chintmdc    ),
  .chregc12_fsmc_darn         (chregc12_fsmc_darn        ),
  .chregc12_fsmc_dgrpaddrc    (chregc12_fsmc_dgrpaddrc   ),
  .chregc12_fsmc_dinc         (chregc12_fsmc_dinc        ),
  .chregc12_fsmc_dst_tr_width (chregc12_fsmc_dst_tr_width),
  .chregc12_fsmc_endlan       (chregc12_fsmc_endlan      ),
  .chregc12_fsmc_group_len    (chregc12_fsmc_group_len   ),
  .chregc12_fsmc_grpmc        (chregc12_fsmc_grpmc       ),
  .chregc12_fsmc_protctl      (chregc12_fsmc_protctl     ),
  .chregc12_fsmc_sarn         (chregc12_fsmc_sarn        ),
  .chregc12_fsmc_sgrpaddrc    (chregc12_fsmc_sgrpaddrc   ),
  .chregc12_fsmc_sinc         (chregc12_fsmc_sinc        ),
  .chregc12_fsmc_src_tr_width (chregc12_fsmc_src_tr_width),
  .chregc12_fsmc_trgtmdc      (chregc12_fsmc_trgtmdc     ),
  .chregc13_fsmc_block_tl     (chregc13_fsmc_block_tl    ),
  .chregc13_fsmc_chintmdc     (chregc13_fsmc_chintmdc    ),
  .chregc13_fsmc_darn         (chregc13_fsmc_darn        ),
  .chregc13_fsmc_dgrpaddrc    (chregc13_fsmc_dgrpaddrc   ),
  .chregc13_fsmc_dinc         (chregc13_fsmc_dinc        ),
  .chregc13_fsmc_dst_tr_width (chregc13_fsmc_dst_tr_width),
  .chregc13_fsmc_endlan       (chregc13_fsmc_endlan      ),
  .chregc13_fsmc_group_len    (chregc13_fsmc_group_len   ),
  .chregc13_fsmc_grpmc        (chregc13_fsmc_grpmc       ),
  .chregc13_fsmc_protctl      (chregc13_fsmc_protctl     ),
  .chregc13_fsmc_sarn         (chregc13_fsmc_sarn        ),
  .chregc13_fsmc_sgrpaddrc    (chregc13_fsmc_sgrpaddrc   ),
  .chregc13_fsmc_sinc         (chregc13_fsmc_sinc        ),
  .chregc13_fsmc_src_tr_width (chregc13_fsmc_src_tr_width),
  .chregc13_fsmc_trgtmdc      (chregc13_fsmc_trgtmdc     ),
  .chregc14_fsmc_block_tl     (chregc14_fsmc_block_tl    ),
  .chregc14_fsmc_chintmdc     (chregc14_fsmc_chintmdc    ),
  .chregc14_fsmc_darn         (chregc14_fsmc_darn        ),
  .chregc14_fsmc_dgrpaddrc    (chregc14_fsmc_dgrpaddrc   ),
  .chregc14_fsmc_dinc         (chregc14_fsmc_dinc        ),
  .chregc14_fsmc_dst_tr_width (chregc14_fsmc_dst_tr_width),
  .chregc14_fsmc_endlan       (chregc14_fsmc_endlan      ),
  .chregc14_fsmc_group_len    (chregc14_fsmc_group_len   ),
  .chregc14_fsmc_grpmc        (chregc14_fsmc_grpmc       ),
  .chregc14_fsmc_protctl      (chregc14_fsmc_protctl     ),
  .chregc14_fsmc_sarn         (chregc14_fsmc_sarn        ),
  .chregc14_fsmc_sgrpaddrc    (chregc14_fsmc_sgrpaddrc   ),
  .chregc14_fsmc_sinc         (chregc14_fsmc_sinc        ),
  .chregc14_fsmc_src_tr_width (chregc14_fsmc_src_tr_width),
  .chregc14_fsmc_trgtmdc      (chregc14_fsmc_trgtmdc     ),
  .chregc15_fsmc_block_tl     (chregc15_fsmc_block_tl    ),
  .chregc15_fsmc_chintmdc     (chregc15_fsmc_chintmdc    ),
  .chregc15_fsmc_darn         (chregc15_fsmc_darn        ),
  .chregc15_fsmc_dgrpaddrc    (chregc15_fsmc_dgrpaddrc   ),
  .chregc15_fsmc_dinc         (chregc15_fsmc_dinc        ),
  .chregc15_fsmc_dst_tr_width (chregc15_fsmc_dst_tr_width),
  .chregc15_fsmc_endlan       (chregc15_fsmc_endlan      ),
  .chregc15_fsmc_group_len    (chregc15_fsmc_group_len   ),
  .chregc15_fsmc_grpmc        (chregc15_fsmc_grpmc       ),
  .chregc15_fsmc_protctl      (chregc15_fsmc_protctl     ),
  .chregc15_fsmc_sarn         (chregc15_fsmc_sarn        ),
  .chregc15_fsmc_sgrpaddrc    (chregc15_fsmc_sgrpaddrc   ),
  .chregc15_fsmc_sinc         (chregc15_fsmc_sinc        ),
  .chregc15_fsmc_src_tr_width (chregc15_fsmc_src_tr_width),
  .chregc15_fsmc_trgtmdc      (chregc15_fsmc_trgtmdc     ),
  .chregc1_fsmc_block_tl      (chregc1_fsmc_block_tl     ),
  .chregc1_fsmc_chintmdc      (chregc1_fsmc_chintmdc     ),
  .chregc1_fsmc_darn          (chregc1_fsmc_darn         ),
  .chregc1_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc    ),
  .chregc1_fsmc_dinc          (chregc1_fsmc_dinc         ),
  .chregc1_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width ),
  .chregc1_fsmc_endlan        (chregc1_fsmc_endlan       ),
  .chregc1_fsmc_group_len     (chregc1_fsmc_group_len    ),
  .chregc1_fsmc_grpmc         (chregc1_fsmc_grpmc        ),
  .chregc1_fsmc_protctl       (chregc1_fsmc_protctl      ),
  .chregc1_fsmc_sarn          (chregc1_fsmc_sarn         ),
  .chregc1_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc    ),
  .chregc1_fsmc_sinc          (chregc1_fsmc_sinc         ),
  .chregc1_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width ),
  .chregc1_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc      ),
  .chregc2_fsmc_block_tl      (chregc2_fsmc_block_tl     ),
  .chregc2_fsmc_chintmdc      (chregc2_fsmc_chintmdc     ),
  .chregc2_fsmc_darn          (chregc2_fsmc_darn         ),
  .chregc2_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc    ),
  .chregc2_fsmc_dinc          (chregc2_fsmc_dinc         ),
  .chregc2_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width ),
  .chregc2_fsmc_endlan        (chregc2_fsmc_endlan       ),
  .chregc2_fsmc_group_len     (chregc2_fsmc_group_len    ),
  .chregc2_fsmc_grpmc         (chregc2_fsmc_grpmc        ),
  .chregc2_fsmc_protctl       (chregc2_fsmc_protctl      ),
  .chregc2_fsmc_sarn          (chregc2_fsmc_sarn         ),
  .chregc2_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc    ),
  .chregc2_fsmc_sinc          (chregc2_fsmc_sinc         ),
  .chregc2_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width ),
  .chregc2_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc      ),
  .chregc3_fsmc_block_tl      (chregc3_fsmc_block_tl     ),
  .chregc3_fsmc_chintmdc      (chregc3_fsmc_chintmdc     ),
  .chregc3_fsmc_darn          (chregc3_fsmc_darn         ),
  .chregc3_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc    ),
  .chregc3_fsmc_dinc          (chregc3_fsmc_dinc         ),
  .chregc3_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width ),
  .chregc3_fsmc_endlan        (chregc3_fsmc_endlan       ),
  .chregc3_fsmc_group_len     (chregc3_fsmc_group_len    ),
  .chregc3_fsmc_grpmc         (chregc3_fsmc_grpmc        ),
  .chregc3_fsmc_protctl       (chregc3_fsmc_protctl      ),
  .chregc3_fsmc_sarn          (chregc3_fsmc_sarn         ),
  .chregc3_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc    ),
  .chregc3_fsmc_sinc          (chregc3_fsmc_sinc         ),
  .chregc3_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width ),
  .chregc3_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc      ),
  .chregc4_fsmc_block_tl      (chregc4_fsmc_block_tl     ),
  .chregc4_fsmc_chintmdc      (chregc4_fsmc_chintmdc     ),
  .chregc4_fsmc_darn          (chregc4_fsmc_darn         ),
  .chregc4_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc    ),
  .chregc4_fsmc_dinc          (chregc4_fsmc_dinc         ),
  .chregc4_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width ),
  .chregc4_fsmc_endlan        (chregc4_fsmc_endlan       ),
  .chregc4_fsmc_group_len     (chregc4_fsmc_group_len    ),
  .chregc4_fsmc_grpmc         (chregc4_fsmc_grpmc        ),
  .chregc4_fsmc_protctl       (chregc4_fsmc_protctl      ),
  .chregc4_fsmc_sarn          (chregc4_fsmc_sarn         ),
  .chregc4_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc    ),
  .chregc4_fsmc_sinc          (chregc4_fsmc_sinc         ),
  .chregc4_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width ),
  .chregc4_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc      ),
  .chregc5_fsmc_block_tl      (chregc5_fsmc_block_tl     ),
  .chregc5_fsmc_chintmdc      (chregc5_fsmc_chintmdc     ),
  .chregc5_fsmc_darn          (chregc5_fsmc_darn         ),
  .chregc5_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc    ),
  .chregc5_fsmc_dinc          (chregc5_fsmc_dinc         ),
  .chregc5_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width ),
  .chregc5_fsmc_endlan        (chregc5_fsmc_endlan       ),
  .chregc5_fsmc_group_len     (chregc5_fsmc_group_len    ),
  .chregc5_fsmc_grpmc         (chregc5_fsmc_grpmc        ),
  .chregc5_fsmc_protctl       (chregc5_fsmc_protctl      ),
  .chregc5_fsmc_sarn          (chregc5_fsmc_sarn         ),
  .chregc5_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc    ),
  .chregc5_fsmc_sinc          (chregc5_fsmc_sinc         ),
  .chregc5_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width ),
  .chregc5_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc      ),
  .chregc6_fsmc_block_tl      (chregc6_fsmc_block_tl     ),
  .chregc6_fsmc_chintmdc      (chregc6_fsmc_chintmdc     ),
  .chregc6_fsmc_darn          (chregc6_fsmc_darn         ),
  .chregc6_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc    ),
  .chregc6_fsmc_dinc          (chregc6_fsmc_dinc         ),
  .chregc6_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width ),
  .chregc6_fsmc_endlan        (chregc6_fsmc_endlan       ),
  .chregc6_fsmc_group_len     (chregc6_fsmc_group_len    ),
  .chregc6_fsmc_grpmc         (chregc6_fsmc_grpmc        ),
  .chregc6_fsmc_protctl       (chregc6_fsmc_protctl      ),
  .chregc6_fsmc_sarn          (chregc6_fsmc_sarn         ),
  .chregc6_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc    ),
  .chregc6_fsmc_sinc          (chregc6_fsmc_sinc         ),
  .chregc6_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width ),
  .chregc6_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc      ),
  .chregc7_fsmc_block_tl      (chregc7_fsmc_block_tl     ),
  .chregc7_fsmc_chintmdc      (chregc7_fsmc_chintmdc     ),
  .chregc7_fsmc_darn          (chregc7_fsmc_darn         ),
  .chregc7_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc    ),
  .chregc7_fsmc_dinc          (chregc7_fsmc_dinc         ),
  .chregc7_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width ),
  .chregc7_fsmc_endlan        (chregc7_fsmc_endlan       ),
  .chregc7_fsmc_group_len     (chregc7_fsmc_group_len    ),
  .chregc7_fsmc_grpmc         (chregc7_fsmc_grpmc        ),
  .chregc7_fsmc_protctl       (chregc7_fsmc_protctl      ),
  .chregc7_fsmc_sarn          (chregc7_fsmc_sarn         ),
  .chregc7_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc    ),
  .chregc7_fsmc_sinc          (chregc7_fsmc_sinc         ),
  .chregc7_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width ),
  .chregc7_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc      ),
  .chregc8_fsmc_block_tl      (chregc8_fsmc_block_tl     ),
  .chregc8_fsmc_chintmdc      (chregc8_fsmc_chintmdc     ),
  .chregc8_fsmc_darn          (chregc8_fsmc_darn         ),
  .chregc8_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc    ),
  .chregc8_fsmc_dinc          (chregc8_fsmc_dinc         ),
  .chregc8_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width ),
  .chregc8_fsmc_endlan        (chregc8_fsmc_endlan       ),
  .chregc8_fsmc_group_len     (chregc8_fsmc_group_len    ),
  .chregc8_fsmc_grpmc         (chregc8_fsmc_grpmc        ),
  .chregc8_fsmc_protctl       (chregc8_fsmc_protctl      ),
  .chregc8_fsmc_sarn          (chregc8_fsmc_sarn         ),
  .chregc8_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc    ),
  .chregc8_fsmc_sinc          (chregc8_fsmc_sinc         ),
  .chregc8_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width ),
  .chregc8_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc      ),
  .chregc9_fsmc_block_tl      (chregc9_fsmc_block_tl     ),
  .chregc9_fsmc_chintmdc      (chregc9_fsmc_chintmdc     ),
  .chregc9_fsmc_darn          (chregc9_fsmc_darn         ),
  .chregc9_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc    ),
  .chregc9_fsmc_dinc          (chregc9_fsmc_dinc         ),
  .chregc9_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width ),
  .chregc9_fsmc_endlan        (chregc9_fsmc_endlan       ),
  .chregc9_fsmc_group_len     (chregc9_fsmc_group_len    ),
  .chregc9_fsmc_grpmc         (chregc9_fsmc_grpmc        ),
  .chregc9_fsmc_protctl       (chregc9_fsmc_protctl      ),
  .chregc9_fsmc_sarn          (chregc9_fsmc_sarn         ),
  .chregc9_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc    ),
  .chregc9_fsmc_sinc          (chregc9_fsmc_sinc         ),
  .chregc9_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width ),
  .chregc9_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc      ),
  .fsmc_chregc0_err_vld       (fsmc_chregc0_err_vld      ),
  .fsmc_chregc0_htfr_vld      (fsmc_chregc0_htfr_vld     ),
  .fsmc_chregc0_tfr_vld       (fsmc_chregc0_tfr_vld      ),
  .fsmc_chregc0_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld ),
  .fsmc_chregc10_err_vld      (fsmc_chregc10_err_vld     ),
  .fsmc_chregc10_htfr_vld     (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc10_tfr_vld      (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc10_trgetcmp_vld (fsmc_chregc10_trgetcmp_vld),
  .fsmc_chregc11_err_vld      (fsmc_chregc11_err_vld     ),
  .fsmc_chregc11_htfr_vld     (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc11_tfr_vld      (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc11_trgetcmp_vld (fsmc_chregc11_trgetcmp_vld),
  .fsmc_chregc12_err_vld      (fsmc_chregc12_err_vld     ),
  .fsmc_chregc12_htfr_vld     (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc12_tfr_vld      (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc12_trgetcmp_vld (fsmc_chregc12_trgetcmp_vld),
  .fsmc_chregc13_err_vld      (fsmc_chregc13_err_vld     ),
  .fsmc_chregc13_htfr_vld     (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc13_tfr_vld      (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc13_trgetcmp_vld (fsmc_chregc13_trgetcmp_vld),
  .fsmc_chregc14_err_vld      (fsmc_chregc14_err_vld     ),
  .fsmc_chregc14_htfr_vld     (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc14_tfr_vld      (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc14_trgetcmp_vld (fsmc_chregc14_trgetcmp_vld),
  .fsmc_chregc15_err_vld      (fsmc_chregc15_err_vld     ),
  .fsmc_chregc15_htfr_vld     (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc15_tfr_vld      (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc15_trgetcmp_vld (fsmc_chregc15_trgetcmp_vld),
  .fsmc_chregc1_err_vld       (fsmc_chregc1_err_vld      ),
  .fsmc_chregc1_htfr_vld      (fsmc_chregc1_htfr_vld     ),
  .fsmc_chregc1_tfr_vld       (fsmc_chregc1_tfr_vld      ),
  .fsmc_chregc1_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld ),
  .fsmc_chregc2_err_vld       (fsmc_chregc2_err_vld      ),
  .fsmc_chregc2_htfr_vld      (fsmc_chregc2_htfr_vld     ),
  .fsmc_chregc2_tfr_vld       (fsmc_chregc2_tfr_vld      ),
  .fsmc_chregc2_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld ),
  .fsmc_chregc3_err_vld       (fsmc_chregc3_err_vld      ),
  .fsmc_chregc3_htfr_vld      (fsmc_chregc3_htfr_vld     ),
  .fsmc_chregc3_tfr_vld       (fsmc_chregc3_tfr_vld      ),
  .fsmc_chregc3_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld ),
  .fsmc_chregc4_err_vld       (fsmc_chregc4_err_vld      ),
  .fsmc_chregc4_htfr_vld      (fsmc_chregc4_htfr_vld     ),
  .fsmc_chregc4_tfr_vld       (fsmc_chregc4_tfr_vld      ),
  .fsmc_chregc4_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld ),
  .fsmc_chregc5_err_vld       (fsmc_chregc5_err_vld      ),
  .fsmc_chregc5_htfr_vld      (fsmc_chregc5_htfr_vld     ),
  .fsmc_chregc5_tfr_vld       (fsmc_chregc5_tfr_vld      ),
  .fsmc_chregc5_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld ),
  .fsmc_chregc6_err_vld       (fsmc_chregc6_err_vld      ),
  .fsmc_chregc6_htfr_vld      (fsmc_chregc6_htfr_vld     ),
  .fsmc_chregc6_tfr_vld       (fsmc_chregc6_tfr_vld      ),
  .fsmc_chregc6_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld ),
  .fsmc_chregc7_err_vld       (fsmc_chregc7_err_vld      ),
  .fsmc_chregc7_htfr_vld      (fsmc_chregc7_htfr_vld     ),
  .fsmc_chregc7_tfr_vld       (fsmc_chregc7_tfr_vld      ),
  .fsmc_chregc7_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld ),
  .fsmc_chregc8_err_vld       (fsmc_chregc8_err_vld      ),
  .fsmc_chregc8_htfr_vld      (fsmc_chregc8_htfr_vld     ),
  .fsmc_chregc8_tfr_vld       (fsmc_chregc8_tfr_vld      ),
  .fsmc_chregc8_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld ),
  .fsmc_chregc9_err_vld       (fsmc_chregc9_err_vld      ),
  .fsmc_chregc9_htfr_vld      (fsmc_chregc9_htfr_vld     ),
  .fsmc_chregc9_tfr_vld       (fsmc_chregc9_tfr_vld      ),
  .fsmc_chregc9_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld ),
  .fsmc_chregc_pdvld_ch0      (fsmc_chregc_pdvld_ch0     ),
  .fsmc_chregc_pdvld_ch1      (fsmc_chregc_pdvld_ch1     ),
  .fsmc_chregc_pdvld_ch10     (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_pdvld_ch11     (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_pdvld_ch12     (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_pdvld_ch13     (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_pdvld_ch14     (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_pdvld_ch15     (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_pdvld_ch2      (fsmc_chregc_pdvld_ch2     ),
  .fsmc_chregc_pdvld_ch3      (fsmc_chregc_pdvld_ch3     ),
  .fsmc_chregc_pdvld_ch4      (fsmc_chregc_pdvld_ch4     ),
  .fsmc_chregc_pdvld_ch5      (fsmc_chregc_pdvld_ch5     ),
  .fsmc_chregc_pdvld_ch6      (fsmc_chregc_pdvld_ch6     ),
  .fsmc_chregc_pdvld_ch7      (fsmc_chregc_pdvld_ch7     ),
  .fsmc_chregc_pdvld_ch8      (fsmc_chregc_pdvld_ch8     ),
  .fsmc_chregc_pdvld_ch9      (fsmc_chregc_pdvld_ch9     ),
  .fsmc_regc_ch0en_clr        (fsmc_regc_ch0en_clr       ),
  .fsmc_regc_ch10en_clr       (fsmc_regc_ch10en_clr      ),
  .fsmc_regc_ch11en_clr       (fsmc_regc_ch11en_clr      ),
  .fsmc_regc_ch12en_clr       (fsmc_regc_ch12en_clr      ),
  .fsmc_regc_ch13en_clr       (fsmc_regc_ch13en_clr      ),
  .fsmc_regc_ch14en_clr       (fsmc_regc_ch14en_clr      ),
  .fsmc_regc_ch15en_clr       (fsmc_regc_ch15en_clr      ),
  .fsmc_regc_ch1en_clr        (fsmc_regc_ch1en_clr       ),
  .fsmc_regc_ch2en_clr        (fsmc_regc_ch2en_clr       ),
  .fsmc_regc_ch3en_clr        (fsmc_regc_ch3en_clr       ),
  .fsmc_regc_ch4en_clr        (fsmc_regc_ch4en_clr       ),
  .fsmc_regc_ch5en_clr        (fsmc_regc_ch5en_clr       ),
  .fsmc_regc_ch6en_clr        (fsmc_regc_ch6en_clr       ),
  .fsmc_regc_ch7en_clr        (fsmc_regc_ch7en_clr       ),
  .fsmc_regc_ch8en_clr        (fsmc_regc_ch8en_clr       ),
  .fsmc_regc_ch9en_clr        (fsmc_regc_ch9en_clr       ),
  .gbc_ch0c_hpreqvld          (gbc_ch0c_hpreqvld         ),
  .gbc_ch0c_reqvld            (gbc_ch0c_reqvld           ),
  .gbc_ch10c_hpreqvld         (gbc_ch10c_hpreqvld        ),
  .gbc_ch10c_reqvld           (gbc_ch10c_reqvld          ),
  .gbc_ch11c_hpreqvld         (gbc_ch11c_hpreqvld        ),
  .gbc_ch11c_reqvld           (gbc_ch11c_reqvld          ),
  .gbc_ch12c_hpreqvld         (gbc_ch12c_hpreqvld        ),
  .gbc_ch12c_reqvld           (gbc_ch12c_reqvld          ),
  .gbc_ch13c_hpreqvld         (gbc_ch13c_hpreqvld        ),
  .gbc_ch13c_reqvld           (gbc_ch13c_reqvld          ),
  .gbc_ch14c_hpreqvld         (gbc_ch14c_hpreqvld        ),
  .gbc_ch14c_reqvld           (gbc_ch14c_reqvld          ),
  .gbc_ch15c_hpreqvld         (gbc_ch15c_hpreqvld        ),
  .gbc_ch15c_reqvld           (gbc_ch15c_reqvld          ),
  .gbc_ch1c_hpreqvld          (gbc_ch1c_hpreqvld         ),
  .gbc_ch1c_reqvld            (gbc_ch1c_reqvld           ),
  .gbc_ch2c_hpreqvld          (gbc_ch2c_hpreqvld         ),
  .gbc_ch2c_reqvld            (gbc_ch2c_reqvld           ),
  .gbc_ch3c_hpreqvld          (gbc_ch3c_hpreqvld         ),
  .gbc_ch3c_reqvld            (gbc_ch3c_reqvld           ),
  .gbc_ch4c_hpreqvld          (gbc_ch4c_hpreqvld         ),
  .gbc_ch4c_reqvld            (gbc_ch4c_reqvld           ),
  .gbc_ch5c_hpreqvld          (gbc_ch5c_hpreqvld         ),
  .gbc_ch5c_reqvld            (gbc_ch5c_reqvld           ),
  .gbc_ch6c_hpreqvld          (gbc_ch6c_hpreqvld         ),
  .gbc_ch6c_reqvld            (gbc_ch6c_reqvld           ),
  .gbc_ch7c_hpreqvld          (gbc_ch7c_hpreqvld         ),
  .gbc_ch7c_reqvld            (gbc_ch7c_reqvld           ),
  .gbc_ch8c_hpreqvld          (gbc_ch8c_hpreqvld         ),
  .gbc_ch8c_reqvld            (gbc_ch8c_reqvld           ),
  .gbc_ch9c_hpreqvld          (gbc_ch9c_hpreqvld         ),
  .gbc_ch9c_reqvld            (gbc_ch9c_reqvld           ),
  .gbc_chnc_dmacen            (gbc_chnc_dmacen           ),
  .hclk                       (hclk                      ),
  .hready                     (hready                    ),
  .hrst_n                     (hrst_n                    ),
  .m_addr_ch0                 (m_addr_ch0                ),
  .m_addr_ch1                 (m_addr_ch1                ),
  .m_addr_ch10                (m_addr_ch10               ),
  .m_addr_ch11                (m_addr_ch11               ),
  .m_addr_ch12                (m_addr_ch12               ),
  .m_addr_ch13                (m_addr_ch13               ),
  .m_addr_ch14                (m_addr_ch14               ),
  .m_addr_ch15                (m_addr_ch15               ),
  .m_addr_ch2                 (m_addr_ch2                ),
  .m_addr_ch3                 (m_addr_ch3                ),
  .m_addr_ch4                 (m_addr_ch4                ),
  .m_addr_ch5                 (m_addr_ch5                ),
  .m_addr_ch6                 (m_addr_ch6                ),
  .m_addr_ch7                 (m_addr_ch7                ),
  .m_addr_ch8                 (m_addr_ch8                ),
  .m_addr_ch9                 (m_addr_ch9                ),
  .m_hrdata                   (m_hrdata                  ),
  .m_hresp                    (m_hresp                   ),
  .m_hsize_ch0                (m_hsize_ch0               ),
  .m_hsize_ch1                (m_hsize_ch1               ),
  .m_hsize_ch10               (m_hsize_ch10              ),
  .m_hsize_ch11               (m_hsize_ch11              ),
  .m_hsize_ch12               (m_hsize_ch12              ),
  .m_hsize_ch13               (m_hsize_ch13              ),
  .m_hsize_ch14               (m_hsize_ch14              ),
  .m_hsize_ch15               (m_hsize_ch15              ),
  .m_hsize_ch2                (m_hsize_ch2               ),
  .m_hsize_ch3                (m_hsize_ch3               ),
  .m_hsize_ch4                (m_hsize_ch4               ),
  .m_hsize_ch5                (m_hsize_ch5               ),
  .m_hsize_ch6                (m_hsize_ch6               ),
  .m_hsize_ch7                (m_hsize_ch7               ),
  .m_hsize_ch8                (m_hsize_ch8               ),
  .m_hsize_ch9                (m_hsize_ch9               ),
  .m_hwdata_ch0               (m_hwdata_ch0              ),
  .m_hwdata_ch1               (m_hwdata_ch1              ),
  .m_hwdata_ch10              (m_hwdata_ch10             ),
  .m_hwdata_ch11              (m_hwdata_ch11             ),
  .m_hwdata_ch12              (m_hwdata_ch12             ),
  .m_hwdata_ch13              (m_hwdata_ch13             ),
  .m_hwdata_ch14              (m_hwdata_ch14             ),
  .m_hwdata_ch15              (m_hwdata_ch15             ),
  .m_hwdata_ch2               (m_hwdata_ch2              ),
  .m_hwdata_ch3               (m_hwdata_ch3              ),
  .m_hwdata_ch4               (m_hwdata_ch4              ),
  .m_hwdata_ch5               (m_hwdata_ch5              ),
  .m_hwdata_ch6               (m_hwdata_ch6              ),
  .m_hwdata_ch7               (m_hwdata_ch7              ),
  .m_hwdata_ch8               (m_hwdata_ch8              ),
  .m_hwdata_ch9               (m_hwdata_ch9              ),
  .m_hwrite_ch0               (m_hwrite_ch0              ),
  .m_hwrite_ch1               (m_hwrite_ch1              ),
  .m_hwrite_ch10              (m_hwrite_ch10             ),
  .m_hwrite_ch11              (m_hwrite_ch11             ),
  .m_hwrite_ch12              (m_hwrite_ch12             ),
  .m_hwrite_ch13              (m_hwrite_ch13             ),
  .m_hwrite_ch14              (m_hwrite_ch14             ),
  .m_hwrite_ch15              (m_hwrite_ch15             ),
  .m_hwrite_ch2               (m_hwrite_ch2              ),
  .m_hwrite_ch3               (m_hwrite_ch3              ),
  .m_hwrite_ch4               (m_hwrite_ch4              ),
  .m_hwrite_ch5               (m_hwrite_ch5              ),
  .m_hwrite_ch6               (m_hwrite_ch6              ),
  .m_hwrite_ch7               (m_hwrite_ch7              ),
  .m_hwrite_ch8               (m_hwrite_ch8              ),
  .m_hwrite_ch9               (m_hwrite_ch9              ),
  .m_prot_ch0                 (m_prot_ch0                ),
  .m_prot_ch1                 (m_prot_ch1                ),
  .m_prot_ch10                (m_prot_ch10               ),
  .m_prot_ch11                (m_prot_ch11               ),
  .m_prot_ch12                (m_prot_ch12               ),
  .m_prot_ch13                (m_prot_ch13               ),
  .m_prot_ch14                (m_prot_ch14               ),
  .m_prot_ch15                (m_prot_ch15               ),
  .m_prot_ch2                 (m_prot_ch2                ),
  .m_prot_ch3                 (m_prot_ch3                ),
  .m_prot_ch4                 (m_prot_ch4                ),
  .m_prot_ch5                 (m_prot_ch5                ),
  .m_prot_ch6                 (m_prot_ch6                ),
  .m_prot_ch7                 (m_prot_ch7                ),
  .m_prot_ch8                 (m_prot_ch8                ),
  .m_prot_ch9                 (m_prot_ch9                ),
  .regc_fsmc_ch0_srcdtlgc     (regc_fsmc_ch0_srcdtlgc    ),
  .regc_fsmc_ch10_srcdtlgc    (regc_fsmc_ch10_srcdtlgc   ),
  .regc_fsmc_ch11_srcdtlgc    (regc_fsmc_ch11_srcdtlgc   ),
  .regc_fsmc_ch12_srcdtlgc    (regc_fsmc_ch12_srcdtlgc   ),
  .regc_fsmc_ch13_srcdtlgc    (regc_fsmc_ch13_srcdtlgc   ),
  .regc_fsmc_ch14_srcdtlgc    (regc_fsmc_ch14_srcdtlgc   ),
  .regc_fsmc_ch15_srcdtlgc    (regc_fsmc_ch15_srcdtlgc   ),
  .regc_fsmc_ch1_srcdtlgc     (regc_fsmc_ch1_srcdtlgc    ),
  .regc_fsmc_ch2_srcdtlgc     (regc_fsmc_ch2_srcdtlgc    ),
  .regc_fsmc_ch3_srcdtlgc     (regc_fsmc_ch3_srcdtlgc    ),
  .regc_fsmc_ch4_srcdtlgc     (regc_fsmc_ch4_srcdtlgc    ),
  .regc_fsmc_ch5_srcdtlgc     (regc_fsmc_ch5_srcdtlgc    ),
  .regc_fsmc_ch6_srcdtlgc     (regc_fsmc_ch6_srcdtlgc    ),
  .regc_fsmc_ch7_srcdtlgc     (regc_fsmc_ch7_srcdtlgc    ),
  .regc_fsmc_ch8_srcdtlgc     (regc_fsmc_ch8_srcdtlgc    ),
  .regc_fsmc_ch9_srcdtlgc     (regc_fsmc_ch9_srcdtlgc    )
);
endmodule
module fsmc(
  busy_chn_code_x,
  chn_etb_htfr_done,
  chn_etb_tfr_done,
  chn_etb_trgevt_done,
  chnc_gbc_chbsy,
  chnc_gbc_chnchgen,
  chnc_gbc_chnen,
  chnc_gbc_trgclr,
  chregc_fsmc_block_tl,
  chregc_fsmc_chintmdc,
  chregc_fsmc_darn,
  chregc_fsmc_dgrpaddrc,
  chregc_fsmc_dinc,
  chregc_fsmc_dst_tr_width,
  chregc_fsmc_endlan,
  chregc_fsmc_group_len,
  chregc_fsmc_grpmc,
  chregc_fsmc_protctl,
  chregc_fsmc_sarn,
  chregc_fsmc_sgrpaddrc,
  chregc_fsmc_sinc,
  chregc_fsmc_src_tr_width,
  chregc_fsmc_trgtmdc,
  fsmc_chregc_err_vld,
  fsmc_chregc_htfr_vld,
  fsmc_chregc_pdvld,
  fsmc_chregc_tfr_vld,
  fsmc_chregc_trgetcmp_vld,
  fsmc_regc_chnen_clr,
  gbc_chnc_dmacen,
  gbc_chnc_hpreqvld,
  gbc_chnc_reqvld,
  hclk,
  hrst_n,
  m_addr_chn,
  m_hrdata,
  m_hready,
  m_hresp,
  m_hsize_chn,
  m_hwdata_chn,
  m_hwrite_chn,
  m_prot_chn,
  regc_fsmc_chn_srcdtlgc
);
input           busy_chn_code_x;          
input           chnc_gbc_chnen;           
input   [11:0]  chregc_fsmc_block_tl;     
input   [2 :0]  chregc_fsmc_chintmdc;     
input   [31:0]  chregc_fsmc_darn;         
input           chregc_fsmc_dgrpaddrc;    
input   [1 :0]  chregc_fsmc_dinc;         
input   [1 :0]  chregc_fsmc_dst_tr_width; 
input           chregc_fsmc_endlan;       
input   [5 :0]  chregc_fsmc_group_len;    
input           chregc_fsmc_grpmc;        
input   [3 :0]  chregc_fsmc_protctl;      
input   [31:0]  chregc_fsmc_sarn;         
input           chregc_fsmc_sgrpaddrc;    
input   [1 :0]  chregc_fsmc_sinc;         
input   [1 :0]  chregc_fsmc_src_tr_width; 
input   [1 :0]  chregc_fsmc_trgtmdc;      
input           gbc_chnc_dmacen;          
input           gbc_chnc_hpreqvld;        
input           gbc_chnc_reqvld;          
input           hclk;                     
input           hrst_n;                   
input   [31:0]  m_hrdata;                 
input           m_hready;                 
input   [1 :0]  m_hresp;                  
input           regc_fsmc_chn_srcdtlgc;   
output          chn_etb_htfr_done;        
output          chn_etb_tfr_done;         
output          chn_etb_trgevt_done;      
output          chnc_gbc_chbsy;           
output          chnc_gbc_chnchgen;        
output          chnc_gbc_trgclr;          
output          fsmc_chregc_err_vld;      
output          fsmc_chregc_htfr_vld;     
output          fsmc_chregc_pdvld;        
output          fsmc_chregc_tfr_vld;      
output          fsmc_chregc_trgetcmp_vld; 
output          fsmc_regc_chnen_clr;      
output  [31:0]  m_addr_chn;               
output  [2 :0]  m_hsize_chn;              
output  [31:0]  m_hwdata_chn;             
output          m_hwrite_chn;             
output  [3 :0]  m_prot_chn;               
reg     [31:0]  buffrdata;                
reg     [31:0]  buffrdata_nxt;            
reg             channl_end_st;            
reg             chnc_gbc_pdvld_d0;        
reg     [12:0]  cntr_blk;                 
reg     [5 :0]  cntr_grup;                
reg     [2 :0]  cntr_rdsrc;               
reg     [2 :0]  cntr_rdsrcctrl;           
reg     [2 :0]  cntr_wrdst;               
reg     [2 :0]  cntr_wrdstctrl;           
reg     [31:0]  dst_waddr;                
reg     [31:0]  dst_waddr_nxt;            
reg             fsmc_chregc_htfr_vld_i_d0; 
reg     [4 :0]  hbus_stt;                 
reg     [4 :0]  hbus_stt_nxt;             
reg             latch_rddata;             
reg             latch_wrdata;             
reg     [31:0]  m_hwdata;                 
reg     [7 :0]  rdata_byte;               
reg     [15:0]  rdata_halfw;              
reg     [31:0]  rdata_word;               
reg     [1 :0]  s_data_sel;               
reg     [31:0]  src_raddr;                
reg     [31:0]  src_raddr_nxt;            
reg             trgevent_end_st;          
reg     [7 :0]  wdata_byte;               
reg     [15:0]  wdata_hword;              
wire            blk_evtend;               
wire            blk_nu_eql0;              
wire            blk_nu_last1;             
wire    [12:0]  block_transfer_length;    
wire            busy_chn_code_x;          
wire            cfg_en;                   
wire            channl_end;               
wire    [31:0]  chi_m_addr;               
wire    [2 :0]  chi_m_hsize;              
wire    [31:0]  chi_m_hwdata;             
wire    [3 :0]  chi_m_prot;               
wire            chn_etb_htfr_done;        
wire            chn_etb_tfr_done;         
wire            chn_etb_trgevt_done;      
wire            chnc_gbc_chbsy;           
wire            chnc_gbc_chnchgen;        
wire            chnc_gbc_chnen;           
wire            chnc_gbc_pdvld_nxt;       
wire            chnc_gbc_trgclr;          
wire    [11:0]  chregc_fsmc_block_tl;     
wire    [12:0]  chregc_fsmc_block_tl_plus; 
wire    [2 :0]  chregc_fsmc_chintmdc;     
wire    [31:0]  chregc_fsmc_darn;         
wire    [31:0]  chregc_fsmc_darn_i;       
wire            chregc_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc_fsmc_dinc;         
wire    [1 :0]  chregc_fsmc_dst_tr_width; 
wire            chregc_fsmc_endlan;       
wire    [5 :0]  chregc_fsmc_group_len;    
wire            chregc_fsmc_grpmc;        
wire    [3 :0]  chregc_fsmc_protctl;      
wire    [31:0]  chregc_fsmc_sarn;         
wire    [31:0]  chregc_fsmc_sarn_i;       
wire            chregc_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc_fsmc_sinc;         
wire    [1 :0]  chregc_fsmc_src_tr_width; 
wire    [1 :0]  chregc_fsmc_trgtmdc;      
wire            cntr_blk_decen;           
wire            cntr_blk_rlden;           
wire            cntr_grup_decen;          
wire            cntr_grup_rlden;          
wire            current_rcvvld;           
wire            dec_dst_cntr;             
wire            dec_src_cntr;             
wire            dst_sgl_end;              
wire            dst_single_inten;         
wire    [2 :0]  dst_trbyt;                
wire            dst_wr_1;                 
wire            dst_wr_end;               
wire            dst_wrctrl_cmplt;         
wire            fsmc_chregc_err_vld;      
wire            fsmc_chregc_htfr_vld;     
wire            fsmc_chregc_htfr_vld_i;   
wire            fsmc_chregc_pdvld;        
wire            fsmc_chregc_tfr_vld;      
wire            fsmc_chregc_trgetcmp_vld; 
wire            fsmc_regc_chnen_clr;      
wire            gbc_chnc_dmacen;          
wire            gbc_chnc_hpreqvld;        
wire            gbc_chnc_reqvld;          
wire            group_evtend;             
wire            group_inten;              
wire            grp_nu_eql0;              
wire            grp_nu_last1;             
wire            hclk;                     
wire            hrst_n;                   
wire            is_grpevt;                
wire            is_rd_ctrlstt;            
wire            is_sgl_dst;               
wire            is_sgl_src;               
wire            is_sglevt;                
wire            is_wr_ctrlstt;            
wire            last_wr_transf;           
wire            latch_rddata_en;          
wire            latch_wrdata_en;          
wire    [31:0]  m_addr_chn;               
wire    [31:0]  m_hrdata;                 
wire            m_hready;                 
wire    [1 :0]  m_hresp;                  
wire    [2 :0]  m_hsize_chn;              
wire    [31:0]  m_hwdata_chn;             
wire            m_hwrite_chn;             
wire    [3 :0]  m_prot_chn;               
wire            rd1_sgl_end;              
wire            rd_addr_upen;             
wire            rdmrth1_sgl_end;          
wire            regc_fsmc_chn_srcdtlgc;   
wire            rladen_dst_cntr;          
wire            rladen_dstwctrl_cntr;     
wire            rladen_src_cntr;          
wire            rladen_srcrctrl_cntr;     
wire            sgl_evtend;               
wire            src_rd_1;                 
wire            src_rd_end;               
wire            src_rdctrl_cmplt;         
wire            src_sgl_end;              
wire            src_single_inten;         
wire    [2 :0]  src_trbyt;                
wire            tg_dst_sglevt;            
wire            tg_src_sglevt;            
wire            trgevent_end;             
wire            wr_addr_upen;             
parameter        IDLE_BUS                           =   5'h1  ; 
parameter        WAIT_RRDY_DRADR_BUS                =   5'h2  ; 
parameter        WAIT_RRDY_DWADR_BUS                =   5'h10 ; 
parameter        WAIT_WRDY_DWADR_BUS                =   5'h18 ; 
parameter        WAIT_WRDY_DRADR_BUS                =   5'h4  ; 
assign     src_trbyt[2:0] = (chregc_fsmc_src_tr_width[1:0]==2'b00) ? 3'b001 : 
                            (chregc_fsmc_src_tr_width[1:0]==2'b01) ? 3'b010 : 
                            3'b100 ; 
assign     dst_trbyt[2:0] = (chregc_fsmc_dst_tr_width[1:0]==2'b00) ? 3'b001 : 
                            (chregc_fsmc_dst_tr_width[1:0]==2'b01) ? 3'b010 : 
                            3'b100 ;  
assign     src_rd_1 = ~( src_trbyt[2:0] < dst_trbyt[2:0] ) ;
assign     src_rdctrl_cmplt = ( ~(|cntr_rdsrcctrl[2:0]) );
assign     dst_wr_1         = ~( src_trbyt[2:0] > dst_trbyt[2:0] ) ;
assign     dst_wrctrl_cmplt = ( ~(|cntr_wrdstctrl[2:0]) )  ;    
assign     src_single_inten = (chregc_fsmc_chintmdc[2]) ;
assign     dst_single_inten = (chregc_fsmc_chintmdc[1]) ;
assign     group_inten      = (chregc_fsmc_chintmdc[0]) | dst_single_inten | src_single_inten ;
assign     chi_m_prot[3:0]    =  chregc_fsmc_protctl[3:0] ;
assign     chi_m_hsize[2:0]   =  (is_rd_ctrlstt ) ? {1'b0,chregc_fsmc_src_tr_width[1:0]} : {1'b0,chregc_fsmc_dst_tr_width[1:0]} ; 
assign     chi_m_addr[31:0]   =  is_wr_ctrlstt ? dst_waddr[31:0] : src_raddr[31:0] ;
assign     m_prot_chn[3:0]    =  chi_m_prot[3:0]    ;        
assign     m_hwrite_chn       =  is_wr_ctrlstt      ;     
assign     m_addr_chn[31:0]   =  chi_m_addr[31:0]   ; 
assign     m_hsize_chn[2:0]   =  chi_m_hsize[2:0]   ;      
assign     m_hwdata_chn[31:0] =  chi_m_hwdata[31:0] ;
always @(posedge hclk or negedge hrst_n)
begin
   if(!hrst_n)
      s_data_sel[1:0] <= 2'b0;
   else if(m_hready)
      s_data_sel[1:0] <= chi_m_addr[1:0] ;
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[7:0]   : m_hrdata[31:24] ;
         2'b01  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[15:8]  : m_hrdata[23:16] ;
         2'b10  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[23:16] : m_hrdata[15:8]  ;
         2'b11  : rdata_byte[7:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:24] : m_hrdata[7:0]   ;
         default: rdata_byte[7:0] = 8'h0;
     endcase
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00: rdata_halfw[15:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[15:0]  : {m_hrdata[23:16],m_hrdata[31:24]};
         2'b10: rdata_halfw[15:0] = (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:16] : {m_hrdata[7:0],m_hrdata[15:8]};
         default: rdata_halfw[15:0] = 16'h0;
     endcase
end
always @( m_hrdata[31:0]
       or s_data_sel[1:0]
       or regc_fsmc_chn_srcdtlgc)
begin
     case(s_data_sel[1:0])
         2'b00: rdata_word[31:0] =  (~regc_fsmc_chn_srcdtlgc) ? m_hrdata[31:0] : {m_hrdata[7:0],m_hrdata[15:8],m_hrdata[23:16],m_hrdata[31:24]};
         default: rdata_word[31:0] = 32'h0;
     endcase
end
always @( src_trbyt[2:0]
       or rdata_word[31:0]
       or latch_rddata_en
       or cntr_rdsrc[2:0]
       or rdata_halfw[15:0]
       or buffrdata[31:0]
       or rdata_byte[7:0])
begin
    case(src_trbyt[2:0])
        3'b001 : begin 
             if( (cntr_rdsrc[2:0] ==3'b011) & (latch_rddata_en) )      
                 buffrdata_nxt[31:0] = {24'h0,rdata_byte[7:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b010) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {16'h0,rdata_byte[7:0],buffrdata[7:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b001) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {8'h0,rdata_byte[7:0],buffrdata[15:0]} ;
             else if( (cntr_rdsrc[2:0] ==3'b000) & (latch_rddata_en) ) 
                 buffrdata_nxt[31:0] = {rdata_byte[7:0],buffrdata[23:0]} ;
             else 
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        3'b010 : begin 
             if( (| cntr_rdsrc[2:1]) & (latch_rddata_en) )      
                 buffrdata_nxt[31:0] = {16'h0,rdata_halfw[15:0]} ;
             else if( latch_rddata_en )      
                 buffrdata_nxt[31:0] = {rdata_halfw[15:0],buffrdata[15:0]} ;
             else 
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        3'b100 : begin 
             if(latch_rddata_en)
                 buffrdata_nxt[31:0] = rdata_word[31:0] ;
             else
                 buffrdata_nxt[31:0] = buffrdata[31:0] ;
        end
        default : begin 
             buffrdata_nxt[31:0] = rdata_word[31:0] ;
        end
    endcase
end
always@(posedge  hclk or negedge hrst_n) 
begin
    if(~hrst_n)     begin
        buffrdata[31:0] <= 32'b0 ;
    end
    else    begin
        buffrdata[31:0] <= buffrdata_nxt[31:0] ;
    end
end
always @( buffrdata[15:0]
       or buffrdata[31:16]
       or cntr_wrdst[2:0])
begin
             if( (cntr_wrdst[2:0] ==3'b000)  )      
                 wdata_byte[7:0] = buffrdata[7:0] ;
             else if( (cntr_wrdst[2:0] ==3'b001)  )      
                 wdata_byte[7:0] = buffrdata[15:8] ;
             else if( (cntr_wrdst[2:0] ==3'b010)  )      
                 wdata_byte[7:0] = buffrdata[23:16] ;
             else
                 wdata_byte[7:0] = buffrdata[31:24] ;
end
always @( cntr_wrdst[2:0]
       or buffrdata[31:0])
begin
             if (cntr_wrdst[2:0] ==3'b000)       
                 wdata_hword[15:0] = buffrdata[15:0] ;
             else
                 wdata_hword[15:0] = buffrdata[31:16] ;
end
always @( wdata_hword[15:0]
       or chregc_fsmc_endlan
       or wdata_byte[7:0]
       or buffrdata[31:0]
       or s_data_sel[1:0]
       or dst_trbyt[2:0])
begin
    case(dst_trbyt[2:0])
        3'b001 : begin 
             if(  ( s_data_sel[1:0]==2'b00) & (~chregc_fsmc_endlan) )      
                 m_hwdata[31:0] = {24'h0,wdata_byte[7:0]} ;
             else if(  ( s_data_sel[1:0]==2'b00) & (chregc_fsmc_endlan) )      
                 m_hwdata[31:0] = {wdata_byte[7:0],24'h0} ;
             else if(  ( s_data_sel[1:0]==2'b01) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_byte[7:0],8'h0} ;
             else if(  ( s_data_sel[1:0]==2'b01) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {8'h0,wdata_byte[7:0],16'h0} ;
             else if(  ( s_data_sel[1:0]==2'b10) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {8'h0,wdata_byte[7:0],16'h0} ;
             else if(  ( s_data_sel[1:0]==2'b10) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_byte[7:0],8'h0} ;
             else if(~chregc_fsmc_endlan)
                 m_hwdata[31:0] = {wdata_byte[7:0],24'h0} ;
              else
                 m_hwdata[31:0] = {24'h0,wdata_byte[7:0]} ;
        end
        3'b010 : begin 
             if(  ( s_data_sel[1:0]==2'b00) & (~chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {16'h0,wdata_hword[15:0]} ;
             else if(  ( s_data_sel[1:0]==2'b00) & (chregc_fsmc_endlan)  )      
                 m_hwdata[31:0] = {wdata_hword[7:0],wdata_hword[15:8],16'h0} ;
             else if (~chregc_fsmc_endlan) 
                 m_hwdata[31:0] = {wdata_hword[15:0],16'h0} ;
             else
                 m_hwdata[31:0] = {16'h0,wdata_hword[7:0],wdata_hword[15:8]} ;
        end
        3'b100 : begin 
             if  (~chregc_fsmc_endlan)
                 m_hwdata[31:0] = buffrdata[31:0] ;
             else
                 m_hwdata[31:0] = { buffrdata[7:0],buffrdata[15:8],buffrdata[23:16],buffrdata[31:24]} ;
        end
        default : begin 
             m_hwdata[31:0] = buffrdata[31:0] ;
        end
    endcase
end
assign    chi_m_hwdata[31:0] = m_hwdata[31:0] ;
assign   chregc_fsmc_darn_i[31:0] = (dst_trbyt[2:0]==3'h2) ? {chregc_fsmc_darn[31:1],1'b0} :
                                    (dst_trbyt[2:0]==3'h4) ? {chregc_fsmc_darn[31:2],2'b0} : chregc_fsmc_darn[31:0] ;
assign   wr_addr_upen = is_wr_ctrlstt & current_rcvvld ;
always @( hbus_stt[4:0]
       or dst_waddr[31:0]
       or chregc_fsmc_darn_i[31:0]
       or group_evtend
       or chregc_fsmc_dgrpaddrc
       or chregc_fsmc_dinc[1:0]
       or dst_trbyt[2:0]
       or wr_addr_upen)
begin
    dst_waddr_nxt[31:0] = (hbus_stt[4:0]==IDLE_BUS)                         ? chregc_fsmc_darn_i[31:0]         :
                          group_evtend  & chregc_fsmc_dgrpaddrc             ? chregc_fsmc_darn_i[31:0]         :    
                          chregc_fsmc_dinc[1]                               ? chregc_fsmc_darn_i[31:0]         :    
                          wr_addr_upen  & (chregc_fsmc_dinc[1:0]==2'b00)    ? (dst_waddr[31:0]+dst_trbyt[2:0]) :   
                          wr_addr_upen  & (chregc_fsmc_dinc[1:0]==2'b01)    ? (dst_waddr[31:0]-dst_trbyt[2:0]) :   
                          dst_waddr[31:0] ; 
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        dst_waddr[31:0] <= 32'b0 ;
    end
    else    begin
        dst_waddr[31:0] <= dst_waddr_nxt[31:0] ;
    end
end
assign   chregc_fsmc_sarn_i[31:0] = (src_trbyt[2:0]==3'h2) ? {chregc_fsmc_sarn[31:1],1'b0} :
                                    (src_trbyt[2:0]==3'h4) ? {chregc_fsmc_sarn[31:2],2'b0} : chregc_fsmc_sarn[31:0] ;
assign   rd_addr_upen = is_rd_ctrlstt & current_rcvvld ;
always @( hbus_stt[4:0]
       or chregc_fsmc_sgrpaddrc
       or rd_addr_upen
       or src_trbyt[2:0]
       or group_evtend
       or src_raddr[31:0]
       or current_rcvvld
       or chregc_fsmc_sarn_i[31:0]
       or chregc_fsmc_sinc[1:0])
begin
    src_raddr_nxt[31:0] = (hbus_stt[4:0]==IDLE_BUS) &(~current_rcvvld)        ? chregc_fsmc_sarn_i[31:0]         :
                          group_evtend  & chregc_fsmc_sgrpaddrc               ? chregc_fsmc_sarn_i[31:0]         :    
                          chregc_fsmc_sinc[1]                                 ? chregc_fsmc_sarn_i[31:0]         :    
                          rd_addr_upen  & (chregc_fsmc_sinc[1:0]==2'b00)      ? (src_raddr[31:0]+src_trbyt[2:0]) :
                          rd_addr_upen  & (chregc_fsmc_sinc[1:0]==2'b01)      ? (src_raddr[31:0]-src_trbyt[2:0]) :
                          src_raddr[31:0] ;
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        src_raddr[31:0] <= 32'b0 ;
    end
    else    begin
        src_raddr[31:0] <= src_raddr_nxt[31:0] ;
    end
end
assign   is_sglevt = ( chregc_fsmc_trgtmdc[1:0] == 2'b00 ) ;
assign   is_grpevt = ( chregc_fsmc_trgtmdc[1:0] == 2'b01 ) ;
assign   tg_src_sglevt = is_sglevt &  is_sgl_src ;
assign   tg_dst_sglevt = is_sglevt &  is_sgl_dst ;
assign   is_sgl_src =  chregc_fsmc_grpmc ;
assign   is_sgl_dst = ~chregc_fsmc_grpmc ;
assign   cntr_grup_decen =  ( is_wr_ctrlstt ) & current_rcvvld & ( is_grpevt | group_inten ) ;                     
assign   cntr_grup_rlden =  (hbus_stt[4:0]==IDLE_BUS) | ( ~(|cntr_grup[5:0]) ) & current_rcvvld & (is_wr_ctrlstt) ;  
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_grup[5:0] <= 6'b0 ;
    end
    else  if( cntr_grup_rlden )
        cntr_grup[5:0] <= #1 (chregc_fsmc_group_len[5:0]+1'b1) - dst_trbyt[2:0]  ;
    else if( cntr_grup_decen )
        cntr_grup[5:0] <= #1 cntr_grup[5:0] - dst_trbyt[2:0] ;
end
assign   grp_nu_eql0 = ( ~ (|cntr_grup[5:0]) ) ; 
assign   group_evtend = is_grpevt & grp_nu_eql0 & current_rcvvld & is_wr_ctrlstt ;
assign   rd1_sgl_end     = ( dst_wrctrl_cmplt | dst_wr_1 ) & is_wr_ctrlstt ;
assign   rdmrth1_sgl_end = (~src_rdctrl_cmplt) & is_rd_ctrlstt & (~src_rd_1) ;
assign   src_rd_end      = rd1_sgl_end | rdmrth1_sgl_end ;
assign   src_sgl_end = src_rd_end & current_rcvvld ;
assign   dst_wr_end  = is_wr_ctrlstt ;
assign   dst_sgl_end = dst_wr_end & current_rcvvld ; 
assign   sgl_evtend  =  is_sglevt & (
                        tg_src_sglevt & src_sgl_end  |
                        tg_dst_sglevt & dst_sgl_end    ) ;
assign   cntr_blk_decen = ( is_wr_ctrlstt ) & current_rcvvld & (~blk_nu_eql0) ; //& is_blk_src |  
assign   cntr_blk_rlden = (hbus_stt[4:0]==IDLE_BUS) ;
assign chregc_fsmc_block_tl_plus[12:0] = chregc_fsmc_block_tl[11:0] + 12'b1;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_blk[12:0] <= 13'h1FFF ;
    end
    else  if( cntr_blk_decen  )
        cntr_blk[12:0] <=  cntr_blk[12:0] - dst_trbyt[2:0] ;
    else if( cntr_blk_rlden )
        cntr_blk[12:0] <= chregc_fsmc_block_tl_plus[12:0] - {10'b0,dst_trbyt[2:0]} ;
end
assign   blk_nu_eql0 = ( ~ (|cntr_blk[12:0]) ) ;
assign   blk_nu_last1 =  ( ~ (| (cntr_blk[12:0])) ) & is_wr_ctrlstt;
assign   grp_nu_last1 =  ( ~ (| (cntr_grup[5:0])) ) & is_wr_ctrlstt ; 
assign   blk_evtend = blk_nu_eql0 & current_rcvvld  & is_wr_ctrlstt ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin
         channl_end_st <= 1'b0 ;
    end
    else if(channl_end) begin
         channl_end_st <= 1'b1 ;
    end
    else if(m_hready) begin
         channl_end_st <= 1'b0 ;
    end
end
assign   chn_etb_tfr_done = channl_end_st & m_hready ;
assign   trgevent_end = ( sgl_evtend | group_evtend | blk_evtend )  ;
always@(posedge  hclk or negedge hrst_n)
begin
    if(~hrst_n) begin
         trgevent_end_st <= 1'b0 ;
    end
    else if(trgevent_end) begin
         trgevent_end_st <= 1'b1 ;
    end
    else if(m_hready) begin
         trgevent_end_st <= 1'b0 ;
    end
end
assign   chn_etb_trgevt_done = trgevent_end_st & m_hready ;
assign   channl_end =  blk_evtend  ;
assign   fsmc_regc_chnen_clr = blk_evtend ;
assign   fsmc_chregc_trgetcmp_vld = trgevent_end ;
assign   fsmc_chregc_tfr_vld  = channl_end ;
assign   chnc_gbc_trgclr =  current_rcvvld & ( sgl_evtend | (grp_nu_last1 & is_grpevt)  | blk_nu_last1 ) ;
assign   fsmc_chregc_err_vld  = m_hready & (m_hresp[1:0]==2'b01) ;
assign   block_transfer_length[12:0] = chregc_fsmc_block_tl[11:0] + 1'b1 ;
assign   fsmc_chregc_htfr_vld_i = ( cntr_blk[12:0] < ({block_transfer_length[12:1]}) ) & (~(hbus_stt[4:0]==IDLE_BUS))   ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        fsmc_chregc_htfr_vld_i_d0 <= 1'b0 ;
    end
    else    begin
        fsmc_chregc_htfr_vld_i_d0 <= fsmc_chregc_htfr_vld_i ;
    end
end
assign    fsmc_chregc_htfr_vld = (~fsmc_chregc_htfr_vld_i_d0) & fsmc_chregc_htfr_vld_i ;
assign   chn_etb_htfr_done = fsmc_chregc_htfr_vld ;
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_rdsrc[2:0] <= 3'b0 ;
    end
    else  if( rladen_src_cntr )  
        cntr_rdsrc[2:0] <= 3'h3; 
    else if( latch_rddata_en )
        cntr_rdsrc[2:0] <= cntr_rdsrc[2:0] - src_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_rdsrcctrl[2:0] <= 3'b0 ;
    end
    else  if( rladen_srcrctrl_cntr )  
        cntr_rdsrcctrl[2:0] <= dst_trbyt[2:0] - src_trbyt[2:0] ;
    else if( dec_src_cntr )
        cntr_rdsrcctrl[2:0] <= cntr_rdsrcctrl[2:0] - src_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   
begin
    if(~hrst_n)     begin
        cntr_wrdstctrl[2:0] <= 3'b0 ;
    end
    else  if( rladen_dstwctrl_cntr )  
        cntr_wrdstctrl[2:0] <= src_trbyt[2:0] - dst_trbyt[2:0] ;
    else if( dec_dst_cntr )
        cntr_wrdstctrl[2:0] <= cntr_wrdstctrl[2:0] - dst_trbyt[2:0] ;
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        cntr_wrdst[2:0] <= 3'b0 ;
    end
    else  if( rladen_dst_cntr )   
        cntr_wrdst[2:0] <= 3'h0 ; 
    else if( latch_wrdata_en )
        cntr_wrdst[2:0] <= cntr_wrdst[2:0] + dst_trbyt[2:0] ;
end
assign     chnc_gbc_chnchgen =  m_hready & busy_chn_code_x & (
                               //src_single_inten & is_rd_ctrlstt & current_rcvvld   |     
                               //dst_single_inten & is_wr_ctrlstt & current_rcvvld         
                               (tg_src_sglevt|src_single_inten) & is_rd_ctrlstt   |        
   ((tg_src_sglevt&last_wr_transf)|tg_dst_sglevt|dst_single_inten) & is_wr_ctrlstt         
                                ) | 
                            ( is_grpevt | group_inten )  & grp_nu_last1 & current_rcvvld & last_wr_transf |            
                               blk_nu_last1 & m_hready & current_rcvvld & last_wr_transf       ;                                
assign   last_wr_transf  = ( (dst_wrctrl_cmplt) | dst_wr_1 )  & is_wr_ctrlstt ;
assign     chnc_gbc_pdvld_nxt = ( ~(hbus_stt[4:0] == IDLE_BUS) ) & ( ~gbc_chnc_reqvld ) & ( ~channl_end ); 
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        chnc_gbc_pdvld_d0 <= 1'b0 ;
    end
    else     
        chnc_gbc_pdvld_d0 <= chnc_gbc_pdvld_nxt ;        
end
assign     fsmc_chregc_pdvld = (~chnc_gbc_pdvld_d0) & (chnc_gbc_pdvld_nxt) & gbc_chnc_hpreqvld ;
assign     chnc_gbc_chbsy = ( ~(hbus_stt[4:0] == IDLE_BUS) ) & (  gbc_chnc_reqvld ) ; 
assign     is_wr_ctrlstt = hbus_stt[4];
assign     is_rd_ctrlstt = ~is_wr_ctrlstt ;
assign     rladen_dstwctrl_cntr = is_rd_ctrlstt ;
assign     rladen_srcrctrl_cntr = is_wr_ctrlstt |  (hbus_stt[4:0] == IDLE_BUS) & (~gbc_chnc_reqvld) ;
assign     dec_src_cntr  = is_rd_ctrlstt & current_rcvvld ;                     
assign     dec_dst_cntr  = is_wr_ctrlstt & current_rcvvld ;
assign     rladen_src_cntr =  dec_dst_cntr | (hbus_stt[4:0] == IDLE_BUS)  ;
assign     rladen_dst_cntr =  dec_src_cntr ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        latch_rddata <= 1'b0 ;
    end
    else if(dec_src_cntr)    
        latch_rddata <= 1'b1 ;        
    else if(m_hready)
        latch_rddata <= 1'b0 ;        
end
assign  latch_rddata_en = latch_rddata & m_hready ;
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        latch_wrdata <= 1'b0 ;
    end
    else if(dec_dst_cntr)    
        latch_wrdata <= 1'b1 ;        
    else if(m_hready)
        latch_wrdata <= 1'b0 ;        
end
assign  latch_wrdata_en = latch_wrdata & m_hready ;
assign    current_rcvvld = gbc_chnc_reqvld & m_hready  ;
assign    cfg_en         = chnc_gbc_chnen&gbc_chnc_dmacen ;
always @( dst_wr_1
       or hbus_stt[4:0]
       or src_rdctrl_cmplt
       or channl_end
       or current_rcvvld
       or src_rd_1
       or dst_wrctrl_cmplt
       or cfg_en)
begin
    hbus_stt_nxt[4:0] = hbus_stt[4:0] ;
    case(hbus_stt[4:0])
        IDLE_BUS          :   begin
            if( (current_rcvvld&cfg_en) & src_rd_1  )     
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;  
            else if( current_rcvvld & cfg_en )            
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;  
            else                                          
                hbus_stt_nxt[4:0] = IDLE_BUS ;  
        end    
        WAIT_RRDY_DRADR_BUS :   begin
            if( src_rdctrl_cmplt & current_rcvvld ) 
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;
        end    
        WAIT_RRDY_DWADR_BUS :   begin
            if(channl_end)
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else if( dst_wr_1 & current_rcvvld )          
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
            else if( current_rcvvld )                     
                hbus_stt_nxt[4:0] = WAIT_WRDY_DWADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;
        end    
        WAIT_WRDY_DWADR_BUS :   begin
            if(channl_end)
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else if( dst_wrctrl_cmplt & current_rcvvld  ) 
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_WRDY_DWADR_BUS ;
        end    
        WAIT_WRDY_DRADR_BUS :   begin
            if( current_rcvvld & src_rd_1  )          
                hbus_stt_nxt[4:0] = WAIT_RRDY_DWADR_BUS ;  
            else if( current_rcvvld )                      
                hbus_stt_nxt[4:0] = WAIT_RRDY_DRADR_BUS ;
            else if(~cfg_en) 
                hbus_stt_nxt[4:0] = IDLE_BUS ; 
            else
                hbus_stt_nxt[4:0] = WAIT_WRDY_DRADR_BUS ;
        end    
        default :   begin
            hbus_stt_nxt[4:0] = IDLE_BUS ;
        end    
    endcase
end
always@(posedge  hclk or negedge hrst_n)   begin
    if(~hrst_n)     begin
        hbus_stt[4:0] <= 5'h1 ;
    end
    else    begin
        hbus_stt[4:0] <= hbus_stt_nxt[4:0] ;
    end
end
endmodule
module gbregc(
  ch0c_gbc_chbsy,
  ch0c_gbc_pdvld,
  ch0regc_gbc_chiif,
  ch10c_gbc_chbsy,
  ch10c_gbc_pdvld,
  ch10regc_gbc_chiif,
  ch11c_gbc_chbsy,
  ch11c_gbc_pdvld,
  ch11regc_gbc_chiif,
  ch12c_gbc_chbsy,
  ch12c_gbc_pdvld,
  ch12regc_gbc_chiif,
  ch13c_gbc_chbsy,
  ch13c_gbc_pdvld,
  ch13regc_gbc_chiif,
  ch14c_gbc_chbsy,
  ch14c_gbc_pdvld,
  ch14regc_gbc_chiif,
  ch15c_gbc_chbsy,
  ch15c_gbc_pdvld,
  ch15regc_gbc_chiif,
  ch1c_gbc_chbsy,
  ch1c_gbc_pdvld,
  ch1regc_gbc_chiif,
  ch2c_gbc_chbsy,
  ch2c_gbc_pdvld,
  ch2regc_gbc_chiif,
  ch3c_gbc_chbsy,
  ch3c_gbc_pdvld,
  ch3regc_gbc_chiif,
  ch4c_gbc_chbsy,
  ch4c_gbc_pdvld,
  ch4regc_gbc_chiif,
  ch5c_gbc_chbsy,
  ch5c_gbc_pdvld,
  ch5regc_gbc_chiif,
  ch6c_gbc_chbsy,
  ch6c_gbc_pdvld,
  ch6regc_gbc_chiif,
  ch7c_gbc_chbsy,
  ch7c_gbc_pdvld,
  ch7regc_gbc_chiif,
  ch8c_gbc_chbsy,
  ch8c_gbc_pdvld,
  ch8regc_gbc_chiif,
  ch9c_gbc_chbsy,
  ch9c_gbc_pdvld,
  ch9regc_gbc_chiif,
  dmac_vic_if,
  gbc_chnc_dmacen,
  hclk,
  hrst_n,
  s_haddr,
  s_hprot,
  s_hrdata_chn,
  s_hready,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           ch0c_gbc_chbsy;    
input           ch0c_gbc_pdvld;    
input           ch0regc_gbc_chiif; 
input           ch10c_gbc_chbsy;   
input           ch10c_gbc_pdvld;   
input           ch10regc_gbc_chiif; 
input           ch11c_gbc_chbsy;   
input           ch11c_gbc_pdvld;   
input           ch11regc_gbc_chiif; 
input           ch12c_gbc_chbsy;   
input           ch12c_gbc_pdvld;   
input           ch12regc_gbc_chiif; 
input           ch13c_gbc_chbsy;   
input           ch13c_gbc_pdvld;   
input           ch13regc_gbc_chiif; 
input           ch14c_gbc_chbsy;   
input           ch14c_gbc_pdvld;   
input           ch14regc_gbc_chiif; 
input           ch15c_gbc_chbsy;   
input           ch15c_gbc_pdvld;   
input           ch15regc_gbc_chiif; 
input           ch1c_gbc_chbsy;    
input           ch1c_gbc_pdvld;    
input           ch1regc_gbc_chiif; 
input           ch2c_gbc_chbsy;    
input           ch2c_gbc_pdvld;    
input           ch2regc_gbc_chiif; 
input           ch3c_gbc_chbsy;    
input           ch3c_gbc_pdvld;    
input           ch3regc_gbc_chiif; 
input           ch4c_gbc_chbsy;    
input           ch4c_gbc_pdvld;    
input           ch4regc_gbc_chiif; 
input           ch5c_gbc_chbsy;    
input           ch5c_gbc_pdvld;    
input           ch5regc_gbc_chiif; 
input           ch6c_gbc_chbsy;    
input           ch6c_gbc_pdvld;    
input           ch6regc_gbc_chiif; 
input           ch7c_gbc_chbsy;    
input           ch7c_gbc_pdvld;    
input           ch7regc_gbc_chiif; 
input           ch8c_gbc_chbsy;    
input           ch8c_gbc_pdvld;    
input           ch8regc_gbc_chiif; 
input           ch9c_gbc_chbsy;    
input           ch9c_gbc_pdvld;    
input           ch9regc_gbc_chiif; 
input           hclk;              
input           hrst_n;            
input   [31:0]  s_haddr;           
input   [3 :0]  s_hprot;           
input           s_hsel;            
input   [1 :0]  s_htrans;          
input   [31:0]  s_hwdata;          
input           s_hwrite;          
output          dmac_vic_if;       
output          gbc_chnc_dmacen;   
output  [31:0]  s_hrdata_chn;      
output          s_hready;          
reg             chpendifr_re;      
reg             chsr_re;           
reg             dmaccfg_re;        
reg             dmaccfg_we;        
reg             dmacen;            
wire            a_nonseq;          
wire            a_seq;             
wire            ch0c_gbc_chbsy;    
wire            ch0c_gbc_pdvld;    
wire            ch0intf;           
wire            ch0regc_gbc_chiif; 
wire            ch10c_gbc_chbsy;   
wire            ch10c_gbc_pdvld;   
wire            ch10intf;          
wire            ch10regc_gbc_chiif; 
wire            ch11c_gbc_chbsy;   
wire            ch11c_gbc_pdvld;   
wire            ch11intf;          
wire            ch11regc_gbc_chiif; 
wire            ch12c_gbc_chbsy;   
wire            ch12c_gbc_pdvld;   
wire            ch12intf;          
wire            ch12regc_gbc_chiif; 
wire            ch13c_gbc_chbsy;   
wire            ch13c_gbc_pdvld;   
wire            ch13intf;          
wire            ch13regc_gbc_chiif; 
wire            ch14c_gbc_chbsy;   
wire            ch14c_gbc_pdvld;   
wire            ch14intf;          
wire            ch14regc_gbc_chiif; 
wire            ch15c_gbc_chbsy;   
wire            ch15c_gbc_pdvld;   
wire            ch15intf;          
wire            ch15regc_gbc_chiif; 
wire            ch1c_gbc_chbsy;    
wire            ch1c_gbc_pdvld;    
wire            ch1intf;           
wire            ch1regc_gbc_chiif; 
wire            ch2c_gbc_chbsy;    
wire            ch2c_gbc_pdvld;    
wire            ch2intf;           
wire            ch2regc_gbc_chiif; 
wire            ch3c_gbc_chbsy;    
wire            ch3c_gbc_pdvld;    
wire            ch3intf;           
wire            ch3regc_gbc_chiif; 
wire            ch4c_gbc_chbsy;    
wire            ch4c_gbc_pdvld;    
wire            ch4intf;           
wire            ch4regc_gbc_chiif; 
wire            ch5c_gbc_chbsy;    
wire            ch5c_gbc_pdvld;    
wire            ch5intf;           
wire            ch5regc_gbc_chiif; 
wire            ch6c_gbc_chbsy;    
wire            ch6c_gbc_pdvld;    
wire            ch6intf;           
wire            ch6regc_gbc_chiif; 
wire            ch7c_gbc_chbsy;    
wire            ch7c_gbc_pdvld;    
wire            ch7intf;           
wire            ch7regc_gbc_chiif; 
wire            ch8c_gbc_chbsy;    
wire            ch8c_gbc_pdvld;    
wire            ch8intf;           
wire            ch8regc_gbc_chiif; 
wire            ch9c_gbc_chbsy;    
wire            ch9c_gbc_pdvld;    
wire            ch9intf;           
wire            ch9regc_gbc_chiif; 
wire            chpendifr_re_nxt;  
wire    [31:0]  chppendifr_r;      
wire    [31:0]  chsr_r;            
wire            chsr_re_nxt;       
wire            dmac_vic_if;       
wire    [31:0]  dmaccfg_r;         
wire            dmaccfg_re_nxt;    
wire            dmaccfg_we_nxt;    
wire            gbc_chnc_dmacen;   
wire            hclk;              
wire            hrst_n;            
wire            reg_burst;         
wire    [31:0]  s_haddr;           
wire    [3 :0]  s_hprot;           
wire    [31:0]  s_hrdata_chn;      
wire            s_hready;          
wire            s_hsel;            
wire    [1 :0]  s_htrans;          
wire    [31:0]  s_hwdata;          
wire            s_hwrite;          
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     GLB_BAS_ADR      =   10'h330  ;
parameter     CHPENDIFR_ADR                =   GLB_BAS_ADR + 10'h00  ; 
parameter     CHSR_ADR                     =   GLB_BAS_ADR + 10'h08  ; 
parameter     DMACCFG_ADR                  =   GLB_BAS_ADR + 10'h0C  ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ)   ;
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign s_hready     = 1'b1 ;
    assign  chpendifr_re_nxt = (s_haddr[9:0] == CHPENDIFR_ADR) & (~s_hwrite) & reg_burst  ;
    always@(posedge  hclk or negedge hrst_n)   
    begin    
        if(~hrst_n)     begin  
             chpendifr_re <= 1'b0 ;
        end
        else    begin  
             chpendifr_re <= chpendifr_re_nxt ;
        end
    end
assign     chppendifr_r[31:0]  = {16'h0,ch15c_gbc_pdvld,ch14c_gbc_pdvld,ch13c_gbc_pdvld,ch12c_gbc_pdvld,ch11c_gbc_pdvld,ch10c_gbc_pdvld,
                                        ch9c_gbc_pdvld,ch8c_gbc_pdvld,ch7c_gbc_pdvld,ch6c_gbc_pdvld,ch5c_gbc_pdvld,ch4c_gbc_pdvld,
                                        ch3c_gbc_pdvld,ch2c_gbc_pdvld,ch1c_gbc_pdvld,ch0c_gbc_pdvld};
assign  chsr_re_nxt = (s_haddr[9:0] == CHSR_ADR) & (~s_hwrite) & reg_burst  ;
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin   
         chsr_re<= 1'b0 ;
    end
    else    begin   
         chsr_re <= chsr_re_nxt ;
    end
end
assign   chsr_r[31:0] = {16'h0 , ch15c_gbc_chbsy ,  ch14c_gbc_chbsy ,  ch13c_gbc_chbsy ,  ch12c_gbc_chbsy ,  ch11c_gbc_chbsy , 
                        ch10c_gbc_chbsy ,  ch9c_gbc_chbsy ,  ch8c_gbc_chbsy ,  ch7c_gbc_chbsy ,  ch6c_gbc_chbsy ,  ch5c_gbc_chbsy , 
                        ch4c_gbc_chbsy ,  ch3c_gbc_chbsy ,  ch2c_gbc_chbsy ,  ch1c_gbc_chbsy ,  ch0c_gbc_chbsy } ;
assign  dmaccfg_re_nxt = (s_haddr[9:0] == DMACCFG_ADR) & (~s_hwrite) & reg_burst ;
assign  dmaccfg_we_nxt = (s_haddr[9:0] == DMACCFG_ADR) & ( s_hwrite) & reg_burst ;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin    
         dmaccfg_re <= 1'b0 ;
         dmaccfg_we <= 1'b0 ;
    end
    else    begin  
         dmaccfg_re <= dmaccfg_re_nxt ;
         dmaccfg_we <= dmaccfg_we_nxt ;
    end
end
always@(posedge  hclk or negedge hrst_n)   
begin   
    if(~hrst_n)     begin    
        dmacen <= 1'b0 ;
    end
    else   if(dmaccfg_we)
        dmacen <= s_hwdata[0] ;
end
assign   dmaccfg_r[31:0] = {31'h0 , dmacen } ; 
assign   gbc_chnc_dmacen = dmacen ;
assign   s_hrdata_chn[31:0] =  
                               chpendifr_re ?  chppendifr_r[31:0] :  
                               chsr_re      ?  chsr_r[31:0]       : 
                               dmaccfg_re   ?  dmaccfg_r[31:0]    : 32'h0 ;
assign   ch15intf = ch15regc_gbc_chiif ;  
assign   ch14intf = ch14regc_gbc_chiif ;  
assign   ch13intf = ch13regc_gbc_chiif ;  
assign   ch12intf = ch12regc_gbc_chiif ;  
assign   ch11intf = ch11regc_gbc_chiif ;  
assign   ch10intf = ch10regc_gbc_chiif ;  
assign   ch9intf  = ch9regc_gbc_chiif  ;  
assign   ch8intf  = ch8regc_gbc_chiif  ;  
assign   ch7intf  = ch7regc_gbc_chiif  ;  
assign   ch6intf  = ch6regc_gbc_chiif  ;   
assign   ch5intf  = ch5regc_gbc_chiif  ;   
assign   ch4intf  = ch4regc_gbc_chiif  ;   
assign   ch3intf  = ch3regc_gbc_chiif  ;    
assign   ch2intf  = ch2regc_gbc_chiif  ;   
assign   ch1intf  = ch1regc_gbc_chiif  ;   
assign   ch0intf  = ch0regc_gbc_chiif  ;    
assign   dmac_vic_if = ch0intf | ch2intf | ch4intf | ch6intf | ch8intf | ch10intf | ch12intf | ch14intf | 
                       ch1intf | ch3intf | ch5intf | ch7intf | ch9intf | ch11intf | ch13intf | ch15intf      ;
endmodule
module hpchn_decd(
actv_chn_cod ,  
chntrg_all
);
parameter   CHN_MUX_W = 4 ;
input   [15:0]  chntrg_all    ;         
output  [15 :0]  actv_chn_cod  ;
wire [15:0] inv;
wire [15:0] incr;
assign inv[15:0] = ~chntrg_all[15:0];
assign incr[15:0] = inv[15:0] + 1'b1;
assign actv_chn_cod[15:0] = incr[15:0] & chntrg_all[15:0];
endmodule
module reg_ctrl(
  ch0_prot_out,
  ch0c_gbc_chbsy,
  ch0c_gbc_chnen,
  ch0c_gbc_sfwtrg,
  ch10_prot_out,
  ch10c_gbc_chbsy,
  ch10c_gbc_chnen,
  ch10c_gbc_sfwtrg,
  ch11_prot_out,
  ch11c_gbc_chbsy,
  ch11c_gbc_chnen,
  ch11c_gbc_sfwtrg,
  ch12_prot_out,
  ch12c_gbc_chbsy,
  ch12c_gbc_chnen,
  ch12c_gbc_sfwtrg,
  ch13_prot_out,
  ch13c_gbc_chbsy,
  ch13c_gbc_chnen,
  ch13c_gbc_sfwtrg,
  ch14_prot_out,
  ch14c_gbc_chbsy,
  ch14c_gbc_chnen,
  ch14c_gbc_sfwtrg,
  ch15_prot_out,
  ch15c_gbc_chbsy,
  ch15c_gbc_chnen,
  ch15c_gbc_sfwtrg,
  ch1_prot_out,
  ch1c_gbc_chbsy,
  ch1c_gbc_chnen,
  ch1c_gbc_sfwtrg,
  ch2_prot_out,
  ch2c_gbc_chbsy,
  ch2c_gbc_chnen,
  ch2c_gbc_sfwtrg,
  ch3_prot_out,
  ch3c_gbc_chbsy,
  ch3c_gbc_chnen,
  ch3c_gbc_sfwtrg,
  ch4_prot_out,
  ch4c_gbc_chbsy,
  ch4c_gbc_chnen,
  ch4c_gbc_sfwtrg,
  ch5_prot_out,
  ch5c_gbc_chbsy,
  ch5c_gbc_chnen,
  ch5c_gbc_sfwtrg,
  ch6_prot_out,
  ch6c_gbc_chbsy,
  ch6c_gbc_chnen,
  ch6c_gbc_sfwtrg,
  ch7_prot_out,
  ch7c_gbc_chbsy,
  ch7c_gbc_chnen,
  ch7c_gbc_sfwtrg,
  ch8_prot_out,
  ch8c_gbc_chbsy,
  ch8c_gbc_chnen,
  ch8c_gbc_sfwtrg,
  ch9_prot_out,
  ch9c_gbc_chbsy,
  ch9c_gbc_chnen,
  ch9c_gbc_sfwtrg,
  chregc0_fsmc_block_tl,
  chregc0_fsmc_chintmdc,
  chregc0_fsmc_darn,
  chregc0_fsmc_dgrpaddrc,
  chregc0_fsmc_dinc,
  chregc0_fsmc_dst_tr_width,
  chregc0_fsmc_endlan,
  chregc0_fsmc_group_len,
  chregc0_fsmc_grpmc,
  chregc0_fsmc_protctl,
  chregc0_fsmc_sarn,
  chregc0_fsmc_sgrpaddrc,
  chregc0_fsmc_sinc,
  chregc0_fsmc_src_tr_width,
  chregc0_fsmc_trgtmdc,
  chregc10_fsmc_block_tl,
  chregc10_fsmc_chintmdc,
  chregc10_fsmc_darn,
  chregc10_fsmc_dgrpaddrc,
  chregc10_fsmc_dinc,
  chregc10_fsmc_dst_tr_width,
  chregc10_fsmc_endlan,
  chregc10_fsmc_group_len,
  chregc10_fsmc_grpmc,
  chregc10_fsmc_protctl,
  chregc10_fsmc_sarn,
  chregc10_fsmc_sgrpaddrc,
  chregc10_fsmc_sinc,
  chregc10_fsmc_src_tr_width,
  chregc10_fsmc_trgtmdc,
  chregc11_fsmc_block_tl,
  chregc11_fsmc_chintmdc,
  chregc11_fsmc_darn,
  chregc11_fsmc_dgrpaddrc,
  chregc11_fsmc_dinc,
  chregc11_fsmc_dst_tr_width,
  chregc11_fsmc_endlan,
  chregc11_fsmc_group_len,
  chregc11_fsmc_grpmc,
  chregc11_fsmc_protctl,
  chregc11_fsmc_sarn,
  chregc11_fsmc_sgrpaddrc,
  chregc11_fsmc_sinc,
  chregc11_fsmc_src_tr_width,
  chregc11_fsmc_trgtmdc,
  chregc12_fsmc_block_tl,
  chregc12_fsmc_chintmdc,
  chregc12_fsmc_darn,
  chregc12_fsmc_dgrpaddrc,
  chregc12_fsmc_dinc,
  chregc12_fsmc_dst_tr_width,
  chregc12_fsmc_endlan,
  chregc12_fsmc_group_len,
  chregc12_fsmc_grpmc,
  chregc12_fsmc_protctl,
  chregc12_fsmc_sarn,
  chregc12_fsmc_sgrpaddrc,
  chregc12_fsmc_sinc,
  chregc12_fsmc_src_tr_width,
  chregc12_fsmc_trgtmdc,
  chregc13_fsmc_block_tl,
  chregc13_fsmc_chintmdc,
  chregc13_fsmc_darn,
  chregc13_fsmc_dgrpaddrc,
  chregc13_fsmc_dinc,
  chregc13_fsmc_dst_tr_width,
  chregc13_fsmc_endlan,
  chregc13_fsmc_group_len,
  chregc13_fsmc_grpmc,
  chregc13_fsmc_protctl,
  chregc13_fsmc_sarn,
  chregc13_fsmc_sgrpaddrc,
  chregc13_fsmc_sinc,
  chregc13_fsmc_src_tr_width,
  chregc13_fsmc_trgtmdc,
  chregc14_fsmc_block_tl,
  chregc14_fsmc_chintmdc,
  chregc14_fsmc_darn,
  chregc14_fsmc_dgrpaddrc,
  chregc14_fsmc_dinc,
  chregc14_fsmc_dst_tr_width,
  chregc14_fsmc_endlan,
  chregc14_fsmc_group_len,
  chregc14_fsmc_grpmc,
  chregc14_fsmc_protctl,
  chregc14_fsmc_sarn,
  chregc14_fsmc_sgrpaddrc,
  chregc14_fsmc_sinc,
  chregc14_fsmc_src_tr_width,
  chregc14_fsmc_trgtmdc,
  chregc15_fsmc_block_tl,
  chregc15_fsmc_chintmdc,
  chregc15_fsmc_darn,
  chregc15_fsmc_dgrpaddrc,
  chregc15_fsmc_dinc,
  chregc15_fsmc_dst_tr_width,
  chregc15_fsmc_endlan,
  chregc15_fsmc_group_len,
  chregc15_fsmc_grpmc,
  chregc15_fsmc_protctl,
  chregc15_fsmc_sarn,
  chregc15_fsmc_sgrpaddrc,
  chregc15_fsmc_sinc,
  chregc15_fsmc_src_tr_width,
  chregc15_fsmc_trgtmdc,
  chregc1_fsmc_block_tl,
  chregc1_fsmc_chintmdc,
  chregc1_fsmc_darn,
  chregc1_fsmc_dgrpaddrc,
  chregc1_fsmc_dinc,
  chregc1_fsmc_dst_tr_width,
  chregc1_fsmc_endlan,
  chregc1_fsmc_group_len,
  chregc1_fsmc_grpmc,
  chregc1_fsmc_protctl,
  chregc1_fsmc_sarn,
  chregc1_fsmc_sgrpaddrc,
  chregc1_fsmc_sinc,
  chregc1_fsmc_src_tr_width,
  chregc1_fsmc_trgtmdc,
  chregc2_fsmc_block_tl,
  chregc2_fsmc_chintmdc,
  chregc2_fsmc_darn,
  chregc2_fsmc_dgrpaddrc,
  chregc2_fsmc_dinc,
  chregc2_fsmc_dst_tr_width,
  chregc2_fsmc_endlan,
  chregc2_fsmc_group_len,
  chregc2_fsmc_grpmc,
  chregc2_fsmc_protctl,
  chregc2_fsmc_sarn,
  chregc2_fsmc_sgrpaddrc,
  chregc2_fsmc_sinc,
  chregc2_fsmc_src_tr_width,
  chregc2_fsmc_trgtmdc,
  chregc3_fsmc_block_tl,
  chregc3_fsmc_chintmdc,
  chregc3_fsmc_darn,
  chregc3_fsmc_dgrpaddrc,
  chregc3_fsmc_dinc,
  chregc3_fsmc_dst_tr_width,
  chregc3_fsmc_endlan,
  chregc3_fsmc_group_len,
  chregc3_fsmc_grpmc,
  chregc3_fsmc_protctl,
  chregc3_fsmc_sarn,
  chregc3_fsmc_sgrpaddrc,
  chregc3_fsmc_sinc,
  chregc3_fsmc_src_tr_width,
  chregc3_fsmc_trgtmdc,
  chregc4_fsmc_block_tl,
  chregc4_fsmc_chintmdc,
  chregc4_fsmc_darn,
  chregc4_fsmc_dgrpaddrc,
  chregc4_fsmc_dinc,
  chregc4_fsmc_dst_tr_width,
  chregc4_fsmc_endlan,
  chregc4_fsmc_group_len,
  chregc4_fsmc_grpmc,
  chregc4_fsmc_protctl,
  chregc4_fsmc_sarn,
  chregc4_fsmc_sgrpaddrc,
  chregc4_fsmc_sinc,
  chregc4_fsmc_src_tr_width,
  chregc4_fsmc_trgtmdc,
  chregc5_fsmc_block_tl,
  chregc5_fsmc_chintmdc,
  chregc5_fsmc_darn,
  chregc5_fsmc_dgrpaddrc,
  chregc5_fsmc_dinc,
  chregc5_fsmc_dst_tr_width,
  chregc5_fsmc_endlan,
  chregc5_fsmc_group_len,
  chregc5_fsmc_grpmc,
  chregc5_fsmc_protctl,
  chregc5_fsmc_sarn,
  chregc5_fsmc_sgrpaddrc,
  chregc5_fsmc_sinc,
  chregc5_fsmc_src_tr_width,
  chregc5_fsmc_trgtmdc,
  chregc6_fsmc_block_tl,
  chregc6_fsmc_chintmdc,
  chregc6_fsmc_darn,
  chregc6_fsmc_dgrpaddrc,
  chregc6_fsmc_dinc,
  chregc6_fsmc_dst_tr_width,
  chregc6_fsmc_endlan,
  chregc6_fsmc_group_len,
  chregc6_fsmc_grpmc,
  chregc6_fsmc_protctl,
  chregc6_fsmc_sarn,
  chregc6_fsmc_sgrpaddrc,
  chregc6_fsmc_sinc,
  chregc6_fsmc_src_tr_width,
  chregc6_fsmc_trgtmdc,
  chregc7_fsmc_block_tl,
  chregc7_fsmc_chintmdc,
  chregc7_fsmc_darn,
  chregc7_fsmc_dgrpaddrc,
  chregc7_fsmc_dinc,
  chregc7_fsmc_dst_tr_width,
  chregc7_fsmc_endlan,
  chregc7_fsmc_group_len,
  chregc7_fsmc_grpmc,
  chregc7_fsmc_protctl,
  chregc7_fsmc_sarn,
  chregc7_fsmc_sgrpaddrc,
  chregc7_fsmc_sinc,
  chregc7_fsmc_src_tr_width,
  chregc7_fsmc_trgtmdc,
  chregc8_fsmc_block_tl,
  chregc8_fsmc_chintmdc,
  chregc8_fsmc_darn,
  chregc8_fsmc_dgrpaddrc,
  chregc8_fsmc_dinc,
  chregc8_fsmc_dst_tr_width,
  chregc8_fsmc_endlan,
  chregc8_fsmc_group_len,
  chregc8_fsmc_grpmc,
  chregc8_fsmc_protctl,
  chregc8_fsmc_sarn,
  chregc8_fsmc_sgrpaddrc,
  chregc8_fsmc_sinc,
  chregc8_fsmc_src_tr_width,
  chregc8_fsmc_trgtmdc,
  chregc9_fsmc_block_tl,
  chregc9_fsmc_chintmdc,
  chregc9_fsmc_darn,
  chregc9_fsmc_dgrpaddrc,
  chregc9_fsmc_dinc,
  chregc9_fsmc_dst_tr_width,
  chregc9_fsmc_endlan,
  chregc9_fsmc_group_len,
  chregc9_fsmc_grpmc,
  chregc9_fsmc_protctl,
  chregc9_fsmc_sarn,
  chregc9_fsmc_sgrpaddrc,
  chregc9_fsmc_sinc,
  chregc9_fsmc_src_tr_width,
  chregc9_fsmc_trgtmdc,
  dmac_vic_if,
  fsmc_chregc0_err_vld,
  fsmc_chregc0_htfr_vld,
  fsmc_chregc0_tfr_vld,
  fsmc_chregc0_trgetcmp_vld,
  fsmc_chregc10_err_vld,
  fsmc_chregc10_htfr_vld,
  fsmc_chregc10_tfr_vld,
  fsmc_chregc10_trgetcmp_vld,
  fsmc_chregc11_err_vld,
  fsmc_chregc11_htfr_vld,
  fsmc_chregc11_tfr_vld,
  fsmc_chregc11_trgetcmp_vld,
  fsmc_chregc12_err_vld,
  fsmc_chregc12_htfr_vld,
  fsmc_chregc12_tfr_vld,
  fsmc_chregc12_trgetcmp_vld,
  fsmc_chregc13_err_vld,
  fsmc_chregc13_htfr_vld,
  fsmc_chregc13_tfr_vld,
  fsmc_chregc13_trgetcmp_vld,
  fsmc_chregc14_err_vld,
  fsmc_chregc14_htfr_vld,
  fsmc_chregc14_tfr_vld,
  fsmc_chregc14_trgetcmp_vld,
  fsmc_chregc15_err_vld,
  fsmc_chregc15_htfr_vld,
  fsmc_chregc15_tfr_vld,
  fsmc_chregc15_trgetcmp_vld,
  fsmc_chregc1_err_vld,
  fsmc_chregc1_htfr_vld,
  fsmc_chregc1_tfr_vld,
  fsmc_chregc1_trgetcmp_vld,
  fsmc_chregc2_err_vld,
  fsmc_chregc2_htfr_vld,
  fsmc_chregc2_tfr_vld,
  fsmc_chregc2_trgetcmp_vld,
  fsmc_chregc3_err_vld,
  fsmc_chregc3_htfr_vld,
  fsmc_chregc3_tfr_vld,
  fsmc_chregc3_trgetcmp_vld,
  fsmc_chregc4_err_vld,
  fsmc_chregc4_htfr_vld,
  fsmc_chregc4_tfr_vld,
  fsmc_chregc4_trgetcmp_vld,
  fsmc_chregc5_err_vld,
  fsmc_chregc5_htfr_vld,
  fsmc_chregc5_tfr_vld,
  fsmc_chregc5_trgetcmp_vld,
  fsmc_chregc6_err_vld,
  fsmc_chregc6_htfr_vld,
  fsmc_chregc6_tfr_vld,
  fsmc_chregc6_trgetcmp_vld,
  fsmc_chregc7_err_vld,
  fsmc_chregc7_htfr_vld,
  fsmc_chregc7_tfr_vld,
  fsmc_chregc7_trgetcmp_vld,
  fsmc_chregc8_err_vld,
  fsmc_chregc8_htfr_vld,
  fsmc_chregc8_tfr_vld,
  fsmc_chregc8_trgetcmp_vld,
  fsmc_chregc9_err_vld,
  fsmc_chregc9_htfr_vld,
  fsmc_chregc9_tfr_vld,
  fsmc_chregc9_trgetcmp_vld,
  fsmc_chregc_pdvld_ch0,
  fsmc_chregc_pdvld_ch1,
  fsmc_chregc_pdvld_ch10,
  fsmc_chregc_pdvld_ch11,
  fsmc_chregc_pdvld_ch12,
  fsmc_chregc_pdvld_ch13,
  fsmc_chregc_pdvld_ch14,
  fsmc_chregc_pdvld_ch15,
  fsmc_chregc_pdvld_ch2,
  fsmc_chregc_pdvld_ch3,
  fsmc_chregc_pdvld_ch4,
  fsmc_chregc_pdvld_ch5,
  fsmc_chregc_pdvld_ch6,
  fsmc_chregc_pdvld_ch7,
  fsmc_chregc_pdvld_ch8,
  fsmc_chregc_pdvld_ch9,
  fsmc_regc_ch0en_clr,
  fsmc_regc_ch10en_clr,
  fsmc_regc_ch11en_clr,
  fsmc_regc_ch12en_clr,
  fsmc_regc_ch13en_clr,
  fsmc_regc_ch14en_clr,
  fsmc_regc_ch15en_clr,
  fsmc_regc_ch1en_clr,
  fsmc_regc_ch2en_clr,
  fsmc_regc_ch3en_clr,
  fsmc_regc_ch4en_clr,
  fsmc_regc_ch5en_clr,
  fsmc_regc_ch6en_clr,
  fsmc_regc_ch7en_clr,
  fsmc_regc_ch8en_clr,
  fsmc_regc_ch9en_clr,
  gbc_chnc_dmacen,
  hclk,
  hrst_n,
  regc_fsmc_ch0_srcdtlgc,
  regc_fsmc_ch10_srcdtlgc,
  regc_fsmc_ch11_srcdtlgc,
  regc_fsmc_ch12_srcdtlgc,
  regc_fsmc_ch13_srcdtlgc,
  regc_fsmc_ch14_srcdtlgc,
  regc_fsmc_ch15_srcdtlgc,
  regc_fsmc_ch1_srcdtlgc,
  regc_fsmc_ch2_srcdtlgc,
  regc_fsmc_ch3_srcdtlgc,
  regc_fsmc_ch4_srcdtlgc,
  regc_fsmc_ch5_srcdtlgc,
  regc_fsmc_ch6_srcdtlgc,
  regc_fsmc_ch7_srcdtlgc,
  regc_fsmc_ch8_srcdtlgc,
  regc_fsmc_ch9_srcdtlgc,
  s_haddr,
  s_hprot,
  s_hrdata,
  s_hready,
  s_hresp,
  s_hsel,
  s_htrans,
  s_hwdata,
  s_hwrite
);
input           ch0c_gbc_chbsy;            
input           ch10c_gbc_chbsy;           
input           ch11c_gbc_chbsy;           
input           ch12c_gbc_chbsy;           
input           ch13c_gbc_chbsy;           
input           ch14c_gbc_chbsy;           
input           ch15c_gbc_chbsy;           
input           ch1c_gbc_chbsy;            
input           ch2c_gbc_chbsy;            
input           ch3c_gbc_chbsy;            
input           ch4c_gbc_chbsy;            
input           ch5c_gbc_chbsy;            
input           ch6c_gbc_chbsy;            
input           ch7c_gbc_chbsy;            
input           ch8c_gbc_chbsy;            
input           ch9c_gbc_chbsy;            
input           fsmc_chregc0_err_vld;      
input           fsmc_chregc0_htfr_vld;     
input           fsmc_chregc0_tfr_vld;      
input           fsmc_chregc0_trgetcmp_vld; 
input           fsmc_chregc10_err_vld;     
input           fsmc_chregc10_htfr_vld;    
input           fsmc_chregc10_tfr_vld;     
input           fsmc_chregc10_trgetcmp_vld; 
input           fsmc_chregc11_err_vld;     
input           fsmc_chregc11_htfr_vld;    
input           fsmc_chregc11_tfr_vld;     
input           fsmc_chregc11_trgetcmp_vld; 
input           fsmc_chregc12_err_vld;     
input           fsmc_chregc12_htfr_vld;    
input           fsmc_chregc12_tfr_vld;     
input           fsmc_chregc12_trgetcmp_vld; 
input           fsmc_chregc13_err_vld;     
input           fsmc_chregc13_htfr_vld;    
input           fsmc_chregc13_tfr_vld;     
input           fsmc_chregc13_trgetcmp_vld; 
input           fsmc_chregc14_err_vld;     
input           fsmc_chregc14_htfr_vld;    
input           fsmc_chregc14_tfr_vld;     
input           fsmc_chregc14_trgetcmp_vld; 
input           fsmc_chregc15_err_vld;     
input           fsmc_chregc15_htfr_vld;    
input           fsmc_chregc15_tfr_vld;     
input           fsmc_chregc15_trgetcmp_vld; 
input           fsmc_chregc1_err_vld;      
input           fsmc_chregc1_htfr_vld;     
input           fsmc_chregc1_tfr_vld;      
input           fsmc_chregc1_trgetcmp_vld; 
input           fsmc_chregc2_err_vld;      
input           fsmc_chregc2_htfr_vld;     
input           fsmc_chregc2_tfr_vld;      
input           fsmc_chregc2_trgetcmp_vld; 
input           fsmc_chregc3_err_vld;      
input           fsmc_chregc3_htfr_vld;     
input           fsmc_chregc3_tfr_vld;      
input           fsmc_chregc3_trgetcmp_vld; 
input           fsmc_chregc4_err_vld;      
input           fsmc_chregc4_htfr_vld;     
input           fsmc_chregc4_tfr_vld;      
input           fsmc_chregc4_trgetcmp_vld; 
input           fsmc_chregc5_err_vld;      
input           fsmc_chregc5_htfr_vld;     
input           fsmc_chregc5_tfr_vld;      
input           fsmc_chregc5_trgetcmp_vld; 
input           fsmc_chregc6_err_vld;      
input           fsmc_chregc6_htfr_vld;     
input           fsmc_chregc6_tfr_vld;      
input           fsmc_chregc6_trgetcmp_vld; 
input           fsmc_chregc7_err_vld;      
input           fsmc_chregc7_htfr_vld;     
input           fsmc_chregc7_tfr_vld;      
input           fsmc_chregc7_trgetcmp_vld; 
input           fsmc_chregc8_err_vld;      
input           fsmc_chregc8_htfr_vld;     
input           fsmc_chregc8_tfr_vld;      
input           fsmc_chregc8_trgetcmp_vld; 
input           fsmc_chregc9_err_vld;      
input           fsmc_chregc9_htfr_vld;     
input           fsmc_chregc9_tfr_vld;      
input           fsmc_chregc9_trgetcmp_vld; 
input           fsmc_chregc_pdvld_ch0;     
input           fsmc_chregc_pdvld_ch1;     
input           fsmc_chregc_pdvld_ch10;    
input           fsmc_chregc_pdvld_ch11;    
input           fsmc_chregc_pdvld_ch12;    
input           fsmc_chregc_pdvld_ch13;    
input           fsmc_chregc_pdvld_ch14;    
input           fsmc_chregc_pdvld_ch15;    
input           fsmc_chregc_pdvld_ch2;     
input           fsmc_chregc_pdvld_ch3;     
input           fsmc_chregc_pdvld_ch4;     
input           fsmc_chregc_pdvld_ch5;     
input           fsmc_chregc_pdvld_ch6;     
input           fsmc_chregc_pdvld_ch7;     
input           fsmc_chregc_pdvld_ch8;     
input           fsmc_chregc_pdvld_ch9;     
input           fsmc_regc_ch0en_clr;       
input           fsmc_regc_ch10en_clr;      
input           fsmc_regc_ch11en_clr;      
input           fsmc_regc_ch12en_clr;      
input           fsmc_regc_ch13en_clr;      
input           fsmc_regc_ch14en_clr;      
input           fsmc_regc_ch15en_clr;      
input           fsmc_regc_ch1en_clr;       
input           fsmc_regc_ch2en_clr;       
input           fsmc_regc_ch3en_clr;       
input           fsmc_regc_ch4en_clr;       
input           fsmc_regc_ch5en_clr;       
input           fsmc_regc_ch6en_clr;       
input           fsmc_regc_ch7en_clr;       
input           fsmc_regc_ch8en_clr;       
input           fsmc_regc_ch9en_clr;       
input           hclk;                      
input           hrst_n;                    
input   [31:0]  s_haddr;                   
input   [3 :0]  s_hprot;                   
input           s_hsel;                    
input   [1 :0]  s_htrans;                  
input   [31:0]  s_hwdata;                  
input           s_hwrite;                  
output          ch0_prot_out;              
output          ch0c_gbc_chnen;            
output          ch0c_gbc_sfwtrg;           
output          ch10_prot_out;             
output          ch10c_gbc_chnen;           
output          ch10c_gbc_sfwtrg;          
output          ch11_prot_out;             
output          ch11c_gbc_chnen;           
output          ch11c_gbc_sfwtrg;          
output          ch12_prot_out;             
output          ch12c_gbc_chnen;           
output          ch12c_gbc_sfwtrg;          
output          ch13_prot_out;             
output          ch13c_gbc_chnen;           
output          ch13c_gbc_sfwtrg;          
output          ch14_prot_out;             
output          ch14c_gbc_chnen;           
output          ch14c_gbc_sfwtrg;          
output          ch15_prot_out;             
output          ch15c_gbc_chnen;           
output          ch15c_gbc_sfwtrg;          
output          ch1_prot_out;              
output          ch1c_gbc_chnen;            
output          ch1c_gbc_sfwtrg;           
output          ch2_prot_out;              
output          ch2c_gbc_chnen;            
output          ch2c_gbc_sfwtrg;           
output          ch3_prot_out;              
output          ch3c_gbc_chnen;            
output          ch3c_gbc_sfwtrg;           
output          ch4_prot_out;              
output          ch4c_gbc_chnen;            
output          ch4c_gbc_sfwtrg;           
output          ch5_prot_out;              
output          ch5c_gbc_chnen;            
output          ch5c_gbc_sfwtrg;           
output          ch6_prot_out;              
output          ch6c_gbc_chnen;            
output          ch6c_gbc_sfwtrg;           
output          ch7_prot_out;              
output          ch7c_gbc_chnen;            
output          ch7c_gbc_sfwtrg;           
output          ch8_prot_out;              
output          ch8c_gbc_chnen;            
output          ch8c_gbc_sfwtrg;           
output          ch9_prot_out;              
output          ch9c_gbc_chnen;            
output          ch9c_gbc_sfwtrg;           
output  [11:0]  chregc0_fsmc_block_tl;     
output  [2 :0]  chregc0_fsmc_chintmdc;     
output  [31:0]  chregc0_fsmc_darn;         
output          chregc0_fsmc_dgrpaddrc;    
output  [1 :0]  chregc0_fsmc_dinc;         
output  [1 :0]  chregc0_fsmc_dst_tr_width; 
output          chregc0_fsmc_endlan;       
output  [5 :0]  chregc0_fsmc_group_len;    
output          chregc0_fsmc_grpmc;        
output  [3 :0]  chregc0_fsmc_protctl;      
output  [31:0]  chregc0_fsmc_sarn;         
output          chregc0_fsmc_sgrpaddrc;    
output  [1 :0]  chregc0_fsmc_sinc;         
output  [1 :0]  chregc0_fsmc_src_tr_width; 
output  [1 :0]  chregc0_fsmc_trgtmdc;      
output  [11:0]  chregc10_fsmc_block_tl;    
output  [2 :0]  chregc10_fsmc_chintmdc;    
output  [31:0]  chregc10_fsmc_darn;        
output          chregc10_fsmc_dgrpaddrc;   
output  [1 :0]  chregc10_fsmc_dinc;        
output  [1 :0]  chregc10_fsmc_dst_tr_width; 
output          chregc10_fsmc_endlan;      
output  [5 :0]  chregc10_fsmc_group_len;   
output          chregc10_fsmc_grpmc;       
output  [3 :0]  chregc10_fsmc_protctl;     
output  [31:0]  chregc10_fsmc_sarn;        
output          chregc10_fsmc_sgrpaddrc;   
output  [1 :0]  chregc10_fsmc_sinc;        
output  [1 :0]  chregc10_fsmc_src_tr_width; 
output  [1 :0]  chregc10_fsmc_trgtmdc;     
output  [11:0]  chregc11_fsmc_block_tl;    
output  [2 :0]  chregc11_fsmc_chintmdc;    
output  [31:0]  chregc11_fsmc_darn;        
output          chregc11_fsmc_dgrpaddrc;   
output  [1 :0]  chregc11_fsmc_dinc;        
output  [1 :0]  chregc11_fsmc_dst_tr_width; 
output          chregc11_fsmc_endlan;      
output  [5 :0]  chregc11_fsmc_group_len;   
output          chregc11_fsmc_grpmc;       
output  [3 :0]  chregc11_fsmc_protctl;     
output  [31:0]  chregc11_fsmc_sarn;        
output          chregc11_fsmc_sgrpaddrc;   
output  [1 :0]  chregc11_fsmc_sinc;        
output  [1 :0]  chregc11_fsmc_src_tr_width; 
output  [1 :0]  chregc11_fsmc_trgtmdc;     
output  [11:0]  chregc12_fsmc_block_tl;    
output  [2 :0]  chregc12_fsmc_chintmdc;    
output  [31:0]  chregc12_fsmc_darn;        
output          chregc12_fsmc_dgrpaddrc;   
output  [1 :0]  chregc12_fsmc_dinc;        
output  [1 :0]  chregc12_fsmc_dst_tr_width; 
output          chregc12_fsmc_endlan;      
output  [5 :0]  chregc12_fsmc_group_len;   
output          chregc12_fsmc_grpmc;       
output  [3 :0]  chregc12_fsmc_protctl;     
output  [31:0]  chregc12_fsmc_sarn;        
output          chregc12_fsmc_sgrpaddrc;   
output  [1 :0]  chregc12_fsmc_sinc;        
output  [1 :0]  chregc12_fsmc_src_tr_width; 
output  [1 :0]  chregc12_fsmc_trgtmdc;     
output  [11:0]  chregc13_fsmc_block_tl;    
output  [2 :0]  chregc13_fsmc_chintmdc;    
output  [31:0]  chregc13_fsmc_darn;        
output          chregc13_fsmc_dgrpaddrc;   
output  [1 :0]  chregc13_fsmc_dinc;        
output  [1 :0]  chregc13_fsmc_dst_tr_width; 
output          chregc13_fsmc_endlan;      
output  [5 :0]  chregc13_fsmc_group_len;   
output          chregc13_fsmc_grpmc;       
output  [3 :0]  chregc13_fsmc_protctl;     
output  [31:0]  chregc13_fsmc_sarn;        
output          chregc13_fsmc_sgrpaddrc;   
output  [1 :0]  chregc13_fsmc_sinc;        
output  [1 :0]  chregc13_fsmc_src_tr_width; 
output  [1 :0]  chregc13_fsmc_trgtmdc;     
output  [11:0]  chregc14_fsmc_block_tl;    
output  [2 :0]  chregc14_fsmc_chintmdc;    
output  [31:0]  chregc14_fsmc_darn;        
output          chregc14_fsmc_dgrpaddrc;   
output  [1 :0]  chregc14_fsmc_dinc;        
output  [1 :0]  chregc14_fsmc_dst_tr_width; 
output          chregc14_fsmc_endlan;      
output  [5 :0]  chregc14_fsmc_group_len;   
output          chregc14_fsmc_grpmc;       
output  [3 :0]  chregc14_fsmc_protctl;     
output  [31:0]  chregc14_fsmc_sarn;        
output          chregc14_fsmc_sgrpaddrc;   
output  [1 :0]  chregc14_fsmc_sinc;        
output  [1 :0]  chregc14_fsmc_src_tr_width; 
output  [1 :0]  chregc14_fsmc_trgtmdc;     
output  [11:0]  chregc15_fsmc_block_tl;    
output  [2 :0]  chregc15_fsmc_chintmdc;    
output  [31:0]  chregc15_fsmc_darn;        
output          chregc15_fsmc_dgrpaddrc;   
output  [1 :0]  chregc15_fsmc_dinc;        
output  [1 :0]  chregc15_fsmc_dst_tr_width; 
output          chregc15_fsmc_endlan;      
output  [5 :0]  chregc15_fsmc_group_len;   
output          chregc15_fsmc_grpmc;       
output  [3 :0]  chregc15_fsmc_protctl;     
output  [31:0]  chregc15_fsmc_sarn;        
output          chregc15_fsmc_sgrpaddrc;   
output  [1 :0]  chregc15_fsmc_sinc;        
output  [1 :0]  chregc15_fsmc_src_tr_width; 
output  [1 :0]  chregc15_fsmc_trgtmdc;     
output  [11:0]  chregc1_fsmc_block_tl;     
output  [2 :0]  chregc1_fsmc_chintmdc;     
output  [31:0]  chregc1_fsmc_darn;         
output          chregc1_fsmc_dgrpaddrc;    
output  [1 :0]  chregc1_fsmc_dinc;         
output  [1 :0]  chregc1_fsmc_dst_tr_width; 
output          chregc1_fsmc_endlan;       
output  [5 :0]  chregc1_fsmc_group_len;    
output          chregc1_fsmc_grpmc;        
output  [3 :0]  chregc1_fsmc_protctl;      
output  [31:0]  chregc1_fsmc_sarn;         
output          chregc1_fsmc_sgrpaddrc;    
output  [1 :0]  chregc1_fsmc_sinc;         
output  [1 :0]  chregc1_fsmc_src_tr_width; 
output  [1 :0]  chregc1_fsmc_trgtmdc;      
output  [11:0]  chregc2_fsmc_block_tl;     
output  [2 :0]  chregc2_fsmc_chintmdc;     
output  [31:0]  chregc2_fsmc_darn;         
output          chregc2_fsmc_dgrpaddrc;    
output  [1 :0]  chregc2_fsmc_dinc;         
output  [1 :0]  chregc2_fsmc_dst_tr_width; 
output          chregc2_fsmc_endlan;       
output  [5 :0]  chregc2_fsmc_group_len;    
output          chregc2_fsmc_grpmc;        
output  [3 :0]  chregc2_fsmc_protctl;      
output  [31:0]  chregc2_fsmc_sarn;         
output          chregc2_fsmc_sgrpaddrc;    
output  [1 :0]  chregc2_fsmc_sinc;         
output  [1 :0]  chregc2_fsmc_src_tr_width; 
output  [1 :0]  chregc2_fsmc_trgtmdc;      
output  [11:0]  chregc3_fsmc_block_tl;     
output  [2 :0]  chregc3_fsmc_chintmdc;     
output  [31:0]  chregc3_fsmc_darn;         
output          chregc3_fsmc_dgrpaddrc;    
output  [1 :0]  chregc3_fsmc_dinc;         
output  [1 :0]  chregc3_fsmc_dst_tr_width; 
output          chregc3_fsmc_endlan;       
output  [5 :0]  chregc3_fsmc_group_len;    
output          chregc3_fsmc_grpmc;        
output  [3 :0]  chregc3_fsmc_protctl;      
output  [31:0]  chregc3_fsmc_sarn;         
output          chregc3_fsmc_sgrpaddrc;    
output  [1 :0]  chregc3_fsmc_sinc;         
output  [1 :0]  chregc3_fsmc_src_tr_width; 
output  [1 :0]  chregc3_fsmc_trgtmdc;      
output  [11:0]  chregc4_fsmc_block_tl;     
output  [2 :0]  chregc4_fsmc_chintmdc;     
output  [31:0]  chregc4_fsmc_darn;         
output          chregc4_fsmc_dgrpaddrc;    
output  [1 :0]  chregc4_fsmc_dinc;         
output  [1 :0]  chregc4_fsmc_dst_tr_width; 
output          chregc4_fsmc_endlan;       
output  [5 :0]  chregc4_fsmc_group_len;    
output          chregc4_fsmc_grpmc;        
output  [3 :0]  chregc4_fsmc_protctl;      
output  [31:0]  chregc4_fsmc_sarn;         
output          chregc4_fsmc_sgrpaddrc;    
output  [1 :0]  chregc4_fsmc_sinc;         
output  [1 :0]  chregc4_fsmc_src_tr_width; 
output  [1 :0]  chregc4_fsmc_trgtmdc;      
output  [11:0]  chregc5_fsmc_block_tl;     
output  [2 :0]  chregc5_fsmc_chintmdc;     
output  [31:0]  chregc5_fsmc_darn;         
output          chregc5_fsmc_dgrpaddrc;    
output  [1 :0]  chregc5_fsmc_dinc;         
output  [1 :0]  chregc5_fsmc_dst_tr_width; 
output          chregc5_fsmc_endlan;       
output  [5 :0]  chregc5_fsmc_group_len;    
output          chregc5_fsmc_grpmc;        
output  [3 :0]  chregc5_fsmc_protctl;      
output  [31:0]  chregc5_fsmc_sarn;         
output          chregc5_fsmc_sgrpaddrc;    
output  [1 :0]  chregc5_fsmc_sinc;         
output  [1 :0]  chregc5_fsmc_src_tr_width; 
output  [1 :0]  chregc5_fsmc_trgtmdc;      
output  [11:0]  chregc6_fsmc_block_tl;     
output  [2 :0]  chregc6_fsmc_chintmdc;     
output  [31:0]  chregc6_fsmc_darn;         
output          chregc6_fsmc_dgrpaddrc;    
output  [1 :0]  chregc6_fsmc_dinc;         
output  [1 :0]  chregc6_fsmc_dst_tr_width; 
output          chregc6_fsmc_endlan;       
output  [5 :0]  chregc6_fsmc_group_len;    
output          chregc6_fsmc_grpmc;        
output  [3 :0]  chregc6_fsmc_protctl;      
output  [31:0]  chregc6_fsmc_sarn;         
output          chregc6_fsmc_sgrpaddrc;    
output  [1 :0]  chregc6_fsmc_sinc;         
output  [1 :0]  chregc6_fsmc_src_tr_width; 
output  [1 :0]  chregc6_fsmc_trgtmdc;      
output  [11:0]  chregc7_fsmc_block_tl;     
output  [2 :0]  chregc7_fsmc_chintmdc;     
output  [31:0]  chregc7_fsmc_darn;         
output          chregc7_fsmc_dgrpaddrc;    
output  [1 :0]  chregc7_fsmc_dinc;         
output  [1 :0]  chregc7_fsmc_dst_tr_width; 
output          chregc7_fsmc_endlan;       
output  [5 :0]  chregc7_fsmc_group_len;    
output          chregc7_fsmc_grpmc;        
output  [3 :0]  chregc7_fsmc_protctl;      
output  [31:0]  chregc7_fsmc_sarn;         
output          chregc7_fsmc_sgrpaddrc;    
output  [1 :0]  chregc7_fsmc_sinc;         
output  [1 :0]  chregc7_fsmc_src_tr_width; 
output  [1 :0]  chregc7_fsmc_trgtmdc;      
output  [11:0]  chregc8_fsmc_block_tl;     
output  [2 :0]  chregc8_fsmc_chintmdc;     
output  [31:0]  chregc8_fsmc_darn;         
output          chregc8_fsmc_dgrpaddrc;    
output  [1 :0]  chregc8_fsmc_dinc;         
output  [1 :0]  chregc8_fsmc_dst_tr_width; 
output          chregc8_fsmc_endlan;       
output  [5 :0]  chregc8_fsmc_group_len;    
output          chregc8_fsmc_grpmc;        
output  [3 :0]  chregc8_fsmc_protctl;      
output  [31:0]  chregc8_fsmc_sarn;         
output          chregc8_fsmc_sgrpaddrc;    
output  [1 :0]  chregc8_fsmc_sinc;         
output  [1 :0]  chregc8_fsmc_src_tr_width; 
output  [1 :0]  chregc8_fsmc_trgtmdc;      
output  [11:0]  chregc9_fsmc_block_tl;     
output  [2 :0]  chregc9_fsmc_chintmdc;     
output  [31:0]  chregc9_fsmc_darn;         
output          chregc9_fsmc_dgrpaddrc;    
output  [1 :0]  chregc9_fsmc_dinc;         
output  [1 :0]  chregc9_fsmc_dst_tr_width; 
output          chregc9_fsmc_endlan;       
output  [5 :0]  chregc9_fsmc_group_len;    
output          chregc9_fsmc_grpmc;        
output  [3 :0]  chregc9_fsmc_protctl;      
output  [31:0]  chregc9_fsmc_sarn;         
output          chregc9_fsmc_sgrpaddrc;    
output  [1 :0]  chregc9_fsmc_sinc;         
output  [1 :0]  chregc9_fsmc_src_tr_width; 
output  [1 :0]  chregc9_fsmc_trgtmdc;      
output          dmac_vic_if;               
output          gbc_chnc_dmacen;           
output          regc_fsmc_ch0_srcdtlgc;    
output          regc_fsmc_ch10_srcdtlgc;   
output          regc_fsmc_ch11_srcdtlgc;   
output          regc_fsmc_ch12_srcdtlgc;   
output          regc_fsmc_ch13_srcdtlgc;   
output          regc_fsmc_ch14_srcdtlgc;   
output          regc_fsmc_ch15_srcdtlgc;   
output          regc_fsmc_ch1_srcdtlgc;    
output          regc_fsmc_ch2_srcdtlgc;    
output          regc_fsmc_ch3_srcdtlgc;    
output          regc_fsmc_ch4_srcdtlgc;    
output          regc_fsmc_ch5_srcdtlgc;    
output          regc_fsmc_ch6_srcdtlgc;    
output          regc_fsmc_ch7_srcdtlgc;    
output          regc_fsmc_ch8_srcdtlgc;    
output          regc_fsmc_ch9_srcdtlgc;    
output  [31:0]  s_hrdata;                  
output          s_hready;                  
output  [1 :0]  s_hresp;                   
reg             ch0_spacesel;              
reg             ch10_spacesel;             
reg             ch11_spacesel;             
reg             ch12_spacesel;             
reg             ch13_spacesel;             
reg             ch14_spacesel;             
reg             ch15_spacesel;             
reg             ch1_spacesel;              
reg             ch2_spacesel;              
reg             ch3_spacesel;              
reg             ch4_spacesel;              
reg             ch5_spacesel;              
reg             ch6_spacesel;              
reg             ch7_spacesel;              
reg             ch8_spacesel;              
reg             ch9_spacesel;              
wire            a_nonseq;                  
wire            a_seq;                     
wire            ch0_prot_out;              
wire            ch0_spacesel_nxt;          
wire            ch0c_gbc_chbsy;            
wire            ch0c_gbc_chnen;            
wire            ch0c_gbc_pdvld;            
wire            ch0c_gbc_sfwtrg;           
wire            ch0regc_gbc_chiif;         
wire            ch10_prot_out;             
wire            ch10_spacesel_nxt;         
wire            ch10c_gbc_chbsy;           
wire            ch10c_gbc_chnen;           
wire            ch10c_gbc_pdvld;           
wire            ch10c_gbc_sfwtrg;          
wire            ch10regc_gbc_chiif;        
wire            ch11_prot_out;             
wire            ch11_spacesel_nxt;         
wire            ch11c_gbc_chbsy;           
wire            ch11c_gbc_chnen;           
wire            ch11c_gbc_pdvld;           
wire            ch11c_gbc_sfwtrg;          
wire            ch11regc_gbc_chiif;        
wire            ch12_prot_out;             
wire            ch12_spacesel_nxt;         
wire            ch12c_gbc_chbsy;           
wire            ch12c_gbc_chnen;           
wire            ch12c_gbc_pdvld;           
wire            ch12c_gbc_sfwtrg;          
wire            ch12regc_gbc_chiif;        
wire            ch13_prot_out;             
wire            ch13_spacesel_nxt;         
wire            ch13c_gbc_chbsy;           
wire            ch13c_gbc_chnen;           
wire            ch13c_gbc_pdvld;           
wire            ch13c_gbc_sfwtrg;          
wire            ch13regc_gbc_chiif;        
wire            ch14_prot_out;             
wire            ch14_spacesel_nxt;         
wire            ch14c_gbc_chbsy;           
wire            ch14c_gbc_chnen;           
wire            ch14c_gbc_pdvld;           
wire            ch14c_gbc_sfwtrg;          
wire            ch14regc_gbc_chiif;        
wire            ch15_prot_out;             
wire            ch15_spacesel_nxt;         
wire            ch15c_gbc_chbsy;           
wire            ch15c_gbc_chnen;           
wire            ch15c_gbc_pdvld;           
wire            ch15c_gbc_sfwtrg;          
wire            ch15regc_gbc_chiif;        
wire            ch1_prot_out;              
wire            ch1_spacesel_nxt;          
wire            ch1c_gbc_chbsy;            
wire            ch1c_gbc_chnen;            
wire            ch1c_gbc_pdvld;            
wire            ch1c_gbc_sfwtrg;           
wire            ch1regc_gbc_chiif;         
wire            ch2_prot_out;              
wire            ch2_spacesel_nxt;          
wire            ch2c_gbc_chbsy;            
wire            ch2c_gbc_chnen;            
wire            ch2c_gbc_pdvld;            
wire            ch2c_gbc_sfwtrg;           
wire            ch2regc_gbc_chiif;         
wire            ch3_prot_out;              
wire            ch3_spacesel_nxt;          
wire            ch3c_gbc_chbsy;            
wire            ch3c_gbc_chnen;            
wire            ch3c_gbc_pdvld;            
wire            ch3c_gbc_sfwtrg;           
wire            ch3regc_gbc_chiif;         
wire            ch4_prot_out;              
wire            ch4_spacesel_nxt;          
wire            ch4c_gbc_chbsy;            
wire            ch4c_gbc_chnen;            
wire            ch4c_gbc_pdvld;            
wire            ch4c_gbc_sfwtrg;           
wire            ch4regc_gbc_chiif;         
wire            ch5_prot_out;              
wire            ch5_spacesel_nxt;          
wire            ch5c_gbc_chbsy;            
wire            ch5c_gbc_chnen;            
wire            ch5c_gbc_pdvld;            
wire            ch5c_gbc_sfwtrg;           
wire            ch5regc_gbc_chiif;         
wire            ch6_prot_out;              
wire            ch6_spacesel_nxt;          
wire            ch6c_gbc_chbsy;            
wire            ch6c_gbc_chnen;            
wire            ch6c_gbc_pdvld;            
wire            ch6c_gbc_sfwtrg;           
wire            ch6regc_gbc_chiif;         
wire            ch7_prot_out;              
wire            ch7_spacesel_nxt;          
wire            ch7c_gbc_chbsy;            
wire            ch7c_gbc_chnen;            
wire            ch7c_gbc_pdvld;            
wire            ch7c_gbc_sfwtrg;           
wire            ch7regc_gbc_chiif;         
wire            ch8_prot_out;              
wire            ch8_spacesel_nxt;          
wire            ch8c_gbc_chbsy;            
wire            ch8c_gbc_chnen;            
wire            ch8c_gbc_pdvld;            
wire            ch8c_gbc_sfwtrg;           
wire            ch8regc_gbc_chiif;         
wire            ch9_prot_out;              
wire            ch9_spacesel_nxt;          
wire            ch9c_gbc_chbsy;            
wire            ch9c_gbc_chnen;            
wire            ch9c_gbc_pdvld;            
wire            ch9c_gbc_sfwtrg;           
wire            ch9regc_gbc_chiif;         
wire    [11:0]  chregc0_fsmc_block_tl;     
wire    [2 :0]  chregc0_fsmc_chintmdc;     
wire    [31:0]  chregc0_fsmc_darn;         
wire            chregc0_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_dinc;         
wire    [1 :0]  chregc0_fsmc_dst_tr_width; 
wire            chregc0_fsmc_endlan;       
wire    [5 :0]  chregc0_fsmc_group_len;    
wire            chregc0_fsmc_grpmc;        
wire    [3 :0]  chregc0_fsmc_protctl;      
wire    [31:0]  chregc0_fsmc_sarn;         
wire            chregc0_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc0_fsmc_sinc;         
wire    [1 :0]  chregc0_fsmc_src_tr_width; 
wire    [1 :0]  chregc0_fsmc_trgtmdc;      
wire    [11:0]  chregc10_fsmc_block_tl;    
wire    [2 :0]  chregc10_fsmc_chintmdc;    
wire    [31:0]  chregc10_fsmc_darn;        
wire            chregc10_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_dinc;        
wire    [1 :0]  chregc10_fsmc_dst_tr_width; 
wire            chregc10_fsmc_endlan;      
wire    [5 :0]  chregc10_fsmc_group_len;   
wire            chregc10_fsmc_grpmc;       
wire    [3 :0]  chregc10_fsmc_protctl;     
wire    [31:0]  chregc10_fsmc_sarn;        
wire            chregc10_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc10_fsmc_sinc;        
wire    [1 :0]  chregc10_fsmc_src_tr_width; 
wire    [1 :0]  chregc10_fsmc_trgtmdc;     
wire    [11:0]  chregc11_fsmc_block_tl;    
wire    [2 :0]  chregc11_fsmc_chintmdc;    
wire    [31:0]  chregc11_fsmc_darn;        
wire            chregc11_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_dinc;        
wire    [1 :0]  chregc11_fsmc_dst_tr_width; 
wire            chregc11_fsmc_endlan;      
wire    [5 :0]  chregc11_fsmc_group_len;   
wire            chregc11_fsmc_grpmc;       
wire    [3 :0]  chregc11_fsmc_protctl;     
wire    [31:0]  chregc11_fsmc_sarn;        
wire            chregc11_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc11_fsmc_sinc;        
wire    [1 :0]  chregc11_fsmc_src_tr_width; 
wire    [1 :0]  chregc11_fsmc_trgtmdc;     
wire    [11:0]  chregc12_fsmc_block_tl;    
wire    [2 :0]  chregc12_fsmc_chintmdc;    
wire    [31:0]  chregc12_fsmc_darn;        
wire            chregc12_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_dinc;        
wire    [1 :0]  chregc12_fsmc_dst_tr_width; 
wire            chregc12_fsmc_endlan;      
wire    [5 :0]  chregc12_fsmc_group_len;   
wire            chregc12_fsmc_grpmc;       
wire    [3 :0]  chregc12_fsmc_protctl;     
wire    [31:0]  chregc12_fsmc_sarn;        
wire            chregc12_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc12_fsmc_sinc;        
wire    [1 :0]  chregc12_fsmc_src_tr_width; 
wire    [1 :0]  chregc12_fsmc_trgtmdc;     
wire    [11:0]  chregc13_fsmc_block_tl;    
wire    [2 :0]  chregc13_fsmc_chintmdc;    
wire    [31:0]  chregc13_fsmc_darn;        
wire            chregc13_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_dinc;        
wire    [1 :0]  chregc13_fsmc_dst_tr_width; 
wire            chregc13_fsmc_endlan;      
wire    [5 :0]  chregc13_fsmc_group_len;   
wire            chregc13_fsmc_grpmc;       
wire    [3 :0]  chregc13_fsmc_protctl;     
wire    [31:0]  chregc13_fsmc_sarn;        
wire            chregc13_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc13_fsmc_sinc;        
wire    [1 :0]  chregc13_fsmc_src_tr_width; 
wire    [1 :0]  chregc13_fsmc_trgtmdc;     
wire    [11:0]  chregc14_fsmc_block_tl;    
wire    [2 :0]  chregc14_fsmc_chintmdc;    
wire    [31:0]  chregc14_fsmc_darn;        
wire            chregc14_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_dinc;        
wire    [1 :0]  chregc14_fsmc_dst_tr_width; 
wire            chregc14_fsmc_endlan;      
wire    [5 :0]  chregc14_fsmc_group_len;   
wire            chregc14_fsmc_grpmc;       
wire    [3 :0]  chregc14_fsmc_protctl;     
wire    [31:0]  chregc14_fsmc_sarn;        
wire            chregc14_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc14_fsmc_sinc;        
wire    [1 :0]  chregc14_fsmc_src_tr_width; 
wire    [1 :0]  chregc14_fsmc_trgtmdc;     
wire    [11:0]  chregc15_fsmc_block_tl;    
wire    [2 :0]  chregc15_fsmc_chintmdc;    
wire    [31:0]  chregc15_fsmc_darn;        
wire            chregc15_fsmc_dgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_dinc;        
wire    [1 :0]  chregc15_fsmc_dst_tr_width; 
wire            chregc15_fsmc_endlan;      
wire    [5 :0]  chregc15_fsmc_group_len;   
wire            chregc15_fsmc_grpmc;       
wire    [3 :0]  chregc15_fsmc_protctl;     
wire    [31:0]  chregc15_fsmc_sarn;        
wire            chregc15_fsmc_sgrpaddrc;   
wire    [1 :0]  chregc15_fsmc_sinc;        
wire    [1 :0]  chregc15_fsmc_src_tr_width; 
wire    [1 :0]  chregc15_fsmc_trgtmdc;     
wire    [11:0]  chregc1_fsmc_block_tl;     
wire    [2 :0]  chregc1_fsmc_chintmdc;     
wire    [31:0]  chregc1_fsmc_darn;         
wire            chregc1_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_dinc;         
wire    [1 :0]  chregc1_fsmc_dst_tr_width; 
wire            chregc1_fsmc_endlan;       
wire    [5 :0]  chregc1_fsmc_group_len;    
wire            chregc1_fsmc_grpmc;        
wire    [3 :0]  chregc1_fsmc_protctl;      
wire    [31:0]  chregc1_fsmc_sarn;         
wire            chregc1_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc1_fsmc_sinc;         
wire    [1 :0]  chregc1_fsmc_src_tr_width; 
wire    [1 :0]  chregc1_fsmc_trgtmdc;      
wire    [11:0]  chregc2_fsmc_block_tl;     
wire    [2 :0]  chregc2_fsmc_chintmdc;     
wire    [31:0]  chregc2_fsmc_darn;         
wire            chregc2_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_dinc;         
wire    [1 :0]  chregc2_fsmc_dst_tr_width; 
wire            chregc2_fsmc_endlan;       
wire    [5 :0]  chregc2_fsmc_group_len;    
wire            chregc2_fsmc_grpmc;        
wire    [3 :0]  chregc2_fsmc_protctl;      
wire    [31:0]  chregc2_fsmc_sarn;         
wire            chregc2_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc2_fsmc_sinc;         
wire    [1 :0]  chregc2_fsmc_src_tr_width; 
wire    [1 :0]  chregc2_fsmc_trgtmdc;      
wire    [11:0]  chregc3_fsmc_block_tl;     
wire    [2 :0]  chregc3_fsmc_chintmdc;     
wire    [31:0]  chregc3_fsmc_darn;         
wire            chregc3_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_dinc;         
wire    [1 :0]  chregc3_fsmc_dst_tr_width; 
wire            chregc3_fsmc_endlan;       
wire    [5 :0]  chregc3_fsmc_group_len;    
wire            chregc3_fsmc_grpmc;        
wire    [3 :0]  chregc3_fsmc_protctl;      
wire    [31:0]  chregc3_fsmc_sarn;         
wire            chregc3_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc3_fsmc_sinc;         
wire    [1 :0]  chregc3_fsmc_src_tr_width; 
wire    [1 :0]  chregc3_fsmc_trgtmdc;      
wire    [11:0]  chregc4_fsmc_block_tl;     
wire    [2 :0]  chregc4_fsmc_chintmdc;     
wire    [31:0]  chregc4_fsmc_darn;         
wire            chregc4_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_dinc;         
wire    [1 :0]  chregc4_fsmc_dst_tr_width; 
wire            chregc4_fsmc_endlan;       
wire    [5 :0]  chregc4_fsmc_group_len;    
wire            chregc4_fsmc_grpmc;        
wire    [3 :0]  chregc4_fsmc_protctl;      
wire    [31:0]  chregc4_fsmc_sarn;         
wire            chregc4_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc4_fsmc_sinc;         
wire    [1 :0]  chregc4_fsmc_src_tr_width; 
wire    [1 :0]  chregc4_fsmc_trgtmdc;      
wire    [11:0]  chregc5_fsmc_block_tl;     
wire    [2 :0]  chregc5_fsmc_chintmdc;     
wire    [31:0]  chregc5_fsmc_darn;         
wire            chregc5_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_dinc;         
wire    [1 :0]  chregc5_fsmc_dst_tr_width; 
wire            chregc5_fsmc_endlan;       
wire    [5 :0]  chregc5_fsmc_group_len;    
wire            chregc5_fsmc_grpmc;        
wire    [3 :0]  chregc5_fsmc_protctl;      
wire    [31:0]  chregc5_fsmc_sarn;         
wire            chregc5_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc5_fsmc_sinc;         
wire    [1 :0]  chregc5_fsmc_src_tr_width; 
wire    [1 :0]  chregc5_fsmc_trgtmdc;      
wire    [11:0]  chregc6_fsmc_block_tl;     
wire    [2 :0]  chregc6_fsmc_chintmdc;     
wire    [31:0]  chregc6_fsmc_darn;         
wire            chregc6_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_dinc;         
wire    [1 :0]  chregc6_fsmc_dst_tr_width; 
wire            chregc6_fsmc_endlan;       
wire    [5 :0]  chregc6_fsmc_group_len;    
wire            chregc6_fsmc_grpmc;        
wire    [3 :0]  chregc6_fsmc_protctl;      
wire    [31:0]  chregc6_fsmc_sarn;         
wire            chregc6_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc6_fsmc_sinc;         
wire    [1 :0]  chregc6_fsmc_src_tr_width; 
wire    [1 :0]  chregc6_fsmc_trgtmdc;      
wire    [11:0]  chregc7_fsmc_block_tl;     
wire    [2 :0]  chregc7_fsmc_chintmdc;     
wire    [31:0]  chregc7_fsmc_darn;         
wire            chregc7_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_dinc;         
wire    [1 :0]  chregc7_fsmc_dst_tr_width; 
wire            chregc7_fsmc_endlan;       
wire    [5 :0]  chregc7_fsmc_group_len;    
wire            chregc7_fsmc_grpmc;        
wire    [3 :0]  chregc7_fsmc_protctl;      
wire    [31:0]  chregc7_fsmc_sarn;         
wire            chregc7_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc7_fsmc_sinc;         
wire    [1 :0]  chregc7_fsmc_src_tr_width; 
wire    [1 :0]  chregc7_fsmc_trgtmdc;      
wire    [11:0]  chregc8_fsmc_block_tl;     
wire    [2 :0]  chregc8_fsmc_chintmdc;     
wire    [31:0]  chregc8_fsmc_darn;         
wire            chregc8_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_dinc;         
wire    [1 :0]  chregc8_fsmc_dst_tr_width; 
wire            chregc8_fsmc_endlan;       
wire    [5 :0]  chregc8_fsmc_group_len;    
wire            chregc8_fsmc_grpmc;        
wire    [3 :0]  chregc8_fsmc_protctl;      
wire    [31:0]  chregc8_fsmc_sarn;         
wire            chregc8_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc8_fsmc_sinc;         
wire    [1 :0]  chregc8_fsmc_src_tr_width; 
wire    [1 :0]  chregc8_fsmc_trgtmdc;      
wire    [11:0]  chregc9_fsmc_block_tl;     
wire    [2 :0]  chregc9_fsmc_chintmdc;     
wire    [31:0]  chregc9_fsmc_darn;         
wire            chregc9_fsmc_dgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_dinc;         
wire    [1 :0]  chregc9_fsmc_dst_tr_width; 
wire            chregc9_fsmc_endlan;       
wire    [5 :0]  chregc9_fsmc_group_len;    
wire            chregc9_fsmc_grpmc;        
wire    [3 :0]  chregc9_fsmc_protctl;      
wire    [31:0]  chregc9_fsmc_sarn;         
wire            chregc9_fsmc_sgrpaddrc;    
wire    [1 :0]  chregc9_fsmc_sinc;         
wire    [1 :0]  chregc9_fsmc_src_tr_width; 
wire    [1 :0]  chregc9_fsmc_trgtmdc;      
wire            dmac_vic_if;               
wire            fsmc_chregc0_err_vld;      
wire            fsmc_chregc0_htfr_vld;     
wire            fsmc_chregc0_tfr_vld;      
wire            fsmc_chregc0_trgetcmp_vld; 
wire            fsmc_chregc10_err_vld;     
wire            fsmc_chregc10_htfr_vld;    
wire            fsmc_chregc10_tfr_vld;     
wire            fsmc_chregc10_trgetcmp_vld; 
wire            fsmc_chregc11_err_vld;     
wire            fsmc_chregc11_htfr_vld;    
wire            fsmc_chregc11_tfr_vld;     
wire            fsmc_chregc11_trgetcmp_vld; 
wire            fsmc_chregc12_err_vld;     
wire            fsmc_chregc12_htfr_vld;    
wire            fsmc_chregc12_tfr_vld;     
wire            fsmc_chregc12_trgetcmp_vld; 
wire            fsmc_chregc13_err_vld;     
wire            fsmc_chregc13_htfr_vld;    
wire            fsmc_chregc13_tfr_vld;     
wire            fsmc_chregc13_trgetcmp_vld; 
wire            fsmc_chregc14_err_vld;     
wire            fsmc_chregc14_htfr_vld;    
wire            fsmc_chregc14_tfr_vld;     
wire            fsmc_chregc14_trgetcmp_vld; 
wire            fsmc_chregc15_err_vld;     
wire            fsmc_chregc15_htfr_vld;    
wire            fsmc_chregc15_tfr_vld;     
wire            fsmc_chregc15_trgetcmp_vld; 
wire            fsmc_chregc1_err_vld;      
wire            fsmc_chregc1_htfr_vld;     
wire            fsmc_chregc1_tfr_vld;      
wire            fsmc_chregc1_trgetcmp_vld; 
wire            fsmc_chregc2_err_vld;      
wire            fsmc_chregc2_htfr_vld;     
wire            fsmc_chregc2_tfr_vld;      
wire            fsmc_chregc2_trgetcmp_vld; 
wire            fsmc_chregc3_err_vld;      
wire            fsmc_chregc3_htfr_vld;     
wire            fsmc_chregc3_tfr_vld;      
wire            fsmc_chregc3_trgetcmp_vld; 
wire            fsmc_chregc4_err_vld;      
wire            fsmc_chregc4_htfr_vld;     
wire            fsmc_chregc4_tfr_vld;      
wire            fsmc_chregc4_trgetcmp_vld; 
wire            fsmc_chregc5_err_vld;      
wire            fsmc_chregc5_htfr_vld;     
wire            fsmc_chregc5_tfr_vld;      
wire            fsmc_chregc5_trgetcmp_vld; 
wire            fsmc_chregc6_err_vld;      
wire            fsmc_chregc6_htfr_vld;     
wire            fsmc_chregc6_tfr_vld;      
wire            fsmc_chregc6_trgetcmp_vld; 
wire            fsmc_chregc7_err_vld;      
wire            fsmc_chregc7_htfr_vld;     
wire            fsmc_chregc7_tfr_vld;      
wire            fsmc_chregc7_trgetcmp_vld; 
wire            fsmc_chregc8_err_vld;      
wire            fsmc_chregc8_htfr_vld;     
wire            fsmc_chregc8_tfr_vld;      
wire            fsmc_chregc8_trgetcmp_vld; 
wire            fsmc_chregc9_err_vld;      
wire            fsmc_chregc9_htfr_vld;     
wire            fsmc_chregc9_tfr_vld;      
wire            fsmc_chregc9_trgetcmp_vld; 
wire            fsmc_chregc_pdvld_ch0;     
wire            fsmc_chregc_pdvld_ch1;     
wire            fsmc_chregc_pdvld_ch10;    
wire            fsmc_chregc_pdvld_ch11;    
wire            fsmc_chregc_pdvld_ch12;    
wire            fsmc_chregc_pdvld_ch13;    
wire            fsmc_chregc_pdvld_ch14;    
wire            fsmc_chregc_pdvld_ch15;    
wire            fsmc_chregc_pdvld_ch2;     
wire            fsmc_chregc_pdvld_ch3;     
wire            fsmc_chregc_pdvld_ch4;     
wire            fsmc_chregc_pdvld_ch5;     
wire            fsmc_chregc_pdvld_ch6;     
wire            fsmc_chregc_pdvld_ch7;     
wire            fsmc_chregc_pdvld_ch8;     
wire            fsmc_chregc_pdvld_ch9;     
wire            fsmc_regc_ch0en_clr;       
wire            fsmc_regc_ch10en_clr;      
wire            fsmc_regc_ch11en_clr;      
wire            fsmc_regc_ch12en_clr;      
wire            fsmc_regc_ch13en_clr;      
wire            fsmc_regc_ch14en_clr;      
wire            fsmc_regc_ch15en_clr;      
wire            fsmc_regc_ch1en_clr;       
wire            fsmc_regc_ch2en_clr;       
wire            fsmc_regc_ch3en_clr;       
wire            fsmc_regc_ch4en_clr;       
wire            fsmc_regc_ch5en_clr;       
wire            fsmc_regc_ch6en_clr;       
wire            fsmc_regc_ch7en_clr;       
wire            fsmc_regc_ch8en_clr;       
wire            fsmc_regc_ch9en_clr;       
wire            gbc_chnc_dmacen;           
wire            hclk;                      
wire            hrst_n;                    
wire            reg_burst;                 
wire            regc_fsmc_ch0_srcdtlgc;    
wire            regc_fsmc_ch10_srcdtlgc;   
wire            regc_fsmc_ch11_srcdtlgc;   
wire            regc_fsmc_ch12_srcdtlgc;   
wire            regc_fsmc_ch13_srcdtlgc;   
wire            regc_fsmc_ch14_srcdtlgc;   
wire            regc_fsmc_ch15_srcdtlgc;   
wire            regc_fsmc_ch1_srcdtlgc;    
wire            regc_fsmc_ch2_srcdtlgc;    
wire            regc_fsmc_ch3_srcdtlgc;    
wire            regc_fsmc_ch4_srcdtlgc;    
wire            regc_fsmc_ch5_srcdtlgc;    
wire            regc_fsmc_ch6_srcdtlgc;    
wire            regc_fsmc_ch7_srcdtlgc;    
wire            regc_fsmc_ch8_srcdtlgc;    
wire            regc_fsmc_ch9_srcdtlgc;    
wire    [31:0]  s_haddr;                   
wire    [3 :0]  s_hprot;                   
wire    [31:0]  s_hrdata;                  
wire    [31:0]  s_hrdata_ch0;              
wire    [31:0]  s_hrdata_ch1;              
wire    [31:0]  s_hrdata_ch10;             
wire    [31:0]  s_hrdata_ch11;             
wire    [31:0]  s_hrdata_ch12;             
wire    [31:0]  s_hrdata_ch13;             
wire    [31:0]  s_hrdata_ch14;             
wire    [31:0]  s_hrdata_ch15;             
wire    [31:0]  s_hrdata_ch2;              
wire    [31:0]  s_hrdata_ch3;              
wire    [31:0]  s_hrdata_ch4;              
wire    [31:0]  s_hrdata_ch5;              
wire    [31:0]  s_hrdata_ch6;              
wire    [31:0]  s_hrdata_ch7;              
wire    [31:0]  s_hrdata_ch8;              
wire    [31:0]  s_hrdata_ch9;              
wire    [31:0]  s_hrdata_gbc;              
wire            s_hready;                  
wire    [1 :0]  s_hresp;                   
wire            s_hsel;                    
wire    [1 :0]  s_htrans;                  
wire    [31:0]  s_hwdata;                  
wire            s_hwrite;                  
gbregc  x_gbregc (
  .ch0c_gbc_chbsy     (ch0c_gbc_chbsy    ),
  .ch0c_gbc_pdvld     (ch0c_gbc_pdvld    ),
  .ch0regc_gbc_chiif  (ch0regc_gbc_chiif ),
  .ch10c_gbc_chbsy    (ch10c_gbc_chbsy   ),
  .ch10c_gbc_pdvld    (ch10c_gbc_pdvld   ),
  .ch10regc_gbc_chiif (ch10regc_gbc_chiif),
  .ch11c_gbc_chbsy    (ch11c_gbc_chbsy   ),
  .ch11c_gbc_pdvld    (ch11c_gbc_pdvld   ),
  .ch11regc_gbc_chiif (ch11regc_gbc_chiif),
  .ch12c_gbc_chbsy    (ch12c_gbc_chbsy   ),
  .ch12c_gbc_pdvld    (ch12c_gbc_pdvld   ),
  .ch12regc_gbc_chiif (ch12regc_gbc_chiif),
  .ch13c_gbc_chbsy    (ch13c_gbc_chbsy   ),
  .ch13c_gbc_pdvld    (ch13c_gbc_pdvld   ),
  .ch13regc_gbc_chiif (ch13regc_gbc_chiif),
  .ch14c_gbc_chbsy    (ch14c_gbc_chbsy   ),
  .ch14c_gbc_pdvld    (ch14c_gbc_pdvld   ),
  .ch14regc_gbc_chiif (ch14regc_gbc_chiif),
  .ch15c_gbc_chbsy    (ch15c_gbc_chbsy   ),
  .ch15c_gbc_pdvld    (ch15c_gbc_pdvld   ),
  .ch15regc_gbc_chiif (ch15regc_gbc_chiif),
  .ch1c_gbc_chbsy     (ch1c_gbc_chbsy    ),
  .ch1c_gbc_pdvld     (ch1c_gbc_pdvld    ),
  .ch1regc_gbc_chiif  (ch1regc_gbc_chiif ),
  .ch2c_gbc_chbsy     (ch2c_gbc_chbsy    ),
  .ch2c_gbc_pdvld     (ch2c_gbc_pdvld    ),
  .ch2regc_gbc_chiif  (ch2regc_gbc_chiif ),
  .ch3c_gbc_chbsy     (ch3c_gbc_chbsy    ),
  .ch3c_gbc_pdvld     (ch3c_gbc_pdvld    ),
  .ch3regc_gbc_chiif  (ch3regc_gbc_chiif ),
  .ch4c_gbc_chbsy     (ch4c_gbc_chbsy    ),
  .ch4c_gbc_pdvld     (ch4c_gbc_pdvld    ),
  .ch4regc_gbc_chiif  (ch4regc_gbc_chiif ),
  .ch5c_gbc_chbsy     (ch5c_gbc_chbsy    ),
  .ch5c_gbc_pdvld     (ch5c_gbc_pdvld    ),
  .ch5regc_gbc_chiif  (ch5regc_gbc_chiif ),
  .ch6c_gbc_chbsy     (ch6c_gbc_chbsy    ),
  .ch6c_gbc_pdvld     (ch6c_gbc_pdvld    ),
  .ch6regc_gbc_chiif  (ch6regc_gbc_chiif ),
  .ch7c_gbc_chbsy     (ch7c_gbc_chbsy    ),
  .ch7c_gbc_pdvld     (ch7c_gbc_pdvld    ),
  .ch7regc_gbc_chiif  (ch7regc_gbc_chiif ),
  .ch8c_gbc_chbsy     (ch8c_gbc_chbsy    ),
  .ch8c_gbc_pdvld     (ch8c_gbc_pdvld    ),
  .ch8regc_gbc_chiif  (ch8regc_gbc_chiif ),
  .ch9c_gbc_chbsy     (ch9c_gbc_chbsy    ),
  .ch9c_gbc_pdvld     (ch9c_gbc_pdvld    ),
  .ch9regc_gbc_chiif  (ch9regc_gbc_chiif ),
  .dmac_vic_if        (dmac_vic_if       ),
  .gbc_chnc_dmacen    (gbc_chnc_dmacen   ),
  .hclk               (hclk              ),
  .hrst_n             (hrst_n            ),
  .s_haddr            (s_haddr           ),
  .s_hprot            (s_hprot           ),
  .s_hrdata_chn       (s_hrdata_gbc      ),
  .s_hready           (s_hready          ),
  .s_hsel             (s_hsel            ),
  .s_htrans           (s_htrans          ),
  .s_hwdata           (s_hwdata          ),
  .s_hwrite           (s_hwrite          )
);
chregc0  x_chregc0 (
  .chn_prot_out              (ch0_prot_out             ),
  .chnc_gbc_chnen            (ch0c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch0c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch0c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch0regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc0_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc0_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc0_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc0_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc0_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc0_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc0_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc0_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc0_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc0_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc0_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc0_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc0_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc0_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc0_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc0_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc0_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch0    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc0_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc0_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch0en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch0_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch0             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
chregc1  x_chregc1 (
  .chn_prot_out              (ch1_prot_out             ),
  .chnc_gbc_chnen            (ch1c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch1c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch1c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch1regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc1_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc1_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc1_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc1_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc1_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc1_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc1_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc1_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc1_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc1_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc1_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc1_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc1_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc1_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc1_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc1_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc1_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch1    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc1_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc1_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch1en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch1_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch1             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`ifndef    CH2_OFF    
chregc2  x_chregc2 (
  .chn_prot_out              (ch2_prot_out             ),
  .chnc_gbc_chnen            (ch2c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch2c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch2c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch2regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc2_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc2_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc2_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc2_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc2_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc2_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc2_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc2_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc2_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc2_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc2_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc2_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc2_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc2_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc2_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc2_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc2_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch2    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc2_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc2_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch2en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch2_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch2             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH3_OFF    
chregc3  x_chregc3 (
  .chn_prot_out              (ch3_prot_out             ),
  .chnc_gbc_chnen            (ch3c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch3c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch3c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch3regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc3_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc3_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc3_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc3_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc3_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc3_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc3_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc3_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc3_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc3_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc3_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc3_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc3_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc3_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc3_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc3_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc3_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch3    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc3_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc3_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch3en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch3_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch3             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH4_OFF    
chregc4  x_chregc4 (
  .chn_prot_out              (ch4_prot_out             ),
  .chnc_gbc_chnen            (ch4c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch4c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch4c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch4regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc4_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc4_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc4_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc4_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc4_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc4_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc4_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc4_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc4_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc4_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc4_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc4_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc4_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc4_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc4_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc4_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc4_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch4    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc4_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc4_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch4en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch4_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch4             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH5_OFF    
chregc5  x_chregc5 (
  .chn_prot_out              (ch5_prot_out             ),
  .chnc_gbc_chnen            (ch5c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch5c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch5c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch5regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc5_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc5_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc5_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc5_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc5_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc5_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc5_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc5_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc5_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc5_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc5_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc5_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc5_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc5_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc5_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc5_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc5_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch5    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc5_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc5_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch5en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch5_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch5             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH6_OFF    
chregc6  x_chregc6 (
  .chn_prot_out              (ch6_prot_out             ),
  .chnc_gbc_chnen            (ch6c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch6c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch6c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch6regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc6_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc6_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc6_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc6_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc6_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc6_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc6_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc6_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc6_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc6_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc6_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc6_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc6_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc6_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc6_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc6_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc6_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch6    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc6_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc6_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch6en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch6_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch6             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH7_OFF    
chregc7  x_chregc7 (
  .chn_prot_out              (ch7_prot_out             ),
  .chnc_gbc_chnen            (ch7c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch7c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch7c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch7regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc7_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc7_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc7_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc7_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc7_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc7_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc7_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc7_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc7_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc7_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc7_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc7_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc7_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc7_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc7_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc7_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc7_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch7    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc7_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc7_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch7en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch7_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch7             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH8_OFF    
chregc8  x_chregc8 (
  .chn_prot_out              (ch8_prot_out             ),
  .chnc_gbc_chnen            (ch8c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch8c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch8c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch8regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc8_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc8_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc8_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc8_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc8_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc8_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc8_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc8_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc8_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc8_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc8_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc8_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc8_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc8_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc8_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc8_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc8_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch8    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc8_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc8_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch8en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch8_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch8             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH9_OFF    
chregc9  x_chregc9 (
  .chn_prot_out              (ch9_prot_out             ),
  .chnc_gbc_chnen            (ch9c_gbc_chnen           ),
  .chnc_gbc_pdvld            (ch9c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg           (ch9c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif         (ch9regc_gbc_chiif        ),
  .chregc_fsmc_block_tl      (chregc9_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc      (chregc9_fsmc_chintmdc    ),
  .chregc_fsmc_darn          (chregc9_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc     (chregc9_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc          (chregc9_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width  (chregc9_fsmc_dst_tr_width),
  .chregc_fsmc_endlan        (chregc9_fsmc_endlan      ),
  .chregc_fsmc_group_len     (chregc9_fsmc_group_len   ),
  .chregc_fsmc_grpmc         (chregc9_fsmc_grpmc       ),
  .chregc_fsmc_protctl       (chregc9_fsmc_protctl     ),
  .chregc_fsmc_sarn          (chregc9_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc     (chregc9_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc          (chregc9_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width  (chregc9_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc       (chregc9_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld       (fsmc_chregc9_err_vld     ),
  .fsmc_chregc_htfr_vld      (fsmc_chregc9_htfr_vld    ),
  .fsmc_chregc_pdvld         (fsmc_chregc_pdvld_ch9    ),
  .fsmc_chregc_tfr_vld       (fsmc_chregc9_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld  (fsmc_chregc9_trgetcmp_vld),
  .fsmc_regc_chnen_clr       (fsmc_regc_ch9en_clr      ),
  .hclk                      (hclk                     ),
  .hrst_n                    (hrst_n                   ),
  .regc_fsmc_chn_srcdtlgc    (regc_fsmc_ch9_srcdtlgc   ),
  .s_haddr                   (s_haddr                  ),
  .s_hprot                   (s_hprot                  ),
  .s_hrdata_chn              (s_hrdata_ch9             ),
  .s_hsel                    (s_hsel                   ),
  .s_htrans                  (s_htrans                 ),
  .s_hwdata                  (s_hwdata                 ),
  .s_hwrite                  (s_hwrite                 )
);
`endif    
`ifndef    CH10_OFF    
chregc10  x_chregc10 (
  .chn_prot_out               (ch10_prot_out             ),
  .chnc_gbc_chnen             (ch10c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch10c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch10c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch10regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc10_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc10_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc10_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc10_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc10_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc10_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc10_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc10_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc10_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc10_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc10_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc10_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc10_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc10_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc10_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc10_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc10_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch10    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc10_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc10_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch10en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch10_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch10             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH11_OFF    
chregc11  x_chregc11 (
  .chn_prot_out               (ch11_prot_out             ),
  .chnc_gbc_chnen             (ch11c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch11c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch11c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch11regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc11_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc11_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc11_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc11_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc11_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc11_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc11_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc11_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc11_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc11_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc11_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc11_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc11_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc11_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc11_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc11_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc11_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch11    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc11_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc11_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch11en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch11_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch11             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH12_OFF    
chregc12  x_chregc12 (
  .chn_prot_out               (ch12_prot_out             ),
  .chnc_gbc_chnen             (ch12c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch12c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch12c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch12regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc12_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc12_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc12_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc12_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc12_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc12_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc12_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc12_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc12_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc12_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc12_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc12_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc12_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc12_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc12_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc12_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc12_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch12    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc12_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc12_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch12en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch12_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch12             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH13_OFF    
chregc13  x_chregc13 (
  .chn_prot_out               (ch13_prot_out             ),
  .chnc_gbc_chnen             (ch13c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch13c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch13c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch13regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc13_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc13_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc13_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc13_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc13_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc13_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc13_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc13_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc13_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc13_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc13_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc13_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc13_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc13_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc13_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc13_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc13_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch13    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc13_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc13_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch13en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch13_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch13             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH14_OFF    
chregc14  x_chregc14 (
  .chn_prot_out               (ch14_prot_out             ),
  .chnc_gbc_chnen             (ch14c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch14c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch14c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch14regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc14_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc14_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc14_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc14_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc14_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc14_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc14_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc14_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc14_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc14_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc14_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc14_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc14_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc14_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc14_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc14_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc14_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch14    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc14_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc14_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch14en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch14_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch14             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
`ifndef    CH15_OFF    
chregc15  x_chregc15 (
  .chn_prot_out               (ch15_prot_out             ),
  .chnc_gbc_chnen             (ch15c_gbc_chnen           ),
  .chnc_gbc_pdvld             (ch15c_gbc_pdvld           ),
  .chnc_gbc_sfwtrg            (ch15c_gbc_sfwtrg          ),
  .chnregc_gbc_chiif          (ch15regc_gbc_chiif        ),
  .chregc_fsmc_block_tl       (chregc15_fsmc_block_tl    ),
  .chregc_fsmc_chintmdc       (chregc15_fsmc_chintmdc    ),
  .chregc_fsmc_darn           (chregc15_fsmc_darn        ),
  .chregc_fsmc_dgrpaddrc      (chregc15_fsmc_dgrpaddrc   ),
  .chregc_fsmc_dinc           (chregc15_fsmc_dinc        ),
  .chregc_fsmc_dst_tr_width   (chregc15_fsmc_dst_tr_width),
  .chregc_fsmc_endlan         (chregc15_fsmc_endlan      ),
  .chregc_fsmc_group_len      (chregc15_fsmc_group_len   ),
  .chregc_fsmc_grpmc          (chregc15_fsmc_grpmc       ),
  .chregc_fsmc_protctl        (chregc15_fsmc_protctl     ),
  .chregc_fsmc_sarn           (chregc15_fsmc_sarn        ),
  .chregc_fsmc_sgrpaddrc      (chregc15_fsmc_sgrpaddrc   ),
  .chregc_fsmc_sinc           (chregc15_fsmc_sinc        ),
  .chregc_fsmc_src_tr_width   (chregc15_fsmc_src_tr_width),
  .chregc_fsmc_trgtmdc        (chregc15_fsmc_trgtmdc     ),
  .fsmc_chregc_err_vld        (fsmc_chregc15_err_vld     ),
  .fsmc_chregc_htfr_vld       (fsmc_chregc15_htfr_vld    ),
  .fsmc_chregc_pdvld          (fsmc_chregc_pdvld_ch15    ),
  .fsmc_chregc_tfr_vld        (fsmc_chregc15_tfr_vld     ),
  .fsmc_chregc_trgetcmp_vld   (fsmc_chregc15_trgetcmp_vld),
  .fsmc_regc_chnen_clr        (fsmc_regc_ch15en_clr      ),
  .hclk                       (hclk                      ),
  .hrst_n                     (hrst_n                    ),
  .regc_fsmc_chn_srcdtlgc     (regc_fsmc_ch15_srcdtlgc   ),
  .s_haddr                    (s_haddr                   ),
  .s_hprot                    (s_hprot                   ),
  .s_hrdata_chn               (s_hrdata_ch15             ),
  .s_hsel                     (s_hsel                    ),
  .s_htrans                   (s_htrans                  ),
  .s_hwdata                   (s_hwdata                  ),
  .s_hwrite                   (s_hwrite                  )
);
`endif    
parameter     NONSEQ = 2'b10 ;
parameter     SEQ    = 2'b11 ;
parameter     CH0_BAS_ADR    = 10'h000       ;   
parameter     CH1_BAS_ADR    = 10'h030       ;
parameter     CH2_BAS_ADR    = 10'h060       ;
parameter     CH3_BAS_ADR    = 10'h090       ; 
parameter     CH4_BAS_ADR    = 10'h0C0       ;
parameter     CH5_BAS_ADR    = 10'h0F0       ;
parameter     CH6_BAS_ADR    = 10'h120       ;  
parameter     CH7_BAS_ADR    = 10'h150       ;
parameter     CH8_BAS_ADR    = 10'h180       ; 
parameter     CH9_BAS_ADR    = 10'h1B0       ;  
parameter     CH10_BAS_ADR   = 10'h1E0       ;  
parameter     CH11_BAS_ADR   = 10'h210       ;     
parameter     CH12_BAS_ADR   = 10'h240       ;     
parameter     CH13_BAS_ADR   = 10'h270       ;   
parameter     CH14_BAS_ADR   = 10'h2A0       ;  
parameter     CH15_BAS_ADR   = 10'h2D0       ; 
assign a_nonseq  = (s_htrans[1:0] == NONSEQ);
assign a_seq     = (s_htrans[1:0] == SEQ)   ;
assign reg_burst = ( a_nonseq || a_seq ) && s_hsel ;
assign   ch0_spacesel_nxt  = (   (s_haddr[9:0] < (CH0_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch1_spacesel_nxt  = (   (s_haddr[9:0] < (CH1_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch2_spacesel_nxt  = (   (s_haddr[9:0] < (CH2_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch3_spacesel_nxt  = (   (s_haddr[9:0] < (CH3_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch4_spacesel_nxt  = (   (s_haddr[9:0] < (CH4_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch5_spacesel_nxt  = (   (s_haddr[9:0] < (CH5_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch6_spacesel_nxt  = (   (s_haddr[9:0] < (CH6_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch7_spacesel_nxt  = (   (s_haddr[9:0] < (CH7_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch8_spacesel_nxt  = (   (s_haddr[9:0] < (CH8_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch9_spacesel_nxt  = (   (s_haddr[9:0] < (CH9_BAS_ADR +10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch10_spacesel_nxt = (   (s_haddr[9:0] < (CH10_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch11_spacesel_nxt = (   (s_haddr[9:0] < (CH11_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch12_spacesel_nxt = (   (s_haddr[9:0] < (CH12_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch13_spacesel_nxt = (   (s_haddr[9:0] < (CH13_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch14_spacesel_nxt = (   (s_haddr[9:0] < (CH14_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
assign   ch15_spacesel_nxt = (   (s_haddr[9:0] < (CH15_BAS_ADR+10'h30))  ) & (~s_hwrite) & reg_burst ;
always@(posedge  hclk or negedge hrst_n)   
begin    
    if(~hrst_n)     begin   
        ch0_spacesel  <= 1'b0 ; 
        ch1_spacesel  <= 1'b0 ; 
        ch2_spacesel  <= 1'b0 ; 
        ch3_spacesel  <= 1'b0 ; 
        ch4_spacesel  <= 1'b0 ; 
        ch5_spacesel  <= 1'b0 ; 
        ch6_spacesel  <= 1'b0 ; 
        ch7_spacesel  <= 1'b0 ; 
        ch8_spacesel  <= 1'b0 ; 
        ch9_spacesel  <= 1'b0 ; 
        ch10_spacesel <= 1'b0 ; 
        ch11_spacesel <= 1'b0 ; 
        ch12_spacesel <= 1'b0 ; 
        ch13_spacesel <= 1'b0 ; 
        ch14_spacesel <= 1'b0 ; 
        ch15_spacesel <= 1'b0 ; 
    end
    else    begin
        ch0_spacesel  <=  ch0_spacesel_nxt  ;
        ch1_spacesel  <=  ch1_spacesel_nxt  ;
        ch2_spacesel  <=  ch2_spacesel_nxt  ;
        ch3_spacesel  <=  ch3_spacesel_nxt  ;
        ch4_spacesel  <=  ch4_spacesel_nxt  ;
        ch5_spacesel  <=  ch5_spacesel_nxt  ;
        ch6_spacesel  <=  ch6_spacesel_nxt  ;
        ch7_spacesel  <=  ch7_spacesel_nxt  ;
        ch8_spacesel  <=  ch8_spacesel_nxt  ;
        ch9_spacesel  <=  ch9_spacesel_nxt  ;
        ch10_spacesel <= ch10_spacesel_nxt  ;
        ch11_spacesel <= ch11_spacesel_nxt  ;
        ch12_spacesel <= ch12_spacesel_nxt  ;
        ch13_spacesel <= ch13_spacesel_nxt  ;
        ch14_spacesel <= ch14_spacesel_nxt  ;
        ch15_spacesel <= ch15_spacesel_nxt  ;
     end
end 
assign s_hresp[1:0] = 2'b00;
assign   s_hrdata[31:0] =      ch0_spacesel   ?  s_hrdata_ch0[31:0] :
                               ch1_spacesel   ?  s_hrdata_ch1[31:0] :
                               ch2_spacesel   ?  s_hrdata_ch2[31:0] :
                               ch3_spacesel   ?  s_hrdata_ch3[31:0] :
                               ch4_spacesel   ?  s_hrdata_ch4[31:0] :
                               ch5_spacesel   ?  s_hrdata_ch5[31:0] :
                               ch6_spacesel   ?  s_hrdata_ch6[31:0] :
                               ch7_spacesel   ?  s_hrdata_ch7[31:0] :
                               ch8_spacesel   ?  s_hrdata_ch8[31:0] :
                               ch9_spacesel   ?  s_hrdata_ch9[31:0] :
                               ch10_spacesel  ?  s_hrdata_ch10[31:0] :
                               ch11_spacesel  ?  s_hrdata_ch11[31:0] :
                               ch12_spacesel  ?  s_hrdata_ch12[31:0] :
                               ch13_spacesel  ?  s_hrdata_ch13[31:0] :
                               ch14_spacesel  ?  s_hrdata_ch14[31:0] :
                               ch15_spacesel  ?  s_hrdata_ch15[31:0] : s_hrdata_gbc[31:0];
endmodule
