/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module wdt_biu #
(
    parameter      WDT_ADDR_LHS = 5'd10
)
(
    input  wire                            pclk        ,
    input  wire                            presetn     ,
    input  wire                            psel        ,
    input  wire         [WDT_ADDR_LHS:0]   paddr       ,
    input  wire                            pwrite      ,
    input  wire                            penable     ,
    input  wire                   [31:0]   pwdata      ,
    output reg                    [31:0]   prdata      ,
    input  wire                   [31:0]   iprdata     ,
    output wire   			               wr_en       ,
    output wire   			               rd_en       ,
    output wire        [WDT_ADDR_LHS-2:0]  reg_addr    ,
    output wire                   [31:0]   ipwdata      
 );
assign  wr_en = psel &  penable &  pwrite;
assign  rd_en = psel & !penable & !pwrite;
assign reg_addr = paddr[WDT_ADDR_LHS:2];
assign  ipwdata = pwdata;
always @(posedge pclk or negedge presetn)
begin
   if(presetn == 1'b0)
       prdata <= 32'b0;
   else if(rd_en == 1'b1)	    
 	  prdata <= iprdata;
   else ;
end
endmodule
module wdt_cnt #
(
   `include     "wdt_params.v"
)
(
   input  wire                       clk              ,
   input  wire                       clk_en           ,
   input  wire    	                 rst_n            ,
   input  wire  [WDT_CNT_WIDTH-1:0]  start_val        ,
   input  wire    	                 restart          ,
   input  wire    	                 cnt_en           ,
   input  wire    	                 pause            ,
   input  wire    	                 speed_up         ,
   input  wire                       scan_mode        ,
   output reg   [WDT_CNT_WIDTH-1:0]  cnt               
);
reg                           ext_rise_edge        ;
reg                           extend               ;
reg                           prev_cnt_en          ;
wire                          int_cnt_en           ;
wire   [WDT_CNT_WIDTH-1:0]    int_start_val        ;
wire                          ext_init_ld          ;
wire                          ext_restart          ;
wire                          initial_load         ;
wire                          rise_edge_cnt_en     ;
wire                          int_speed_up         ;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        cnt <= WDT_CNT_RST;
    else if(clk_en) begin
        if(initial_load)
            cnt <= int_start_val;
        else if(ext_restart || (cnt == {WDT_CNT_WIDTH{1'b0}} & (~pause)))
            cnt <= int_start_val;
        else if(int_cnt_en)
            cnt <= cnt - 1'b1;
        else ;
    end
    else ;
end
assign  int_start_val[WDT_CNT_WIDTH-1:8] = int_speed_up ? {(WDT_CNT_WIDTH-8){1'b0}} : 
                                                          start_val[WDT_CNT_WIDTH-1:8];
assign  int_start_val[7:0]               = int_speed_up ? 8'b11111111 : 
                                                          start_val[7:0];
assign  int_speed_up                     = scan_mode ? cnt[0] : speed_up;
assign  int_cnt_en                       = cnt_en & (~pause);
assign  initial_load                     = (WDT_DUAL_TOP == 1) ? ext_init_ld : 1'b0;
assign  ext_init_ld  = (WDT_CLK_EN == 1) ? (rise_edge_cnt_en | ext_rise_edge) : rise_edge_cnt_en;
always @ (posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        ext_rise_edge <= 1'b0;
    else
        ext_rise_edge <= ((rise_edge_cnt_en & (~clk_en)) | ext_init_ld) & ~(clk_en & ext_init_ld);
end
assign  rise_edge_cnt_en = cnt_en & ~prev_cnt_en;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0) 
        prev_cnt_en <= 1'b0;
    else
        prev_cnt_en <= cnt_en;
end
assign  ext_restart = (WDT_CLK_EN == 1) ? (restart | extend) : restart;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        extend <= 1'b0;
    else
        extend <= ((restart & (~clk_en)) | ext_restart) & ~(clk_en & ext_restart);
end
endmodule
module wdt_isrc #
(
    `include     "wdt_params.v"
)
(
    input  wire                         pclk        ,
    input  wire   	                    presetn     ,
    input  wire   	                    wdt_clk_en  ,
    input  wire  [WDT_CNT_WIDTH-1:0]    top         ,
    input  wire                         restart     ,
    input  wire                         wdt_en      ,
    input  wire                         eoi_en      ,
    input  wire                [7:0]    rpl         ,
    input  wire                         rmod        ,
    input  wire                         pause       ,
    input  wire                         speed_up    ,
    input  wire                         scan_mode   ,
    output wire  [WDT_CNT_WIDTH-1:0]    cnt         ,
    output wire  		                wdt_int     ,
    output wire                         sys_rst      
);
   wdt_cnt U_WDT_CNT
   (
      .clk          (pclk          ),
      .clk_en       (wdt_clk_en    ),
      .rst_n        (presetn       ),
      .start_val    (top           ),
      .restart      (restart       ),
      .cnt_en       (wdt_en        ),
      .pause        (pause         ),
      .speed_up     (speed_up      ),
      .scan_mode    (scan_mode     ),
      .cnt          (cnt           )
   );
   wdt_isrg U_WDT_ISRG
   (
    .clk           (pclk           ),
    .clk_en        (wdt_clk_en     ),
    .rst_n         (presetn        ),
    .cnt_val       (cnt            ),
    .eoi_en        (eoi_en         ),
    .restart       (restart        ),
    .rst_pulse_len (rpl            ),
    .resp_mod      (rmod           ),
    .pause         (pause          ),
    .wdt_int       (wdt_int        ),
    .sys_rst       (sys_rst        )
    );
endmodule 
module wdt_isrg #
(
   `include     "wdt_params.v"
)
(
   input  wire                         clk            ,
   input  wire    	                   rst_n          ,
   input  wire                         clk_en         ,
   input  wire  [WDT_CNT_WIDTH-1:0]    cnt_val        ,
   input  wire    	                   eoi_en         ,
   input  wire    	                   restart        ,
   input  wire                [7:0]    rst_pulse_len  ,
   input  wire                         resp_mod       ,
   input  wire                         pause          ,
   output reg   		               wdt_int        ,
   output reg                          sys_rst         
);
reg    [7:0]                rst_cnt         ;
reg                         extend          ;
wire                        clr_int         ;
wire                        ext_clr_int     ;
wire                        clr_sys_rst     ;
wire                        zero_cnt        ;
reg                         prev_zero_cnt   ;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        wdt_int <= 1'b0;
    else if(resp_mod) begin
        if(ext_clr_int)
            wdt_int <= 1'b0;
        else if(zero_cnt & clk_en & (~pause))
            wdt_int <= 1'b1;
        else ;
    end
    else
        wdt_int <= 1'b0;
end
assign  ext_clr_int = (WDT_CLK_EN == 1) ? (clr_int | extend) : clr_int;
assign  clr_int = restart | eoi_en;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        extend <= 1'b0;
    else
        extend <= ((clr_int & (~clk_en)) | ext_clr_int) & ~(clk_en & ext_clr_int);
end 
assign  zero_cnt = (cnt_val == {WDT_CNT_WIDTH{1'b0}}) ? 1'b1 : 1'b0;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        sys_rst <= 1'b0;
    else begin
        if(clr_sys_rst)
            sys_rst <= 1'b0;
        else if(zero_cnt & clk_en & (~pause) & (~ext_clr_int)) begin
            if(resp_mod)
                sys_rst <= wdt_int;
            else
                sys_rst <= 1'b1;
        end
        else ;
    end
end 
assign  clr_sys_rst = (rst_cnt >= rst_pulse_len) ? 1'b1 : 1'b0;
always @(posedge clk or negedge rst_n)
begin
    if(rst_n == 1'b0)
        rst_cnt <= 8'b0;
    else begin
        if(sys_rst)
            rst_cnt <= rst_cnt + 1'b1;
        else
            rst_cnt <= 8'b0;
    end
end 
endmodule 
module wdt_regfile #
(
    `include        "wdt_params.v"
)
(
    input  wire                              pclk             ,
    input  wire     		                 presetn          ,
    input  wire                              clk_en           ,
    input  wire                              wdt_en_external  ,
    input  wire     		                 wr_en            ,
    input  wire     		                 rd_en            ,
    input  wire        [WDT_ADDR_LHS-2:0]    reg_addr         ,
    input  wire                    [31:0]    ipwdata          ,
    output reg                     [31:0]    iprdata          ,
    input  wire       [WDT_CNT_WIDTH-1:0]    cnt              ,
    input  wire                              wdt_int          ,
    output wire       [WDT_CNT_WIDTH-1:0]    top              ,
    output wire                              restart          ,
    output reg                               wdt_en           ,
    output wire                              eoi_en           ,
    output reg                      [7:0]    rpl              ,
    output wire                              rmod              
);
localparam             WDT_CR_OFFSET     = 0;
localparam             WDT_TORR_OFFSET   = 1;
localparam             WDT_CCVR_OFFSET   = 2;
localparam             WDT_CRR_OFFSET    = 3;
localparam             WDT_STAT_OFFSET   = 4;
localparam             WDT_EOI_OFFSET    = 5;
localparam             WDT_FIXED_TOP_0   = 32'hffff    ;
localparam             WDT_FIXED_TOP_1   = 32'h1ffff   ;
localparam             WDT_FIXED_TOP_2   = 32'h3ffff   ;
localparam             WDT_FIXED_TOP_3   = 32'h7ffff   ;
localparam             WDT_FIXED_TOP_4   = 32'hfffff   ;
localparam             WDT_FIXED_TOP_5   = 32'h1fffff  ;
localparam             WDT_FIXED_TOP_6   = 32'h3fffff  ;
localparam             WDT_FIXED_TOP_7   = 32'h7fffff  ;
localparam             WDT_FIXED_TOP_8   = 32'hffffff  ;
localparam             WDT_FIXED_TOP_9   = 32'h1ffffff ;
localparam             WDT_FIXED_TOP_10  = 32'h3ffffff ;
localparam             WDT_FIXED_TOP_11  = 32'h7ffffff ;
localparam             WDT_FIXED_TOP_12  = 32'hfffffff ;
localparam             WDT_FIXED_TOP_13  = 32'h1fffffff;
localparam             WDT_FIXED_TOP_14  = 32'h3fffffff;
localparam             WDT_FIXED_TOP_15  = 32'h7fffffff;
localparam             WDT_RPL_0         = 1  ;
localparam             WDT_RPL_1         = 3  ;
localparam             WDT_RPL_2         = 7  ;
localparam             WDT_RPL_3         = 15 ;
localparam             WDT_RPL_4         = 31 ;
localparam             WDT_RPL_5         = 63 ;
localparam             WDT_RPL_6         = 127;
localparam             WDT_RPL_7         = 255;
wire                               wdt_cr_en        ;
wire                               wdt_torr_en      ;
wire                               wdt_ccvr_en      ;
wire                               wdt_crr_en       ;
wire                               wdt_stat_en      ;
wire                               wdt_eoi_en       ;
wire                               wdt_cr_we        ;
wire                               wdt_torr_we      ;
wire                               wdt_crr_we       ;
reg                      [ 5:0]    wdt_cr_ir        ;
wire                     [ 5:0]    wdt_cr           ;
reg                      [ 7:0]    wdt_torr_ir      ;
wire                     [ 7:0]    wdt_torr         ;
wire                     [31:0]    wdt_ccvr         ;
wire 		             [ 2:0]    dflt_rpl         ;
wire 			                   dflt_rmod        ;
wire 	                           dflt_wdt_en      ;
wire 		             [ 3:0]    dflt_top_init    ;
wire                     [ 3:0]    dflt_top_bus     ;
wire                     [ 7:0]    int_wdt_torr_ir  ;
reg                      [31:0]    int_cnt          ;
wire                               wdt_eoi_rd       ;
reg                                prev_wdt_eoi_rd  ;
wire                               top_sel          ;
reg         [WDT_CNT_WIDTH-1:0]    int_top          ;
reg         [WDT_CNT_WIDTH-1:0]    int_top_init     ;
reg                                been_started     ;
reg                                been_enabled     ;
assign  wdt_cr_en     = (reg_addr == WDT_CR_OFFSET  ) ? 1'b1 : 1'b0;
assign  wdt_torr_en   = (reg_addr == WDT_TORR_OFFSET) ? 1'b1 : 1'b0;
assign  wdt_ccvr_en   = (reg_addr == WDT_CCVR_OFFSET) ? 1'b1 : 1'b0;
assign  wdt_crr_en    = (reg_addr == WDT_CRR_OFFSET ) ? 1'b1 : 1'b0;
assign  wdt_stat_en   = (reg_addr == WDT_STAT_OFFSET) ? 1'b1 : 1'b0;
assign  wdt_eoi_en    = (reg_addr == WDT_EOI_OFFSET ) ? 1'b1 : 1'b0;
assign  wdt_cr_we   = wdt_cr_en   & wr_en;
assign  wdt_torr_we = wdt_torr_en & wr_en;
assign  wdt_crr_we  = wdt_crr_en  & wr_en;
assign  dflt_rpl    = WDT_DFLT_RPL;
assign  dflt_rmod   = WDT_DFLT_RMOD;
assign  dflt_wdt_en = WDT_ALWAYS_EN;
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0) 
        wdt_cr_ir <= {1'b0,dflt_rpl, dflt_rmod, dflt_wdt_en};
    else if(wdt_cr_we) begin
   	    wdt_cr_ir[5:1] <= ipwdata[5:1];
   	        wdt_cr_ir[0] <= ipwdata[0];
    end
    else ;
end
assign  wdt_cr[5]   = wdt_cr_ir[5];
assign  wdt_cr[4:2] = wdt_cr_ir[4:2];
assign  wdt_cr[1]   = wdt_cr_ir[1];
assign  wdt_cr[0]   = (WDT_ALWAYS_EN == 1'b0) ? wdt_cr_ir[0]   : WDT_ALWAYS_EN;
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0) 
        wdt_torr_ir <= WDT_TOP_RST;
    else if(wdt_torr_we)
   	   wdt_torr_ir <= ipwdata[7:0];
    else ;
end
assign  dflt_top_init   = WDT_DFLT_TOP_INIT;
assign  dflt_top_bus    = WDT_DFLT_TOP;
assign  int_wdt_torr_ir = (WDT_ALWAYS_EN == 1'b1 && WDT_DUAL_TOP == 1'b1) ? {dflt_top_init, wdt_torr_ir[3:0]} : wdt_torr_ir;
assign  wdt_torr        = int_wdt_torr_ir; 
assign  restart = (wdt_crr_we) ? (ipwdata[7:0] == 8'b01110110) : 1'b0;
always @ (*) 
begin
    int_cnt = 32'b0;
    int_cnt[WDT_CNT_WIDTH-1:0] = cnt;
end
assign  wdt_ccvr = int_cnt; 
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0) 
        prev_wdt_eoi_rd <= 1'b0;
    else 
        prev_wdt_eoi_rd <= wdt_eoi_rd;
end
assign  wdt_eoi_rd = wdt_eoi_en & rd_en;
assign  eoi_en = wdt_eoi_rd & ~prev_wdt_eoi_rd;
always @(*) 
begin      
    iprdata = 32'b0;    
    if(wdt_cr_en == 1'b1)
        iprdata[5:0] = wdt_cr;
    else if(wdt_torr_en == 1'b1)
        iprdata[7:0] = wdt_torr;
    else if(wdt_ccvr_en == 1'b1)
        iprdata[WDT_CNT_WIDTH-1:0]  = wdt_ccvr[WDT_CNT_WIDTH-1:0];
    else if(wdt_stat_en == 1'b1)
        iprdata[0]   = wdt_int;     
end
assign  top     = top_sel ? int_top : int_top_init;
assign  top_sel = (WDT_DUAL_TOP == 1'b1) ? been_started : 1'b1;
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0) 
        been_started <= 1'b0;
    else if(clk_en)
        been_started <= been_enabled;
    else ;
end
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0) 
        been_enabled <= 1'b0;
    else if(wdt_en)
        been_enabled <= 1'b1;
    else ;
end
always @(*)
begin
    if(WDT_USE_FIX_TOP == 1'b1) begin
        case(wdt_torr[7:4])
            4'd1       : int_top_init = WDT_FIXED_TOP_1;
            4'd2       : int_top_init = WDT_FIXED_TOP_2;
            4'd3       : int_top_init = WDT_FIXED_TOP_3;
            4'd4       : int_top_init = WDT_FIXED_TOP_4;
            4'd5       : int_top_init = WDT_FIXED_TOP_5;
            4'd6       : int_top_init = WDT_FIXED_TOP_6;
            4'd7       : int_top_init = WDT_FIXED_TOP_7;
            4'd8       : int_top_init = WDT_FIXED_TOP_8;
            4'd9       : int_top_init = WDT_FIXED_TOP_9;
            4'd10      : int_top_init = WDT_FIXED_TOP_10;
            4'd11      : int_top_init = WDT_FIXED_TOP_11;
            4'd12      : int_top_init = WDT_FIXED_TOP_12;
            4'd13      : int_top_init = WDT_FIXED_TOP_13;
            4'd14      : int_top_init = WDT_FIXED_TOP_14;
            4'd15      : int_top_init = WDT_FIXED_TOP_15;
            default    : int_top_init = WDT_FIXED_TOP_0;
        endcase
    end
    else begin
        case(wdt_torr[7:4])
            4'd1       : int_top_init = WDT_USER_TOP_INIT_1;
            4'd2       : int_top_init = WDT_USER_TOP_INIT_2;
            4'd3       : int_top_init = WDT_USER_TOP_INIT_3;
            4'd4       : int_top_init = WDT_USER_TOP_INIT_4;
            4'd5       : int_top_init = WDT_USER_TOP_INIT_5;
            4'd6       : int_top_init = WDT_USER_TOP_INIT_6;
            4'd7       : int_top_init = WDT_USER_TOP_INIT_7;
            4'd8       : int_top_init = WDT_USER_TOP_INIT_8;
            4'd9       : int_top_init = WDT_USER_TOP_INIT_9;
            4'd10      : int_top_init = WDT_USER_TOP_INIT_10;
            4'd11      : int_top_init = WDT_USER_TOP_INIT_11;
            4'd12      : int_top_init = WDT_USER_TOP_INIT_12;
            4'd13      : int_top_init = WDT_USER_TOP_INIT_13;
            4'd14      : int_top_init = WDT_USER_TOP_INIT_14;
            4'd15      : int_top_init = WDT_USER_TOP_INIT_15;
            default    : int_top_init = WDT_USER_TOP_INIT_0;
        endcase
    end
end
always @(*)
begin
    if(WDT_USE_FIX_TOP == 1'b1) begin
        case(wdt_torr[3:0])
            4'd1       : int_top = WDT_FIXED_TOP_1;
            4'd2       : int_top = WDT_FIXED_TOP_2;
            4'd3       : int_top = WDT_FIXED_TOP_3;
            4'd4       : int_top = WDT_FIXED_TOP_4;
            4'd5       : int_top = WDT_FIXED_TOP_5;
            4'd6       : int_top = WDT_FIXED_TOP_6;
            4'd7       : int_top = WDT_FIXED_TOP_7;
            4'd8       : int_top = WDT_FIXED_TOP_8;
            4'd9       : int_top = WDT_FIXED_TOP_9;
            4'd10      : int_top = WDT_FIXED_TOP_10;
            4'd11      : int_top = WDT_FIXED_TOP_11;
            4'd12      : int_top = WDT_FIXED_TOP_12;
            4'd13      : int_top = WDT_FIXED_TOP_13;
            4'd14      : int_top = WDT_FIXED_TOP_14;
            4'd15      : int_top = WDT_FIXED_TOP_15;
            default : int_top = WDT_FIXED_TOP_0;
        endcase
    end
    else begin
        case(wdt_torr[3:0])
            4'd1       : int_top = WDT_USER_TOP_1;
            4'd2       : int_top = WDT_USER_TOP_2;
            4'd3       : int_top = WDT_USER_TOP_3;
            4'd4       : int_top = WDT_USER_TOP_4;
            4'd5       : int_top = WDT_USER_TOP_5;
            4'd6       : int_top = WDT_USER_TOP_6;
            4'd7       : int_top = WDT_USER_TOP_7;
            4'd8       : int_top = WDT_USER_TOP_8;
            4'd9       : int_top = WDT_USER_TOP_9;
            4'd10      : int_top = WDT_USER_TOP_10;
            4'd11      : int_top = WDT_USER_TOP_11;
            4'd12      : int_top = WDT_USER_TOP_12;
            4'd13      : int_top = WDT_USER_TOP_13;
            4'd14      : int_top = WDT_USER_TOP_14;
            4'd15      : int_top = WDT_USER_TOP_15;
            default : int_top = WDT_USER_TOP_0;
        endcase
    end
end
always @(*)
begin
    case (wdt_cr[4:2])
        3'd1       : rpl = WDT_RPL_1;
        3'd2       : rpl = WDT_RPL_2;
        3'd3       : rpl = WDT_RPL_3;
        3'd4       : rpl = WDT_RPL_4;
        3'd5       : rpl = WDT_RPL_5;
        3'd6       : rpl = WDT_RPL_6;
        3'd7       : rpl = WDT_RPL_7;
        default    : rpl = WDT_RPL_0;
    endcase
end
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        wdt_en <= 1'b0;
    else if(wdt_cr[0] == 1'b1)
        wdt_en <= 1'b1;
    else if(wdt_en_external == 1'b1)
        wdt_en <= 1'b1;
    else
        wdt_en <= 1'b0;
end
assign  rmod   = wdt_cr[1];
endmodule 
module wdt_sec_top(
  intr,
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  prst_b,
  psel,
  pwdata,
  pwrite,
  scan_mode,
  sys_rst_b,
  tipc_wdt_trust
);
input   [31:0]  paddr;         
input           pclk;          
input           penable;       
input   [2 :0]  pprot;         
input           prst_b;        
input           psel;          
input   [31:0]  pwdata;        
input           pwrite;        
input           scan_mode;     
input           tipc_wdt_trust; 
output          intr;          
output  [31:0]  prdata;        
output          sys_rst_b;     
wire    [7 :0]  i_paddr;       
wire    [31:0]  i_prdata;      
wire            i_psel;        
wire            i_pwrite;      
wire            intr;          
wire    [31:0]  paddr;         
wire            pclk;          
wire            penable;       
wire    [2 :0]  pprot;         
wire    [31:0]  prdata;        
wire            prst_b;        
wire            psel;          
wire    [31:0]  pwdata;        
wire            pwrite;        
wire            scan_mode;     
wire            sys_rst_b;     
wire            tipc_wdt_trust; 
wire            wdt_int_n;     
wire            wdt_sys_rst;   
wdt  x_wdt (
  .paddr           (i_paddr        ),
  .pclk            (pclk           ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .presetn         (prst_b         ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       ),
  .scan_mode       (scan_mode      ),
  .speed_up        (1'b0           ),
  .wdt_en_external (1'b0           ),
  .wdt_int         (intr           ),
  .wdt_int_n       (wdt_int_n      ),
  .wdt_sys_rst     (wdt_sys_rst    ),
  .wdt_sys_rst_n   (sys_rst_b      )
);
assign i_paddr[7:0] = paddr[7:0];
assign prdata[31:0] = i_prdata[31:0] ;
assign i_pwrite = pwrite ;
assign i_psel = psel ;
endmodule
module wdt(
pclk,
presetn,
penable,
pwrite,
pwdata,
paddr,
psel,
speed_up,
scan_mode,
wdt_en_external,
wdt_int,
wdt_int_n,
wdt_sys_rst,
wdt_sys_rst_n,
prdata
);
input                              pclk             ;
input                              presetn          ;
input                              penable          ;
input                              pwrite           ;
input                    [31:0]    pwdata           ;
input          		[7:0]      paddr            ;
input                              psel             ;
input                              speed_up         ;
input                              scan_mode        ;
input                              wdt_en_external  ;
output                             wdt_int          ;
output                             wdt_int_n        ;
output                             wdt_sys_rst      ;
output                             wdt_sys_rst_n    ;
output                   [31:0]    prdata           ;
wire                               wr_en            ;
wire                               rd_en            ;
wire                      [3:0]    byte_en          ;
wire         [5:0]                 reg_addr         ;
wire                     [31:0]    ipwdata          ;
wire                     [31:0]    iprdata          ;
wire        [31:0]                 cnt              ;
wire                               wdt_int          ;
wire        [31:0]                 top              ;
wire                               restart          ;
wire                               wdt_en           ;
wire                               eoi_en           ;
wire                      [7:0]    rpl              ;
wire                               rmod             ;
wire                               sys_rst          ;
wire                               wdt_int_n        ;
wire                               wdt_sys_rst      ;
wire                               wdt_sys_rst_n    ;
wire                               wdt_clk_en       ;
wire                               int_wdt_clk_en   ;
wire                               pause            ;
wire                               int_pause        ;
parameter        WDT_ADDR_LHS = 5'd7;
parameter        WDT_CLK_EN = 1'b0;
parameter        WDT_PAUSE = 1'b0;
wdt_biu # 
(   
    .WDT_ADDR_LHS       (WDT_ADDR_LHS     )
)
U_WDT_BIU
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .psel               (psel             ),
    .penable            (penable          ),
    .pwrite             (pwrite           ),
    .paddr              (paddr            ),
    .pwdata             (pwdata           ),
    .prdata             (prdata           ),
    .wr_en              (wr_en            ),
    .rd_en              (rd_en            ),
    .reg_addr           (reg_addr         ),
    .ipwdata            (ipwdata          ),
    .iprdata            (iprdata          )
);
wdt_regfile U_WDT_REGFILE
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .clk_en             (int_wdt_clk_en   ),
    .wdt_en_external    (wdt_en_external  ),
    .wr_en              (wr_en            ),
    .rd_en              (rd_en            ),
    .reg_addr           (reg_addr         ),
    .cnt                (cnt              ),
    .wdt_int            (wdt_int          ),
    .ipwdata            (ipwdata          ),
    .iprdata            (iprdata          ),      
    .top                (top              ),
    .restart            (restart          ),
    .wdt_en             (wdt_en           ),
    .eoi_en             (eoi_en           ),
    .rpl                (rpl              ),
    .rmod               (rmod             ) 
);
wdt_isrc   
U_WDT_ISRC
(
    .pclk               (pclk             ),
    .presetn            (presetn          ),
    .wdt_clk_en         (int_wdt_clk_en   ),
    .top                (top              ),
    .restart            (restart          ),
    .wdt_en             (wdt_en           ),
    .eoi_en             (eoi_en           ),
    .rpl                (rpl              ),
    .rmod               (rmod             ),
    .pause              (int_pause        ),
    .speed_up           (speed_up         ),
    .scan_mode          (scan_mode        ),
    .cnt                (cnt              ),
    .wdt_int            (wdt_int          ),
    .sys_rst            (sys_rst          )
);
assign  int_wdt_clk_en = (WDT_CLK_EN == 1) ? wdt_clk_en : 1'b1;
assign  int_pause      = (WDT_PAUSE == 1)  ? pause : 1'b0;
assign  wdt_int_n      = ~wdt_int;
assign  wdt_sys_rst    = sys_rst;
assign  wdt_sys_rst_n  = ~sys_rst;
endmodule 
