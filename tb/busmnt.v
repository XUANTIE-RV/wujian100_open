/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module busmnt(

);

reg             fail_mark_times; 
reg             pass_mark_times; 
reg     [31:0]  write_addr;     
reg             write_flag;     

wire    [31:0]  ahb_xx_haddr;   
wire            ahb_xx_hready;  
wire    [1 :0]  ahb_xx_htrans;  
wire    [31:0]  ahb_xx_hwdata;  
wire            ahb_xx_hwrite;  
wire            sysrst_b;    
wire            sysclk;         

`ifdef iverilog
  integer FILE;
`else
  static integer FILE;
`endif

`define CPU_TOP wujian100_open_tb.x_wujian100_open_top.x_cpu_top

integer    GPRFILE;
integer    k;

reg        gpr_mnt_done;
reg [31:0] gpr [15:0];

initial
begin
  gpr_mnt_done = 1'b0;
  GPRFILE = $fopen("rtl_gpr.log");
  if(GPRFILE==0)
  begin
    $display("Can't open log file!");
    $finish;
  end

  wait (gpr_mnt_done);
  for(k=0; k<16; k=k+1)
  $fwrite(GPRFILE,"r%1h:0x%08h\n",k,gpr[k]);
  $fclose(GPRFILE);
end

assign sysclk   = `CPU_TOP.pad_core_clk;
assign sysrst_b = `CPU_TOP.pad_core_rst_b;

assign ahb_xx_htrans[1:0]  = `CPU_TOP.cpu_hmain0_m2_htrans[1:0];
assign ahb_xx_hready       = `CPU_TOP.hmain0_cpu_m2_hready;
assign ahb_xx_haddr[31:0]  = `CPU_TOP.cpu_hmain0_m2_haddr[31:0];
assign ahb_xx_hwdata[31:0] = `CPU_TOP.cpu_hmain0_m2_hwdata[31:0];
assign ahb_xx_hwrite       = `CPU_TOP.cpu_hmain0_m2_hwrite;

always @(posedge sysclk or negedge sysrst_b)
begin  
  if(! sysrst_b)
  begin
    fail_mark_times <= 1'b0;
    pass_mark_times <= 1'b0;
    write_addr[31:0] <= 32'b0;
    write_flag <= 1'b0;
  end
  else
  begin
    if(write_flag)
    begin
      write_flag <= 1'b0;

      if((write_addr[31:0] == 32'h20007c50) && (ahb_xx_hwdata[31:0] == 32'h1001))
      begin
        if(fail_mark_times == 1'b1)
        begin
          $display("***************************************\n");
          $display("*              Test Fail              *\n");
          $display("***************************************\n");
          FILE = $fopen("run_case.report","w");
          $fdisplay(FILE,"TEST FAIL");
          //$report("********* Test Fail **********");
          $finish;
        end
        else
        begin
          fail_mark_times <= 1'b1;
        end
      end
      else if((write_addr[31:0] == 32'h20007c50) && (ahb_xx_hwdata[31:0] == 32'h2002))
      begin
        if(pass_mark_times == 1'b1)
        begin
          $display("***************************************\n");
          $display("*              Test Pass              *\n");
          $display("***************************************\n");
          FILE = $fopen("run_case.report","w");
          $fdisplay(FILE,"TEST PASS"); 
          //$report("********* Test Pass **********");
          $finish;
        end
        else
        begin
          pass_mark_times <= 1'b1;
        end
      end
      else if(write_addr[31:0] == 32'h20007c50)
      begin
        //for printf in C
        $write("%c", ahb_xx_hwdata[7:0]);
      end

      if((write_addr[31:0] >= 32'h20007c60) && (write_addr[31:0] <= 32'h20007c9c))
      begin
        case((write_addr[31:0] - 32'h0000_7c60)/4)
          4'd0:  gpr[0]  = ahb_xx_hwdata[31:0];
          4'd1:  gpr[1]  = ahb_xx_hwdata[31:0];
          4'd2:  gpr[2]  = ahb_xx_hwdata[31:0];
          4'd3:  gpr[3]  = ahb_xx_hwdata[31:0];
          4'd4:  gpr[4]  = ahb_xx_hwdata[31:0];
          4'd5:  gpr[5]  = ahb_xx_hwdata[31:0];
          4'd6:  gpr[6]  = ahb_xx_hwdata[31:0];
          4'd7:  gpr[7]  = ahb_xx_hwdata[31:0];
          4'd8:  gpr[8]  = ahb_xx_hwdata[31:0];
          4'd9:  gpr[9]  = ahb_xx_hwdata[31:0];
          4'd10: gpr[10] = ahb_xx_hwdata[31:0];
          4'd11: gpr[11] = ahb_xx_hwdata[31:0];
          4'd12: gpr[12] = ahb_xx_hwdata[31:0];
          4'd13: gpr[13] = ahb_xx_hwdata[31:0];
          4'd14: gpr[14] = ahb_xx_hwdata[31:0];
          4'd15: gpr[15] = ahb_xx_hwdata[31:0];
        endcase
      end

      if(write_addr[31:0] == 32'h20007c9c)
      begin
        gpr_mnt_done <= 1'b1;
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

