/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module apb_dummy_top(
  intr,  
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  psel,
  pwdata,
  pwrite,
  presetn
);
input   [31:0]  paddr;        
input           pclk;         
input           penable;      
input   [2 :0]  pprot;        
input           psel;         
input   [31:0]  pwdata;       
input           pwrite;       
input           presetn;   
output  [31:0]  prdata; 
output          intr;  
assign prdata[31:0] = 32'h0;
assign intr = 1'b0;
endmodule
module ahb_dummy_top(
  haddr,
  hclk,
  hprot,
  hrdata,
  hready,
  hresp,
  hrst_b,
  hsel,
  hsize,
  htrans,
  hwdata,
  hwrite,
  intr
);
input   [31:0]  haddr;        
input           hclk;         
input   [3 :0]  hprot;        
input           hrst_b;       
input           hsel;         
input   [2 :0]  hsize;        
input   [1 :0]  htrans;       
input   [31:0]  hwdata;       
input           hwrite;       
output  [31:0]  hrdata;       
output          hready;  
output  [1 :0]  hresp;    
output		intr;    
wire  [31:0]  hrdata;       
wire          hready;  
wire  [1 :0]  hresp;    
wire          intr;
assign hrdata[31:0] = 32'b0;       
assign hready = 1'b1;  
assign hresp[1:0] = 2'b0;    
assign intr = 1'b0;     
endmodule
module ahbm_dummy_top(
hclk,
hrst_b,
mhrdata,
mhresp,
mhready,
mhgrant,
mhwdata,
mhburst,
mhtrans,
mhwrite,
mhaddr,
mhsize,
mhprot
);
output   [31:0]  mhaddr;       
output   [2 :0]  mhburst;      
output   [3 :0]  mhprot;       
output   [2 :0]  mhsize;       
output   [1 :0]  mhtrans;      
output   [31:0]  mhwdata;      
output           mhwrite; 
input          hclk;      
input          hrst_b;      
input          mhgrant;      
input  [31:0]  mhrdata;      
input          mhready;      
input  [1 :0]  mhresp;  
wire   [31:0]  mhaddr;       
wire   [2 :0]  mhburst;      
wire   [3 :0]  mhprot;       
wire   [2 :0]  mhsize;       
wire   [1 :0]  mhtrans;      
wire   [31:0]  mhwdata;      
wire           mhwrite; 
assign mhaddr[31:0]  = 32'b0; 
assign mhburst[2 :0] = 3'b0; 
assign mhprot[3 :0]  = 4'b0;
assign mhsize[2 :0]  = 3'b0;
assign mhtrans[1 :0] = 2'b0; 
assign mhwdata[31:0] = 32'b0; 
assign mhwrite       = 1'b0;
endmodule
