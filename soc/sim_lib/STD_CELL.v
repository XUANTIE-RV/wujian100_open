/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module Standard_Cell_CLK_GATE(
Q, 
CK, 
EN, 
SE
);
   output Q;
   input CK;
   input EN;
   input SE;

wire	E;
reg	q_tmp;
assign E = SE | EN;

always @(E or CK)
begin 
    if(!CK)
	q_tmp = E;
end

assign Q = q_tmp & CK;


endmodule


module Standard_Cell_CLK_MUX2(
X, 
S, 
D0, 
D1
);
   output X;
   input S;
   input D0;
   input D1;

assign X = S ? D1 : D0;

endmodule


