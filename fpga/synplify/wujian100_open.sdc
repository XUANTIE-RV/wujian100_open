#Copyright (c) 2019 Alibaba Group Holding Limited
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Collections
#

#
# Clocks
#top
define_clock   {n:PIN_EHS} -name PIN_EHS  -freq 20 -clockgroup clkgroup_2
define_clock   {n:PAD_JTAG_TCLK} -name PAD_JTAG_TCLK  -freq 2 -clockgroup clkgroup_3
define_clock   {n:x_aou_top.x_rtc0_sec_top.x_rtc_aou_top.x_rtc_clk_div.i_rtc_ext_clk} -name I_RTC_EXT_CLK -freq 1 -clockgroup clkgroup_4
define_clock   {n:x_aou_top.x_rtc0_sec_top.x_rtc_aou_top.x_rtc_clk_div.rtc_clk_div} -name RTC_CLK_DIV -freq 0.5 -clockgroup clkgroup_4
#pwm
define_clock   {n:x_pdu_top.x_sub_apb0_top.x_pwm_sec_top.x_pwm.x_pwm_ctrl.clkdiv} -name CLKDIV  -freq 5 -clockgroup clkgroup_2
#
# Clock to Clock
#

#
# Inputs/Outputs
#

#
# Registers
#

#
# Delay Paths
#

#
# Attributes
#

#
# I/O Standards
#

#
# Compile Points
#

#
# Other
#
