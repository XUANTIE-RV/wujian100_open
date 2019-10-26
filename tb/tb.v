/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


`define SYNTHESIS
`define MAX_SIM_TIME 1500000000

`timescale 1ns/100ps

module wujian100_open_tb ();

`define  TB_MODULE             wujian100_open_tb
`define  TOP_MODULE           `TB_MODULE.x_wujian100_open_top

`define CORE_JTG_TCLK_DURATION 500

`define CLKMUX_EHS_CLK_DURATION 25 

`define CLKMUX_ELS_CLK_DURATION 15258.789

`ifdef iverilog
  integer FILE;
`else
  static integer FILE;
`endif

reg     [31:0]  cpuclk_counter;           
reg             i_ext_pad_clkmux_ehs_clk; 
reg             i_ext_pad_clkmux_els_clk; 
reg             i_ext_pad_rstgen_i_mcurst; 
reg             jtag_clk;                 


wire            PAD_GPIO_0;               
wire            PAD_GPIO_1;               
wire            PAD_GPIO_10;              
wire            PAD_GPIO_11;              
wire            PAD_GPIO_12;              
wire            PAD_GPIO_13;              
wire            PAD_GPIO_14;              
wire            PAD_GPIO_15;              
wire            PAD_GPIO_16;              
wire            PAD_GPIO_17;              
wire            PAD_GPIO_18;              
wire            PAD_GPIO_19;              
wire            PAD_GPIO_2;               
wire            PAD_GPIO_20;              
wire            PAD_GPIO_21;              
wire            PAD_GPIO_22;              
wire            PAD_GPIO_23;              
wire            PAD_GPIO_24;              
wire            PAD_GPIO_25;              
wire            PAD_GPIO_26;              
wire            PAD_GPIO_27;              
wire            PAD_GPIO_28;              
wire            PAD_GPIO_29;              
wire            PAD_GPIO_3;               
wire            PAD_GPIO_30;              
wire            PAD_GPIO_31;              
wire            PAD_GPIO_4;               
wire            PAD_GPIO_5;               
wire            PAD_GPIO_6;               
wire            PAD_GPIO_7;               
wire            PAD_GPIO_8;               
wire            PAD_GPIO_9;               
wire            PAD_JTAG_TCLK;            
wire            PAD_JTAG_TMS;             
wire            PAD_MCURST;               
wire            PAD_PWM_CH0;              
wire            PAD_PWM_CH1;              
wire            PAD_PWM_CH10;             
wire            PAD_PWM_CH11;             
wire            PAD_PWM_CH2;              
wire            PAD_PWM_CH3;              
wire            PAD_PWM_CH4;              
wire            PAD_PWM_CH5;              
wire            PAD_PWM_CH6;              
wire            PAD_PWM_CH7;              
wire            PAD_PWM_CH8;              
wire            PAD_PWM_CH9;              
wire            PAD_PWM_FAULT;            
wire            PAD_USI0_NSS;             
wire            PAD_USI0_SCLK;            
wire            PAD_USI0_SD0;             
wire            PAD_USI0_SD1;             
wire            PAD_USI1_NSS;             
wire            PAD_USI1_SCLK;            
wire            PAD_USI1_SD0;             
wire            PAD_USI1_SD1;             
wire            PAD_USI2_NSS;             
wire            PAD_USI2_SCLK;            
wire            PAD_USI2_SD0;             
wire            PAD_USI2_SD1;             
wire            PIN_EHS;                  
wire            PIN_ELS;                  
wire            PIN_TCLK;                 
wire            PI_IO_JTAG_MODE;          
wire            PI_MCURST;                
wire            PI_MODE_SEL0;             
wire            PI_MODE_SEL1;             
wire            PI_SOC_32KCLK;            
wire            PI_SOC_CLK;               
wire            PI_SOC_RST_B;             
wire            PI_TEST_MODE;             
wire            POUT_EHS;                 
wire            POUT_ELS;                 
wire            flash_bist_en;            


////////////////////////////////////clock define/////////////////////////////////
////////////////////////////////////ehs clock define////////////////////////////
assign PIN_EHS = i_ext_pad_clkmux_ehs_clk;
assign PI_SOC_CLK = i_ext_pad_clkmux_ehs_clk;
initial
begin
  i_ext_pad_clkmux_ehs_clk = 1'b0;
  forever begin
    #`CLKMUX_EHS_CLK_DURATION;
    i_ext_pad_clkmux_ehs_clk = ~i_ext_pad_clkmux_ehs_clk;
  end
end

////////////////////////////////////els clock define////////////////////////////                   
assign PIN_ELS = i_ext_pad_clkmux_els_clk;


initial
begin
  i_ext_pad_clkmux_els_clk = 1'b0;
  forever begin
    #`CLKMUX_ELS_CLK_DURATION;
    i_ext_pad_clkmux_els_clk = ~i_ext_pad_clkmux_els_clk;
  end
end

////////////////////////////////////jtag clock define////////////////////////////
assign PIN_TCLK = jtag_clk;
assign PAD_JTAG_TCLK = jtag_clk;

initial
begin
force PAD_JTAG_TMS = 1'b1;
end

initial
begin
  jtag_clk = 1'b0;
  forever begin
    #`CORE_JTG_TCLK_DURATION;
    jtag_clk = ~jtag_clk;
  end
end

/////////////////////////////////pad reset define/////////////////////////////
assign PI_MCURST = i_ext_pad_rstgen_i_mcurst;
assign PAD_MCURST = i_ext_pad_rstgen_i_mcurst;
assign PI_SOC_RST_B = i_ext_pad_rstgen_i_mcurst;

     initial
     begin
       i_ext_pad_rstgen_i_mcurst = 1'b0;
       #200;
       i_ext_pad_rstgen_i_mcurst = 1'b0;
       #20000;
       i_ext_pad_rstgen_i_mcurst = 1'b1;
     end

/////////////////////////////test mode define////////////////////////////////



///////////////////////////dut instance/////////////////////////////////////

wujian100_open_top  x_wujian100_open_top (
  .PAD_GPIO_0    (PAD_GPIO_0   ),
  .PAD_GPIO_1    (PAD_GPIO_1   ),
  .PAD_GPIO_10   (PAD_GPIO_10  ),
  .PAD_GPIO_11   (PAD_GPIO_11  ),
  .PAD_GPIO_12   (PAD_GPIO_12  ),
  .PAD_GPIO_13   (PAD_GPIO_13  ),
  .PAD_GPIO_14   (PAD_GPIO_14  ),
  .PAD_GPIO_15   (PAD_GPIO_15  ),
  .PAD_GPIO_16   (PAD_GPIO_16  ),
  .PAD_GPIO_17   (PAD_GPIO_17  ),
  .PAD_GPIO_18   (PAD_GPIO_18  ),
  .PAD_GPIO_19   (PAD_GPIO_19  ),
  .PAD_GPIO_2    (PAD_GPIO_2   ),
  .PAD_GPIO_20   (PAD_GPIO_20  ),
  .PAD_GPIO_21   (PAD_GPIO_21  ),
  .PAD_GPIO_22   (PAD_GPIO_22  ),
  .PAD_GPIO_23   (PAD_GPIO_23  ),
  .PAD_GPIO_24   (PAD_GPIO_24  ),
  .PAD_GPIO_25   (PAD_GPIO_25  ),
  .PAD_GPIO_26   (PAD_GPIO_26  ),
  .PAD_GPIO_27   (PAD_GPIO_27  ),
  .PAD_GPIO_28   (PAD_GPIO_28  ),
  .PAD_GPIO_29   (PAD_GPIO_29  ),
  .PAD_GPIO_3    (PAD_GPIO_3   ),
  .PAD_GPIO_30   (PAD_GPIO_30  ),
  .PAD_GPIO_31   (PAD_GPIO_31  ),
  .PAD_GPIO_4    (PAD_GPIO_4   ),
  .PAD_GPIO_5    (PAD_GPIO_5   ),
  .PAD_GPIO_6    (PAD_GPIO_6   ),
  .PAD_GPIO_7    (PAD_GPIO_7   ),
  .PAD_GPIO_8    (PAD_GPIO_8   ),
  .PAD_GPIO_9    (PAD_GPIO_9   ),
  .PAD_JTAG_TCLK (PAD_JTAG_TCLK),
  .PAD_JTAG_TMS  (PAD_JTAG_TMS ),
  .PAD_MCURST    (PAD_MCURST   ),
  .PAD_PWM_CH0   (PAD_PWM_CH0  ),
  .PAD_PWM_CH1   (PAD_PWM_CH1  ),
  .PAD_PWM_CH10  (PAD_PWM_CH10 ),
  .PAD_PWM_CH11  (PAD_PWM_CH11 ),
  .PAD_PWM_CH2   (PAD_PWM_CH2  ),
  .PAD_PWM_CH3   (PAD_PWM_CH3  ),
  .PAD_PWM_CH4   (PAD_PWM_CH4  ),
  .PAD_PWM_CH5   (PAD_PWM_CH5  ),
  .PAD_PWM_CH6   (PAD_PWM_CH6  ),
  .PAD_PWM_CH7   (PAD_PWM_CH7  ),
  .PAD_PWM_CH8   (PAD_PWM_CH8  ),
  .PAD_PWM_CH9   (PAD_PWM_CH9  ),
  .PAD_PWM_FAULT (PAD_PWM_FAULT),
  .PAD_USI0_NSS  (PAD_USI0_NSS ),
  .PAD_USI0_SCLK (PAD_USI0_SCLK),
  .PAD_USI0_SD0  (PAD_USI0_SD0 ),
  .PAD_USI0_SD1  (PAD_USI0_SD1 ),
  .PAD_USI1_NSS  (PAD_USI1_NSS ),
  .PAD_USI1_SCLK (PAD_USI1_SCLK),
  .PAD_USI1_SD0  (PAD_USI1_SD0 ),
  .PAD_USI1_SD1  (PAD_USI1_SD1 ),
  .PAD_USI2_NSS  (PAD_USI2_NSS ),
  .PAD_USI2_SCLK (PAD_USI2_SCLK),
  .PAD_USI2_SD0  (PAD_USI2_SD0 ),
  .PAD_USI2_SD1  (PAD_USI2_SD1 ),
  .PIN_EHS       (PIN_EHS      ),
  .PIN_ELS       (PIN_ELS      ),
  .POUT_EHS      (POUT_EHS     ),
  .POUT_ELS      (POUT_ELS     )
);





//////////////////////program download///////////////////////////////////


initial
begin : load_program
integer j;
integer k;
  reg [31:0] one_word;
`ifdef iverilog
  reg [31:0]  temp_mem[16384];
`else
  reg [31:0]  temp_mem[integer];
`endif
  $readmemh("test.pat", temp_mem);
   @( posedge PI_SOC_RST_B);
 for(k=0; k<32'h4000; k=k+1)
    begin
      one_word[31:0] = temp_mem[k];
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_isram_top.x_sms_sram.x_fpga_spram.x_fpga_byte3_spram.mem[k][7:0] = one_word[7:0];
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_isram_top.x_sms_sram.x_fpga_spram.x_fpga_byte2_spram.mem[k][7:0] = one_word[15:8];
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_isram_top.x_sms_sram.x_fpga_spram.x_fpga_byte1_spram.mem[k][7:0] = one_word[23:16];
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_isram_top.x_sms_sram.x_fpga_spram.x_fpga_byte0_spram.mem[k][7:0] = one_word[31:24];
    end
end


initial
begin : load_data
  integer j;
   @( posedge PI_SOC_RST_B);
  $display("\t******START TO LOAD PROGRAM******\n");
  for(j=0;j<32'h4000;j=j+1)
  begin
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_sms0_top.x_sms_sram.x_fpga_spram.x_fpga_byte3_spram.mem[j][7:0] = 8'h0;
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_sms0_top.x_sms_sram.x_fpga_spram.x_fpga_byte2_spram.mem[j][7:0] = 8'h0;
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_sms0_top.x_sms_sram.x_fpga_spram.x_fpga_byte1_spram.mem[j][7:0] = 8'h0;
      wujian100_open_tb.x_wujian100_open_top.x_retu_top.x_smu_top.x_sms_top.x_sms0_top.x_sms_sram.x_fpga_spram.x_fpga_byte0_spram.mem[j][7:0] = 8'h0;
  end
end
//cpuclk counter
initial
begin 
  cpuclk_counter[31:0] = 32'b0;
end

always@(posedge i_ext_pad_clkmux_ehs_clk)
begin 
  cpuclk_counter[31:0] = cpuclk_counter[31:0] + 1;
end

//max simultion time monitor
initial
begin 
  while($time < `MAX_SIM_TIME) 
  begin 
    #100;
  end
  $display("***********simulation finish for meet max simulation time*******************\n");  
  FILE = $fopen("run_case.report","w");
  $fdisplay(FILE,"TEST FAIL");
  $finish;
end


busmnt x_busmnt();
virtual_counter  x_virtual_counter ();

`ifndef NO_DUMP
initial
begin
   $display("######time:%d, Dump start######",$time);
////Dump fsdb should set $g_novas_pli in run_case
//   $fsdbDumpfile("vg_dump.fsdb");
//   $fsdbDumpon;
//   $fsdbDumpvars();
   $dumpfile("test.vcd");
   $dumpvars;
end
`endif


endmodule


