/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module usi_i2c_test();
pullup x_pad_i2c_scl (`TB_MODULE.PAD_USI0_SCLK);
pullup x_pad_i2c_sda (`TB_MODULE.PAD_USI0_SD0);

initial
begin
@(posedge `TB_MODULE.PAD_MCURST);
force `TB_MODULE.PAD_USI1_SCLK = `TB_MODULE.PAD_USI0_SCLK;
forever
begin
 wait(`TOP_MODULE.usi1_ioctl_sd0_oe_n === 1'b1);
 release `TB_MODULE.PAD_USI0_SD0;
 force `TB_MODULE.PAD_USI1_SD0 = `TB_MODULE.PAD_USI0_SD0;
 wait(`TOP_MODULE.usi1_ioctl_sd0_oe_n === 1'b0);
 release `TB_MODULE.PAD_USI1_SD0;
 force `TB_MODULE.PAD_USI0_SD0 = `TB_MODULE.PAD_USI1_SD0;
end
end

endmodule
