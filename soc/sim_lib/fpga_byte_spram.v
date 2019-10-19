/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module fpga_byte_spram(
  A,
  CEN,
  CLK,
  D,
  Q,
  WEN   
);

parameter  ADDRWIDTH = 17;
parameter  DATAWIDTH = 8;
parameter  MEMDEPTH  = 2**(ADDRWIDTH);


input   [(ADDRWIDTH-1) :0]  A;
input           CEN;
input           CLK;
input   [(DATAWIDTH-1):0]  D;
input           WEN;
output  [(DATAWIDTH-1):0]  Q;

reg     [(DATAWIDTH-1):0]  Q;
reg     [(DATAWIDTH-1):0]  mem[(MEMDEPTH-1):0];

always@(posedge CLK)
begin
  if(!CEN)
  begin
    if(!WEN)
    begin
      mem[A] <= D;
      Q      <= D;
    end
    else
    begin
      Q      <= mem[A];
    end
  end
end
endmodule

