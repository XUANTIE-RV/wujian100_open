/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module tim0_sec_top(
  etb_tim1_trig_en_off,
  etb_tim1_trig_en_on,
  etb_tim2_trig_en_off,
  etb_tim2_trig_en_on,
  intr,
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  scan_mode,
  tim1_etb_trig,
  tim2_etb_trig,
  tipc_tim0_trust
);
input           etb_tim1_trig_en_off; 
input           etb_tim1_trig_en_on; 
input           etb_tim2_trig_en_off; 
input           etb_tim2_trig_en_on; 
input   [31:0]  paddr;               
input           pclk;                
input           penable;             
input   [2 :0]  pprot;               
input           presetn;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           scan_mode;           
input           tipc_tim0_trust;     
output  [1 :0]  intr;                
output  [31:0]  prdata;              
output          tim1_etb_trig;       
output          tim2_etb_trig;       
wire            etb_tim1_trig_en_off; 
wire            etb_tim1_trig_en_on; 
wire            etb_tim2_trig_en_off; 
wire            etb_tim2_trig_en_on; 
wire    [31:0]  i_prdata;            
wire            i_psel;              
wire            i_pwrite;            
wire    [1 :0]  intr;                
wire    [31:0]  paddr;               
wire            pclk;                
wire            penable;             
wire    [2 :0]  pprot;               
wire    [31:0]  prdata;              
wire            presetn;             
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            scan_mode;           
wire            tim1_etb_trig;       
wire            tim2_etb_trig;       
wire            tipc_tim0_trust;     
tim_top  x_tim_top (
  .etb_tim1_trig_en_off (etb_tim1_trig_en_off),
  .etb_tim1_trig_en_on  (etb_tim1_trig_en_on ),
  .etb_tim2_trig_en_off (etb_tim2_trig_en_off),
  .etb_tim2_trig_en_on  (etb_tim2_trig_en_on ),
  .intr                 (intr                ),
  .paddr                (paddr               ),
  .pclk                 (pclk                ),
  .penable              (penable             ),
  .prdata               (i_prdata            ),
  .presetn              (presetn             ),
  .psel                 (i_psel              ),
  .pwdata               (pwdata              ),
  .pwrite               (i_pwrite            ),
  .scan_mode            (scan_mode           ),
  .tim1_etb_trig        (tim1_etb_trig       ),
  .tim2_etb_trig        (tim2_etb_trig       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;
endmodule
module timers_apbif #
(
    `include              "timers_params.v"
)
(
    input  wire                                 pclk                  ,
    input  wire                                 presetn               ,
    input  wire                                 penable               ,
    input  wire                                 pwrite                ,
    input  wire                       [31:0]    pwdata                ,
    input  wire           [TIMER_ADDR_LHS:0]    paddr                 ,
    input  wire                                 psel                  ,
    output reg            [TIMER1_WIDTH-1:0]    timer1loadcount       ,
    output reg            [TIMER2_WIDTH-1:0]    timer2loadcount       ,
    output wire                       [ 1:0]    timer_en              ,
    output wire                       [ 1:0]    timer_mode            ,
    output wire                       [ 1:0]    timer_hwen            ,
    output wire                                 timer_int_flag        ,
    output wire                                 timer_int_flag_n      ,
    output wire                       [ 1:0]    timer_int             ,
    output wire                       [ 1:0]    timer_int_n           ,
    input  wire                       [63:0]    bus_current_value     ,
    input  wire                       [ 1:0]    bus_interrupts        ,
    output reg                        [31:0]    prdata                ,
    input  wire                                 etb_tim1_trig_en_on   ,
    input  wire                                 etb_tim2_trig_en_on   ,
    input  wire                                 etb_tim1_trig_en_off  ,
    input  wire                                 etb_tim2_trig_en_off  ,
    output reg                                  tim1_etb_trig         ,
    output reg                                  tim2_etb_trig
);
localparam           TIMER1LC_OFFSET      = 8'd0 ;
localparam           TIMER1CV_OFFSET      = 8'd1 ;
localparam           TIMER1CR_OFFSET      = 8'd2 ;
localparam           TIMER1EOI_OFFSET     = 8'd3 ;
localparam           TIMER1INTST_OFFSET   = 8'd4 ;
localparam           TIMER2LC_OFFSET      = 8'd5 ;
localparam           TIMER2CV_OFFSET      = 8'd6 ;
localparam           TIMER2CR_OFFSET      = 8'd7 ;
localparam           TIMER2EOI_OFFSET     = 8'd8 ;
localparam           TIMER2INTST_OFFSET   = 8'd9 ;
localparam           TIMERSINTST_OFFSET   = 8'd40;
localparam           TIMERSEOI_OFFSET     = 8'd41;
localparam           TIMERSRAW_OFFSET     = 8'd42;
reg     [TIMER_CTRL_WIDTH-1:0]    timer1controlreg       ;
reg     [TIMER_CTRL_WIDTH-1:0]    timer2controlreg       ;
reg                               timer1loadcount_wen    ;
reg                               timer1controlreg_wen   ;
reg                               timer1eoi_ren          ;
reg                               timer2loadcount_wen    ;
reg                               timer2controlreg_wen   ;
reg                               timer2eoi_ren          ;
reg                               timerseoi_ren          ;
reg                     [31:0]    ri_timer1loadcount     ;
reg                     [31:0]    ri_timer1currentvalue  ;
reg                     [31:0]    ri_timer1controlreg    ;
reg                     [31:0]    ri_timer1intstatus     ;
reg                     [31:0]    ri_timer2loadcount     ;
reg                     [31:0]    ri_timer2currentvalue  ;
reg                     [31:0]    ri_timer2controlreg    ;
reg                     [31:0]    ri_timer2intstatus     ;
reg                               timer1_int_ff1         ; 
reg                               timer1_int_ff2         ; 
reg                               timer2_int_ff1         ; 
reg                               timer2_int_ff2         ;
reg                     [ 1:0]    timer_int_tmp          ;
reg                     [ 1:0]    int_sync_ff1           ;
reg                     [31:0]    ri_timer_int           ;
reg                     [31:0]    ri_timersintstatus     ;
wire                    [31:0]    timer1currentvalue     ;  
wire                    [31:0]    timer2currentvalue     ;
wire                    [ 1:0]    int_sync               ;
wire                    [ 1:0]    timereoi               ;
wire                              timerseoi              ;
wire                    [ 1:0]    timeren                ; 
wire                    [ 1:0]    timermode              ;
wire                    [ 1:0]    timerhwen              ;
wire                    [ 1:0]    timerintmask           ;
wire                    [ 1:0]    edge_detected          ;
integer                           i;
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1LC_OFFSET)
            timer1loadcount_wen = 1'b1;
        else
            timer1loadcount_wen = 1'b0;
    end
    else
        timer1loadcount_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1CR_OFFSET)
            timer1controlreg_wen = 1'b1;
        else
            timer1controlreg_wen = 1'b0;
    end
    else
        timer1controlreg_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER1EOI_OFFSET)
            timer1eoi_ren = 1'b1;
        else
            timer1eoi_ren = 1'b0;
    end
    else
        timer1eoi_ren = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2LC_OFFSET)
            timer2loadcount_wen = 1'b1;
        else
            timer2loadcount_wen = 1'b0;
    end
    else
        timer2loadcount_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b1) && (pwrite == 1'b1)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2CR_OFFSET)
            timer2controlreg_wen = 1'b1;
        else
            timer2controlreg_wen = 1'b0;
    end
    else
        timer2controlreg_wen = 1'b0;
end
always @(*)
begin
    if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin      
        if(paddr[TIMER_ADDR_LHS:2] == TIMER2EOI_OFFSET)
            timer2eoi_ren = 1'b1;
        else
            timer2eoi_ren = 1'b0;
    end
    else
        timer2eoi_ren = 1'b0;
end
always @(*)
begin
  if((psel == 1'b1) && (penable == 1'b0) && (pwrite == 1'b0)) begin
      if(paddr[TIMER_ADDR_LHS:0] == TIMERSEOI_OFFSET)
          timerseoi_ren = 1'b1;
      else
          timerseoi_ren = 1'b0;
  end
  else
      timerseoi_ren = 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        timer1loadcount <= {TIMER1_WIDTH{1'b0}};
    else if(timer1loadcount_wen == 1'b1)
        timer1loadcount <= pwdata[TIMER1_WIDTH-1:0];
    else ;
end
always @(*)
begin
    ri_timer1loadcount = 32'b0;
    ri_timer1loadcount[TIMER1_WIDTH-1:0] = timer1loadcount;
end
always @(*)
begin
    ri_timer1currentvalue = 32'b0;
    ri_timer1currentvalue[TIMER1_WIDTH-1:0] = timer1currentvalue[TIMER1_WIDTH-1:0];
end
always@(posedge pclk or negedge presetn)
begin
    if (presetn == 1'b0)
        timer1controlreg <= {TIMER_CTRL_WIDTH{1'b0}};
    else if(timer1controlreg_wen == 1'b1)
        timer1controlreg <= pwdata[TIMER_CTRL_WIDTH-1:0];
    else if(etb_tim1_trig_en_off == 1'b1)
        timer1controlreg[0] <= 1'b0;
    else if(etb_tim1_trig_en_on == 1'b1)
        timer1controlreg[0] <= 1'b1;
    else ;
end
always @(*)
begin
    ri_timer1controlreg = 32'b0;
    ri_timer1controlreg[TIMER_CTRL_WIDTH-1:0] = timer1controlreg;
end
always@(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        timer2loadcount <= {TIMER2_WIDTH{1'b0}};
    else if(timer2loadcount_wen == 1'b1)
        timer2loadcount <= pwdata[TIMER2_WIDTH-1:0];
    else ;
end
always @(*)
begin
    ri_timer2loadcount = 32'b0;
    ri_timer2loadcount[TIMER2_WIDTH-1:0] = timer2loadcount;
end
always @(*)
begin
    ri_timer2currentvalue = 32'b0;
    ri_timer2currentvalue[TIMER2_WIDTH-1:0] = timer2currentvalue[TIMER2_WIDTH-1:0];
end
always@(posedge pclk or negedge presetn)
begin
    if (presetn == 1'b0)
        timer2controlreg <= {TIMER_CTRL_WIDTH{1'b0}};
    else if(timer2controlreg_wen == 1'b1)
        timer2controlreg <= pwdata[TIMER_CTRL_WIDTH-1:0];
    else if(etb_tim2_trig_en_off == 1'b1)
        timer2controlreg[0] <= 1'b0;
    else if(etb_tim2_trig_en_on == 1'b1)
        timer2controlreg[0] <= 1'b1;
    else ;
end
always @(*)
begin
    ri_timer2controlreg = 32'b0;
    ri_timer2controlreg[TIMER_CTRL_WIDTH-1:0] = timer2controlreg;
end  
always @(posedge pclk or negedge presetn)
begin
    if(presetn == 1'b0)
        prdata <= 32'b0;
    else if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0)) begin
        case (paddr[TIMER_ADDR_LHS:2])
            TIMER1LC_OFFSET   : prdata <= ri_timer1loadcount;
            TIMER1CV_OFFSET   : prdata <= ri_timer1currentvalue;
            TIMER1CR_OFFSET   : prdata <= ri_timer1controlreg;
            TIMER1INTST_OFFSET: prdata <= ri_timer1intstatus;
            TIMER2LC_OFFSET   : prdata <= ri_timer2loadcount;
            TIMER2CV_OFFSET   : prdata <= ri_timer2currentvalue;
            TIMER2CR_OFFSET   : prdata <= ri_timer2controlreg;
            TIMER2INTST_OFFSET: prdata <= ri_timer2intstatus;
            TIMERSINTST_OFFSET: prdata <= ri_timersintstatus;
            TIMERSRAW_OFFSET  : prdata <= ri_timer_int;
            default           : prdata <= 32'b0;
        endcase
    end
    else ;
end
always @(posedge pclk or negedge presetn) 
begin
    if(presetn == 1'b0) begin
        timer1_int_ff1 <= 1'b0;
        timer1_int_ff2 <= 1'b0;
        timer2_int_ff1 <= 1'b0;
        timer2_int_ff2 <= 1'b0;
    end 
    else begin
        timer1_int_ff1 <= bus_interrupts[0];
        timer2_int_ff1 <= bus_interrupts[1];
        timer1_int_ff2 <= timer1_int_ff1;
        timer2_int_ff2 <= timer2_int_ff1;
    end
end
assign int_sync[0] = (TIMER1_METASTABLE==1) ? timer1_int_ff2 : bus_interrupts[0];
assign int_sync[1] = (TIMER2_METASTABLE==1) ? timer2_int_ff2 : bus_interrupts[1];
assign timer1currentvalue = bus_current_value[31:0];
assign timer2currentvalue = bus_current_value[63:32];
always @(posedge pclk or negedge presetn) 
begin
    if (presetn == 1'b0)
        int_sync_ff1 <= 2'b0;
    else
        int_sync_ff1 <= int_sync;
end
assign edge_detected = int_sync & (~int_sync_ff1);
assign timereoi = {timer2eoi_ren,timer1eoi_ren};
assign timerseoi = timerseoi_ren;
assign timeren = {timer2controlreg[0],timer1controlreg[0]};
assign timermode = {timer2controlreg[1],timer1controlreg[1]};
assign timerhwen = {timer2controlreg[4],timer1controlreg[4]};
always @(posedge pclk or negedge presetn) 
begin
    if(presetn == 1'b0)
      timer_int_tmp <= 2'b0;
    else begin
        for(i=0;i<2;i=i+1) begin
            if(edge_detected[i] == 1'b1) begin
                if(timeren[i]==1'b1)
                    timer_int_tmp[i] <= 1'b1;
                else
                    timer_int_tmp[i] <= 1'b0; 
            end
            else if((timereoi[i] == 1'b1) || (timerseoi == 1'b1) || (timeren[i]==1'b0))
                timer_int_tmp[i] <= 1'b0;
            else ; 
        end
    end
end
always @(*)
begin
    ri_timer_int = 32'b0;
    ri_timer_int[1:0] = timer_int_tmp;
end
always @(posedge pclk or negedge presetn) 
begin
   if(presetn == 1'b0)
       tim1_etb_trig <= 1'b0;
   else if(edge_detected[0] ==1'b1)
       tim1_etb_trig <= 1'b1;
   else
       tim1_etb_trig <= 1'b0;
end
always @(posedge pclk or negedge presetn) 
begin
   if(presetn == 1'b0)
       tim2_etb_trig <= 1'b0;
   else if(edge_detected[1] ==1'b1)
       tim2_etb_trig <= 1'b1;
   else
       tim2_etb_trig <= 1'b0;
end
assign  timerintmask[0] = timer1controlreg[2];
assign  timerintmask[1] = timer2controlreg[2];
always @(*) 
begin
    ri_timer1intstatus = 32'b0;
    ri_timer2intstatus = 32'b0;
    ri_timersintstatus = 32'b0;
    ri_timer1intstatus[0]   = ri_timer_int[0] & (~timerintmask[0]);
    ri_timer2intstatus[0]   = ri_timer_int[1] & (~timerintmask[1]);  
    ri_timersintstatus[1:0] = ri_timer_int[1:0] & (~timerintmask);
end
assign timer_int_flag   = |ri_timersintstatus;
assign timer_int_flag_n = ~timer_int_flag;
assign timer_int        = ri_timersintstatus[1:0];
assign timer_int_n      = ~timer_int;
assign timer_en         = timeren;
assign timer_mode       = timermode;
assign timer_hwen       = timerhwen;
endmodule
module timers_frc #
(
    parameter TIMER_WIDTH      = 8,
    parameter TIMER_PULSE_EXTD = 0
)
(
    input  wire                                      timer_clk      ,
    input  wire                                      timer_resetn   ,
    input  wire                                      timer_en       ,
    input  wire                                      timer_mode     ,
    input  wire                                      timerhwen      ,
    input  wire                [TIMER_WIDTH-1:0]     load_value     ,
    output reg                            [31:0]     current_value  ,
    output reg                                       toggle         ,
    output wire                                      interrupt      ,
    output wire                                      timertrig
);
reg                      rising_edge       ;
reg                      atzero            ;
reg [TIMER_WIDTH-1:0]    timer             ;
reg                      extend1           ;
reg                      extend2           ;
reg                      extend3           ;
wire                     load              ;
wire                     raw_interrupt     ;
wire                     interrupt_extd1   ;
wire                     interrupt_extd2   ;
wire                     interrupt_extd3   ;
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        rising_edge <= 1'b0;
    else
        rising_edge <= timer_en;
end
assign load = ((timer_en == 1'b1) & (rising_edge == 1'b0));
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        timer <= {TIMER_WIDTH{1'b1}};
    else begin
        if(timer_en == 1'b1) begin
            if(load == 1'b1)
                timer <= load_value;
            else begin
                if(timer == {TIMER_WIDTH{1'b0}}) begin
                    if(timer_mode == 1'b0)
                        timer <= {TIMER_WIDTH{1'b1}};
                    else
                        timer <= load_value;
                end
                else
                    timer <= timer - {{(TIMER_WIDTH-1){1'b0}},{1'b1}};
            end
        end
        else 
            timer <= {TIMER_WIDTH{1'b1}};
    end
end
always @ (posedge timer_clk or negedge timer_resetn) 
begin
    if(timer_resetn == 1'b0)
        atzero <= 1'b0;
    else
        atzero <= (timer=={TIMER_WIDTH{1'b0}});
end
assign raw_interrupt = atzero;
assign timertrig     = atzero & timerhwen;
always @ (posedge timer_clk or negedge timer_resetn)
begin
    if(timer_resetn == 1'b0)
        toggle <= 1'b0;
    else if(timer=={TIMER_WIDTH{1'b0}})
        toggle <= ~toggle;
    else ;
end
always @(posedge timer_clk or negedge timer_resetn) 
begin
  if(timer_resetn == 1'b0) begin
      extend1 <= 1'b0;
      extend2 <= 1'b0;
      extend3 <= 1'b0;
  end 
  else begin
      extend1 <= raw_interrupt;
      extend2 <= extend1;
      extend3 <= extend2;
  end
end           
assign interrupt_extd1 = raw_interrupt | extend1;
assign interrupt_extd2 = interrupt_extd1 | extend2;
assign interrupt_extd3 = interrupt_extd2 | extend3;
always @(*) 
begin  
    current_value = 32'b0;
    if(timer_en == 1'b1)
      current_value[TIMER_WIDTH-1:0] = timer;  
end
assign interrupt = ((TIMER_PULSE_EXTD == 0) ? raw_interrupt :
                   ((TIMER_PULSE_EXTD == 1) ? interrupt_extd1 :
                   ((TIMER_PULSE_EXTD == 2) ? interrupt_extd2 : 
                                              interrupt_extd3)));
endmodule
module timers_top #
(
    `include         "timers_params.v"
)
(
    pclk                   ,
    presetn                ,
    penable                ,
    psel                   ,
    pwrite                 ,
    paddr                  ,
    pwdata                 ,
    scan_mode              ,
    timer_1_clk            ,
    timer_2_clk            ,
    timer_1_resetn         ,
    timer_2_resetn         ,
    timer_en               ,
    timertrig              ,
    timer_int              ,
    timer_int_n            ,
    timer_int_flag         ,
    timer_int_flag_n       ,
    etb_tim1_trig_en_on    ,
    etb_tim1_trig_en_off   ,
    etb_tim2_trig_en_on    ,
    etb_tim2_trig_en_off   ,
    tim1_etb_trig          ,
    tim2_etb_trig          ,
    prdata
);
input                                           pclk                   ;
input                                           presetn                ;
input                                           penable                ;
input                                           psel                   ;
input                                           pwrite                 ;
input             [7:0]            paddr                  ;        
input                         [31:0]            pwdata                 ;
input                                           scan_mode              ; 
input                                           timer_1_clk            ;
input                                           timer_1_resetn         ;
input                                           timer_2_clk            ;
input                                           timer_2_resetn         ;
input                                           etb_tim1_trig_en_on    ;
input                                           etb_tim1_trig_en_off   ;
input                                           etb_tim2_trig_en_on    ;
input                                           etb_tim2_trig_en_off   ;
output                                          tim1_etb_trig          ;
output                                          tim2_etb_trig          ;
output                        [ 1:0]            timer_en               ;
output                        [ 1:0]            timertrig              ;
output                        [ 1:0]            timer_int              ;
output                        [ 1:0]            timer_int_n            ;
output                                          timer_int_flag         ;
output                                          timer_int_flag_n       ;         
output                        [31:0]            prdata                 ;
wire                                [63:0]    bus_load_value       ;
wire                                [63:0]    bus_current_value    ;
wire                                 [1:0]    bus_interrupt        ;
wire                                          timer_1_clk          ; 
wire                                          timer_1_resetn       ;
wire                                          timer_1_toggle       ;
wire                                          timer_2_clk          ; 
wire                                          timer_2_resetn       ;
wire                                          timer_2_toggle       ;
wire                    [TIMER1_WIDTH-1:0]    timer1loadcount      ;
wire                    [TIMER2_WIDTH-1:0]    timer2loadcount      ;
wire                                 [1:0]    timer_en             ;
wire                                 [1:0]    timer_mode           ;
wire                                 [1:0]    timer_hwen           ;
wire                                 [1:0]    timer_int            ;
wire                                 [1:0]    timer_int_n          ;
wire                                          timer_int_flag       ;
wire                                          timer_int_flag_n     ;
timers_apbif U_TIMERS_APBIF 
(   
    .pclk                    (pclk                     ),
    .presetn                 (presetn                  ),
    .penable                 (penable                  ),
    .pwrite                  (pwrite                   ),
    .pwdata                  (pwdata                   ),
    .paddr                   (paddr                    ),
    .psel                    (psel                     ),
    .timer1loadcount         (timer1loadcount          ), 
    .timer2loadcount         (timer2loadcount          ), 
    .etb_tim1_trig_en_on     (etb_tim1_trig_en_on      ),
    .etb_tim1_trig_en_off    (etb_tim1_trig_en_off     ),
    .etb_tim2_trig_en_on     (etb_tim2_trig_en_on      ),
    .etb_tim2_trig_en_off    (etb_tim2_trig_en_off     ),
    .tim1_etb_trig           (tim1_etb_trig            ),
    .tim2_etb_trig           (tim2_etb_trig            ),
    .timer_en                (timer_en                 ),
    .timer_mode              (timer_mode               ),
    .timer_hwen              (timer_hwen               ),
    .timer_int_flag          (timer_int_flag           ),
    .timer_int_flag_n        (timer_int_flag_n         ),
    .timer_int               (timer_int                ),
    .timer_int_n             (timer_int_n              ),
    .bus_current_value       (bus_current_value        ),
    .bus_interrupts          (bus_interrupt            ),
    .prdata                  (prdata                   )
);
timers_frc #
(    .TIMER_WIDTH            (TIMER1_WIDTH             ),
     .TIMER_PULSE_EXTD       (TIMER1_PULSE_EXTD        )
) 
U_TIMER0 
(   
    .timer_clk               (timer_1_clk              ),
    .timer_resetn            (timer_1_resetn           ),
    .timer_en                (timer_en[0]              ),
    .timer_mode              (timer_mode[0]            ),
    .load_value              (timer1loadcount          ),
    .current_value           (bus_current_value[31:0]  ),
    .toggle                  (timer_1_toggle           ),
    .interrupt               (bus_interrupt[0]         ),
    .timertrig               (timertrig[0]             ),
    .timerhwen               (timer_hwen[0]            )
 );
timers_frc #
(    .TIMER_WIDTH            (TIMER2_WIDTH             ),
     .TIMER_PULSE_EXTD       (TIMER2_PULSE_EXTD        )
) 
U_TIMER1 
(   
    .timer_clk               (timer_2_clk              ),
    .timer_resetn            (timer_2_resetn           ),
    .timer_en                (timer_en[1]              ),
    .timer_mode              (timer_mode[1]            ),
    .load_value              (timer2loadcount          ),
    .current_value           (bus_current_value[63:32] ),
    .toggle                  (timer_2_toggle           ),
    .interrupt               (bus_interrupt[1]         ),
    .timertrig               (timertrig[1]             ),
    .timerhwen               (timer_hwen[1]            )
 );
endmodule
module tim_top(
  etb_tim1_trig_en_off,
  etb_tim1_trig_en_on,
  etb_tim2_trig_en_off,
  etb_tim2_trig_en_on,
  intr,
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwrite,
  scan_mode,
  tim1_etb_trig,
  tim2_etb_trig
);
input           etb_tim1_trig_en_off; 
input           etb_tim1_trig_en_on; 
input           etb_tim2_trig_en_off; 
input           etb_tim2_trig_en_on; 
input   [31:0]  paddr;               
input           pclk;                
input           penable;             
input           presetn;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           scan_mode;           
output  [1 :0]  intr;                
output  [31:0]  prdata;              
output          tim1_etb_trig;       
output          tim2_etb_trig;       
wire            etb_tim1_trig_en_off; 
wire            etb_tim1_trig_en_on; 
wire            etb_tim2_trig_en_off; 
wire            etb_tim2_trig_en_on; 
wire    [1 :0]  intr;                
wire    [31:0]  paddr;               
wire            pclk;                
wire            penable;             
wire    [31:0]  prdata;              
wire            presetn;             
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            scan_mode;           
wire            tim1_etb_trig;       
wire            tim2_etb_trig;       
wire    [1 :0]  timer_en;            
wire            timer_int_flag;      
wire            timer_int_flag_n;    
wire    [1 :0]  timer_int_n;         
wire    [1 :0]  timertrig;           
timers_top  x_timers_top (
  .etb_tim1_trig_en_off (etb_tim1_trig_en_off),
  .etb_tim1_trig_en_on  (etb_tim1_trig_en_on ),
  .etb_tim2_trig_en_off (etb_tim2_trig_en_off),
  .etb_tim2_trig_en_on  (etb_tim2_trig_en_on ),
  .paddr                (paddr[7:0]          ),
  .pclk                 (pclk                ),
  .penable              (penable             ),
  .prdata               (prdata              ),
  .presetn              (presetn             ),
  .psel                 (psel                ),
  .pwdata               (pwdata              ),
  .pwrite               (pwrite              ),
  .scan_mode            (scan_mode           ),
  .tim1_etb_trig        (tim1_etb_trig       ),
  .tim2_etb_trig        (tim2_etb_trig       ),
  .timer_1_clk          (pclk                ),
  .timer_1_resetn       (presetn             ),
  .timer_2_clk          (pclk                ),
  .timer_2_resetn       (presetn             ),
  .timer_en             (timer_en            ),
  .timer_int            (intr                ),
  .timer_int_flag       (timer_int_flag      ),
  .timer_int_flag_n     (timer_int_flag_n    ),
  .timer_int_n          (timer_int_n         ),
  .timertrig            (timertrig           )
);
endmodule
