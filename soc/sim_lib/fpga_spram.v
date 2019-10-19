/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module fpga_spram(
  A,
  CEN,
  CLK,
  D,
  Q,
  BWEN   
);

parameter  DATAWIDTH = 32;
parameter  ADDRWIDTH = 17;
parameter  MEMDEPTH  = 2**(ADDRWIDTH);

input   [(ADDRWIDTH-1) :0]  A;
input           CEN;
input           CLK;
input   [(DATAWIDTH-1):0]  D;
input   [3:0]        BWEN;
output  [(DATAWIDTH-1):0]  Q;

wire     [(DATAWIDTH-1):0]  Q;

fpga_byte_spram #(ADDRWIDTH,8,MEMDEPTH) x_fpga_byte0_spram(
  .A(A),
  .CEN(CEN),
  .CLK(CLK),
  .D(D[7:0]),
  .Q(Q[7:0]),
  .WEN(BWEN[0])   
);

fpga_byte_spram #(ADDRWIDTH,8,MEMDEPTH) x_fpga_byte1_spram(
  .A(A),
  .CEN(CEN),
  .CLK(CLK),
  .D(D[15:8]),
  .Q(Q[15:8]),
  .WEN(BWEN[1])   
);

fpga_byte_spram #(ADDRWIDTH,8,MEMDEPTH) x_fpga_byte2_spram(
  .A(A),
  .CEN(CEN),
  .CLK(CLK),
  .D(D[23:16]),
  .Q(Q[23:16]),
  .WEN(BWEN[2])   
);

fpga_byte_spram #(ADDRWIDTH,8,MEMDEPTH) x_fpga_byte3_spram(
  .A(A),
  .CEN(CEN),
  .CLK(CLK),
  .D(D[31:24]),
  .Q(Q[31:24]),
  .WEN(BWEN[3])   
);

endmodule
