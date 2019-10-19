#Copyright (c) 2019 Alibaba Group Holding Limited
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#===========================================================
# FMX7AR3B
# Xilinx Artix-7 XC7A200T-FGG484
# Pin assignment constraint file
#===========================================================

#===========================================
# set io standard
#===========================================
set_property IOSTANDARD LVCMOS33 [get_ports]


#===========================================
# Create clock
#===========================================
#create_clock  -period 50.00 -name MAIN_CLK [get_ports PIN_EHS]

#===========================================
# Global clock and reset source
#===========================================
set_property PACKAGE_PIN B17   [get_ports PIN_EHS];     # 20 MHz
#set_property PACKAGE_PIN E19   [get_ports OSC_CLK_48M]     # 48 MHz
set_property PACKAGE_PIN W11   [get_ports PAD_MCURST];         # K1
#set_property PACKAGE_PIN Y11   [get_ports {gpio0_port[0]}];         # K2
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets PAD_JTAG_TCLK_c]

#===========================================
# C-SKY  JTAG interface: J8
#===========================================
set_property PACKAGE_PIN AA15  [get_ports PAD_JTAG_TCLK]
set_property PACKAGE_PIN P14  [get_ports PAD_JTAG_TMS]
#set_property PACKAGE_PIN V13  [get_ports JTAG_TDI]
#set_property PACKAGE_PIN V14  [get_ports JTAG_TDO]
#set_property PACKAGE_PIN W15  [get_ports i_pad_jtg_trst_b]
#set_property PACKAGE_PIN AB15  [get_ports JTAG_NRST]

#===========================================
# Memory:
# NOR-FLASH: S29GL128S x2
# PSRAM: EM7644SU16ASZP x2
#===========================================
#set_property PACKAGE_PIN L6   [get_ports {mmc_flash_wp_b}]
#set_property PACKAGE_PIN L5    [get_ports {mmc_flash_rst_b}]
#set_property PACKAGE_PIN M1    [get_ports {mmc_flash_cs_b}]
#set_property PACKAGE_PIN G1    [get_ports {mmc_oe_b}]
#set_property PACKAGE_PIN L3    [get_ports {mmc_we_b}]
#set_property PACKAGE_PIN D2    [get_ports {mmc_sram_cs_b}]
#set_property PACKAGE_PIN D1    [get_ports {mmc_sram_zz_b}]
#set_property PACKAGE_PIN B1    [get_ports {mmc_bsel_b[0]}]
#set_property PACKAGE_PIN C2    [get_ports {mmc_bsel_b[1]}]
#set_property PACKAGE_PIN A1    [get_ports {mmc_bsel_b[2]}]
#set_property PACKAGE_PIN B2    [get_ports {mmc_bsel_b[3]}]
#set_property PACKAGE_PIN T1    [get_ports {mmc_data[0]}]
#set_property PACKAGE_PIN T4    [get_ports {mmc_data[1]}]
#set_property PACKAGE_PIN T3    [get_ports {mmc_data[2]}]
#set_property PACKAGE_PIN T5    [get_ports {mmc_data[3]}]
#set_property PACKAGE_PIN T6    [get_ports {mmc_data[4]}]
#set_property PACKAGE_PIN R2    [get_ports {mmc_data[5]}]
#set_property PACKAGE_PIN R3    [get_ports {mmc_data[6]}]
#set_property PACKAGE_PIN R6    [get_ports {mmc_data[7]}]
#set_property PACKAGE_PIN U6    [get_ports {mmc_data[8]}]
#set_property PACKAGE_PIN U3    [get_ports {mmc_data[9]}]
#set_property PACKAGE_PIN U5    [get_ports {mmc_data[10]}]
#set_property PACKAGE_PIN U2    [get_ports {mmc_data[11]}]
#set_property PACKAGE_PIN U1    [get_ports {mmc_data[12]}]
#set_property PACKAGE_PIN V3    [get_ports {mmc_data[13]}]
#set_property PACKAGE_PIN V4    [get_ports {mmc_data[14]}]
#set_property PACKAGE_PIN V2    [get_ports {mmc_data[15]}]
#set_property PACKAGE_PIN Y3    [get_ports {mmc_data[16]}]
#set_property PACKAGE_PIN Y4    [get_ports {mmc_data[17]}]
#set_property PACKAGE_PIN Y6    [get_ports {mmc_data[18]}]
#set_property PACKAGE_PIN W1    [get_ports {mmc_data[19]}]
#set_property PACKAGE_PIN W4    [get_ports {mmc_data[20]}]
#set_property PACKAGE_PIN W5    [get_ports {mmc_data[21]}]
#set_property PACKAGE_PIN W6    [get_ports {mmc_data[22]}]
#set_property PACKAGE_PIN W7    [get_ports {mmc_data[23]}]
#set_property PACKAGE_PIN Y2    [get_ports {mmc_data[24]}]
#set_property PACKAGE_PIN Y1    [get_ports {mmc_data[25]}]
#set_property PACKAGE_PIN AA4   [get_ports {mmc_data[26]}]
#set_property PACKAGE_PIN AA3   [get_ports {mmc_data[27]}]
#set_property PACKAGE_PIN AA1   [get_ports {mmc_data[28]}]
#set_property PACKAGE_PIN AB3   [get_ports {mmc_data[29]}]
#set_property PACKAGE_PIN AB2   [get_ports {mmc_data[30]}]
#set_property PACKAGE_PIN AB1   [get_ports {mmc_data[31]}]
#set_property PACKAGE_PIN G2    [get_ports {mmc_addr[0]}]
#set_property PACKAGE_PIN E1    [get_ports {mmc_addr[1]}]
#set_property PACKAGE_PIN E3    [get_ports {mmc_addr[2]}]
#set_property PACKAGE_PIN H5    [get_ports {mmc_addr[3]}]
#set_property PACKAGE_PIN E2    [get_ports {mmc_addr[4]}]
#set_property PACKAGE_PIN G3    [get_ports {mmc_addr[5]}]
#set_property PACKAGE_PIN F4    [get_ports {mmc_addr[6]}]
#set_property PACKAGE_PIN F1    [get_ports {mmc_addr[7]}]
#set_property PACKAGE_PIN H2    [get_ports {mmc_addr[8]}]
#set_property PACKAGE_PIN J5    [get_ports {mmc_addr[9]}]
#set_property PACKAGE_PIN K3    [get_ports {mmc_addr[10]}]
#set_property PACKAGE_PIN K1    [get_ports {mmc_addr[11]}]
#set_property PACKAGE_PIN J6    [get_ports {mmc_addr[12]}]
#set_property PACKAGE_PIN K2    [get_ports {mmc_addr[13]}]
#set_property PACKAGE_PIN J2    [get_ports {mmc_addr[14]}]
#set_property PACKAGE_PIN K4    [get_ports {mmc_addr[15]}]
#set_property PACKAGE_PIN K6    [get_ports {mmc_addr[16]}]
#set_property PACKAGE_PIN G4    [get_ports {mmc_addr[17]}]
#set_property PACKAGE_PIN H4    [get_ports {mmc_addr[18]}]
#set_property PACKAGE_PIN H3    [get_ports {mmc_addr[19]}]
#set_property PACKAGE_PIN L1    [get_ports {mmc_addr[20]}]
#set_property PACKAGE_PIN J1    [get_ports {mmc_addr[21]}]
#set_property PACKAGE_PIN L4    [get_ports {mmc_addr[22]}]

#===========================================
# YOC SOCKET 1
#===========================================
set_property PACKAGE_PIN T15    [get_ports PAD_GPIO_0]
set_property PACKAGE_PIN P15    [get_ports PAD_GPIO_1]
set_property PACKAGE_PIN U15    [get_ports PAD_GPIO_2]
set_property PACKAGE_PIN AA16   [get_ports PAD_GPIO_3]
set_property PACKAGE_PIN Y16    [get_ports PAD_GPIO_4]
set_property PACKAGE_PIN R16    [get_ports PAD_GPIO_5]
set_property PACKAGE_PIN AB16   [get_ports PAD_GPIO_6]
set_property PACKAGE_PIN P16    [get_ports PAD_GPIO_7]
set_property PACKAGE_PIN R17    [get_ports PAD_GPIO_8]
set_property PACKAGE_PIN U16    [get_ports PAD_GPIO_9]
set_property PACKAGE_PIN V17    [get_ports PAD_GPIO_10]
set_property PACKAGE_PIN T16    [get_ports PAD_GPIO_11]
set_property PACKAGE_PIN P17    [get_ports PAD_GPIO_12]
set_property PACKAGE_PIN W16    [get_ports PAD_GPIO_13]
set_property PACKAGE_PIN Y17    [get_ports PAD_GPIO_14]
set_property PACKAGE_PIN U17    [get_ports PAD_GPIO_15]
set_property PACKAGE_PIN T18    [get_ports PAD_GPIO_16]
set_property PACKAGE_PIN R18    [get_ports PAD_GPIO_17]
set_property PACKAGE_PIN W17    [get_ports PAD_GPIO_18]
                                           
#===========================================
# YOC SOCKET 2
#===========================================
set_property PACKAGE_PIN AB17    [get_ports PAD_GPIO_19]
set_property PACKAGE_PIN AB18    [get_ports PAD_GPIO_20]
set_property PACKAGE_PIN Y18     [get_ports PAD_GPIO_21]
set_property PACKAGE_PIN V18     [get_ports PAD_GPIO_22]
set_property PACKAGE_PIN AA18    [get_ports PAD_GPIO_23]
set_property PACKAGE_PIN AA19    [get_ports PAD_GPIO_24]
set_property PACKAGE_PIN W19     [get_ports PAD_GPIO_25]
set_property PACKAGE_PIN AA20    [get_ports PAD_GPIO_26]
set_property PACKAGE_PIN W20     [get_ports PAD_GPIO_27]
set_property PACKAGE_PIN V19     [get_ports PAD_GPIO_28]
set_property PACKAGE_PIN U20     [get_ports PAD_GPIO_29]
set_property PACKAGE_PIN AB20    [get_ports PAD_GPIO_30]
set_property PACKAGE_PIN T20     [get_ports PAD_GPIO_31]
#set_property PACKAGE_PIN V20     [get_ports ]
#set_property PACKAGE_PIN U21     [get_ports ]
#set_property PACKAGE_PIN W21     [get_ports ]
#set_property PACKAGE_PIN Y22     [get_ports ]
#set_property PACKAGE_PIN W22     [get_ports ]
#set_property PACKAGE_PIN Y21     [get_ports ]

#===========================================
# YOC SOCKET 3
#===========================================
set_property PACKAGE_PIN M21    [get_ports PAD_PWM_CH0]
set_property PACKAGE_PIN N17    [get_ports PAD_PWM_CH1]
set_property PACKAGE_PIN N13    [get_ports PAD_PWM_CH2]
set_property PACKAGE_PIN N19    [get_ports PAD_PWM_CH3]
set_property PACKAGE_PIN N18    [get_ports PAD_PWM_CH4]
set_property PACKAGE_PIN N14    [get_ports PAD_PWM_CH5]
set_property PACKAGE_PIN N20    [get_ports PAD_PWM_CH6]
set_property PACKAGE_PIN N22    [get_ports PAD_PWM_CH7]
set_property PACKAGE_PIN N15    [get_ports PAD_PWM_CH8]
set_property PACKAGE_PIN M15    [get_ports PAD_PWM_CH9]
set_property PACKAGE_PIN M17    [get_ports PAD_PWM_CH10]
set_property PACKAGE_PIN M13    [get_ports PAD_PWM_CH11]
set_property PACKAGE_PIN M18    [get_ports PAD_PWM_FAULT]
#set_property PACKAGE_PIN M16    [get_ports ]
#set_property PACKAGE_PIN M22    [get_ports ]
#set_property PACKAGE_PIN L13    [get_ports ]
#set_property PACKAGE_PIN M20    [get_ports ]
#set_property PACKAGE_PIN L14    [get_ports ]
#set_property PACKAGE_PIN L20    [get_ports ]

#===========================================
# YOC SOCKET 4
#===========================================
set_property PACKAGE_PIN L18    [get_ports PAD_USI0_NSS]
set_property PACKAGE_PIN L15    [get_ports PAD_USI0_SCLK]
set_property PACKAGE_PIN L21    [get_ports PAD_USI0_SD0]
set_property PACKAGE_PIN L19    [get_ports PAD_USI0_SD1]
set_property PACKAGE_PIN K18    [get_ports PAD_USI1_NSS]
set_property PACKAGE_PIN K16    [get_ports PAD_USI1_SCLK]
set_property PACKAGE_PIN K13    [get_ports PAD_USI1_SD0]
set_property PACKAGE_PIN K17    [get_ports PAD_USI1_SD1]
set_property PACKAGE_PIN K14    [get_ports PAD_USI2_NSS]
set_property PACKAGE_PIN K19    [get_ports PAD_USI2_SCLK]
set_property PACKAGE_PIN J14    [get_ports PAD_USI2_SD0]
set_property PACKAGE_PIN K22    [get_ports PAD_USI2_SD1]
#set_property PACKAGE_PIN J16    [get_ports ]
#set_property PACKAGE_PIN K21    [get_ports ]
#set_property PACKAGE_PIN J15    [get_ports ]
#set_property PACKAGE_PIN J22    [get_ports ]
#set_property PACKAGE_PIN J19    [get_ports ]
#set_property PACKAGE_PIN J17    [get_ports ]
#set_property PACKAGE_PIN J21    [get_ports ]

#===========================================
# YOC SOCKET 5
#===========================================
#set_property PACKAGE_PIN H14   [get_ports PIN_ELS]
#set_property PACKAGE_PIN H18   [get_ports ]
#set_property PACKAGE_PIN H15   [get_ports ]
#set_property PACKAGE_PIN J20   [get_ports ]
#set_property PACKAGE_PIN H19   [get_ports ]
#set_property PACKAGE_PIN G13   [get_ports ]
#set_property PACKAGE_PIN H22   [get_ports ]
#set_property PACKAGE_PIN H20   [get_ports ]
#set_property PACKAGE_PIN G16   [get_ports ]
#set_property PACKAGE_PIN G15   [get_ports ]
#set_property PACKAGE_PIN G18   [get_ports ]
#set_property PACKAGE_PIN G17   [get_ports ]
#set_property PACKAGE_PIN G21   [get_ports ]
#set_property PACKAGE_PIN G22   [get_ports ]
#set_property PACKAGE_PIN F21   [get_ports ]
#set_property PACKAGE_PIN E22   [get_ports ]
#set_property PACKAGE_PIN E21   [get_ports ]
#set_property PACKAGE_PIN D22   [get_ports ]
#set_property PACKAGE_PIN D21   [get_ports ]

#===========================================
# YOC SOCKET 6 SOCKET
#===========================================
#set_property PACKAGE_PIN B22    [get_ports ]
#set_property PACKAGE_PIN B21    [get_ports ]
#set_property PACKAGE_PIN C22    [get_ports ]
#set_property PACKAGE_PIN C20    [get_ports ]
#set_property PACKAGE_PIN A21    [get_ports ]
#set_property PACKAGE_PIN B20    [get_ports ]
#set_property PACKAGE_PIN A20    [get_ports ]
#set_property PACKAGE_PIN A19    [get_ports ]
#set_property PACKAGE_PIN F20    [get_ports ]
#set_property PACKAGE_PIN D20    [get_ports ]
#set_property PACKAGE_PIN C18    [get_ports ]
#set_property PACKAGE_PIN C19    [get_ports ]
#set_property PACKAGE_PIN F19    [get_ports ]
#set_property PACKAGE_PIN F18    [get_ports ]
#set_property PACKAGE_PIN A18    [get_ports ]
#set_property PACKAGE_PIN E18    [get_ports ]
#set_property PACKAGE_PIN D17    [get_ports ]
#set_property PACKAGE_PIN E17    [get_ports ]
#set_property PACKAGE_PIN C17    [get_ports ]

#===========================================
# YOC SOCKET 7 SOCKET
#===========================================
#set_property PACKAGE_PIN A16    [get_ports {gpio7_port[0]}]
#set_property PACKAGE_PIN B16    [get_ports {gpio7_port[1]}]
#set_property PACKAGE_PIN A14    [get_ports {gpio7_port[2]}]
#set_property PACKAGE_PIN F16    [get_ports {gpio7_port[3]}]
#set_property PACKAGE_PIN E16    [get_ports {gpio7_port[4]}]
#set_property PACKAGE_PIN A15    [get_ports {gpio7_port[5]}]
#set_property PACKAGE_PIN D16    [get_ports {gpio7_port[6]}]
#set_property PACKAGE_PIN D15    [get_ports {gpio7_port[7]}]
#set_property PACKAGE_PIN F15    [get_ports {gpio7_port[8]}]
#set_property PACKAGE_PIN B15    [get_ports {gpio7_port[9]}]
#set_property PACKAGE_PIN D14    [get_ports {gpio7_port[10]}]
#set_property PACKAGE_PIN C15    [get_ports {gpio7_port[11]}]
#set_property PACKAGE_PIN F14    [get_ports {gpio7_port[12]}]
#set_property PACKAGE_PIN C14    [get_ports {gpio7_port[13]}]
#set_property PACKAGE_PIN B13    [get_ports {gpio7_port[14]}]
#set_property PACKAGE_PIN A13    [get_ports {gpio7_port[15]}]
#set_property PACKAGE_PIN C13    [get_ports {gpio7_port[16]}]
#set_property PACKAGE_PIN F13    [get_ports {gpio7_port[17]}]
#set_property PACKAGE_PIN E13    [get_ports {gpio7_port[18]}]

#===========================================
# YOC SOCKET 8 SOCKET
#===========================================
#set_property PACKAGE_PIN AB8    [get_ports {gpio8_port[0]}]
#set_property PACKAGE_PIN V9     [get_ports {gpio8_port[1]}]
#set_property PACKAGE_PIN AA8    [get_ports {gpio8_port[2]}]
#set_property PACKAGE_PIN Y9     [get_ports {gpio8_port[3]}]
#set_property PACKAGE_PIN W9     [get_ports {gpio8_port[4]}]
#set_property PACKAGE_PIN V10    [get_ports {gpio8_port[5]}]
#set_property PACKAGE_PIN AA9    [get_ports {gpio8_port[6]}]
#set_property PACKAGE_PIN AA10   [get_ports {gpio8_port[7]}]
#set_property PACKAGE_PIN AA11   [get_ports {gpio8_port[8]}]
#set_property PACKAGE_PIN AB10   [get_ports {gpio8_port[9]}]
#set_property PACKAGE_PIN AB12   [get_ports {gpio8_port[10]}]
#set_property PACKAGE_PIN AB11   [get_ports {gpio8_port[11]}]
#set_property PACKAGE_PIN AA13   [get_ports {gpio8_port[12]}]
#set_property PACKAGE_PIN AB13   [get_ports {gpio8_port[13]}]
#set_property PACKAGE_PIN AA14   [get_ports {gpio8_port[14]}]
#set_property PACKAGE_PIN Y13    [get_ports {gpio8_port[15]}]
#set_property PACKAGE_PIN W14    [get_ports {gpio8_port[16]}]
#set_property PACKAGE_PIN T14    [get_ports {gpio8_port[17]}]
#set_property PACKAGE_PIN Y14    [get_ports {gpio8_port[18]}]
#  

#===========================================
# UART:
#===========================================
#set_property PACKAGE_PIN N3   [get_ports ]
#set_property PACKAGE_PIN N4   [get_ports ]
#set_property PACKAGE_PIN N5   [get_ports ]
#set_property PACKAGE_PIN M2   [get_ports ]
#set_property PACKAGE_PIN M5   [get_ports ]
#set_property PACKAGE_PIN M6   [get_ports ]

#===========================================
# SE:
#===========================================
#set_property PACKAGE_PIN AB22   [get_ports {gpio0_port[18]}];#SE_DATA
#set_property PACKAGE_PIN AA21   [get_ports {gpio0_port[16]}];#[get_ports SE_CLK]
#set_property PACKAGE_PIN AB21   [get_ports {gpio0_port[17]}];#[get_ports SE_RST]

#===========================================
# USER KEYs:
#===========================================
#set_property PACKAGE_PIN AB7   [get_ports ];	#k3
#set_property PACKAGE_PIN Y8    [get_ports {gpio0_port[2]}];	#k4
#set_property PACKAGE_PIN AB6   [get_ports {gpio0_port[3]}];	#k5
#set_property PACKAGE_PIN V8    [get_ports {gpio0_port[4]}];	#k6

#===========================================
# SWITCH x8
#===========================================
#set_property PACKAGE_PIN P2   [get_ports ]
#set_property PACKAGE_PIN P1   [get_ports ]
#set_property PACKAGE_PIN R1   [get_ports ]
#set_property PACKAGE_PIN U7   [get_ports ]
#set_property PACKAGE_PIN V7   [get_ports ]
#set_property PACKAGE_PIN AA5  [get_ports {gpio0_port[10]}]
#set_property PACKAGE_PIN AB5  [get_ports {gpio0_port[11]}]
#set_property PACKAGE_PIN Y7   [get_ports {gpio0_port[12]}]

#===========================================
# RGB LED
#===========================================
set_property PACKAGE_PIN P4  [get_ports POUT_EHS]
#set_property PACKAGE_PIN P5  [get_ports POUT_ELS]
#set_property PACKAGE_PIN N2  [get_ports ]

#===========================================
# FPGA configuration properties
#===========================================
set_property CONFIG_VOLTAGE  3.3   [current_design]
set_property CFGBVS          VCCO  [current_design]
set_property CONFIG_MODE     SPIx4 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH      4      [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE        40     [current_design]
set_property BITSTREAM.CONFIG.EXTMASTERCCLK_EN  DIV-2  [current_design]

