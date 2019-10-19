/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module virtual_counter();

`define CPU_TOP wujian100_open_tb.x_wujian100_open_top.x_cpu_top
`define CPU_CLK `CPU_TOP.pll_core_cpuclk
`define CPU_RST `CPU_TOP.pad_cpu_rst_b
`define AHB_RDATA   `CPU_TOP.hmain0_cpu_m2_hrdata[31:0]

reg [31:0] virtual_counter;

always @(posedge `CPU_CLK or negedge `CPU_RST)
begin
  if(!`CPU_RST)
    virtual_counter[31:0] <= 32'b0;
  else if(virtual_counter[31:0]==32'hffffffff)
    virtual_counter[31:0] <= virtual_counter[31:0];
  else
    virtual_counter[31:0] <= virtual_counter[31:0] +1'b1;
end 


wire    [31:0]  ahb_xx_haddr;   
wire            ahb_xx_hready;  
wire    [1 :0]  ahb_xx_htrans;  
wire    [31:0]  ahb_xx_hrdata;  
wire            ahb_xx_hwrite;  
wire    [31:0]  ahb_xx_hwdata; 
wire            sysrst_b;    
wire            sysclk;        
reg             read_flag;   
reg             write_flag;   
reg     [31:0]  write_addr;     

assign sysclk   = `CPU_TOP.pad_core_clk;
assign sysrst_b = `CPU_TOP.pad_core_rst_b;

assign ahb_xx_htrans[1:0]  = `CPU_TOP.cpu_hmain0_m2_htrans[1:0];
assign ahb_xx_hready       = `CPU_TOP.hmain0_cpu_m2_hready;
assign ahb_xx_haddr[31:0]  = `CPU_TOP.cpu_hmain0_m2_haddr[31:0];
assign ahb_xx_hwrite       = `CPU_TOP.cpu_hmain0_m2_hwrite;
assign ahb_xx_hwdata[31:0] = `CPU_TOP.cpu_hmain0_m2_hwdata[31:0];

always @(posedge sysclk or negedge sysrst_b)
begin  
  if(! sysrst_b)
    read_flag <= 1'b0;
  else if ((ahb_xx_htrans[1:0] == 2'b10) && ahb_xx_hready && !ahb_xx_hwrite
          && (ahb_xx_haddr[31:0] == 32'h2001FFF0))
    read_flag <= 1'b1;
  else if (ahb_xx_hready)
    read_flag <= 1'b0;
end 

initial
begin
  forever begin
    wait(read_flag==1'b1);
    #2;
    force read_flag=1'b0;
    wait(ahb_xx_hready==1'b1);
    force `AHB_RDATA = virtual_counter[31:0];
    @(posedge sysclk);
    release `AHB_RDATA;
    release read_flag;
  end
end

//for print

always @(posedge sysclk or negedge sysrst_b)
begin  
  if(! sysrst_b)
  begin
    write_addr[31:0] <= 32'b0;
    write_flag <= 1'b0;
  end
  else
  begin
    if(write_flag)
    begin
      write_flag <= 1'b0;
      if(write_addr[31:0] == 32'h2001FFF0)
      begin
        //for printf in C
        $write("%c", ahb_xx_hwdata[7:0]);
      end
    end
    if((ahb_xx_htrans[1:0] == 2'b10) && ahb_xx_hready && ahb_xx_hwrite)
    begin
      write_flag <= 1'b1;
      write_addr[31:0] <= ahb_xx_haddr[31:0];
    end
  end
end

endmodule


