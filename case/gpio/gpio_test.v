/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

module gpio_test();

`define b_pad_porta_oe `TB_MODULE.x_wujian100_open_top.x_aou_top.x_gpio_sec_top.gpio_porta_ddr[31:0]

`define GPIO0_GPIO_EXT_PORTA {`TB_MODULE.PAD_GPIO_31,`TB_MODULE.PAD_GPIO_30,`TB_MODULE.PAD_GPIO_29,`TB_MODULE.PAD_GPIO_28,`TB_MODULE.PAD_GPIO_27,`TB_MODULE.PAD_GPIO_26,`TB_MODULE.PAD_GPIO_25,`TB_MODULE.PAD_GPIO_24,`TB_MODULE.PAD_GPIO_23,`TB_MODULE.PAD_GPIO_22,`TB_MODULE.PAD_GPIO_21,`TB_MODULE.PAD_GPIO_20,`TB_MODULE.PAD_GPIO_19,`TB_MODULE.PAD_GPIO_18,`TB_MODULE.PAD_GPIO_17,`TB_MODULE.PAD_GPIO_16,`TB_MODULE.PAD_GPIO_15,`TB_MODULE.PAD_GPIO_14,`TB_MODULE.PAD_GPIO_13,`TB_MODULE.PAD_GPIO_12,`TB_MODULE.PAD_GPIO_11,`TB_MODULE.PAD_GPIO_10,`TB_MODULE.PAD_GPIO_9,`TB_MODULE.PAD_GPIO_8,`TB_MODULE.PAD_GPIO_7,`TB_MODULE.PAD_GPIO_6,`TB_MODULE.PAD_GPIO_5,`TB_MODULE.PAD_GPIO_4,`TB_MODULE.PAD_GPIO_3,`TB_MODULE.PAD_GPIO_2,`TB_MODULE.PAD_GPIO_1,`TB_MODULE.PAD_GPIO_0}



initial
begin
   wait(`TB_MODULE.PAD_MCURST);
wait(`b_pad_porta_oe == 32'h0);
force `GPIO0_GPIO_EXT_PORTA = 32'h55555555;
  $display("************gpio port a output test data 55555555!************\n");
wait(`b_pad_porta_oe == 32'hffffffff);
release `GPIO0_GPIO_EXT_PORTA;

wait(`GPIO0_GPIO_EXT_PORTA == 32'h5a5a5a5a);
  $display("************gpio port a output test data 5a5a5a5a!************\n");
wait(`b_pad_porta_oe == 32'h0);
force  `GPIO0_GPIO_EXT_PORTA = 32'haaaaaaaa;

wait(`b_pad_porta_oe == 32'hffffffff);
release `GPIO0_GPIO_EXT_PORTA;
wait(`GPIO0_GPIO_EXT_PORTA == 32'ha5a5a5a5);
  $display("************gpio port a output test data a5a5a5a5!************\n");

wait(`b_pad_porta_oe == 32'h0);
force  `GPIO0_GPIO_EXT_PORTA = 32'h12345678;


end
endmodule


