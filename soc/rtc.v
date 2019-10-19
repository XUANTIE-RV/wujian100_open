/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define RTC_CDR_OFFSET     0
`define RTC_MR_OFFSET      1
`define RTC_CLR_OFFSET     2
`define RTC_CR_OFFSET      3
`define RTC_STAT_OFFSET    4
`define RTC_RSTAT_OFFSET   5
`define RTC_EOI_OFFSET     6
`define RTC_VID_OFFSET     7
`define RTC_CLK_DIV        8
`define RTC_VERSION_ID     32'h3230312a
module rtc0_sec_top(
  aortc_paddr,
  aortc_pclk,
  aortc_penable,
  aortc_pprot,
  aortc_prdata,
  aortc_psel,
  aortc_pwdata,
  aortc_pwrite,
  aortc_rst_n,
  etb_rtc_trig,
  i_rtc_ext_clk,
  rtc0_vic_intr,
  rtc_etb_trig,
  test_mode,
  tipc_rtc0_trust
);
input   [31:0]  aortc_paddr;         
input           aortc_pclk;          
input           aortc_penable;       
input   [2 :0]  aortc_pprot;         
input           aortc_psel;          
input   [31:0]  aortc_pwdata;        
input           aortc_pwrite;        
input           aortc_rst_n;         
input           etb_rtc_trig;        
input           i_rtc_ext_clk;       
input           test_mode;           
input           tipc_rtc0_trust;     
output  [31:0]  aortc_prdata;        
output          rtc0_vic_intr;       
output          rtc_etb_trig;        
wire    [31:0]  aortc_paddr;         
wire            aortc_pclk;          
wire            aortc_penable;       
wire    [2 :0]  aortc_pprot;         
wire    [31:0]  aortc_prdata;        
wire            aortc_psel;          
wire    [31:0]  aortc_pwdata;        
wire            aortc_pwrite;        
wire            aortc_rst_n;         
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire            etb_rtc_trig;        
wire            i_rtc_ext_clk;       
wire            int_flag;            
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            rtc0_vic_intr;       
wire            rtc_clk;             
wire            rtc_etb_trig;        
wire            test_mode;           
wire            tipc_rtc0_trust;     
wire    [31:0]  w_prdata;            
wire            w_psel;              
wire            w_pwrite;            
rtc_pdu_top  x_rtc_pdu_top (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .aou_pdu_cr_reg       (aou_pdu_cr_reg      ),
  .aou_pdu_div_reg      (aou_pdu_div_reg     ),
  .aou_pdu_intr_mask    (aou_pdu_intr_mask   ),
  .aou_pdu_mr_reg       (aou_pdu_mr_reg      ),
  .int_flag             (int_flag            ),
  .paddr                (aortc_paddr[31:0]   ),
  .pclk                 (aortc_pclk          ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_int_clr      (pdu_aou_int_clr     ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .pdu_aou_wen_cr       (pdu_aou_wen_cr      ),
  .pdu_aou_wen_div      (pdu_aou_wen_div     ),
  .pdu_aou_wen_mr       (pdu_aou_wen_mr      ),
  .penable              (aortc_penable       ),
  .prdata               (w_prdata[31:0]      ),
  .presetn              (aortc_rst_n         ),
  .psel                 (w_psel              ),
  .pwdata               (aortc_pwdata[31:0]  ),
  .pwrite               (w_pwrite            ),
  .rtc_clk              (rtc_clk             ),
  .test_mode            (test_mode           )
);
rtc_aou_top  x_rtc_aou_top (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .aou_pdu_cr_reg       (aou_pdu_cr_reg      ),
  .aou_pdu_div_reg      (aou_pdu_div_reg     ),
  .aou_pdu_intr_mask    (aou_pdu_intr_mask   ),
  .aou_pdu_mr_reg       (aou_pdu_mr_reg      ),
  .etb_rtc_trig         (etb_rtc_trig        ),
  .i_rtc_ext_clk        (i_rtc_ext_clk       ),
  .int_flag             (int_flag            ),
  .pclk                 (aortc_pclk          ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_int_clr      (pdu_aou_int_clr     ),
  .pdu_aou_pwdata       (aortc_pwdata[31:0]  ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .pdu_aou_wen_cr       (pdu_aou_wen_cr      ),
  .pdu_aou_wen_div      (pdu_aou_wen_div     ),
  .pdu_aou_wen_mr       (pdu_aou_wen_mr      ),
  .rtc0_vic_intr        (rtc0_vic_intr       ),
  .rtc_clk              (rtc_clk             ),
  .rtc_etb_trig         (rtc_etb_trig        ),
  .rtc_por_rst_n        (aortc_rst_n         ),
  .test_mode            (test_mode           )
);
assign aortc_prdata[31:0] = w_prdata[31:0];
assign w_pwrite = aortc_pwrite;
assign w_psel = aortc_psel;
endmodule
module rtc_aou_apbif(
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  cnt_en,
  etb_rtc_trig,
  intr_en,
  intr_mask,
  match_val,
  pclk,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  presetn,
  pwdata,
  rtcclkdivcfg,
  test_mode,
  wrap_en
);
input           etb_rtc_trig;     
input           pclk;             
input           pdu_aou_wen_cr;   
input           pdu_aou_wen_div;  
input           pdu_aou_wen_mr;   
input           presetn;          
input   [31:0]  pwdata;           
input           test_mode;        
output  [3 :0]  aou_pdu_cr_reg;   
output  [19:0]  aou_pdu_div_reg;  
output          aou_pdu_intr_mask; 
output  [31:0]  aou_pdu_mr_reg;   
output          cnt_en;           
output          intr_en;          
output          intr_mask;        
output  [31:0]  match_val;        
output  [19:0]  rtcclkdivcfg;     
output          wrap_en;          
reg     [3 :0]  cr_reg;           
reg     [19:0]  div_reg;          
reg     [31:0]  mr_reg;           
wire    [3 :0]  aou_pdu_cr_reg;   
wire    [19:0]  aou_pdu_div_reg;  
wire            aou_pdu_intr_mask; 
wire    [31:0]  aou_pdu_mr_reg;   
wire            cnt_en;           
wire            etb_rtc_trig;     
wire            gate_en;          
wire            intr_en;          
wire            intr_mask;        
wire    [31:0]  match_val;        
wire            pclk;             
wire            pclk_gate;        
wire            pdu_aou_wen_cr;   
wire            pdu_aou_wen_div;  
wire            pdu_aou_wen_mr;   
wire            presetn;          
wire    [31:0]  pwdata;           
wire    [19:0]  rtcclkdivcfg;     
wire            test_mode;        
wire            wrap_en;          
assign gate_en = pdu_aou_wen_mr|pdu_aou_wen_cr|etb_rtc_trig|pdu_aou_wen_div;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_gate           ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     mr_reg[31:0] <= 32'b0;
   else if(pdu_aou_wen_mr)
     mr_reg[31:0] <= pwdata[31:0];
 end
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     cr_reg[3:0] <= 4'b0;
   else if(pdu_aou_wen_cr)
     cr_reg[3:0] <= pwdata[3:0];
   else if(etb_rtc_trig)
     cr_reg[2] <= 1'b1;
 end
 always @ (posedge pclk_gate or negedge presetn)
 begin
   if(~presetn)
     div_reg[19:0] <= 20'b1;
   else if(pdu_aou_wen_div)
     div_reg[19:0] <= pwdata[19:0];
 end
 assign aou_pdu_mr_reg[31:0] = mr_reg[31:0];
 assign aou_pdu_cr_reg[ 3:0] = cr_reg[ 3:0];
 assign aou_pdu_div_reg[19:0] = div_reg[19:0];
 assign match_val[31:0] = mr_reg[31:0];
 assign wrap_en = cr_reg[3];
 assign cnt_en = cr_reg[2];
 assign aou_pdu_intr_mask = cr_reg[1];
 assign intr_mask = cr_reg[1];
 assign intr_en = cr_reg[0];
 assign rtcclkdivcfg[19:0] = div_reg[19:0];
endmodule
module rtc_aou_top(
  aou_pdu_cnt,
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  etb_rtc_trig,
  i_rtc_ext_clk,
  int_flag,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_pwdata,
  pdu_aou_wen_clr_sync,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  rtc0_vic_intr,
  rtc_clk,
  rtc_etb_trig,
  rtc_por_rst_n,
  test_mode
);
input           etb_rtc_trig;        
input           i_rtc_ext_clk;       
input           pclk;                
input   [31:0]  pdu_aou_clr_reg;     
input           pdu_aou_int_clr;     
input   [31:0]  pdu_aou_pwdata;      
input           pdu_aou_wen_clr_sync; 
input           pdu_aou_wen_cr;      
input           pdu_aou_wen_div;     
input           pdu_aou_wen_mr;      
input           rtc_por_rst_n;       
input           test_mode;           
output  [31:0]  aou_pdu_cnt;         
output  [3 :0]  aou_pdu_cr_reg;      
output  [19:0]  aou_pdu_div_reg;     
output          aou_pdu_intr_mask;   
output  [31:0]  aou_pdu_mr_reg;      
output          int_flag;            
output          rtc0_vic_intr;       
output          rtc_clk;             
output          rtc_etb_trig;        
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire            cnt_en;              
wire    [31:0]  count_val;           
wire            etb_rtc_trig;        
wire            i_rtc_ext_clk;       
wire            int_flag;            
wire            intr_en;             
wire            intr_mask;           
wire    [31:0]  match_val;           
wire            pclk;                
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire    [31:0]  pdu_aou_pwdata;      
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            presetn;             
wire    [31:0]  pwdata;              
wire            rtc0_vic_intr;       
wire            rtc_clk;             
wire            rtc_etb_trig;        
wire            rtc_por_rst_n;       
wire    [19:0]  rtcclkdivcfg;        
wire            test_mode;           
wire            wrap_en;             
rtc_cnt  x_rtc_cnt (
  .aou_pdu_cnt          (aou_pdu_cnt         ),
  .cnt_en               (cnt_en              ),
  .count_val            (count_val           ),
  .match_val            (match_val           ),
  .pdu_aou_clr_reg      (pdu_aou_clr_reg     ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .presetn              (presetn             ),
  .rtc_clk              (rtc_clk             ),
  .wrap_en              (wrap_en             )
);
rtc_ig  x_rtc_ig (
  .cnt_en          (cnt_en         ),
  .count_val       (count_val      ),
  .i_rtc_ext_clk   (i_rtc_ext_clk  ),
  .int_flag        (int_flag       ),
  .intr_en         (intr_en        ),
  .intr_mask       (intr_mask      ),
  .match_val       (match_val      ),
  .pdu_aou_int_clr (pdu_aou_int_clr),
  .rtc0_vic_intr   (rtc0_vic_intr  ),
  .rtc_etb_trig    (rtc_etb_trig   ),
  .rtc_por_rst_n   (rtc_por_rst_n  )
);
rtc_clk_div  x_rtc_clk_div (
  .cnt_en        (cnt_en       ),
  .i_rtc_ext_clk (i_rtc_ext_clk),
  .pclk          (pclk         ),
  .presetn       (presetn      ),
  .rtc_clk       (rtc_clk      ),
  .rtcclkdivcfg  (rtcclkdivcfg ),
  .test_mode     (test_mode    )
);
rtc_aou_apbif  x_rtc_aou_apbif (
  .aou_pdu_cr_reg    (aou_pdu_cr_reg   ),
  .aou_pdu_div_reg   (aou_pdu_div_reg  ),
  .aou_pdu_intr_mask (aou_pdu_intr_mask),
  .aou_pdu_mr_reg    (aou_pdu_mr_reg   ),
  .cnt_en            (cnt_en           ),
  .etb_rtc_trig      (etb_rtc_trig     ),
  .intr_en           (intr_en          ),
  .intr_mask         (intr_mask        ),
  .match_val         (match_val        ),
  .pclk              (pclk             ),
  .pdu_aou_wen_cr    (pdu_aou_wen_cr   ),
  .pdu_aou_wen_div   (pdu_aou_wen_div  ),
  .pdu_aou_wen_mr    (pdu_aou_wen_mr   ),
  .presetn           (presetn          ),
  .pwdata            (pwdata           ),
  .rtcclkdivcfg      (rtcclkdivcfg     ),
  .test_mode         (test_mode        ),
  .wrap_en           (wrap_en          )
);
assign presetn = rtc_por_rst_n;
assign pwdata[31:0] = pdu_aou_pwdata[31:0];
endmodule
module rtc_cdr_sync(
  aou_pdu_cnt,
  cnt_sync,
  pclk,
  presetn,
  test_mode
);
input   [31:0]  aou_pdu_cnt; 
input           pclk;       
input           presetn;    
input           test_mode;  
output  [31:0]  cnt_sync;   
reg             cnt_reg1;   
reg             cnt_reg2;   
reg             cnt_reg3;   
reg     [31:0]  cnt_sync;   
wire    [31:0]  aou_pdu_cnt; 
wire            cnt_ed;     
wire            pclk;       
wire            pclk_sync;  
wire            presetn;    
wire            test_mode;  
 always @(posedge pclk or negedge presetn)
 begin
   if(~presetn)
     begin
       cnt_reg1 <= 1'b0;
       cnt_reg2 <= 1'b0;
       cnt_reg3 <= 1'b0;
     end
   else
     begin
       cnt_reg1 <= aou_pdu_cnt[0];
       cnt_reg2 <= cnt_reg1;
       cnt_reg3 <= cnt_reg2;
     end
 end
assign cnt_ed = cnt_reg2 ^ cnt_reg3;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_sync           ),
  .external_en          (cnt_ed              ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @(posedge pclk_sync or negedge presetn)
 begin
   if(~presetn)
     begin
       cnt_sync[31:0] <= 32'b0;
     end
   else 
     begin
       cnt_sync[31:0] <= aou_pdu_cnt[31:0];
     end
 end
endmodule
module rtc_clk_div(
  cnt_en,
  i_rtc_ext_clk,
  pclk,
  presetn,
  rtc_clk,
  rtcclkdivcfg,
  test_mode
);
input           cnt_en;       
input           i_rtc_ext_clk; 
input           pclk;         
input           presetn;      
input   [19:0]  rtcclkdivcfg; 
input           test_mode;    
output          rtc_clk;      
reg     [19:0]  cnt;          
wire            cntEq0;       
wire            cnt_en;       
wire            gate_en;      
wire            i_rtc_ext_clk; 
wire            pclk;         
wire            presetn;      
wire            rtc_clk;      
wire            rtc_clk_div;  
wire    [19:0]  rtcclkdivcfg; 
wire            test_mode;    
assign cntEq0 = cnt[19:0] == rtcclkdivcfg[19:0];
always @(posedge i_rtc_ext_clk or negedge presetn)
begin
	if(~presetn)
		cnt[19:0] <= 20'b0;
	else if(cntEq0)
		cnt[19:0] <= 20'b0;
	else if(cnt_en)
		cnt[19:0] <= cnt[19:0] + 20'b1;
end
assign gate_en = cntEq0;
gated_clk_cell  x_gatecell (
  .clk_in               (i_rtc_ext_clk       ),
  .clk_out              (rtc_clk_div         ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
assign rtc_clk = test_mode ? pclk : rtc_clk_div;
endmodule
module rtc_clr_sync(
  pclk,
  pdu_aou_wen_clr_sync,
  presetn,
  rtc_clk,
  test_mode,
  wen_clr
);
input        pclk;                
input        presetn;             
input        rtc_clk;             
input        test_mode;           
input        wen_clr;             
output       pdu_aou_wen_clr_sync; 
reg          pclk_load_sync1;     
reg          pclk_load_sync2;     
reg          rtc_load_sync1;      
reg          rtc_load_sync2;      
reg          wen_clr_hold;        
wire         gate_en;             
wire         load_done;           
wire         pclk;                
wire         pclk_sync;           
wire         pdu_aou_wen_clr_sync; 
wire         presetn;             
wire         rtc_clk;             
wire         test_mode;           
wire         wen_clr;             
assign gate_en = wen_clr | wen_clr_hold | pclk_load_sync2;
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_sync           ),
  .external_en          (gate_en             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @(posedge pclk_sync or negedge presetn)
 begin
   if(~presetn)
     begin
       wen_clr_hold <= 1'b0;
     end
   else if(load_done)
     begin
       wen_clr_hold <= 1'b0;
     end
   else if(wen_clr)
     begin
       wen_clr_hold <= 1'b1;
     end
 end
 always @(posedge rtc_clk or negedge presetn)
 begin
   if(~presetn)
     begin
       rtc_load_sync1 <= 1'b0;
       rtc_load_sync2 <= 1'b0;
     end
   else
     begin
       rtc_load_sync1 <= wen_clr_hold;
       rtc_load_sync2 <= rtc_load_sync1;
     end
 end
 always @(posedge pclk_sync or negedge presetn)
 begin
   if(~presetn)
     begin
       pclk_load_sync1 <= 1'b0;
       pclk_load_sync2 <= 1'b0;
     end
   else
     begin
       pclk_load_sync1 <= rtc_load_sync2;
       pclk_load_sync2 <= pclk_load_sync1;
     end
 end
assign load_done = pclk_load_sync2;
assign pdu_aou_wen_clr_sync = rtc_load_sync2;
endmodule
module rtc_cnt(
  aou_pdu_cnt,
  cnt_en,
  count_val,
  match_val,
  pdu_aou_clr_reg,
  pdu_aou_wen_clr_sync,
  presetn,
  rtc_clk,
  wrap_en
);
input           cnt_en;              
input   [31:0]  match_val;           
input   [31:0]  pdu_aou_clr_reg;     
input           pdu_aou_wen_clr_sync; 
input           presetn;             
input           rtc_clk;             
input           wrap_en;             
output  [31:0]  aou_pdu_cnt;         
output  [31:0]  count_val;           
reg     [31:0]  cnt;                 
wire    [31:0]  aou_pdu_cnt;         
wire            cnt_en;              
wire    [31:0]  count_val;           
wire    [31:0]  match_val;           
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_wen_clr_sync; 
wire            presetn;             
wire            rtc_clk;             
wire            wrap_en;             
 always @ (posedge rtc_clk or negedge presetn)
 begin
   if(~presetn)
     begin
         cnt[31:0] <= {32{1'b0}};
     end
   else if(pdu_aou_wen_clr_sync)
     begin
         cnt[31:0] <= pdu_aou_clr_reg[31:0];
     end
   else if(cnt_en)
     begin
        if((cnt[31:0] == match_val[31:0]) && wrap_en)
           begin
             cnt[31:0] <= {32{1'b0}};
           end
	else
	   begin
             cnt[31:0] <= cnt[31:0] + 1'b1;
           end
     end
 end 
 assign aou_pdu_cnt[31:0] = cnt[31:0];
 assign count_val[31:0] = cnt[31:0];
endmodule
module rtc_ig(
  cnt_en,
  count_val,
  i_rtc_ext_clk,
  int_flag,
  intr_en,
  intr_mask,
  match_val,
  pdu_aou_int_clr,
  rtc0_vic_intr,
  rtc_etb_trig,
  rtc_por_rst_n
);
input           cnt_en;         
input   [31:0]  count_val;      
input           i_rtc_ext_clk;  
input           intr_en;        
input           intr_mask;      
input   [31:0]  match_val;      
input           pdu_aou_int_clr; 
input           rtc_por_rst_n;  
output          int_flag;       
output          rtc0_vic_intr;  
output          rtc_etb_trig;   
reg             cmp_res;        
reg             int_flag;       
reg             rtc_etb_trig;   
wire            cnt_en;         
wire    [31:0]  count_val;      
wire            i_rtc_ext_clk;  
wire            int_intr;       
wire            intr_en;        
wire            intr_mask;      
wire    [31:0]  match_val;      
wire            pdu_aou_int_clr; 
wire            rtc0_vic_intr;  
wire            rtc_por_rst_n;  
 always @ (match_val[31:0] or count_val[31:0] or cnt_en)
 begin
   if((match_val[31:0] == count_val[31:0]) && cnt_en)
     begin
       cmp_res = 1'b1;
     end
   else
     begin
       cmp_res = 1'b0;
     end
 end
assign int_intr = cmp_res && intr_en;
assign rtc0_vic_intr = intr_mask ? 1'b0 : (int_flag && ~pdu_aou_int_clr);
 always @ (posedge i_rtc_ext_clk or negedge rtc_por_rst_n)
 begin
   if(!rtc_por_rst_n)
     begin
       int_flag <= 1'b0;
     end
   else if(int_intr)
     begin
       int_flag <= 1'b1;
     end
   else if (pdu_aou_int_clr)
     begin
       int_flag <= 1'b0;
     end
 end
 always @ (posedge i_rtc_ext_clk or negedge rtc_por_rst_n)
 begin
   if(!rtc_por_rst_n)
     begin
       rtc_etb_trig <= 1'b0;
     end
   else if(cmp_res)
     begin
       rtc_etb_trig <= 1'b1;
     end
   else
     begin
       rtc_etb_trig <= 1'b0;
     end
 end
endmodule
module rtc_pdu_apbif(
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  cnt_sync,
  int_flag,
  paddr,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  test_mode,
  wen_clr
);
input   [3 :0]  aou_pdu_cr_reg;   
input   [19:0]  aou_pdu_div_reg;  
input           aou_pdu_intr_mask; 
input   [31:0]  aou_pdu_mr_reg;   
input   [31:0]  cnt_sync;         
input           int_flag;         
input   [31:0]  paddr;            
input           pclk;             
input           penable;          
input           presetn;          
input           psel;             
input   [31:0]  pwdata;           
input           pwrite;           
input           test_mode;        
output  [31:0]  pdu_aou_clr_reg;  
output          pdu_aou_int_clr;  
output          pdu_aou_wen_cr;   
output          pdu_aou_wen_div;  
output          pdu_aou_wen_mr;   
output  [31:0]  prdata;           
output          wen_clr;          
reg     [31:0]  clr_reg;          
reg             int_clr;          
reg             int_state;        
reg     [31:0]  prdata;           
reg             ren_cdr;          
reg             ren_clr;          
reg             ren_cr;           
reg             ren_div;          
reg             ren_eoi;          
reg             ren_mr;           
reg             ren_rstat;        
reg             ren_stat;         
reg             ren_vid;          
reg             wen_clr;          
reg             wen_cr;           
reg             wen_div;          
reg             wen_mr;           
wire    [3 :0]  aou_pdu_cr_reg;   
wire    [19:0]  aou_pdu_div_reg;  
wire            aou_pdu_intr_mask; 
wire    [31:0]  aou_pdu_mr_reg;   
wire            aou_pdu_rstat;    
wire            aou_pdu_stat;     
wire    [31:0]  cdr_reg;          
wire    [31:0]  cnt_sync;         
wire    [3 :0]  cr_reg;           
wire    [19:0]  div_reg;          
wire            int_flag;         
wire    [31:0]  mr_reg;           
wire    [31:0]  paddr;            
wire            pclk;             
wire            pclk_clr;         
wire    [31:0]  pdu_aou_clr_reg;  
wire            pdu_aou_int_clr;  
wire            pdu_aou_ren_eoi;  
wire            pdu_aou_wen_cr;   
wire            pdu_aou_wen_div;  
wire            pdu_aou_wen_mr;   
wire            penable;          
wire            presetn;          
wire            psel;             
wire    [31:0]  pwdata;           
wire            pwrite;           
wire            test_mode;        
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_MR_OFFSET))
       wen_mr = 1'b1;
   else
       wen_mr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CLR_OFFSET))
       wen_clr = 1'b1;
   else
       wen_clr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CR_OFFSET))
       wen_cr = 1'b1;
   else
       wen_cr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1) &&
       (paddr[5:2] == `RTC_CLK_DIV))
       wen_div = 1'b1;
   else
       wen_div = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CDR_OFFSET))
      ren_cdr = 1'b1;
   else
      ren_cdr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_MR_OFFSET))
      ren_mr = 1'b1;
   else
      ren_mr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CLR_OFFSET))
      ren_clr = 1'b1;
   else
      ren_clr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CR_OFFSET))
      ren_cr = 1'b1;
   else
      ren_cr = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_STAT_OFFSET))
      ren_stat = 1'b1;
   else
      ren_stat = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_RSTAT_OFFSET))
      ren_rstat = 1'b1;
   else
      ren_rstat = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_EOI_OFFSET))
      ren_eoi = 1'b1;
   else
      ren_eoi = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_VID_OFFSET))
      ren_vid = 1'b1;
   else
      ren_vid = 1'b0;
 end
 always @(paddr[5:2] or psel or penable or pwrite)
 begin
   if ((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b0) &&
      (paddr[5:2] == `RTC_CLK_DIV))
      ren_div = 1'b1;
   else
      ren_div = 1'b0;
 end
gated_clk_cell  gatecell (
  .clk_in               (pclk                ),
  .clk_out              (pclk_clr            ),
  .external_en          (wen_clr             ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
 always @ (posedge pclk_clr or negedge presetn)
 begin
   if(~presetn)
     clr_reg[31:0] <= 32'b0;
   else
     clr_reg[31:0] <= pwdata[31:0];
 end
always @( mr_reg[31:0]
       or ren_cr
       or ren_eoi
       or cr_reg[3:0]
       or aou_pdu_rstat
       or cdr_reg[31:0]
       or ren_cdr
       or ren_rstat
       or ren_div
       or div_reg[19:0]
       or ren_mr
       or clr_reg[31:0]
       or ren_vid
       or ren_clr
       or ren_stat
       or aou_pdu_stat)
begin
 begin
   if(ren_cdr)
     begin
       prdata[31:0] = cdr_reg[31:0];
     end
   else if(ren_mr)
     begin
       prdata[31:0] = mr_reg[31:0];
     end
   else if(ren_clr)
     begin
       prdata[31:0] = clr_reg[31:0];
     end
   else if(ren_cr)
     begin
       prdata[31:0] = {28'b0,cr_reg[3:0]};
     end
   else if(ren_stat)
     begin
       prdata[31:0] = {31'b0,aou_pdu_stat};
     end
   else if(ren_rstat)
     begin
       prdata[31:0] = {31'b0,aou_pdu_rstat};
     end
   else if(ren_eoi)
     begin
       prdata[31:0] = 32'b0;
     end
   else if(ren_vid)
     begin
       prdata[31:0] = `RTC_VERSION_ID;
     end
   else if(ren_div)
     begin
       prdata[31:0] = {12'b0,div_reg[19:0]};
     end
   else
       prdata[31:0] = 32'b0;
 end
end
always @(posedge pclk or negedge presetn)
begin
  if(~presetn)
    begin
      int_clr <= 1'b0;
    end
  else if (int_flag && pdu_aou_ren_eoi)
    begin
      int_clr <= 1'b1;
    end
  else if (int_flag)
    begin
      int_clr <= int_clr;
    end
  else 
    begin
      int_clr <= 1'b0;
    end
end
assign pdu_aou_int_clr = int_clr;
always @(posedge pclk or negedge presetn)
begin
  if(~presetn)
    begin
      int_state <= 1'b0;
    end
  else if (int_clr)
    begin
      int_state <= 1'b0;
    end
  else if (int_flag)
    begin
      int_state <= 1'b1;
    end
end
assign aou_pdu_rstat = int_state;
assign aou_pdu_stat = aou_pdu_intr_mask ? 1'b0 : int_state;
 assign mr_reg[31:0] = aou_pdu_mr_reg[31:0];
 assign cr_reg[ 3:0] = aou_pdu_cr_reg[ 3:0];
 assign div_reg[19:0] = aou_pdu_div_reg[19:0];
 assign cdr_reg[31:0] = cnt_sync[31:0];
 assign pdu_aou_clr_reg[31:0] = clr_reg[31:0];
 assign pdu_aou_ren_eoi = ren_eoi;
 assign pdu_aou_wen_mr = wen_mr;
 assign pdu_aou_wen_cr = wen_cr;
 assign pdu_aou_wen_div = wen_div;
endmodule
module rtc_pdu_top(
  aou_pdu_cnt,
  aou_pdu_cr_reg,
  aou_pdu_div_reg,
  aou_pdu_intr_mask,
  aou_pdu_mr_reg,
  int_flag,
  paddr,
  pclk,
  pdu_aou_clr_reg,
  pdu_aou_int_clr,
  pdu_aou_wen_clr_sync,
  pdu_aou_wen_cr,
  pdu_aou_wen_div,
  pdu_aou_wen_mr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  rtc_clk,
  test_mode
);
input   [31:0]  aou_pdu_cnt;         
input   [3 :0]  aou_pdu_cr_reg;      
input   [19:0]  aou_pdu_div_reg;     
input           aou_pdu_intr_mask;   
input   [31:0]  aou_pdu_mr_reg;      
input           int_flag;            
input   [31:0]  paddr;               
input           pclk;                
input           penable;             
input           presetn;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           rtc_clk;             
input           test_mode;           
output  [31:0]  pdu_aou_clr_reg;     
output          pdu_aou_int_clr;     
output          pdu_aou_wen_clr_sync; 
output          pdu_aou_wen_cr;      
output          pdu_aou_wen_div;     
output          pdu_aou_wen_mr;      
output  [31:0]  prdata;              
wire    [31:0]  aou_pdu_cnt;         
wire    [3 :0]  aou_pdu_cr_reg;      
wire    [19:0]  aou_pdu_div_reg;     
wire            aou_pdu_intr_mask;   
wire    [31:0]  aou_pdu_mr_reg;      
wire    [31:0]  cnt_sync;            
wire            int_flag;            
wire    [31:0]  paddr;               
wire            pclk;                
wire    [31:0]  pdu_aou_clr_reg;     
wire            pdu_aou_int_clr;     
wire            pdu_aou_wen_clr_sync; 
wire            pdu_aou_wen_cr;      
wire            pdu_aou_wen_div;     
wire            pdu_aou_wen_mr;      
wire            penable;             
wire    [31:0]  prdata;              
wire            presetn;             
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            rtc_clk;             
wire            test_mode;           
wire            wen_clr;             
rtc_pdu_apbif  x_rtc_pdu_apbif (
  .aou_pdu_cr_reg    (aou_pdu_cr_reg   ),
  .aou_pdu_div_reg   (aou_pdu_div_reg  ),
  .aou_pdu_intr_mask (aou_pdu_intr_mask),
  .aou_pdu_mr_reg    (aou_pdu_mr_reg   ),
  .cnt_sync          (cnt_sync         ),
  .int_flag          (int_flag         ),
  .paddr             (paddr            ),
  .pclk              (pclk             ),
  .pdu_aou_clr_reg   (pdu_aou_clr_reg  ),
  .pdu_aou_int_clr   (pdu_aou_int_clr  ),
  .pdu_aou_wen_cr    (pdu_aou_wen_cr   ),
  .pdu_aou_wen_div   (pdu_aou_wen_div  ),
  .pdu_aou_wen_mr    (pdu_aou_wen_mr   ),
  .penable           (penable          ),
  .prdata            (prdata           ),
  .presetn           (presetn          ),
  .psel              (psel             ),
  .pwdata            (pwdata           ),
  .pwrite            (pwrite           ),
  .test_mode         (test_mode        ),
  .wen_clr           (wen_clr          )
);
rtc_cdr_sync  x_rtc_cdr_sync (
  .aou_pdu_cnt (aou_pdu_cnt),
  .cnt_sync    (cnt_sync   ),
  .pclk        (pclk       ),
  .presetn     (presetn    ),
  .test_mode   (test_mode  )
);
rtc_clr_sync  x_rtc_clr_sync (
  .pclk                 (pclk                ),
  .pdu_aou_wen_clr_sync (pdu_aou_wen_clr_sync),
  .presetn              (presetn             ),
  .rtc_clk              (rtc_clk             ),
  .test_mode            (test_mode           ),
  .wen_clr              (wen_clr             )
);
endmodule
