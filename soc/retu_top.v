/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module retu_top(
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
smu_top  x_smu_top (
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
endmodule
