/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

module pwm_test();

`define pwm_ch0_od `TB_MODULE.PAD_PWM_CH0
`define pwm_ch2_id `TB_MODULE.PAD_PWM_CH2

reg input_data;
reg pwm_ch0_out_flag;

initial
begin
#100;
input_data = 1'b0;
wait(pwm_ch0_out_flag == 1'b1);
	forever
	begin
   	@(posedge `pwm_ch0_od); 
   	input_data = ~input_data;
	end
end

initial
begin
force `pwm_ch2_id = input_data;
end

initial
begin
   pwm_ch0_out_flag = 1'b0;
   @( posedge `TB_MODULE.PAD_MCURST);
    wait(`pwm_ch0_od === 1'h0);
    wait(`pwm_ch0_od === 1'h1);
    repeat (20) @(posedge `pwm_ch0_od);    
    pwm_ch0_out_flag = 1'b1;    
  $display("************pwm ch0 output test pass!************");
end
endmodule


