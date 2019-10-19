/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define   GPIO_PWIDTH 6'd32
`define   GPIO_SW_DATA_RESET 32'h0
`define   GPIO_SW_DIR_RESET 32'h0
`define   GPIO_INT_LEVEL_SYNC_EN 1'b1
`define   GPIO_INT_POL_SEL 1'b1
`define   GPIO_DEBOUNCE_EN 1'b0
`define   GPIO_EXT_DATA_SYNC_EN 1'b0
`define   GPIO_ADDR_LHS 5'h6
module gpio0(
  gpio0_etb_trig,
  gpio_ext_porta,
  gpio_intr_flag,
  gpio_intrclk_en,
  gpio_porta_ddr,
  gpio_porta_dr,
  paddr,
  pclk,
  pclk_intr,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite
);
input   [31:0]  gpio_ext_porta; 
input   [31:0]  paddr;          
input           pclk;           
input           pclk_intr;      
input           penable;        
input           presetn;        
input           psel;           
input   [31:0]  pwdata;         
input           pwrite;         
output  [31:0]  gpio0_etb_trig; 
output          gpio_intr_flag; 
output          gpio_intrclk_en; 
output  [31:0]  gpio_porta_ddr; 
output  [31:0]  gpio_porta_dr;  
output  [31:0]  prdata;         
wire    [31:0]  gpio0_etb_trig; 
wire    [31:0]  gpio0_prdata;   
wire    [31:0]  gpio_ext_porta; 
wire            gpio_intr_flag; 
wire            gpio_intrclk_en; 
wire    [31:0]  gpio_porta_ddr; 
wire    [31:0]  gpio_porta_dr;  
wire    [31:0]  paddr;          
wire            pclk;           
wire            pclk_intr;      
wire            penable;        
wire    [31:0]  prdata;         
wire            presetn;        
wire            psel;           
wire    [31:0]  pwdata;         
wire            pwrite;         
gpio_top  x_gpio_top (
  .dbclk           (pclk           ),
  .dbclk_rstn      (presetn        ),
  .gpio_etb_trig   (gpio0_etb_trig ),
  .gpio_in_data    (gpio_ext_porta ),
  .gpio_int_clk_en (gpio_intrclk_en),
  .gpio_int_flag   (gpio_intr_flag ),
  .gpio_out_data   (gpio_porta_dr  ),
  .gpio_out_en     (gpio_porta_ddr ),
  .paddr           (paddr[6:0]     ),
  .pclk            (pclk           ),
  .pclk_int        (pclk_intr      ),
  .penable         (penable        ),
  .prdata          (gpio0_prdata   ),
  .presetn         (presetn        ),
  .psel            (psel           ),
  .pwdata          (pwdata         ),
  .pwrite          (pwrite         ),
  .scan_mode       (1'b0           )
);
assign prdata[31:0] = gpio0_prdata[31:0];
endmodule
module gpio0_sec_top(
  gpio0_etb_trig,
  gpio_ext_porta,
  gpio_intr_flag,
  gpio_intrclk_en,
  gpio_porta_ddr,
  gpio_porta_dr,
  paddr,
  pclk,
  pclk_intr,
  penable,
  pprot,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  tipc_gpio0_trust
);
input   [31:0]  gpio_ext_porta;  
input   [31:0]  paddr;           
input           pclk;            
input           pclk_intr;       
input           penable;         
input   [2 :0]  pprot;           
input           presetn;         
input           psel;            
input   [31:0]  pwdata;          
input           pwrite;          
input           tipc_gpio0_trust; 
output  [31:0]  gpio0_etb_trig;  
output          gpio_intr_flag;  
output          gpio_intrclk_en; 
output  [31:0]  gpio_porta_ddr;  
output  [31:0]  gpio_porta_dr;   
output  [31:0]  prdata;          
wire    [31:0]  gpio0_etb_trig;  
wire    [31:0]  gpio_ext_porta;  
wire            gpio_intr_flag;  
wire            gpio_intrclk_en; 
wire    [31:0]  gpio_porta_ddr;  
wire    [31:0]  gpio_porta_dr;   
wire    [31:0]  i_prdata;        
wire            i_psel;          
wire            i_pwrite;        
wire    [31:0]  paddr;           
wire            pclk;            
wire            pclk_intr;       
wire            penable;         
wire    [2 :0]  pprot;           
wire    [31:0]  prdata;          
wire            presetn;         
wire            psel;            
wire    [31:0]  pwdata;          
wire            pwrite;          
wire            tipc_gpio0_trust; 
gpio0  x_gpio0 (
  .gpio0_etb_trig  (gpio0_etb_trig ),
  .gpio_ext_porta  (gpio_ext_porta ),
  .gpio_intr_flag  (gpio_intr_flag ),
  .gpio_intrclk_en (gpio_intrclk_en),
  .gpio_porta_ddr  (gpio_porta_ddr ),
  .gpio_porta_dr   (gpio_porta_dr  ),
  .paddr           (paddr          ),
  .pclk            (pclk           ),
  .pclk_intr       (pclk_intr      ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .presetn         (presetn        ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;
endmodule
module gpio_apbif 
(
    pclk                    ,
    presetn                 ,
    penable                 ,
    pwrite                  ,
    pwdata                  ,
    paddr                   ,
    psel                    ,                 
    gpio_ext_data           ,
    gpio_int_status         ,
    gpio_raw_int_status     ,
    gpio_sw_data            ,
    gpio_sw_dir             ,
    gpio_int_en             ,
    gpio_int_mask           ,
    gpio_int_type           ,
    gpio_int_pol            ,
    gpio_debounce           ,
    gpio_int_clr            ,
    gpio_int_level_sync     ,
    prdata                   
);
input                         pclk                    ;
input                         presetn                 ;
input                         penable                 ;
input                         pwrite                  ;
input             [31:0]      pwdata                  ;
input  [`GPIO_ADDR_LHS:0]      paddr                   ;
input                         psel                    ;                 
input  [`GPIO_PWIDTH-1:0]      gpio_ext_data           ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_status         ;
input  [`GPIO_PWIDTH-1:0]      gpio_raw_int_status     ;
wire                          pclk                    ;
wire                          presetn                 ;
wire                          penable                 ;
wire                          pwrite                  ;
wire              [31:0]      pwdata                  ;
wire   [`GPIO_ADDR_LHS:0]      paddr                   ;
wire                          psel                    ;                 
wire   [`GPIO_PWIDTH-1:0]      gpio_ext_data           ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_status         ;
wire   [`GPIO_PWIDTH-1:0]      gpio_raw_int_status     ;
output [`GPIO_PWIDTH-1:0]      gpio_sw_data            ;
output [`GPIO_PWIDTH-1:0]      gpio_sw_dir             ;
output [`GPIO_PWIDTH-1:0]      gpio_int_en             ;
output [`GPIO_PWIDTH-1:0]      gpio_int_mask           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_type           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_pol            ;
output [`GPIO_PWIDTH-1:0]      gpio_debounce           ;
output [`GPIO_PWIDTH-1:0]      gpio_int_clr            ;
output                        gpio_int_level_sync     ;
output            [31:0]      prdata                  ;
reg    [`GPIO_PWIDTH-1:0]      gpio_sw_data            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_sw_dir             ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_en             ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_mask           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_type           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_pol            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_debounce           ;
reg    [`GPIO_PWIDTH-1:0]      gpio_int_clr            ;
reg                           gpio_int_level_sync     ;
reg               [31:0]      prdata                  ;
localparam        GPIO_SW_DATA_OFFSET            = 5'b00000;
localparam        GPIO_SW_DIR_OFFSET             = 5'b00001;
localparam        GPIO_SW_HW_CTRL_OFFSET         = 5'b00010;
localparam        GPIO_INT_FUNC_EN_OFFSET        = 5'b01100;
localparam        GPIO_INT_MASK_OFFSET           = 5'b01101;
localparam        GPIO_INT_TYPE_OFFSET           = 5'b01110;
localparam        GPIO_INT_POL_SEL_OFFSET        = 5'b01111;
localparam        GPIO_INT_STATUS_OFFSET         = 5'b10000;
localparam        GPIO_RAW_INT_STATUS_OFFSET     = 5'b10001;
localparam        GPIO_DEBOUNCE_OFFSET           = 5'b10010;
localparam        GPIO_INT_CLR_OFFSET            = 5'b10011;
localparam        GPIO_EXT_DATA_OFFSET           = 5'b10100;
localparam        GPIO_INT_LEVEL_SYNC_OFFSET     = 5'b11000;
reg               gpio_sw_data_wen         ;
reg               gpio_sw_dir_wen          ;
reg               gpio_int_en_wen          ;
reg               gpio_int_mask_wen        ;
reg               gpio_int_type_wen        ;
reg               gpio_int_pol_wen         ;
reg               gpio_debounce_wen        ;
reg               gpio_int_level_sync_wen  ;
reg               gpio_int_clr_wen         ;
reg    [31:0]     ri_gpio_sw_data          ;
reg    [31:0]     ri_gpio_sw_dir           ;
reg    [31:0]     ri_gpio_int_en           ;
reg    [31:0]     ri_gpio_int_mask         ;
reg    [31:0]     ri_gpio_int_type         ;
reg    [31:0]     ri_gpio_int_pol          ;
reg    [31:0]     ri_gpio_debounce         ;
reg    [31:0]     ri_gpio_int_level_sync   ;
reg    [31:0]     ri_gpio_ext_data         ;
reg    [31:0]     ri_gpio_raw_int_status   ;
reg    [31:0]     ri_gpio_int_status       ;
wire              zero_value               ;
assign  zero_value = 1'b0;
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_SW_DATA_OFFSET)
            gpio_sw_data_wen = 1'b1;
        else
            gpio_sw_data_wen = 1'b0;
    end
    else
        gpio_sw_data_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_SW_DIR_OFFSET)
            gpio_sw_dir_wen = 1'b1;
        else
            gpio_sw_dir_wen = 1'b0;
    end
    else
        gpio_sw_dir_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_FUNC_EN_OFFSET)
            gpio_int_en_wen = 1'b1;
        else
            gpio_int_en_wen = 1'b0;
    end
    else
        gpio_int_en_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_MASK_OFFSET)
            gpio_int_mask_wen = 1'b1;
        else
            gpio_int_mask_wen = 1'b0;
    end
    else
        gpio_int_mask_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_TYPE_OFFSET)
            gpio_int_type_wen = 1'b1;
        else
            gpio_int_type_wen = 1'b0;
    end
    else
        gpio_int_type_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_POL_SEL_OFFSET)
            gpio_int_pol_wen = 1'b1;
        else
            gpio_int_pol_wen = 1'b0;
    end
    else
        gpio_int_pol_wen = 1'b0;
end   
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_LEVEL_SYNC_OFFSET)
            gpio_int_level_sync_wen = 1'b1;
        else
            gpio_int_level_sync_wen = 1'b0;
    end
    else
        gpio_int_level_sync_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
        if(paddr[`GPIO_ADDR_LHS:2] == GPIO_INT_LEVEL_SYNC_OFFSET)
            gpio_int_clr_wen = 1'b1;
        else
            gpio_int_clr_wen = 1'b0;
    end
    else
        gpio_int_clr_wen = 1'b0;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_en <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_en_wen == 1'b1)
        gpio_int_en <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_en = {32{zero_value}};
    ri_gpio_int_en[`GPIO_PWIDTH-1:0] = gpio_int_en;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_mask <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_mask_wen == 1'b1)
        gpio_int_mask <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_mask = {32{zero_value}};
    ri_gpio_int_mask[`GPIO_PWIDTH-1:0] = gpio_int_mask;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_type <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_type_wen == 1'b1)
        gpio_int_type <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_type = {32{zero_value}};
    ri_gpio_int_type[`GPIO_PWIDTH-1:0] = gpio_int_type;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_pol <= {`GPIO_PWIDTH{1'b0}};
    else if (gpio_int_pol_wen == 1'b1)
        gpio_int_pol <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_int_pol = {32{zero_value}};
    ri_gpio_int_pol[`GPIO_PWIDTH-1:0] = gpio_int_pol;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_int_level_sync <= 1'b0;
    else if (gpio_int_level_sync_wen == 1'b1)
        gpio_int_level_sync <= pwdata[0];
    else ;
end
always@(*)
begin 
    if(gpio_int_clr_wen == 1'b1)
        gpio_int_clr = pwdata[`GPIO_PWIDTH-1:0];
    else 
        gpio_int_clr = {`GPIO_PWIDTH{1'b0}};
end
always @(*)
begin 
    ri_gpio_int_level_sync = {32{zero_value}};
    ri_gpio_int_level_sync[0] = gpio_int_level_sync;
end
always @(*)
begin 
    ri_gpio_int_status = {32{zero_value}};
    ri_gpio_int_status[`GPIO_PWIDTH-1:0] = gpio_int_status;
end
always @(*)
begin 
    ri_gpio_raw_int_status = {32{zero_value}};
    ri_gpio_raw_int_status[`GPIO_PWIDTH-1:0] = gpio_raw_int_status;
end
generate
    if(`GPIO_DEBOUNCE_EN == 1'b1) begin: SUPPORT_DEBOUNCE_PROC
        always @(*)
        begin
            if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin
                if(paddr[`GPIO_ADDR_LHS:2] == GPIO_DEBOUNCE_OFFSET)
                    gpio_debounce_wen = 1'b1;
                else
                    gpio_debounce_wen = 1'b0;
            end
            else
                gpio_debounce_wen = 1'b0;
        end
        always@(posedge pclk or negedge presetn)
        begin 
            if(presetn == 1'b0)
                gpio_debounce <= {`GPIO_PWIDTH{1'b0}};
            else if (gpio_debounce_wen == 1'b1)
                gpio_debounce <= pwdata[`GPIO_PWIDTH-1:0];
            else ;
        end
        always @(*)
        begin 
            ri_gpio_debounce = {32{zero_value}};
            ri_gpio_debounce[`GPIO_PWIDTH-1:0] = gpio_debounce;
        end
    end
    else begin: NO_SUPPORT_DEBOUNCE_PROC
        always @(*)
        begin
            gpio_debounce_wen = zero_value;
            gpio_debounce     = {32{zero_value}};
            ri_gpio_debounce = {32{zero_value}};
        end
    end
endgenerate
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_sw_data <= ({`GPIO_PWIDTH{1'b0}} | `GPIO_SW_DATA_RESET);
    else if (gpio_sw_data_wen == 1'b1)
        gpio_sw_data <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_sw_data = 32'b0;
    ri_gpio_sw_data[`GPIO_PWIDTH-1:0] = gpio_sw_data;
end
always@(posedge pclk or negedge presetn)
begin 
    if(presetn == 1'b0)
        gpio_sw_dir <= ({`GPIO_PWIDTH{1'b0}} | `GPIO_SW_DIR_RESET);
    else if (gpio_sw_dir_wen == 1'b1)
        gpio_sw_dir <= pwdata[`GPIO_PWIDTH-1:0];
    else ;
end
always @(*)
begin 
    ri_gpio_sw_dir = 32'b0;
    ri_gpio_sw_dir[`GPIO_PWIDTH-1:0] = gpio_sw_dir;
end
always @(*)
begin 
    ri_gpio_ext_data = 32'b0;
    ri_gpio_ext_data[`GPIO_PWIDTH-1:0] = gpio_ext_data;
end
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        prdata <= 32'b0;
    else if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0)) begin
        case (paddr[`GPIO_ADDR_LHS:2])
            `GPIO_SW_DATA_RESET         : prdata <= ri_gpio_sw_data;
            GPIO_SW_DIR_OFFSET         : prdata <= ri_gpio_sw_dir;
            GPIO_SW_HW_CTRL_OFFSET     : prdata <= 32'b0;
            GPIO_INT_FUNC_EN_OFFSET    : prdata <= ri_gpio_int_en;
            GPIO_INT_MASK_OFFSET       : prdata <= ri_gpio_int_mask;
            GPIO_INT_TYPE_OFFSET       : prdata <= ri_gpio_int_type;
            GPIO_INT_POL_SEL_OFFSET    : prdata <= ri_gpio_int_pol;
            GPIO_INT_STATUS_OFFSET     : prdata <= ri_gpio_int_status;
            GPIO_RAW_INT_STATUS_OFFSET : prdata <= ri_gpio_raw_int_status;
            GPIO_DEBOUNCE_OFFSET       : prdata <= ri_gpio_debounce;
            GPIO_INT_LEVEL_SYNC_OFFSET : prdata <= ri_gpio_int_level_sync;
            GPIO_EXT_DATA_OFFSET       : prdata <= ri_gpio_ext_data;              	 
            default                    : prdata <= 32'b0;
        endcase
    end
    else ;
end
endmodule
module gpio_ctrl 
(
pclk                  ,
pclk_int              ,
dbclk                 ,
presetn               ,
dbclk_rstn            ,
scan_mode             ,
gpio_sw_data          ,
gpio_sw_dir           ,
gpio_int_en           ,
gpio_int_mask         ,
gpio_int_type         ,
gpio_int_pol          ,
gpio_debounce         ,
gpio_int_clr          ,
gpio_rx_data          ,
gpio_int_level_sync   ,
gpio_tx_data          ,
gpio_tx_en            ,
gpio_ext_data         ,
gpio_int_flag         ,
gpio_int_flag_n       ,
gpio_int_status       ,
gpio_int              ,
gpio_int_n            ,
gpio_raw_int_status   ,
gpio_int_clk_en       ,
gpio_etb_trig
);
input                         pclk                  ;
input                         pclk_int              ;
input                         dbclk                 ;
input                         presetn               ;
input                         dbclk_rstn            ;
input                         scan_mode             ;
input  [`GPIO_PWIDTH-1:0]      gpio_sw_data          ;
input  [`GPIO_PWIDTH-1:0]      gpio_sw_dir           ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_en           ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_mask         ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_type         ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_pol          ;
input  [`GPIO_PWIDTH-1:0]      gpio_debounce         ;
input  [`GPIO_PWIDTH-1:0]      gpio_int_clr          ;
input  [`GPIO_PWIDTH-1:0]      gpio_rx_data          ;
input                         gpio_int_level_sync   ;
wire                          pclk                  ;
wire                          pclk_int              ;
wire                          dbclk                 ;
wire                          presetn               ;
wire                          dbclk_rstn            ;
wire                          scan_mode             ;
wire   [`GPIO_PWIDTH-1:0]      gpio_sw_data          ;
wire   [`GPIO_PWIDTH-1:0]      gpio_sw_dir           ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_en           ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_mask         ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_type         ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_pol          ;
wire   [`GPIO_PWIDTH-1:0]      gpio_debounce         ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_clr          ;
wire   [`GPIO_PWIDTH-1:0]      gpio_rx_data          ;
wire                          gpio_int_level_sync   ;
output [`GPIO_PWIDTH-1:0]      gpio_tx_data          ;
output [`GPIO_PWIDTH-1:0]      gpio_tx_en            ;
output [`GPIO_PWIDTH-1:0]      gpio_ext_data         ;
output                        gpio_int_flag         ;
output                        gpio_int_flag_n       ;
output [`GPIO_PWIDTH-1:0]      gpio_int_status       ;
output [`GPIO_PWIDTH-1:0]      gpio_int              ;
output [`GPIO_PWIDTH-1:0]      gpio_int_n            ;
output [`GPIO_PWIDTH-1:0]      gpio_raw_int_status   ;
output                        gpio_int_clk_en       ;
output [`GPIO_PWIDTH-1:0]      gpio_etb_trig         ;
reg    [`GPIO_PWIDTH-1:0]      gpio_tx_data          ;
reg    [`GPIO_PWIDTH-1:0]      gpio_tx_en            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_ext_data         ;
wire                          gpio_int_flag         ;
wire                          gpio_int_flag_n       ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_status       ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int              ;
wire   [`GPIO_PWIDTH-1:0]      gpio_int_n            ;
reg    [`GPIO_PWIDTH-1:0]      gpio_raw_int_status   ;
reg                           gpio_int_clk_en       ;
wire   [`GPIO_PWIDTH-1:0]      gpio_etb_trig         ;
reg           [`GPIO_PWIDTH-1:0]     gpio_rx_data_int   ;
reg           [`GPIO_PWIDTH-1:0]     int_level_sync_in  ;
reg           [`GPIO_PWIDTH-1:0]     int_edge_out       ;
reg           [`GPIO_PWIDTH-1:0]     debounce_d2        ;
wire          [`GPIO_PWIDTH-1:0]     int_level          ;
wire          [`GPIO_PWIDTH-1:0]     gpio_ext_data_tmp  ;
wire                                zero_value         ;
wire                                gpio_int_flag_tmp  ;
assign  zero_value = 1'b0;
reg           [`GPIO_PWIDTH-1:0]     int_clk_en           ;
reg           [`GPIO_PWIDTH-1:0]     int_level_ff1        ;
reg           [`GPIO_PWIDTH-1:0]     gpio_int_status_edge ;
reg           [`GPIO_PWIDTH-1:0]     gpio_int_status_level;
wire                                gpio_int_clk_en_tmp  ;
wire          [`GPIO_PWIDTH-1:0]     int_edge             ;
integer                             int_k                ;
always @(*)
begin: INT_CLK_EN_PROC
integer i;
    for (i=0;i<`GPIO_PWIDTH;i=i+1) begin
        if(gpio_int_en[i] == 1'b1)
            if(gpio_int_type[i] == 1'b1)
                int_clk_en[i] = 1'b1;
            else
                int_clk_en[i] = gpio_int_level_sync;
        else
            int_clk_en[i] =  1'b0;
    end
end 
assign  gpio_int_clk_en_tmp = | int_clk_en;
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        gpio_int_clk_en <= 1'b0;
    else
        gpio_int_clk_en <= gpio_int_clk_en_tmp;
end
always @(*) 
begin: GPIO_RX_INT_PROC
integer i;
    gpio_rx_data_int = {`GPIO_PWIDTH{1'b0}};
    for(i=0;i<`GPIO_PWIDTH;i=i+1) begin
        if(gpio_int_pol[i] == 1'b0)
            gpio_rx_data_int[i] = ~gpio_rx_data[i];
        else
            gpio_rx_data_int[i] = gpio_rx_data[i];
    end
end
always @(*) 
begin: INT_LEVEL_SYNC_IN_PROC
integer i;
    int_level_sync_in = {`GPIO_PWIDTH{1'b0}};
    if(`GPIO_DEBOUNCE_EN == 1'b0)
        int_level_sync_in = gpio_rx_data_int;
    else begin
        for(i=0;i<`GPIO_PWIDTH;i=i+1) begin
            if(gpio_debounce[i] == 1'b1) 
                int_level_sync_in[i] = debounce_d2[i];
            else
                int_level_sync_in[i] = gpio_rx_data_int[i];
        end
    end
end 
always @(posedge pclk_int or negedge presetn)
begin
  if(presetn == 1'b0)
      int_level_ff1 <= {`GPIO_PWIDTH{1'b0}};
  else
      int_level_ff1 <= int_level;
end
assign int_edge = int_level ^ int_level_ff1;
always @(*) 
begin: INT_EDGE_OUT_PROC
integer j;
    int_edge_out = {`GPIO_PWIDTH{1'b0}};      
    for(j=0;j<`GPIO_PWIDTH;j=j+1) begin
        int_edge_out[j] = int_edge[j] & int_level[j] ; 
    end 
end
always @(posedge pclk or negedge presetn)
begin: GPIO_INT_STATUS_EGDE_PROC
    if(presetn == 1'b0)
        gpio_int_status_edge <= {`GPIO_PWIDTH{1'b0}};
    else begin
        for(int_k=0;int_k<`GPIO_PWIDTH;int_k=int_k+1) begin
            if(gpio_int_en[int_k] == 1'b0)
                gpio_int_status_edge[int_k] <= 1'b0;
            else if((int_edge_out[int_k] == 1'b1) &&
                    (gpio_int_en[int_k] == 1'b1) && 
                    (gpio_sw_dir[int_k] == 1'b0))
                gpio_int_status_edge[int_k] <= 1'b1;
            else if(gpio_int_clr[int_k] == 1'b1)
                  gpio_int_status_edge[int_k] <= 1'b0;
            else ;
        end 
    end
end  
always @(*) 
begin: GPIO_INT_STATUS_LEVEL_PROC
integer k;
    gpio_int_status_level = {`GPIO_PWIDTH{1'b0}};
    for(k=0;k<`GPIO_PWIDTH;k=k+1) begin
        if(gpio_sw_dir[k] == 1'b1)
            gpio_int_status_level[k] = 1'b0;
        else if(gpio_int_level_sync == 1'b1)
            gpio_int_status_level[k] = int_level[k];
        else
            gpio_int_status_level[k] = int_level_sync_in[k];
    end 
end
always @(*) 
begin: GPIO_RAW_INT_STATUS_PROC
integer l;
    gpio_raw_int_status = {`GPIO_PWIDTH{1'b0}};
    for(l=0;l<`GPIO_PWIDTH;l=l+1) begin
        if(gpio_int_en[l] == 1'b0)
            gpio_raw_int_status[l] = 1'b0;
        else if(gpio_int_type[l] == 1'b1)
            gpio_raw_int_status[l] = gpio_int_status_edge[l] ;
        else
            gpio_raw_int_status[l] = gpio_int_status_level[l] ;
    end  
end   
assign  gpio_int_status   = gpio_raw_int_status & (~gpio_int_mask); 
assign  gpio_int          = (`GPIO_INT_POL_SEL == 1'b1) ? gpio_int_status : (~gpio_int_status);
assign  gpio_int_n        = gpio_int;
assign  gpio_int_flag_tmp = | gpio_int_status;
assign  gpio_int_flag     = (`GPIO_INT_POL_SEL == 1'b1) ? gpio_int_flag_tmp : (~gpio_int_flag_tmp);
assign  gpio_int_flag_n   = gpio_int_flag;
generate
    if(`GPIO_INT_LEVEL_SYNC_EN == 1'b1) begin: SUPPORT_INT_LEVEL_SYNC_PROC
        reg           [`GPIO_PWIDTH-1:0]     int_level_sync_in_ff1;
        reg           [`GPIO_PWIDTH-1:0]     int_level_sync_in_ff2;
        always @(posedge pclk_int or negedge presetn)
        begin
            if(presetn == 1'b0)
                int_level_sync_in_ff1 <= {`GPIO_PWIDTH{1'b0}};
            else
                int_level_sync_in_ff1 <= int_level_sync_in;
        end
        always @(posedge pclk_int or negedge presetn)
        begin
            if(presetn == 1'b0)
                int_level_sync_in_ff2 <= {`GPIO_PWIDTH{1'b0}};
            else
                int_level_sync_in_ff2 <= int_level_sync_in_ff1;
        end
        assign  int_level = (gpio_int_level_sync == 1'b1) ? int_level_sync_in_ff2 : 
                                                            int_level_sync_in;
    end
    else begin: NO_SUPPORT_INT_LEVEL_SYNC_PROC
        assign  int_level = int_level_sync_in;
    end
endgenerate
generate
    if(`GPIO_DEBOUNCE_EN == 1'b1) begin: SUPPORT_DEBOUNCE_PROC
        reg                      [31:0]     debounce_rstn_tmp   ;
        reg                      [31:0]     gpio_rx_data_int_tmp;
        reg                      [31:0]     debounce_d1_tmp     ;
        wire                                debounce_rstn_0     ;
        wire                                debounce_rstn_1     ;
        wire                                debounce_rstn_2     ;
        wire                                debounce_rstn_3     ;
        wire                                debounce_rstn_4     ;
        wire                                debounce_rstn_5     ;
        wire                                debounce_rstn_6     ;
        wire                                debounce_rstn_7     ;
        wire                                debounce_rstn_8     ;
        wire                                debounce_rstn_9     ;
        wire                                debounce_rstn_10    ;
        wire                                debounce_rstn_11    ;
        wire                                debounce_rstn_12    ;
        wire                                debounce_rstn_13    ;
        wire                                debounce_rstn_14    ;
        wire                                debounce_rstn_15    ;
        wire                                debounce_rstn_16    ;
        wire                                debounce_rstn_17    ;
        wire                                debounce_rstn_18    ;
        wire                                debounce_rstn_19    ;
        wire                                debounce_rstn_20    ;
        wire                                debounce_rstn_21    ;
        wire                                debounce_rstn_22    ;
        wire                                debounce_rstn_23    ;
        wire                                debounce_rstn_24    ;
        wire                                debounce_rstn_25    ;
        wire                                debounce_rstn_26    ;
        wire                                debounce_rstn_27    ;
        wire                                debounce_rstn_28    ;
        wire                                debounce_rstn_29    ;
        wire                                debounce_rstn_30    ;
        wire                                debounce_rstn_31    ;
        wire           [`GPIO_PWIDTH-1:0]    debounce_d1         ; 
        always @(*)
        begin
            debounce_rstn_tmp = 32'b0;
            debounce_rstn_tmp[`GPIO_PWIDTH-1:0] = gpio_rx_data_int & {`GPIO_PWIDTH{dbclk_rstn}};
        end
        always @(*)
        begin
            gpio_rx_data_int_tmp = 32'b0;
            gpio_rx_data_int_tmp[`GPIO_PWIDTH-1:0] = gpio_rx_data_int;
        end
        assign  debounce_rstn_0  = (debounce_rstn_tmp[0]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_1  = (debounce_rstn_tmp[1]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_2  = (debounce_rstn_tmp[2]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_3  = (debounce_rstn_tmp[3]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_4  = (debounce_rstn_tmp[4]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_5  = (debounce_rstn_tmp[5]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_6  = (debounce_rstn_tmp[6]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_7  = (debounce_rstn_tmp[7]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_8  = (debounce_rstn_tmp[8]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_9  = (debounce_rstn_tmp[9]  || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_10 = (debounce_rstn_tmp[10] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_11 = (debounce_rstn_tmp[11] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_12 = (debounce_rstn_tmp[12] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_13 = (debounce_rstn_tmp[13] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_14 = (debounce_rstn_tmp[14] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_15 = (debounce_rstn_tmp[15] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_16 = (debounce_rstn_tmp[16] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_17 = (debounce_rstn_tmp[17] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_18 = (debounce_rstn_tmp[18] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_19 = (debounce_rstn_tmp[19] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_20 = (debounce_rstn_tmp[20] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_21 = (debounce_rstn_tmp[21] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_22 = (debounce_rstn_tmp[22] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_23 = (debounce_rstn_tmp[23] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_24 = (debounce_rstn_tmp[24] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_25 = (debounce_rstn_tmp[25] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_26 = (debounce_rstn_tmp[26] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_27 = (debounce_rstn_tmp[27] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_28 = (debounce_rstn_tmp[28] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_29 = (debounce_rstn_tmp[29] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_30 = (debounce_rstn_tmp[30] || scan_mode) && (dbclk_rstn);
        assign  debounce_rstn_31 = (debounce_rstn_tmp[31] || scan_mode) && (dbclk_rstn);
        always @(posedge dbclk or negedge debounce_rstn_0)
        begin
            if(debounce_rstn_0 == 1'b0)
                debounce_d1_tmp[0] <= 1'b0;
            else
                debounce_d1_tmp[0] <= gpio_rx_data_int_tmp[0];
        end  
        always @(posedge dbclk or negedge debounce_rstn_1)
        begin
            if(debounce_rstn_1 == 1'b0)
                debounce_d1_tmp[1] <= 1'b0;
            else
                debounce_d1_tmp[1] <= gpio_rx_data_int_tmp[1];
        end  
        always @(posedge dbclk or negedge debounce_rstn_2)
        begin
            if(debounce_rstn_2 == 1'b0)
                debounce_d1_tmp[2] <= 1'b0;
            else
                debounce_d1_tmp[2] <= gpio_rx_data_int_tmp[2];
        end  
        always @(posedge dbclk or negedge debounce_rstn_3)
        begin
            if(debounce_rstn_3 == 1'b0)
                debounce_d1_tmp[3] <= 1'b0;
            else
                debounce_d1_tmp[3] <= gpio_rx_data_int_tmp[3];
        end  
        always @(posedge dbclk or negedge debounce_rstn_4)
        begin
            if(debounce_rstn_4 == 1'b0)
                debounce_d1_tmp[4] <= 1'b0;
            else
                debounce_d1_tmp[4] <= gpio_rx_data_int_tmp[4];
        end  
        always @(posedge dbclk or negedge debounce_rstn_5)
        begin
            if(debounce_rstn_5 == 1'b0)
                debounce_d1_tmp[5] <= 1'b0;
            else
                debounce_d1_tmp[5] <= gpio_rx_data_int_tmp[5];
        end  
        always @(posedge dbclk or negedge debounce_rstn_6)
        begin
            if(debounce_rstn_6 == 1'b0)
                debounce_d1_tmp[6] <= 1'b0;
            else
                debounce_d1_tmp[6] <= gpio_rx_data_int_tmp[6];
        end  
        always @(posedge dbclk or negedge debounce_rstn_7)
        begin
            if(debounce_rstn_7 == 1'b0)
                debounce_d1_tmp[7] <= 1'b0;
            else
                debounce_d1_tmp[7] <= gpio_rx_data_int_tmp[7];
        end  
        always @(posedge dbclk or negedge debounce_rstn_8)
        begin
            if(debounce_rstn_8 == 1'b0)
                debounce_d1_tmp[8] <= 1'b0;
            else
                debounce_d1_tmp[8] <= gpio_rx_data_int_tmp[8];
        end  
        always @(posedge dbclk or negedge debounce_rstn_9)
        begin
            if(debounce_rstn_9 == 1'b0)
                debounce_d1_tmp[9] <= 1'b0;
            else
                debounce_d1_tmp[9] <= gpio_rx_data_int_tmp[9];
        end  
        always @(posedge dbclk or negedge debounce_rstn_10)
        begin
            if(debounce_rstn_10 == 1'b0)
                debounce_d1_tmp[10] <= 1'b0;
            else
                debounce_d1_tmp[10] <= gpio_rx_data_int_tmp[10];
        end  
        always @(posedge dbclk or negedge debounce_rstn_11)
        begin
            if(debounce_rstn_11 == 1'b0)
                debounce_d1_tmp[11] <= 1'b0;
            else
                debounce_d1_tmp[11] <= gpio_rx_data_int_tmp[11];
        end  
        always @(posedge dbclk or negedge debounce_rstn_12)
        begin
            if(debounce_rstn_12 == 1'b0)
                debounce_d1_tmp[12] <= 1'b0;
            else
                debounce_d1_tmp[12] <= gpio_rx_data_int_tmp[12];
        end  
        always @(posedge dbclk or negedge debounce_rstn_13)
        begin
            if(debounce_rstn_13 == 1'b0)
                debounce_d1_tmp[13] <= 1'b0;
            else
                debounce_d1_tmp[13] <= gpio_rx_data_int_tmp[13];
        end  
        always @(posedge dbclk or negedge debounce_rstn_14)
        begin
            if(debounce_rstn_14 == 1'b0)
                debounce_d1_tmp[14] <= 1'b0;
            else
                debounce_d1_tmp[14] <= gpio_rx_data_int_tmp[14];
        end  
        always @(posedge dbclk or negedge debounce_rstn_15)
        begin
            if(debounce_rstn_15 == 1'b0)
                debounce_d1_tmp[15] <= 1'b0;
            else
                debounce_d1_tmp[15] <= gpio_rx_data_int_tmp[15];
        end  
        always @(posedge dbclk or negedge debounce_rstn_16)
        begin
            if(debounce_rstn_16 == 1'b0)
                debounce_d1_tmp[16] <= 1'b0;
            else
                debounce_d1_tmp[16] <= gpio_rx_data_int_tmp[16];
        end  
        always @(posedge dbclk or negedge debounce_rstn_17)
        begin
            if(debounce_rstn_17 == 1'b0)
                debounce_d1_tmp[17] <= 1'b0;
            else
                debounce_d1_tmp[17] <= gpio_rx_data_int_tmp[17];
        end  
        always @(posedge dbclk or negedge debounce_rstn_18)
        begin
            if(debounce_rstn_18 == 1'b0)
                debounce_d1_tmp[18] <= 1'b0;
            else
                debounce_d1_tmp[18] <= gpio_rx_data_int_tmp[18];
        end  
        always @(posedge dbclk or negedge debounce_rstn_19)
        begin
            if(debounce_rstn_19 == 1'b0)
                debounce_d1_tmp[19] <= 1'b0;
            else
                debounce_d1_tmp[19] <= gpio_rx_data_int_tmp[19];
        end  
        always @(posedge dbclk or negedge debounce_rstn_20)
        begin
            if(debounce_rstn_20 == 1'b0)
                debounce_d1_tmp[20] <= 1'b0;
            else
                debounce_d1_tmp[20] <= gpio_rx_data_int_tmp[20];
        end  
        always @(posedge dbclk or negedge debounce_rstn_21)
        begin
            if(debounce_rstn_21 == 1'b0)
                debounce_d1_tmp[21] <= 1'b0;
            else
                debounce_d1_tmp[21] <= gpio_rx_data_int_tmp[21];
        end  
        always @(posedge dbclk or negedge debounce_rstn_22)
        begin
            if(debounce_rstn_22 == 1'b0)
                debounce_d1_tmp[22] <= 1'b0;
            else
                debounce_d1_tmp[22] <= gpio_rx_data_int_tmp[22];
        end  
        always @(posedge dbclk or negedge debounce_rstn_23)
        begin
            if(debounce_rstn_23 == 1'b0)
                debounce_d1_tmp[23] <= 1'b0;
            else
                debounce_d1_tmp[23] <= gpio_rx_data_int_tmp[23];
        end  
        always @(posedge dbclk or negedge debounce_rstn_24)
        begin
            if(debounce_rstn_24 == 1'b0)
                debounce_d1_tmp[24] <= 1'b0;
            else
                debounce_d1_tmp[24] <= gpio_rx_data_int_tmp[24];
        end  
        always @(posedge dbclk or negedge debounce_rstn_25)
        begin
            if(debounce_rstn_25 == 1'b0)
                debounce_d1_tmp[25] <= 1'b0;
            else
                debounce_d1_tmp[25] <= gpio_rx_data_int_tmp[25];
        end  
        always @(posedge dbclk or negedge debounce_rstn_26)
        begin
            if(debounce_rstn_26 == 1'b0)
                debounce_d1_tmp[26] <= 1'b0;
            else
                debounce_d1_tmp[26] <= gpio_rx_data_int_tmp[26];
        end  
        always @(posedge dbclk or negedge debounce_rstn_27)
        begin
            if(debounce_rstn_27 == 1'b0)
                debounce_d1_tmp[27] <= 1'b0;
            else
                debounce_d1_tmp[27] <= gpio_rx_data_int_tmp[27];
        end  
        always @(posedge dbclk or negedge debounce_rstn_28)
        begin
            if(debounce_rstn_28 == 1'b0)
                debounce_d1_tmp[28] <= 1'b0;
            else
                debounce_d1_tmp[28] <= gpio_rx_data_int_tmp[28];
        end  
        always @(posedge dbclk or negedge debounce_rstn_29)
        begin
            if(debounce_rstn_29 == 1'b0)
                debounce_d1_tmp[29] <= 1'b0;
            else
                debounce_d1_tmp[29] <= gpio_rx_data_int_tmp[29];
        end  
        always @(posedge dbclk or negedge debounce_rstn_30)
        begin
            if(debounce_rstn_30 == 1'b0)
                debounce_d1_tmp[30] <= 1'b0;
            else
                debounce_d1_tmp[30] <= gpio_rx_data_int_tmp[30];
        end  
        always @(posedge dbclk or negedge debounce_rstn_31)
        begin
            if(debounce_rstn_31 == 1'b0)
                debounce_d1_tmp[31] <= 1'b0;
            else
                debounce_d1_tmp[31] <= gpio_rx_data_int_tmp[31];
        end  
        assign debounce_d1 = debounce_d1_tmp[`GPIO_PWIDTH-1:0];
        always @(posedge dbclk or negedge dbclk_rstn)
        begin
            if(dbclk_rstn == 1'b1) 
                debounce_d2 <= {`GPIO_PWIDTH{1'b0}}; 
            else
                debounce_d2 <= debounce_d1; 
        end
    end
    else begin: NO_SUPPORT_DEBOUNCE_PROC
        always @(*)
        begin
            debounce_d2 = {`GPIO_PWIDTH{zero_value}};
        end
    end
endgenerate
always @(*) 
begin: GPIO_TX_DATA_PROC
integer i;
    for(i=0; i < `GPIO_PWIDTH; i=i+1) begin
        gpio_tx_data[i] = gpio_sw_data[i];
    end        
end
always @(*) 
begin: GPIO_TX_EN_PROC
integer i;
    for(i=0;i<`GPIO_PWIDTH;i=i+1) begin
        gpio_tx_en[i] = gpio_sw_dir[i];
    end
end
generate
    if(`GPIO_EXT_DATA_SYNC_EN == 1'b1) begin: SUPPORT_SYNC_EXT_DATA_PROC
        reg           [`GPIO_PWIDTH-1:0]     gpio_rx_data_ff1;
        reg           [`GPIO_PWIDTH-1:0]     gpio_rx_data_ff2;
        always @(posedge pclk or negedge presetn) 
        begin
            if(presetn == 1'b0)
                gpio_rx_data_ff1 <= {`GPIO_PWIDTH{1'b0}};
            else
                gpio_rx_data_ff1 <= gpio_rx_data;
        end
        always @(posedge pclk or negedge presetn) 
        begin
            if(presetn == 1'b0)
                gpio_rx_data_ff2 <= {`GPIO_PWIDTH{1'b0}};
            else
                gpio_rx_data_ff2 <= gpio_rx_data_ff1;
        end
        assign  gpio_ext_data_tmp = gpio_rx_data_ff2;
    end
    else begin: NO_SUPPORT_SYNC_EXT_DATA_PROC
        assign  gpio_ext_data_tmp = gpio_rx_data;
    end
endgenerate
always @(*)
begin: GPIO_EXT_DATA_PROC
integer i;
    gpio_ext_data = {`GPIO_PWIDTH{zero_value}};
    for(i=0;i<`GPIO_PWIDTH;i=i+1) begin
        if(gpio_tx_en[i] == 1'b1)
            gpio_ext_data[i] = gpio_sw_data[i];
        else
            gpio_ext_data[i] = gpio_ext_data_tmp[i];
    end 
end      
assign  gpio_etb_trig = int_level;
endmodule 
module gpio_top 
(
                   gpio_etb_trig      ,
                   pclk               ,
                   pclk_int           ,
                   dbclk              ,
                   dbclk_rstn         ,
                   scan_mode          ,                   
                   presetn            ,
                   penable            ,
                   pwrite             ,
                   pwdata             ,
                   paddr              ,
                   psel               ,
                   gpio_in_data       ,
                   gpio_out_data      ,
                   gpio_out_en        ,
                   gpio_int_flag      ,
                   gpio_int_clk_en    ,
                   prdata              
);
output              [31:0]     gpio_etb_trig        ;                   
input                                     pclk                 ;
input                                     pclk_int             ;
input                                     presetn              ;
input                                     dbclk                ; 
input                                     dbclk_rstn           ;
input                                     scan_mode            ;
input                                     penable              ;
input                                     pwrite               ;
input                          [31:0]     pwdata               ;
input               [6:0]     paddr                ;
input                                     psel                 ;
input               [31:0]     gpio_in_data         ;
output              [31:0]     gpio_out_data        ;
output              [31:0]     gpio_out_en          ;
output                                    gpio_int_flag        ;
output                                    gpio_int_clk_en      ;
output                         [31:0]     prdata               ;
wire                                      dbclk                ;
wire                                      dbclk_rstn           ;
wire                                      scan_mode            ;
wire                                      pclk_int             ;
wire                           [31:0]     prdata               ;
wire                [31:0]     gpio_sw_data         ;
wire                [31:0]     gpio_sw_dir          ;
wire                [31:0]     gpio_int_en          ;
wire                [31:0]     gpio_int_mask        ;
wire                [31:0]     gpio_int_type        ;
wire                [31:0]     gpio_int_pol         ;
wire                [31:0]     gpio_int             ;
wire                [31:0]     gpio_int_n           ;
wire                [31:0]     gpio_raw_int_status  ;
wire                [31:0]     gpio_debounce        ;
wire                                       gpio_int_level_sync  ;
wire                [31:0]     gpio_int_clr         ;
wire                [31:0]     gpio_in_data         ;
wire                [31:0]     gpio_ext_data        ;  
wire                [31:0]     gpio_out_data        ;
wire                [31:0]     gpio_out_en          ;
wire                                       gpio_int_flag        ;
wire                                       gpio_int_flag_n      ;
wire                [31:0]     gpio_int_status      ;
gpio_apbif U_GPIO_APBIF
(
    .pclk                          (pclk                      ),
    .presetn                       (presetn                   ),
    .penable                       (penable                   ),
    .pwrite                        (pwrite                    ),
    .pwdata                        (pwdata                    ),
    .paddr                         (paddr                     ),
    .psel                          (psel                      ),
    .gpio_sw_data                  (gpio_sw_data              ),
    .gpio_sw_dir                   (gpio_sw_dir               ),
    .gpio_int_en                   (gpio_int_en               ),
    .gpio_int_mask                 (gpio_int_mask             ),
    .gpio_int_type                 (gpio_int_type             ),
    .gpio_int_pol                  (gpio_int_pol              ),
    .gpio_int_status               (gpio_int_status           ),
    .gpio_raw_int_status           (gpio_raw_int_status       ),
    .gpio_debounce                 (gpio_debounce             ),
    .gpio_int_clr                  (gpio_int_clr              ),
    .gpio_ext_data                 (gpio_ext_data             ),
    .gpio_int_level_sync           (gpio_int_level_sync       ),
    .prdata                        (prdata                    )
);
gpio_ctrl U_GPIO_CTRL  
(
    .gpio_etb_trig                 (gpio_etb_trig             ),
    .pclk                          (pclk                      ),
    .pclk_int                      (pclk_int                  ),
    .dbclk                         (dbclk                     ),
    .presetn                       (presetn                   ),
    .dbclk_rstn                    (dbclk_rstn                ),
    .scan_mode                     (scan_mode                 ),
    .gpio_sw_data                  (gpio_sw_data              ),
    .gpio_sw_dir                   (gpio_sw_dir               ),
    .gpio_int_en                   (gpio_int_en               ),
    .gpio_int_mask                 (gpio_int_mask             ),
    .gpio_int_type                 (gpio_int_type             ),
    .gpio_int_pol                  (gpio_int_pol              ),
    .gpio_debounce                 (gpio_debounce             ),
    .gpio_int_clr                  (gpio_int_clr              ),
    .gpio_rx_data                  (gpio_in_data              ),
    .gpio_int_level_sync           (gpio_int_level_sync       ),
    .gpio_tx_data                  (gpio_out_data             ),
    .gpio_tx_en                    (gpio_out_en               ),
    .gpio_ext_data                 (gpio_ext_data             ),
    .gpio_int_flag                 (gpio_int_flag             ),
    .gpio_int                      (gpio_int                  ),
    .gpio_int_flag_n               (gpio_int_flag_n           ),
    .gpio_int_n                    (gpio_int_n                ),
    .gpio_int_status               (gpio_int_status           ),
    .gpio_raw_int_status           (gpio_raw_int_status       ),
    .gpio_int_clk_en               (gpio_int_clk_en           )
);
endmodule
