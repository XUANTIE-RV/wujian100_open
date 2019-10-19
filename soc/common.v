/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module clk_mux2(
clk_sel,
clk_a,
clk_b,
clk_out
);
input	clk_sel;
input	clk_a;
input	clk_b;
output	clk_out;
wire	clk_sel;
wire	clk_a;
wire	clk_b;
`ifdef FPGA
reg 	clk_out;
always @( clk_sel or  clk_a or clk_b)
begin
  case(clk_sel) // synopsys infer_mux
    1'b1: clk_out = clk_b;
    1'b0: clk_out = clk_a;
  endcase
end
`else
wire	clk_out;
Standard_Cell_CLK_MUX2 x_STD_clkmux2 (
	.D0	(clk_a),
	.D1	(clk_b),
	.S	(clk_sel),
	.X	(clk_out)
	);
`endif
endmodule
module gated_clk_cell(
  clk_in,
  global_en,
  module_en,
  local_en,
  external_en,
  pad_yy_test_mode,
  pad_yy_gate_clk_en_b,
  clk_out
);
input  clk_in;
input  global_en;
input  module_en;
input  local_en;
input  external_en;
input  pad_yy_test_mode;
input  pad_yy_gate_clk_en_b;
output clk_out;
wire   clk_en_bf_latch;
wire   SE;
reg    clk_en_af_latch;
assign clk_en_bf_latch = (global_en && (module_en || local_en)) || external_en ;
assign SE	       = pad_yy_test_mode | pad_yy_gate_clk_en_b;
`ifdef FPGA
assign clk_out = clk_in;
`else
Standard_Cell_CLK_GATE x_gated_clk_cell(
             .CK  (clk_in),
             .SE  (SE),
             .EN   (clk_en_bf_latch),
             .Q   (clk_out)
             );
`endif
endmodule   
