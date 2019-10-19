/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module map_test();

initial
begin
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_imemdummy_top0.hrdata[31:0] = 32'h1;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_dmemdummy_top0.hrdata[31:0] = 32'h2;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_dummy_top0.hrdata[31:0] = 32'h3;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_dummy_top1.hrdata[31:0] = 32'h4;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_dummy_top2.hrdata[31:0] = 32'h5;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_main_bus_top.x_main_dummy_top3.hrdata[31:0] = 32'h6;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_ls_top.x_lsbus_dummy_top0.hrdata[31:0] = 32'h11;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_ls_top.x_lsbus_dummy_top1.hrdata[31:0] = 32'h12;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_ls_top.x_lsbus_dummy_top2.hrdata[31:0] = 32'h13;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_ls_top.x_lsbus_dummy_top3.hrdata[31:0] = 32'h14;

force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top1.prdata[31:0] = 32'h22;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top2.prdata[31:0] = 32'h23;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top3.prdata[31:0] = 32'h24;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top4.prdata[31:0] = 32'h25;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top5.prdata[31:0] = 32'h26;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top7.prdata[31:0] = 32'h28;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top8.prdata[31:0] = 32'h29;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb0_top.x_apb0_dummy_top9.prdata[31:0] = 32'h2a;

force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top1.prdata[31:0] = 32'h32;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top2.prdata[31:0] = 32'h33;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top3.prdata[31:0] = 32'h34;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top4.prdata[31:0] = 32'h35;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top5.prdata[31:0] = 32'h36;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top6.prdata[31:0] = 32'h37;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top7.prdata[31:0] = 32'h38;
force wujian100_open_tb.x_wujian100_open_top.x_pdu_top.x_sub_apb1_top.x_apb1_dummy_top8.prdata[31:0] = 32'h39;

force wujian100_open_tb.x_wujian100_open_top.x_aou_top.x_pmu_top.prdata[31:0] = 32'h33333333;

end


endmodule
