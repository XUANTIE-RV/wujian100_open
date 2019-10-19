/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


parameter                  AHB_APB_BRIDGE_EN             = 1'b1,
parameter                  APB_LEAF_SLV_NUM              = 5'd16,
parameter                  APB_LEAF_SLV0_START_ADDR      = 32'h60000000,
parameter                  APB_LEAF_SLV0_END_ADDR        = 32'h600003ff,
parameter                  APB_LEAF_SLV1_START_ADDR      = 32'h60000400,
parameter                  APB_LEAF_SLV1_END_ADDR        = 32'h600007ff,
parameter                  APB_LEAF_SLV2_START_ADDR      = 32'h60000800,
parameter                  APB_LEAF_SLV2_END_ADDR        = 32'h60000bff,
parameter                  APB_LEAF_SLV3_START_ADDR      = 32'h60000c00,
parameter                  APB_LEAF_SLV3_END_ADDR        = 32'h60000fff,
parameter                  APB_LEAF_SLV4_START_ADDR      = 32'h60028000,
parameter                  APB_LEAF_SLV4_END_ADDR        = 32'h6002bfff,
parameter                  APB_LEAF_SLV5_START_ADDR      = 32'h60018000,
parameter                  APB_LEAF_SLV5_END_ADDR        = 32'h6001bfff,
parameter                  APB_LEAF_SLV6_START_ADDR      = 32'h60004000,
parameter                  APB_LEAF_SLV6_END_ADDR        = 32'h60007fff,
parameter                  APB_LEAF_SLV7_START_ADDR      = 32'h60008000,
parameter                  APB_LEAF_SLV7_END_ADDR        = 32'h6000bfff,
parameter                  APB_LEAF_SLV8_START_ADDR      = 32'h6000c000,
parameter                  APB_LEAF_SLV8_END_ADDR        = 32'h6000ffff,
parameter                  APB_LEAF_SLV9_START_ADDR      = 32'h60010000,
parameter                  APB_LEAF_SLV9_END_ADDR        = 32'h60013fff, 
parameter                  APB_LEAF_SLV10_START_ADDR     = 32'h60014000,
parameter                  APB_LEAF_SLV10_END_ADDR       = 32'h60017fff,
parameter                  APB_LEAF_SLV11_START_ADDR     = 32'h6001c000,
parameter                  APB_LEAF_SLV11_END_ADDR       = 32'h6001ffff,
parameter                  APB_LEAF_SLV12_START_ADDR     = 32'h60020000,
parameter                  APB_LEAF_SLV12_END_ADDR       = 32'h60023fff,
parameter                  APB_LEAF_SLV13_START_ADDR     = 32'h60024000,
parameter                  APB_LEAF_SLV13_END_ADDR       = 32'h60027fff,
parameter                  APB_LEAF_SLV14_START_ADDR     = 32'h6002c000,
parameter                  APB_LEAF_SLV14_END_ADDR       = 32'h6002ffff,
parameter                  APB_LEAF_SLV15_START_ADDR     = 32'h60030000,
parameter                  APB_LEAF_SLV15_END_ADDR       = 32'h60033fff

