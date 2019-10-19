/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
parameter        WDT_CNT_WIDTH = 6'd32,
parameter        WDT_DUAL_TOP = 1'b1,
parameter        WDT_DFLT_TOP = 4'b0,
parameter        WDT_DFLT_TOP_INIT = 4'b0,
parameter        WDT_USE_FIX_TOP = 1'b0,
parameter        WDT_USER_TOP_0 = 32'hffff,
parameter        WDT_USER_TOP_1 = 32'h1ffff,
parameter        WDT_USER_TOP_2 = 32'h3ffff,
parameter        WDT_USER_TOP_3 = 32'h7ffff,
parameter        WDT_USER_TOP_4 = 32'hfffff,
parameter        WDT_USER_TOP_5 = 32'h1fffff,
parameter        WDT_USER_TOP_6 = 32'h3fffff,
parameter        WDT_USER_TOP_7 = 32'h7fffff,
parameter        WDT_USER_TOP_8 = 32'hffffff,
parameter        WDT_USER_TOP_9 = 32'h1ffffff,
parameter        WDT_USER_TOP_10 = 32'h3ffffff,
parameter        WDT_USER_TOP_11 = 32'h7ffffff,
parameter        WDT_USER_TOP_12 = 32'hfffffff,
parameter        WDT_USER_TOP_13 = 32'h1fffffff,
parameter        WDT_USER_TOP_14 = 32'h3fffffff,
parameter        WDT_USER_TOP_15 = 32'h7fffffff,
parameter        WDT_USER_TOP_INIT_0 = 32'hffff,
parameter        WDT_USER_TOP_INIT_1 = 32'h1ffff,
parameter        WDT_USER_TOP_INIT_2 = 32'h3ffff,
parameter        WDT_USER_TOP_INIT_3 = 32'h7ffff,
parameter        WDT_USER_TOP_INIT_4 = 32'hfffff,
parameter        WDT_USER_TOP_INIT_5 = 32'h1fffff,
parameter        WDT_USER_TOP_INIT_6 = 32'h3fffff,
parameter        WDT_USER_TOP_INIT_7 = 32'h7fffff,
parameter        WDT_USER_TOP_INIT_8 = 32'hffffff,
parameter        WDT_USER_TOP_INIT_9 = 32'h1ffffff,
parameter        WDT_USER_TOP_INIT_10 = 32'h3ffffff,
parameter        WDT_USER_TOP_INIT_11 = 32'h7ffffff,
parameter        WDT_USER_TOP_INIT_12 = 32'hfffffff,
parameter        WDT_USER_TOP_INIT_13 = 32'h1fffffff,
parameter        WDT_USER_TOP_INIT_14 = 32'h3fffffff,
parameter        WDT_USER_TOP_INIT_15 = 32'h7fffffff,
parameter        WDT_DFLT_RPL = 3'b0,
parameter        WDT_DFLT_RMOD = 1'b0,
parameter        WDT_ALWAYS_EN = 1'b0,
parameter        WDT_CLK_EN = 1'b0,
parameter        WDT_PAUSE = 1'b0,
parameter        WDT_TOP_RST = 8'b0,
parameter        WDT_CNT_RST  = 32'hffff,
parameter        WDT_ADDR_LHS = 5'd7
