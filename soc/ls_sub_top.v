/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module ls_sub_top(
  apb0_lsbus_s2_hrdata,
  apb0_lsbus_s2_hready,
  apb0_lsbus_s2_hresp,
  apb1_lsbus_s3_hrdata,
  apb1_lsbus_s3_hready,
  apb1_lsbus_s3_hresp,
  hmain0_lsbus_s10_haddr,
  hmain0_lsbus_s10_hburst,
  hmain0_lsbus_s10_hprot,
  hmain0_lsbus_s10_hsel,
  hmain0_lsbus_s10_hsize,
  hmain0_lsbus_s10_htrans,
  hmain0_lsbus_s10_hwdata,
  hmain0_lsbus_s10_hwrite,
  lsbus_apb0_s2_haddr,
  lsbus_apb0_s2_hburst,
  lsbus_apb0_s2_hprot,
  lsbus_apb0_s2_hsel,
  lsbus_apb0_s2_hsize,
  lsbus_apb0_s2_htrans,
  lsbus_apb0_s2_hwdata,
  lsbus_apb0_s2_hwrite,
  lsbus_apb1_s3_haddr,
  lsbus_apb1_s3_hburst,
  lsbus_apb1_s3_hprot,
  lsbus_apb1_s3_hsel,
  lsbus_apb1_s3_hsize,
  lsbus_apb1_s3_htrans,
  lsbus_apb1_s3_hwdata,
  lsbus_apb1_s3_hwrite,
  lsbus_dummy0_intr,
  lsbus_dummy1_intr,
  lsbus_dummy2_intr,
  lsbus_dummy3_intr,
  lsbus_hmain0_s10_hrdata,
  lsbus_hmain0_s10_hready,
  lsbus_hmain0_s10_hresp,
  pmu_dummy0_s3clk,
  pmu_dummy0_s3rst_b,
  pmu_dummy1_s3clk,
  pmu_dummy1_s3rst_b,
  pmu_dummy2_s3clk,
  pmu_dummy2_s3rst_b,
  pmu_dummy3_s3clk,
  pmu_dummy3_s3rst_b,
  pmu_lsbus_hclk,
  pmu_lsbus_hrst_b,
  pmu_sub3_s3clk,
  pmu_sub3_s3rst_b
);
input   [31:0]  apb0_lsbus_s2_hrdata;   
input           apb0_lsbus_s2_hready;   
input   [1 :0]  apb0_lsbus_s2_hresp;    
input   [31:0]  apb1_lsbus_s3_hrdata;   
input           apb1_lsbus_s3_hready;   
input   [1 :0]  apb1_lsbus_s3_hresp;    
input   [31:0]  hmain0_lsbus_s10_haddr; 
input   [2 :0]  hmain0_lsbus_s10_hburst; 
input   [3 :0]  hmain0_lsbus_s10_hprot; 
input           hmain0_lsbus_s10_hsel;  
input   [2 :0]  hmain0_lsbus_s10_hsize; 
input   [1 :0]  hmain0_lsbus_s10_htrans; 
input   [31:0]  hmain0_lsbus_s10_hwdata; 
input           hmain0_lsbus_s10_hwrite; 
input           pmu_dummy0_s3clk;       
input           pmu_dummy0_s3rst_b;     
input           pmu_dummy1_s3clk;       
input           pmu_dummy1_s3rst_b;     
input           pmu_dummy2_s3clk;       
input           pmu_dummy2_s3rst_b;     
input           pmu_dummy3_s3clk;       
input           pmu_dummy3_s3rst_b;     
input           pmu_lsbus_hclk;         
input           pmu_lsbus_hrst_b;       
input           pmu_sub3_s3clk;         
input           pmu_sub3_s3rst_b;       
output  [31:0]  lsbus_apb0_s2_haddr;    
output  [2 :0]  lsbus_apb0_s2_hburst;   
output  [3 :0]  lsbus_apb0_s2_hprot;    
output          lsbus_apb0_s2_hsel;     
output  [2 :0]  lsbus_apb0_s2_hsize;    
output  [1 :0]  lsbus_apb0_s2_htrans;   
output  [31:0]  lsbus_apb0_s2_hwdata;   
output          lsbus_apb0_s2_hwrite;   
output  [31:0]  lsbus_apb1_s3_haddr;    
output  [2 :0]  lsbus_apb1_s3_hburst;   
output  [3 :0]  lsbus_apb1_s3_hprot;    
output          lsbus_apb1_s3_hsel;     
output  [2 :0]  lsbus_apb1_s3_hsize;    
output  [1 :0]  lsbus_apb1_s3_htrans;   
output  [31:0]  lsbus_apb1_s3_hwdata;   
output          lsbus_apb1_s3_hwrite;   
output          lsbus_dummy0_intr;      
output          lsbus_dummy1_intr;      
output          lsbus_dummy2_intr;      
output          lsbus_dummy3_intr;      
output  [31:0]  lsbus_hmain0_s10_hrdata; 
output          lsbus_hmain0_s10_hready; 
output  [1 :0]  lsbus_hmain0_s10_hresp; 
wire    [31:0]  apb0_lsbus_s2_hrdata;   
wire            apb0_lsbus_s2_hready;   
wire    [1 :0]  apb0_lsbus_s2_hresp;    
wire    [31:0]  apb1_lsbus_s3_hrdata;   
wire            apb1_lsbus_s3_hready;   
wire    [1 :0]  apb1_lsbus_s3_hresp;    
wire    [31:0]  dummy0_lsbus_s0_hrdata; 
wire            dummy0_lsbus_s0_hready; 
wire    [1 :0]  dummy0_lsbus_s0_hresp;  
wire    [31:0]  dummy1_lsbus_s1_hrdata; 
wire            dummy1_lsbus_s1_hready; 
wire    [1 :0]  dummy1_lsbus_s1_hresp;  
wire    [31:0]  dummy2_lsbus_s4_hrdata; 
wire            dummy2_lsbus_s4_hready; 
wire    [1 :0]  dummy2_lsbus_s4_hresp;  
wire    [31:0]  dummy3_lsbus_s5_hrdata; 
wire            dummy3_lsbus_s5_hready; 
wire    [1 :0]  dummy3_lsbus_s5_hresp;  
wire    [31:0]  hmain0_lsbus_s10_haddr; 
wire    [2 :0]  hmain0_lsbus_s10_hburst; 
wire    [3 :0]  hmain0_lsbus_s10_hprot; 
wire            hmain0_lsbus_s10_hsel;  
wire    [2 :0]  hmain0_lsbus_s10_hsize; 
wire    [1 :0]  hmain0_lsbus_s10_htrans; 
wire    [31:0]  hmain0_lsbus_s10_hwdata; 
wire            hmain0_lsbus_s10_hwrite; 
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
wire    [31:0]  lsbus_dummy0_s0_haddr;  
wire    [2 :0]  lsbus_dummy0_s0_hburst; 
wire    [3 :0]  lsbus_dummy0_s0_hprot;  
wire            lsbus_dummy0_s0_hsel;   
wire    [2 :0]  lsbus_dummy0_s0_hsize;  
wire    [1 :0]  lsbus_dummy0_s0_htrans; 
wire    [31:0]  lsbus_dummy0_s0_hwdata; 
wire            lsbus_dummy0_s0_hwrite; 
wire            lsbus_dummy1_intr;      
wire    [31:0]  lsbus_dummy1_s1_haddr;  
wire    [2 :0]  lsbus_dummy1_s1_hburst; 
wire    [3 :0]  lsbus_dummy1_s1_hprot;  
wire            lsbus_dummy1_s1_hsel;   
wire    [2 :0]  lsbus_dummy1_s1_hsize;  
wire    [1 :0]  lsbus_dummy1_s1_htrans; 
wire    [31:0]  lsbus_dummy1_s1_hwdata; 
wire            lsbus_dummy1_s1_hwrite; 
wire            lsbus_dummy2_intr;      
wire    [31:0]  lsbus_dummy2_s4_haddr;  
wire    [2 :0]  lsbus_dummy2_s4_hburst; 
wire    [3 :0]  lsbus_dummy2_s4_hprot;  
wire            lsbus_dummy2_s4_hsel;   
wire    [2 :0]  lsbus_dummy2_s4_hsize;  
wire    [1 :0]  lsbus_dummy2_s4_htrans; 
wire    [31:0]  lsbus_dummy2_s4_hwdata; 
wire            lsbus_dummy2_s4_hwrite; 
wire            lsbus_dummy3_intr;      
wire    [31:0]  lsbus_dummy3_s5_haddr;  
wire    [2 :0]  lsbus_dummy3_s5_hburst; 
wire    [3 :0]  lsbus_dummy3_s5_hprot;  
wire            lsbus_dummy3_s5_hsel;   
wire    [2 :0]  lsbus_dummy3_s5_hsize;  
wire    [1 :0]  lsbus_dummy3_s5_htrans; 
wire    [31:0]  lsbus_dummy3_s5_hwdata; 
wire            lsbus_dummy3_s5_hwrite; 
wire    [31:0]  lsbus_hmain0_s10_hrdata; 
wire            lsbus_hmain0_s10_hready; 
wire    [1 :0]  lsbus_hmain0_s10_hresp; 
wire            pmu_dummy0_s3clk;       
wire            pmu_dummy0_s3rst_b;     
wire            pmu_dummy1_s3clk;       
wire            pmu_dummy1_s3rst_b;     
wire            pmu_dummy2_s3clk;       
wire            pmu_dummy2_s3rst_b;     
wire            pmu_dummy3_s3clk;       
wire            pmu_dummy3_s3rst_b;     
wire            pmu_lsbus_hclk;         
wire            pmu_lsbus_hrst_b;       
wire            pmu_sub3_s3clk;         
wire            pmu_sub3_s3rst_b;       
ahb_matrix_1_6_sub  x_sub_ls_top (
  .m_haddr                  (hmain0_lsbus_s10_haddr  ),
  .m_hburst                 (hmain0_lsbus_s10_hburst ),
  .m_hprot                  (hmain0_lsbus_s10_hprot  ),
  .m_hrdata                 (lsbus_hmain0_s10_hrdata ),
  .m_hready                 (lsbus_hmain0_s10_hready ),
  .m_hresp                  (lsbus_hmain0_s10_hresp  ),
  .m_hselx                  (hmain0_lsbus_s10_hsel   ),
  .m_hsize                  (hmain0_lsbus_s10_hsize  ),
  .m_htrans                 (hmain0_lsbus_s10_htrans ),
  .m_hwdata                 (hmain0_lsbus_s10_hwdata ),
  .m_hwrite                 (hmain0_lsbus_s10_hwrite ),
  .main_hclk                (pmu_lsbus_hclk          ),
  .main_hresetn             (pmu_lsbus_hrst_b        ),
  .pmu_matrix_clkdiv_bypass (1'b1                    ),
  .s0_haddr                 (lsbus_dummy0_s0_haddr   ),
  .s0_hburst                (lsbus_dummy0_s0_hburst  ),
  .s0_hprot                 (lsbus_dummy0_s0_hprot   ),
  .s0_hrdata                (dummy0_lsbus_s0_hrdata  ),
  .s0_hready                (dummy0_lsbus_s0_hready  ),
  .s0_hresp                 (dummy0_lsbus_s0_hresp   ),
  .s0_hselx                 (lsbus_dummy0_s0_hsel    ),
  .s0_hsize                 (lsbus_dummy0_s0_hsize   ),
  .s0_htrans                (lsbus_dummy0_s0_htrans  ),
  .s0_hwdata                (lsbus_dummy0_s0_hwdata  ),
  .s0_hwrite                (lsbus_dummy0_s0_hwrite  ),
  .s1_haddr                 (lsbus_dummy1_s1_haddr   ),
  .s1_hburst                (lsbus_dummy1_s1_hburst  ),
  .s1_hprot                 (lsbus_dummy1_s1_hprot   ),
  .s1_hrdata                (dummy1_lsbus_s1_hrdata  ),
  .s1_hready                (dummy1_lsbus_s1_hready  ),
  .s1_hresp                 (dummy1_lsbus_s1_hresp   ),
  .s1_hselx                 (lsbus_dummy1_s1_hsel    ),
  .s1_hsize                 (lsbus_dummy1_s1_hsize   ),
  .s1_htrans                (lsbus_dummy1_s1_htrans  ),
  .s1_hwdata                (lsbus_dummy1_s1_hwdata  ),
  .s1_hwrite                (lsbus_dummy1_s1_hwrite  ),
  .s2_haddr                 (lsbus_apb0_s2_haddr     ),
  .s2_hburst                (lsbus_apb0_s2_hburst    ),
  .s2_hprot                 (lsbus_apb0_s2_hprot     ),
  .s2_hrdata                (apb0_lsbus_s2_hrdata    ),
  .s2_hready                (apb0_lsbus_s2_hready    ),
  .s2_hresp                 (apb0_lsbus_s2_hresp     ),
  .s2_hselx                 (lsbus_apb0_s2_hsel      ),
  .s2_hsize                 (lsbus_apb0_s2_hsize     ),
  .s2_htrans                (lsbus_apb0_s2_htrans    ),
  .s2_hwdata                (lsbus_apb0_s2_hwdata    ),
  .s2_hwrite                (lsbus_apb0_s2_hwrite    ),
  .s3_haddr                 (lsbus_apb1_s3_haddr     ),
  .s3_hburst                (lsbus_apb1_s3_hburst    ),
  .s3_hprot                 (lsbus_apb1_s3_hprot     ),
  .s3_hrdata                (apb1_lsbus_s3_hrdata    ),
  .s3_hready                (apb1_lsbus_s3_hready    ),
  .s3_hresp                 (apb1_lsbus_s3_hresp     ),
  .s3_hselx                 (lsbus_apb1_s3_hsel      ),
  .s3_hsize                 (lsbus_apb1_s3_hsize     ),
  .s3_htrans                (lsbus_apb1_s3_htrans    ),
  .s3_hwdata                (lsbus_apb1_s3_hwdata    ),
  .s3_hwrite                (lsbus_apb1_s3_hwrite    ),
  .s4_haddr                 (lsbus_dummy2_s4_haddr   ),
  .s4_hburst                (lsbus_dummy2_s4_hburst  ),
  .s4_hprot                 (lsbus_dummy2_s4_hprot   ),
  .s4_hrdata                (dummy2_lsbus_s4_hrdata  ),
  .s4_hready                (dummy2_lsbus_s4_hready  ),
  .s4_hresp                 (dummy2_lsbus_s4_hresp   ),
  .s4_hselx                 (lsbus_dummy2_s4_hsel    ),
  .s4_hsize                 (lsbus_dummy2_s4_hsize   ),
  .s4_htrans                (lsbus_dummy2_s4_htrans  ),
  .s4_hwdata                (lsbus_dummy2_s4_hwdata  ),
  .s4_hwrite                (lsbus_dummy2_s4_hwrite  ),
  .s5_haddr                 (lsbus_dummy3_s5_haddr   ),
  .s5_hburst                (lsbus_dummy3_s5_hburst  ),
  .s5_hprot                 (lsbus_dummy3_s5_hprot   ),
  .s5_hrdata                (dummy3_lsbus_s5_hrdata  ),
  .s5_hready                (dummy3_lsbus_s5_hready  ),
  .s5_hresp                 (dummy3_lsbus_s5_hresp   ),
  .s5_hselx                 (lsbus_dummy3_s5_hsel    ),
  .s5_hsize                 (lsbus_dummy3_s5_hsize   ),
  .s5_htrans                (lsbus_dummy3_s5_htrans  ),
  .s5_hwdata                (lsbus_dummy3_s5_hwdata  ),
  .s5_hwrite                (lsbus_dummy3_s5_hwrite  ),
  .sub_hclk                 (pmu_sub3_s3clk          ),
  .sub_hresetn              (pmu_sub3_s3rst_b        )
);
ahb_dummy_top  x_lsbus_dummy_top0 (
  .haddr                  (lsbus_dummy0_s0_haddr ),
  .hclk                   (pmu_dummy0_s3clk      ),
  .hprot                  (lsbus_dummy0_s0_hprot ),
  .hrdata                 (dummy0_lsbus_s0_hrdata),
  .hready                 (dummy0_lsbus_s0_hready),
  .hresp                  (dummy0_lsbus_s0_hresp ),
  .hrst_b                 (pmu_dummy0_s3rst_b    ),
  .hsel                   (lsbus_dummy0_s0_hsel  ),
  .hsize                  (lsbus_dummy0_s0_hsize ),
  .htrans                 (lsbus_dummy0_s0_htrans),
  .hwdata                 (lsbus_dummy0_s0_hwdata),
  .hwrite                 (lsbus_dummy0_s0_hwrite),
  .intr                   (lsbus_dummy0_intr     )
);
ahb_dummy_top  x_lsbus_dummy_top1 (
  .haddr                  (lsbus_dummy1_s1_haddr ),
  .hclk                   (pmu_dummy1_s3clk      ),
  .hprot                  (lsbus_dummy1_s1_hprot ),
  .hrdata                 (dummy1_lsbus_s1_hrdata),
  .hready                 (dummy1_lsbus_s1_hready),
  .hresp                  (dummy1_lsbus_s1_hresp ),
  .hrst_b                 (pmu_dummy1_s3rst_b    ),
  .hsel                   (lsbus_dummy1_s1_hsel  ),
  .hsize                  (lsbus_dummy1_s1_hsize ),
  .htrans                 (lsbus_dummy1_s1_htrans),
  .hwdata                 (lsbus_dummy1_s1_hwdata),
  .hwrite                 (lsbus_dummy1_s1_hwrite),
  .intr                   (lsbus_dummy1_intr     )
);
ahb_dummy_top  x_lsbus_dummy_top2 (
  .haddr                  (lsbus_dummy2_s4_haddr ),
  .hclk                   (pmu_dummy2_s3clk      ),
  .hprot                  (lsbus_dummy2_s4_hprot ),
  .hrdata                 (dummy2_lsbus_s4_hrdata),
  .hready                 (dummy2_lsbus_s4_hready),
  .hresp                  (dummy2_lsbus_s4_hresp ),
  .hrst_b                 (pmu_dummy2_s3rst_b    ),
  .hsel                   (lsbus_dummy2_s4_hsel  ),
  .hsize                  (lsbus_dummy2_s4_hsize ),
  .htrans                 (lsbus_dummy2_s4_htrans),
  .hwdata                 (lsbus_dummy2_s4_hwdata),
  .hwrite                 (lsbus_dummy2_s4_hwrite),
  .intr                   (lsbus_dummy2_intr     )
);
ahb_dummy_top  x_lsbus_dummy_top3 (
  .haddr                  (lsbus_dummy3_s5_haddr ),
  .hclk                   (pmu_dummy3_s3clk      ),
  .hprot                  (lsbus_dummy3_s5_hprot ),
  .hrdata                 (dummy3_lsbus_s5_hrdata),
  .hready                 (dummy3_lsbus_s5_hready),
  .hresp                  (dummy3_lsbus_s5_hresp ),
  .hrst_b                 (pmu_dummy3_s3rst_b    ),
  .hsel                   (lsbus_dummy3_s5_hsel  ),
  .hsize                  (lsbus_dummy3_s5_hsize ),
  .htrans                 (lsbus_dummy3_s5_htrans),
  .hwdata                 (lsbus_dummy3_s5_hwdata),
  .hwrite                 (lsbus_dummy3_s5_hwrite),
  .intr                   (lsbus_dummy3_intr     )
);
endmodule
