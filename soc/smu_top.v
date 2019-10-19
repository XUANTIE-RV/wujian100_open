/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module smu_top(
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
  ismc_hmain0_s0_hrdata,
  ismc_hmain0_s0_hready,
  ismc_hmain0_s0_hresp,
  pmu_smc_hclk,
  pmu_smc_hrst_b,
  smc_hmain0_s2_hrdata,
  smc_hmain0_s2_hready,
  smc_hmain0_s2_hresp,
  smc_hmain0_s3_hrdata,
  smc_hmain0_s3_hready,
  smc_hmain0_s3_hresp,
  smc_hmain0_s4_hrdata,
  smc_hmain0_s4_hready,
  smc_hmain0_s4_hresp
);
input   [31:0]  hmain0_ismc_s0_haddr; 
input   [3 :0]  hmain0_ismc_s0_hprot; 
input           hmain0_ismc_s0_hsel;  
input   [2 :0]  hmain0_ismc_s0_hsize; 
input   [1 :0]  hmain0_ismc_s0_htrans; 
input   [31:0]  hmain0_ismc_s0_hwdata; 
input           hmain0_ismc_s0_hwrite; 
input   [31:0]  hmain0_smc_s2_haddr;  
input   [3 :0]  hmain0_smc_s2_hprot;  
input           hmain0_smc_s2_hsel;   
input   [2 :0]  hmain0_smc_s2_hsize;  
input   [1 :0]  hmain0_smc_s2_htrans; 
input   [31:0]  hmain0_smc_s2_hwdata; 
input           hmain0_smc_s2_hwrite; 
input   [31:0]  hmain0_smc_s3_haddr;  
input   [3 :0]  hmain0_smc_s3_hprot;  
input           hmain0_smc_s3_hsel;   
input   [2 :0]  hmain0_smc_s3_hsize;  
input   [1 :0]  hmain0_smc_s3_htrans; 
input   [31:0]  hmain0_smc_s3_hwdata; 
input           hmain0_smc_s3_hwrite; 
input   [31:0]  hmain0_smc_s4_haddr;  
input   [3 :0]  hmain0_smc_s4_hprot;  
input           hmain0_smc_s4_hsel;   
input   [2 :0]  hmain0_smc_s4_hsize;  
input   [1 :0]  hmain0_smc_s4_htrans; 
input   [31:0]  hmain0_smc_s4_hwdata; 
input           hmain0_smc_s4_hwrite; 
input           pmu_smc_hclk;         
input           pmu_smc_hrst_b;       
output  [31:0]  ismc_hmain0_s0_hrdata; 
output          ismc_hmain0_s0_hready; 
output  [1 :0]  ismc_hmain0_s0_hresp; 
output  [31:0]  smc_hmain0_s2_hrdata; 
output          smc_hmain0_s2_hready; 
output  [1 :0]  smc_hmain0_s2_hresp;  
output  [31:0]  smc_hmain0_s3_hrdata; 
output          smc_hmain0_s3_hready; 
output  [1 :0]  smc_hmain0_s3_hresp;  
output  [31:0]  smc_hmain0_s4_hrdata; 
output          smc_hmain0_s4_hready; 
output  [1 :0]  smc_hmain0_s4_hresp;  
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
wire    [31:0]  ismc_hmain0_s0_hrdata; 
wire            ismc_hmain0_s0_hready; 
wire    [1 :0]  ismc_hmain0_s0_hresp; 
wire            pmu_smc_hclk;         
wire            pmu_smc_hrst_b;       
wire    [31:0]  smc_hmain0_s2_hrdata; 
wire            smc_hmain0_s2_hready; 
wire    [1 :0]  smc_hmain0_s2_hresp;  
wire    [31:0]  smc_hmain0_s3_hrdata; 
wire            smc_hmain0_s3_hready; 
wire    [1 :0]  smc_hmain0_s3_hresp;  
wire    [31:0]  smc_hmain0_s4_hrdata; 
wire            smc_hmain0_s4_hready; 
wire    [1 :0]  smc_hmain0_s4_hresp;  
wire            sms0_idle;            
wire            sms1_idle;            
wire            sms2_idle;            
wire            sms3_idle;            
wire            sms_big_endian_b;     
sms_top  x_sms_top (
  .ahb_sms0_haddr        (hmain0_smc_s2_haddr  ),
  .ahb_sms0_hprot        (hmain0_smc_s2_hprot  ),
  .ahb_sms0_hsel         (hmain0_smc_s2_hsel   ),
  .ahb_sms0_hsize        (hmain0_smc_s2_hsize  ),
  .ahb_sms0_htrans       (hmain0_smc_s2_htrans ),
  .ahb_sms0_hwdata       (hmain0_smc_s2_hwdata ),
  .ahb_sms0_hwrite       (hmain0_smc_s2_hwrite ),
  .ahb_sms1_haddr        (hmain0_smc_s3_haddr  ),
  .ahb_sms1_hprot        (hmain0_smc_s3_hprot  ),
  .ahb_sms1_hsel         (hmain0_smc_s3_hsel   ),
  .ahb_sms1_hsize        (hmain0_smc_s3_hsize  ),
  .ahb_sms1_htrans       (hmain0_smc_s3_htrans ),
  .ahb_sms1_hwdata       (hmain0_smc_s3_hwdata ),
  .ahb_sms1_hwrite       (hmain0_smc_s3_hwrite ),
  .ahb_sms2_haddr        (hmain0_smc_s4_haddr  ),
  .ahb_sms2_hprot        (hmain0_smc_s4_hprot  ),
  .ahb_sms2_hsel         (hmain0_smc_s4_hsel   ),
  .ahb_sms2_hsize        (hmain0_smc_s4_hsize  ),
  .ahb_sms2_htrans       (hmain0_smc_s4_htrans ),
  .ahb_sms2_hwdata       (hmain0_smc_s4_hwdata ),
  .ahb_sms2_hwrite       (hmain0_smc_s4_hwrite ),
  .ahb_sms3_haddr        (hmain0_ismc_s0_haddr ),
  .ahb_sms3_hprot        (hmain0_ismc_s0_hprot ),
  .ahb_sms3_hsel         (hmain0_ismc_s0_hsel  ),
  .ahb_sms3_hsize        (hmain0_ismc_s0_hsize ),
  .ahb_sms3_htrans       (hmain0_ismc_s0_htrans),
  .ahb_sms3_hwdata       (hmain0_ismc_s0_hwdata),
  .ahb_sms3_hwrite       (hmain0_ismc_s0_hwrite),
  .pmu_sms_hclk          (pmu_smc_hclk         ),
  .pmu_sms_hrst_b        (pmu_smc_hrst_b       ),
  .sms0_ahb_hrdata       (smc_hmain0_s2_hrdata ),
  .sms0_ahb_hready       (smc_hmain0_s2_hready ),
  .sms0_ahb_hresp        (smc_hmain0_s2_hresp  ),
  .sms0_idle             (sms0_idle            ),
  .sms1_ahb_hrdata       (smc_hmain0_s3_hrdata ),
  .sms1_ahb_hready       (smc_hmain0_s3_hready ),
  .sms1_ahb_hresp        (smc_hmain0_s3_hresp  ),
  .sms1_idle             (sms1_idle            ),
  .sms2_ahb_hrdata       (smc_hmain0_s4_hrdata ),
  .sms2_ahb_hready       (smc_hmain0_s4_hready ),
  .sms2_ahb_hresp        (smc_hmain0_s4_hresp  ),
  .sms2_idle             (sms2_idle            ),
  .sms3_ahb_hrdata       (ismc_hmain0_s0_hrdata),
  .sms3_ahb_hready       (ismc_hmain0_s0_hready),
  .sms3_ahb_hresp        (ismc_hmain0_s0_hresp ),
  .sms3_idle             (sms3_idle            ),
  .sms_big_endian_b      (sms_big_endian_b     )
);
assign sms_big_endian_b = 1'b1;
endmodule
