/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module usi1_sec_top(
  clk,
  dma_ack_rx,
  dma_ack_tx,
  dma_req_rx,
  dma_req_tx,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  paddr,
  penable,
  pprot,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  sec_rx_req,
  sec_tx_req,
  tipc_usi1_trust,
  usi_etb_rx_trig,
  usi_etb_tx_trig,
  usi_intr
);
input           clk;            
input           dma_ack_rx;     
input           dma_ack_tx;     
input           nss_in;         
input   [31:0]  paddr;          
input           penable;        
input   [2 :0]  pprot;          
input           psel;           
input   [31:0]  pwdata;         
input           pwrite;         
input           rst_n;          
input           sclk_in;        
input           sd0_in;         
input           sd1_in;         
input           tipc_usi1_trust; 
output          dma_req_rx;     
output          dma_req_tx;     
output          nss_ie_n;       
output          nss_oe_n;       
output          nss_out;        
output  [31:0]  prdata;         
output          sclk_ie_n;      
output          sclk_oe_n;      
output          sclk_out;       
output          sd0_ie_n;       
output          sd0_oe_n;       
output          sd0_out;        
output          sd1_ie_n;       
output          sd1_oe_n;       
output          sd1_out;        
output          sec_rx_req;     
output          sec_tx_req;     
output          usi_etb_rx_trig; 
output          usi_etb_tx_trig; 
output          usi_intr;       
wire            clk;            
wire            dma_ack_rx;     
wire            dma_ack_tx;     
wire            dma_req_rx;     
wire            dma_req_tx;     
wire    [31:0]  i_prdata;       
wire            i_psel;         
wire            i_pwrite;       
wire            nss_ie_n;       
wire            nss_in;         
wire            nss_oe_n;       
wire            nss_out;        
wire    [31:0]  paddr;          
wire            penable;        
wire    [2 :0]  pprot;          
wire    [31:0]  prdata;         
wire            psel;           
wire    [31:0]  pwdata;         
wire            pwrite;         
wire            rst_n;          
wire            sclk_ie_n;      
wire            sclk_in;        
wire            sclk_oe_n;      
wire            sclk_out;       
wire            sd0_ie_n;       
wire            sd0_in;         
wire            sd0_oe_n;       
wire            sd0_out;        
wire            sd1_ie_n;       
wire            sd1_in;         
wire            sd1_oe_n;       
wire            sd1_out;        
wire            sec_rx_req;     
wire            sec_tx_req;     
wire            tipc_usi1_trust; 
wire            usi_etb_rx_trig; 
wire            usi_etb_tx_trig; 
wire            usi_intr;       
usi_top  x_usi1 (
  .clk             (clk            ),
  .dma_ack_rx      (dma_ack_rx     ),
  .dma_ack_tx      (dma_ack_tx     ),
  .dma_req_rx      (dma_req_rx     ),
  .dma_req_tx      (dma_req_tx     ),
  .nss_ie_n        (nss_ie_n       ),
  .nss_in          (nss_in         ),
  .nss_oe_n        (nss_oe_n       ),
  .nss_out         (nss_out        ),
  .paddr           (paddr          ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       ),
  .rst_n           (rst_n          ),
  .sclk_ie_n       (sclk_ie_n      ),
  .sclk_in         (sclk_in        ),
  .sclk_oe_n       (sclk_oe_n      ),
  .sclk_out        (sclk_out       ),
  .sd0_ie_n        (sd0_ie_n       ),
  .sd0_in          (sd0_in         ),
  .sd0_oe_n        (sd0_oe_n       ),
  .sd0_out         (sd0_out        ),
  .sd1_ie_n        (sd1_ie_n       ),
  .sd1_in          (sd1_in         ),
  .sd1_oe_n        (sd1_oe_n       ),
  .sd1_out         (sd1_out        ),
  .usi_etb_rx_trig (usi_etb_rx_trig),
  .usi_etb_tx_trig (usi_etb_tx_trig),
  .usi_intr        (usi_intr       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;

assign sec_rx_req = dma_req_rx;
assign sec_tx_req = dma_req_tx;

endmodule
module usi2_sec_top(
  clk,
  dma_ack_rx,
  dma_ack_tx,
  dma_req_rx,
  dma_req_tx,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  paddr,
  penable,
  pprot,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  sec_rx_req,
  sec_tx_req,
  tipc_usi2_trust,
  usi_etb_rx_trig,
  usi_etb_tx_trig,
  usi_intr
);
input           clk;            
input           dma_ack_rx;     
input           dma_ack_tx;     
input           nss_in;         
input   [31:0]  paddr;          
input           penable;        
input   [2 :0]  pprot;          
input           psel;           
input   [31:0]  pwdata;         
input           pwrite;         
input           rst_n;          
input           sclk_in;        
input           sd0_in;         
input           sd1_in;         
input           tipc_usi2_trust; 
output          dma_req_rx;     
output          dma_req_tx;     
output          nss_ie_n;       
output          nss_oe_n;       
output          nss_out;        
output  [31:0]  prdata;         
output          sclk_ie_n;      
output          sclk_oe_n;      
output          sclk_out;       
output          sd0_ie_n;       
output          sd0_oe_n;       
output          sd0_out;        
output          sd1_ie_n;       
output          sd1_oe_n;       
output          sd1_out;        
output          sec_rx_req;     
output          sec_tx_req;     
output          usi_etb_rx_trig; 
output          usi_etb_tx_trig; 
output          usi_intr;       
wire            clk;            
wire            dma_ack_rx;     
wire            dma_ack_tx;     
wire            dma_req_rx;     
wire            dma_req_tx;     
wire    [31:0]  i_prdata;       
wire            i_psel;         
wire            i_pwrite;       
wire            nss_ie_n;       
wire            nss_in;         
wire            nss_oe_n;       
wire            nss_out;        
wire    [31:0]  paddr;          
wire            penable;        
wire    [2 :0]  pprot;          
wire    [31:0]  prdata;         
wire            psel;           
wire    [31:0]  pwdata;         
wire            pwrite;         
wire            rst_n;          
wire            sclk_ie_n;      
wire            sclk_in;        
wire            sclk_oe_n;      
wire            sclk_out;       
wire            sd0_ie_n;       
wire            sd0_in;         
wire            sd0_oe_n;       
wire            sd0_out;        
wire            sd1_ie_n;       
wire            sd1_in;         
wire            sd1_oe_n;       
wire            sd1_out;        
wire            sec_rx_req;     
wire            sec_tx_req;     
wire            tipc_usi2_trust; 
wire            usi_etb_rx_trig; 
wire            usi_etb_tx_trig; 
wire            usi_intr;       
usi_top  x_usi2 (
  .clk             (clk            ),
  .dma_ack_rx      (dma_ack_rx     ),
  .dma_ack_tx      (dma_ack_tx     ),
  .dma_req_rx      (dma_req_rx     ),
  .dma_req_tx      (dma_req_tx     ),
  .nss_ie_n        (nss_ie_n       ),
  .nss_in          (nss_in         ),
  .nss_oe_n        (nss_oe_n       ),
  .nss_out         (nss_out        ),
  .paddr           (paddr          ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       ),
  .rst_n           (rst_n          ),
  .sclk_ie_n       (sclk_ie_n      ),
  .sclk_in         (sclk_in        ),
  .sclk_oe_n       (sclk_oe_n      ),
  .sclk_out        (sclk_out       ),
  .sd0_ie_n        (sd0_ie_n       ),
  .sd0_in          (sd0_in         ),
  .sd0_oe_n        (sd0_oe_n       ),
  .sd0_out         (sd0_out        ),
  .sd1_ie_n        (sd1_ie_n       ),
  .sd1_in          (sd1_in         ),
  .sd1_oe_n        (sd1_oe_n       ),
  .sd1_out         (sd1_out        ),
  .usi_etb_rx_trig (usi_etb_rx_trig),
  .usi_etb_tx_trig (usi_etb_tx_trig),
  .usi_intr        (usi_intr       )
);
assign prdata[31:0] = i_prdata[31:0] ;
assign i_pwrite = pwrite ;
assign i_psel =  psel ;
assign sec_rx_req = dma_req_rx ;
assign sec_tx_req = dma_req_tx ;
endmodule
