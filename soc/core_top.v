/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
module core_top(
  apb0_dummy1_intr,
  apb0_dummy2_intr,
  apb0_dummy3_intr,
  apb0_dummy4_intr,
  apb0_dummy5_intr,
  apb0_dummy7_intr,
  apb0_dummy8_intr,
  apb0_dummy9_intr,
  apb1_dummy1_intr,
  apb1_dummy2_intr,
  apb1_dummy3_intr,
  apb1_dummy4_intr,
  apb1_dummy5_intr,
  apb1_dummy6_intr,
  apb1_dummy7_intr,
  apb1_dummy8_intr,
  bist0_mode,
  cpu_hmain0_m0_haddr,
  cpu_hmain0_m0_hburst,
  cpu_hmain0_m0_hprot,
  cpu_hmain0_m0_hsize,
  cpu_hmain0_m0_htrans,
  cpu_hmain0_m0_hwdata,
  cpu_hmain0_m0_hwrite,
  cpu_hmain0_m1_haddr,
  cpu_hmain0_m1_hburst,
  cpu_hmain0_m1_hprot,
  cpu_hmain0_m1_hsize,
  cpu_hmain0_m1_htrans,
  cpu_hmain0_m1_hwdata,
  cpu_hmain0_m1_hwrite,
  cpu_hmain0_m2_haddr,
  cpu_hmain0_m2_hburst,
  cpu_hmain0_m2_hprot,
  cpu_hmain0_m2_hsize,
  cpu_hmain0_m2_htrans,
  cpu_hmain0_m2_hwdata,
  cpu_hmain0_m2_hwrite,
  cpu_padmux_jtg_tms_o,
  cpu_padmux_jtg_tms_oe,
  cpu_pmu_dfs_ack,
  cpu_pmu_sleep_b,
  dft_clk,
  dmac0_wic_intr,
  gpio_wic_intr,
  hmain0_cpu_m0_hrdata,
  hmain0_cpu_m0_hready,
  hmain0_cpu_m0_hresp,
  hmain0_cpu_m1_hrdata,
  hmain0_cpu_m1_hready,
  hmain0_cpu_m1_hresp,
  hmain0_cpu_m2_hrdata,
  hmain0_cpu_m2_hready,
  hmain0_cpu_m2_hresp,
  lsbus_dummy0_intr,
  lsbus_dummy1_intr,
  lsbus_dummy2_intr,
  lsbus_dummy3_intr,
  main_dmemdummy0_intr,
  main_dummy0_intr,
  main_dummy1_intr,
  main_dummy2_intr,
  main_dummy3_intr,
  main_imemdummy0_intr,
  pad_core_clk,
  pad_core_ctim_refclk,
  pad_core_rst_b,
  padmux_cpu_jtg_tclk,
  padmux_cpu_jtg_tms_i,
  pmu_cpu_dfs_req,
  pmu_wic_intr,
  pwm_wic_intr,
  rtc_wic_intr,
  scan_en,
  scan_mode,
  test_mode,
  tim0_wic_intr,
  tim1_wic_intr,
  tim2_wic_intr,
  tim3_wic_intr,
  tim4_wic_intr,
  tim5_wic_intr,
  tim6_wic_intr,
  tim7_wic_intr,
  usi0_wic_intr,
  usi1_wic_intr,
  usi2_wic_intr,
  wdt_wic_intr
);
input           apb0_dummy1_intr;      
input           apb0_dummy2_intr;      
input           apb0_dummy3_intr;      
input           apb0_dummy4_intr;      
input           apb0_dummy5_intr;      
input           apb0_dummy7_intr;      
input           apb0_dummy8_intr;      
input           apb0_dummy9_intr;      
input           apb1_dummy1_intr;      
input           apb1_dummy2_intr;      
input           apb1_dummy3_intr;      
input           apb1_dummy4_intr;      
input           apb1_dummy5_intr;      
input           apb1_dummy6_intr;      
input           apb1_dummy7_intr;      
input           apb1_dummy8_intr;      
input           bist0_mode;            
input           dft_clk;               
input           dmac0_wic_intr;        
input           gpio_wic_intr;         
input   [31:0]  hmain0_cpu_m0_hrdata;  
input           hmain0_cpu_m0_hready;  
input   [1 :0]  hmain0_cpu_m0_hresp;   
input   [31:0]  hmain0_cpu_m1_hrdata;  
input           hmain0_cpu_m1_hready;  
input   [1 :0]  hmain0_cpu_m1_hresp;   
input   [31:0]  hmain0_cpu_m2_hrdata;  
input           hmain0_cpu_m2_hready;  
input   [1 :0]  hmain0_cpu_m2_hresp;   
input           lsbus_dummy0_intr;     
input           lsbus_dummy1_intr;     
input           lsbus_dummy2_intr;     
input           lsbus_dummy3_intr;     
input           main_dmemdummy0_intr;  
input           main_dummy0_intr;      
input           main_dummy1_intr;      
input           main_dummy2_intr;      
input           main_dummy3_intr;      
input           main_imemdummy0_intr;  
input           pad_core_clk;          
input           pad_core_ctim_refclk;  
input           pad_core_rst_b;        
input           padmux_cpu_jtg_tclk;   
input           padmux_cpu_jtg_tms_i;  
input           pmu_cpu_dfs_req;       
input           pmu_wic_intr;          
input           pwm_wic_intr;          
input           rtc_wic_intr;          
input           scan_en;               
input           scan_mode;             
input           test_mode;             
input   [1 :0]  tim0_wic_intr;         
input   [1 :0]  tim1_wic_intr;         
input   [1 :0]  tim2_wic_intr;         
input   [1 :0]  tim3_wic_intr;         
input   [1 :0]  tim4_wic_intr;         
input   [1 :0]  tim5_wic_intr;         
input   [1 :0]  tim6_wic_intr;         
input   [1 :0]  tim7_wic_intr;         
input           usi0_wic_intr;         
input           usi1_wic_intr;         
input           usi2_wic_intr;         
input           wdt_wic_intr;          
output  [31:0]  cpu_hmain0_m0_haddr;   
output  [2 :0]  cpu_hmain0_m0_hburst;  
output  [3 :0]  cpu_hmain0_m0_hprot;   
output  [2 :0]  cpu_hmain0_m0_hsize;   
output  [1 :0]  cpu_hmain0_m0_htrans;  
output  [31:0]  cpu_hmain0_m0_hwdata;  
output          cpu_hmain0_m0_hwrite;  
output  [31:0]  cpu_hmain0_m1_haddr;   
output  [2 :0]  cpu_hmain0_m1_hburst;  
output  [3 :0]  cpu_hmain0_m1_hprot;   
output  [2 :0]  cpu_hmain0_m1_hsize;   
output  [1 :0]  cpu_hmain0_m1_htrans;  
output  [31:0]  cpu_hmain0_m1_hwdata;  
output          cpu_hmain0_m1_hwrite;  
output  [31:0]  cpu_hmain0_m2_haddr;   
output  [2 :0]  cpu_hmain0_m2_hburst;  
output  [3 :0]  cpu_hmain0_m2_hprot;   
output  [2 :0]  cpu_hmain0_m2_hsize;   
output  [1 :0]  cpu_hmain0_m2_htrans;  
output  [31:0]  cpu_hmain0_m2_hwdata;  
output          cpu_hmain0_m2_hwrite;  
output          cpu_padmux_jtg_tms_o;  
output          cpu_padmux_jtg_tms_oe; 
output          cpu_pmu_dfs_ack;       
output          cpu_pmu_sleep_b;       
reg             cpu_pmu_dfs_ack;       
reg             cpu_pmu_srst_b;        
wire            apb0_dummy1_intr;      
wire            apb0_dummy2_intr;      
wire            apb0_dummy3_intr;      
wire            apb0_dummy4_intr;      
wire            apb0_dummy5_intr;      
wire            apb0_dummy7_intr;      
wire            apb0_dummy8_intr;      
wire            apb0_dummy9_intr;      
wire            apb1_dummy1_intr;      
wire            apb1_dummy2_intr;      
wire            apb1_dummy3_intr;      
wire            apb1_dummy4_intr;      
wire            apb1_dummy5_intr;      
wire            apb1_dummy6_intr;      
wire            apb1_dummy7_intr;      
wire            apb1_dummy8_intr;      
wire            bist0_mode;            
wire    [31:0]  biu_pad_haddr;         
wire    [2 :0]  biu_pad_hburst;        
wire    [3 :0]  biu_pad_hprot;         
wire    [2 :0]  biu_pad_hsize;         
wire    [1 :0]  biu_pad_htrans;        
wire    [31:0]  biu_pad_hwdata;        
wire            biu_pad_hwrite;        
wire            biu_pad_vec_redrct;    
wire            clk_en;                
wire            core_pad_jdb_ack_b;    
wire    [1 :0]  core_pad_jdb_pm;       
wire            core_pad_jtg_tap_on;   
wire            core_pad_wakeup_b;     
wire            core_sysio_pad_dbg_b;  
wire            core_sysio_pad_idly4_b; 
wire            core_sysio_pad_ipend_b; 
wire    [31:0]  cp0_pad_mintstatus;    
wire    [31:0]  cp0_pad_mstatus;       
wire    [31:0]  cp0_pad_psr;           
wire    [31:0]  cpu_hmain0_m0_haddr;   
wire    [2 :0]  cpu_hmain0_m0_hburst;  
wire    [3 :0]  cpu_hmain0_m0_hprot;   
wire    [2 :0]  cpu_hmain0_m0_hsize;   
wire    [1 :0]  cpu_hmain0_m0_htrans;  
wire    [31:0]  cpu_hmain0_m0_hwdata;  
wire            cpu_hmain0_m0_hwrite;  
wire    [31:0]  cpu_hmain0_m1_haddr;   
wire    [2 :0]  cpu_hmain0_m1_hburst;  
wire    [3 :0]  cpu_hmain0_m1_hprot;   
wire    [2 :0]  cpu_hmain0_m1_hsize;   
wire    [1 :0]  cpu_hmain0_m1_htrans;  
wire    [31:0]  cpu_hmain0_m1_hwdata;  
wire            cpu_hmain0_m1_hwrite;  
wire    [31:0]  cpu_hmain0_m2_haddr;   
wire    [2 :0]  cpu_hmain0_m2_hburst;  
wire    [3 :0]  cpu_hmain0_m2_hprot;   
wire    [2 :0]  cpu_hmain0_m2_hsize;   
wire    [1 :0]  cpu_hmain0_m2_htrans;  
wire    [31:0]  cpu_hmain0_m2_hwdata;  
wire            cpu_hmain0_m2_hwrite;  
wire            cpu_pad_dfs_ack;       
wire            cpu_padmux_jtg_tms_o;  
wire            cpu_padmux_jtg_tms_oe; 
wire            cpu_pmu_sleep_b;       
wire            cpu_retire_vld;        
wire            cpu_wic_ctim_int_vld;  
wire            ctim_pad_int_vld;      
wire    [31:0]  dahbl_pad_haddr;       
wire    [2 :0]  dahbl_pad_hburst;      
wire    [3 :0]  dahbl_pad_hprot;       
wire    [2 :0]  dahbl_pad_hsize;       
wire    [1 :0]  dahbl_pad_htrans;      
wire    [31:0]  dahbl_pad_hwdata;      
wire            dahbl_pad_hwrite;      
wire            dft_clk;               
wire            dlite_clk_en;          
wire            dmac0_wic_intr;        
wire            gpio_wic_intr;         
wire            had_pad_jdb_ack_b;     
wire    [1 :0]  had_pad_jdb_pm;        
wire            had_pad_jtg_tap_on;    
wire            had_pad_jtg_tms_o;     
wire            had_pad_jtg_tms_oe;    
wire            had_pad_wakeup_req_b;  
wire    [31:0]  hmain0_cpu_m0_hrdata;  
wire            hmain0_cpu_m0_hready;  
wire    [1 :0]  hmain0_cpu_m0_hresp;   
wire    [31:0]  hmain0_cpu_m1_hrdata;  
wire            hmain0_cpu_m1_hready;  
wire    [1 :0]  hmain0_cpu_m1_hresp;   
wire    [31:0]  hmain0_cpu_m2_hrdata;  
wire            hmain0_cpu_m2_hready;  
wire    [1 :0]  hmain0_cpu_m2_hresp;   
wire    [31:0]  iahbl_pad_haddr;       
wire    [2 :0]  iahbl_pad_hburst;      
wire    [3 :0]  iahbl_pad_hprot;       
wire    [2 :0]  iahbl_pad_hsize;       
wire    [1 :0]  iahbl_pad_htrans;      
wire    [31:0]  iahbl_pad_hwdata;      
wire            iahbl_pad_hwrite;      
wire            iahbl_pad_vec_redrct;  
wire            ilite_clk_en;          
wire    [63:0]  ip_cpu_int_cfg;        
wire    [63:0]  ip_cpu_int_vld;        
wire    [31:0]  iu_pad_gpr_data;       
wire    [4 :0]  iu_pad_gpr_index;      
wire            iu_pad_gpr_we;         
wire            iu_pad_inst_retire;    
wire            iu_pad_inst_split;     
wire    [31:0]  iu_pad_retire_pc;      
wire            lsbus_dummy0_intr;     
wire            lsbus_dummy1_intr;     
wire            lsbus_dummy2_intr;     
wire            lsbus_dummy3_intr;     
wire            main_dmemdummy0_intr;  
wire            main_dummy0_intr;      
wire            main_dummy1_intr;      
wire            main_dummy2_intr;      
wire            main_dummy3_intr;      
wire            main_imemdummy0_intr;  
wire    [31:0]  pad_biu_hrdata;        
wire            pad_biu_hready;        
wire            pad_biu_hresp;         
wire    [11:0]  pad_bmu_iahbl_base;    
wire    [11:0]  pad_bmu_iahbl_mask;    
wire    [63:0]  pad_clic_int_cfg;      
wire    [63:0]  pad_clic_int_vld;      
wire            pad_core_clk;          
wire            pad_core_ctim_refclk;  
wire            pad_core_jtg_tclk;     
wire            pad_core_rst_b;        
wire            pad_cpu_dfs_req;       
wire            pad_cpu_ext_int_b;     
wire            pad_cpu_rst_b;         
wire    [25:0]  pad_ctim_calib;        
wire            pad_ctim_refclk;       
wire    [31:0]  pad_dahbl_hrdata;      
wire            pad_dahbl_hready;      
wire            pad_dahbl_hresp;       
wire            pad_dahbl_hsec;        
wire            pad_had_jdb_req_b;     
wire            pad_had_jtg_tap_en;    
wire            pad_had_jtg_tclk;      
wire            pad_had_jtg_tms_i;     
wire            pad_had_jtg_trst_b;    
wire            pad_had_rst_b;         
wire    [31:0]  pad_iahbl_hrdata;      
wire            pad_iahbl_hready;      
wire            pad_iahbl_hresp;       
wire            pad_sysio_bigend_b;    
wire    [2 :0]  pad_sysio_clkratio;    
wire            pad_sysio_dbgrq_b;     
wire            pad_sysio_endian_v2;   
wire    [63:0]  pad_vic_int_cfg;       
wire    [63:0]  pad_vic_int_vld;       
wire            pad_yy_bist_tst_en;    
wire            pad_yy_gate_clk_en_b;  
wire            pad_yy_scan_enable;    
wire            pad_yy_test_mode;      
wire            padmux_cpu_jtg_tclk;   
wire            padmux_cpu_jtg_tms_i;  
wire            pll_core_cpuclk;       
wire            pll_cpu_clk;           
wire            pmu_cpu_dfs_req;       
wire            pmu_wic_intr;          
wire            pwm_wic_intr;          
wire            rtc_wic_intr;          
wire            rtu_pad_inst_retire;   
wire            scan_en;               
wire            scan_mode;             
wire            sysio_pad_dbg_b;       
wire            sysio_pad_idly4_b;     
wire            sysio_pad_ipend_b;     
wire    [1 :0]  sysio_pad_lpmd_b;      
wire            sysio_pad_srst;        
wire            sysio_pad_wakeup_b;    
wire            test_mode;             
wire    [1 :0]  tim0_wic_intr;         
wire    [1 :0]  tim1_wic_intr;         
wire    [1 :0]  tim2_wic_intr;         
wire    [1 :0]  tim3_wic_intr;         
wire    [1 :0]  tim4_wic_intr;         
wire    [1 :0]  tim5_wic_intr;         
wire    [1 :0]  tim6_wic_intr;         
wire    [1 :0]  tim7_wic_intr;         
wire            usi0_wic_intr;         
wire            usi1_wic_intr;         
wire            usi2_wic_intr;         
wire            wdt_wic_intr;          
assign dlite_clk_en = 1'b1;
assign ilite_clk_en = 1'b1;
assign pad_core_jtg_tclk = test_mode ? dft_clk : padmux_cpu_jtg_tclk;
E902_20191018  CPU (
  .biu_pad_haddr        (biu_pad_haddr       ),
  .biu_pad_hburst       (biu_pad_hburst      ),
  .biu_pad_hprot        (biu_pad_hprot       ),
  .biu_pad_hsize        (biu_pad_hsize       ),
  .biu_pad_htrans       (biu_pad_htrans      ),
  .biu_pad_hwdata       (biu_pad_hwdata      ),
  .biu_pad_hwrite       (biu_pad_hwrite      ),
  .biu_pad_vec_redrct   (biu_pad_vec_redrct  ),
  .clk_en               (clk_en              ),
  .cp0_pad_mintstatus   (cp0_pad_mintstatus  ),
  .cp0_pad_mstatus      (cp0_pad_mstatus     ),
  .cp0_pad_psr          (cp0_pad_psr         ),
  .cpu_pad_dfs_ack      (cpu_pad_dfs_ack     ),
  .ctim_pad_int_vld     (ctim_pad_int_vld    ),
  .had_pad_jdb_ack_b    (had_pad_jdb_ack_b   ),
  .had_pad_jdb_pm       (had_pad_jdb_pm      ),
  .had_pad_jtg_tap_on   (had_pad_jtg_tap_on  ),
  .had_pad_jtg_tms_o    (had_pad_jtg_tms_o   ),
  .had_pad_jtg_tms_oe   (had_pad_jtg_tms_oe  ),
  .had_pad_wakeup_req_b (had_pad_wakeup_req_b),
  .iahbl_pad_haddr      (iahbl_pad_haddr     ),
  .iahbl_pad_hburst     (iahbl_pad_hburst    ),
  .iahbl_pad_hprot      (iahbl_pad_hprot     ),
  .iahbl_pad_hsize      (iahbl_pad_hsize     ),
  .iahbl_pad_htrans     (iahbl_pad_htrans    ),
  .iahbl_pad_hwdata     (iahbl_pad_hwdata    ),
  .iahbl_pad_hwrite     (iahbl_pad_hwrite    ),
  .iahbl_pad_vec_redrct (iahbl_pad_vec_redrct),
  .iu_pad_gpr_data      (iu_pad_gpr_data     ),
  .iu_pad_gpr_index     (iu_pad_gpr_index    ),
  .iu_pad_gpr_we        (iu_pad_gpr_we       ),
  .iu_pad_inst_retire   (iu_pad_inst_retire  ),
  .iu_pad_inst_split    (iu_pad_inst_split   ),
  .iu_pad_retire_pc     (iu_pad_retire_pc    ),
  .pad_biu_hrdata       (pad_biu_hrdata      ),
  .pad_biu_hready       (pad_biu_hready      ),
  .pad_biu_hresp        (pad_biu_hresp       ),
  .pad_bmu_iahbl_base   (pad_bmu_iahbl_base  ),
  .pad_bmu_iahbl_mask   (pad_bmu_iahbl_mask  ),
  .pad_clic_int_cfg     (pad_clic_int_cfg    ),
  .pad_clic_int_vld     (pad_clic_int_vld    ),
  .pad_cpu_dfs_req      (pad_cpu_dfs_req     ),
  .pad_cpu_ext_int_b    (pad_cpu_ext_int_b   ),
  .pad_cpu_rst_b        (pad_cpu_rst_b       ),
  .pad_ctim_calib       (pad_ctim_calib      ),
  .pad_ctim_refclk      (pad_ctim_refclk     ),
  .pad_had_jdb_req_b    (pad_had_jdb_req_b   ),
  .pad_had_jtg_tap_en   (pad_had_jtg_tap_en  ),
  .pad_had_jtg_tclk     (pad_had_jtg_tclk    ),
  .pad_had_jtg_tms_i    (pad_had_jtg_tms_i   ),
  .pad_had_jtg_trst_b   (pad_had_jtg_trst_b  ),
  .pad_had_rst_b        (pad_had_rst_b       ),
  .pad_iahbl_hrdata     (pad_iahbl_hrdata    ),
  .pad_iahbl_hready     (pad_iahbl_hready    ),
  .pad_iahbl_hresp      (pad_iahbl_hresp     ),
  .pad_sysio_bigend_b   (pad_sysio_bigend_b  ),
  .pad_sysio_clkratio   (pad_sysio_clkratio  ),
  .pad_sysio_endian_v2  (pad_sysio_endian_v2 ),
  .pad_yy_gate_clk_en_b (pad_yy_gate_clk_en_b),
  .pad_yy_test_mode     (pad_yy_test_mode    ),
  .pll_core_cpuclk      (pll_core_cpuclk     ),
  .sysio_pad_dbg_b      (sysio_pad_dbg_b     ),
  .sysio_pad_ipend_b    (sysio_pad_ipend_b   ),
  .sysio_pad_lpmd_b     (sysio_pad_lpmd_b    ),
  .sysio_pad_srst       (sysio_pad_srst      ),
  .sysio_pad_wakeup_b   (sysio_pad_wakeup_b  )
);
gated_clk_cell  cpu_gated_clk (
  .clk_in               (pad_core_clk        ),
  .clk_out              (pll_cpu_clk         ),
  .external_en          (1'b1                ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
assign pad_cpu_dfs_req = pmu_cpu_dfs_req;
always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
	if(!pad_cpu_rst_b)
	cpu_pmu_dfs_ack	<= 1'b0;
	else
	cpu_pmu_dfs_ack	<= cpu_pad_dfs_ack;
end
always @(posedge pll_core_cpuclk or negedge pad_cpu_rst_b)
begin
	if(!pad_cpu_rst_b)
	cpu_pmu_srst_b	<=  1'b1;
	else
	cpu_pmu_srst_b	<= !sysio_pad_srst; 
end
assign pll_core_cpuclk             = pll_cpu_clk;
assign pad_cpu_rst_b               = pad_core_rst_b;
assign clk_en                      = 1'b1;
assign pad_bmu_iahbl_base[11:0]    = 12'h000;
assign pad_bmu_iahbl_mask[11:0]    = 12'he00;
assign cpu_wic_ctim_int_vld        = ctim_pad_int_vld;
assign cpu_pmu_sleep_b	   	   = & sysio_pad_lpmd_b[1:0];
assign pad_vic_int_cfg[63:0]       = ip_cpu_int_cfg[63:0];
assign pad_vic_int_vld[63:0]       = ip_cpu_int_vld[63:0];
assign core_pad_wakeup_b           = sysio_pad_wakeup_b;
assign pad_yy_gate_clk_en_b        = 1'b0;
assign pad_ctim_calib[25:0]        = 26'h0;
assign pad_ctim_refclk             = pad_core_ctim_refclk;
assign pad_had_jdb_req_b           = 1'b1;
assign pad_sysio_bigend_b          = 1'b1;
assign pad_sysio_clkratio[2:0]     = 2'b0;
assign pad_sysio_dbgrq_b           = 1'b1;
assign pad_yy_bist_tst_en          = bist0_mode;
assign pad_yy_scan_enable          = scan_en;
assign pad_yy_test_mode            = scan_mode;
assign core_pad_jdb_ack_b          = had_pad_jdb_ack_b;
assign core_pad_jdb_pm[1:0]        = had_pad_jdb_pm[1:0];
assign core_sysio_pad_dbg_b        = sysio_pad_dbg_b;
assign core_sysio_pad_idly4_b      = sysio_pad_idly4_b;
assign core_sysio_pad_ipend_b      = sysio_pad_ipend_b;
assign pad_had_jtg_tap_en     = 1'b1;
assign pad_had_jtg_trst_b     = pad_core_rst_b;
assign pad_had_jtg_tclk       = pad_core_jtg_tclk;
assign pad_had_jtg_tms_i      = padmux_cpu_jtg_tms_i;
assign core_pad_jtg_tap_on    = had_pad_jtg_tap_on;
assign cpu_padmux_jtg_tms_o   = had_pad_jtg_tms_o;
assign cpu_padmux_jtg_tms_oe  = had_pad_jtg_tms_oe;
assign cpu_hmain0_m2_haddr[31:0]   = biu_pad_haddr[31:0];
assign cpu_hmain0_m2_hburst[2:0]   = biu_pad_hburst[2:0];
assign cpu_hmain0_m2_hprot[3:0]    = biu_pad_hprot[3:0];
assign cpu_hmain0_m2_hsize[2:0]    = biu_pad_hsize[2:0];
assign cpu_hmain0_m2_htrans[1:0]   = biu_pad_htrans[1:0];
assign cpu_hmain0_m2_hwdata[31:0]  = biu_pad_hwdata[31:0];
assign cpu_hmain0_m2_hwrite        = biu_pad_hwrite;
assign pad_biu_hrdata[31:0]        = hmain0_cpu_m2_hrdata[31:0];
assign pad_biu_hready              = hmain0_cpu_m2_hready;
assign pad_biu_hresp               = |hmain0_cpu_m2_hresp[1:0];
assign cpu_hmain0_m0_haddr[31:0]   = iahbl_pad_haddr[31:0];
assign cpu_hmain0_m0_hburst[2:0]   = iahbl_pad_hburst[2:0];
assign cpu_hmain0_m0_hprot[3:0]    = iahbl_pad_hprot[3:0];
assign cpu_hmain0_m0_hsize[2:0]    = iahbl_pad_hsize[2:0];
assign cpu_hmain0_m0_htrans[1:0]   = iahbl_pad_htrans[1:0];
assign cpu_hmain0_m0_hwdata[31:0]  = iahbl_pad_hwdata[31:0];
assign cpu_hmain0_m0_hwrite        = iahbl_pad_hwrite;
assign pad_iahbl_hrdata[31:0]      = hmain0_cpu_m0_hrdata[31:0];
assign pad_iahbl_hready            = hmain0_cpu_m0_hready;
assign pad_iahbl_hresp             = |hmain0_cpu_m0_hresp[1:0];
assign cpu_hmain0_m1_haddr[31:0]   = dahbl_pad_haddr[31:0];
assign cpu_hmain0_m1_hburst[2:0]   = dahbl_pad_hburst[2:0];
assign cpu_hmain0_m1_hprot[3:0]    = dahbl_pad_hprot[3:0];
assign cpu_hmain0_m1_hsize[2:0]    = dahbl_pad_hsize[2:0];
assign cpu_hmain0_m1_htrans[1:0]   = dahbl_pad_htrans[1:0];
assign cpu_hmain0_m1_hwdata[31:0]  = dahbl_pad_hwdata[31:0];
assign cpu_hmain0_m1_hwrite        = dahbl_pad_hwrite;
assign pad_dahbl_hrdata[31:0]      = hmain0_cpu_m1_hrdata[31:0];
assign pad_dahbl_hready            = hmain0_cpu_m1_hready;
assign pad_dahbl_hresp             = |hmain0_cpu_m1_hresp[1:0];
assign pad_dahbl_hsec = 1'b0;
assign cpu_retire_vld = rtu_pad_inst_retire;
assign ip_cpu_int_vld[6:0]   = 1'b0;
assign ip_cpu_int_vld[7]     = cpu_wic_ctim_int_vld;
assign ip_cpu_int_vld[15:8]  = 8'b0;
assign ip_cpu_int_vld[16]     = gpio_wic_intr;
assign ip_cpu_int_vld[18:17]   = tim0_wic_intr[1:0];
assign ip_cpu_int_vld[20:19]   = tim1_wic_intr[1:0];
assign ip_cpu_int_vld[22:21]   = tim2_wic_intr[1:0];
assign ip_cpu_int_vld[24:23]   = tim3_wic_intr[1:0];
assign ip_cpu_int_vld[25]    = pwm_wic_intr;
assign ip_cpu_int_vld[26]    = rtc_wic_intr;
assign ip_cpu_int_vld[27]    = wdt_wic_intr; 
assign ip_cpu_int_vld[28]    = usi0_wic_intr;
assign ip_cpu_int_vld[29]    = usi1_wic_intr;
assign ip_cpu_int_vld[30]    = usi2_wic_intr;
assign ip_cpu_int_vld[31]    = pmu_wic_intr;
assign ip_cpu_int_vld[32]    = dmac0_wic_intr;
assign ip_cpu_int_vld[34:33]   = tim4_wic_intr[1:0];
assign ip_cpu_int_vld[36:35]   = tim5_wic_intr[1:0];
assign ip_cpu_int_vld[38:37]   = tim6_wic_intr[1:0];
assign ip_cpu_int_vld[40:39]   = tim7_wic_intr[1:0];
assign ip_cpu_int_vld[41]    = main_imemdummy0_intr | main_dmemdummy0_intr;
assign ip_cpu_int_vld[42]    = main_dummy0_intr;
assign ip_cpu_int_vld[43]    = main_dummy1_intr;
assign ip_cpu_int_vld[44]    = main_dummy2_intr;
assign ip_cpu_int_vld[45]    = main_dummy3_intr;
assign ip_cpu_int_vld[46]    = lsbus_dummy0_intr;
assign ip_cpu_int_vld[47]    = lsbus_dummy1_intr;
assign ip_cpu_int_vld[48]    = lsbus_dummy2_intr;
assign ip_cpu_int_vld[49]    = lsbus_dummy3_intr;
assign ip_cpu_int_vld[50]    = apb0_dummy1_intr;
assign ip_cpu_int_vld[51]    = apb0_dummy2_intr;
assign ip_cpu_int_vld[52]    = apb0_dummy3_intr;
assign ip_cpu_int_vld[53]    = apb0_dummy4_intr;
assign ip_cpu_int_vld[54]    = apb0_dummy5_intr;
assign ip_cpu_int_vld[55]    = apb0_dummy7_intr;
assign ip_cpu_int_vld[56]    = apb0_dummy8_intr;
assign ip_cpu_int_vld[57]    = apb0_dummy9_intr;
assign ip_cpu_int_vld[58]    = apb1_dummy1_intr;
assign ip_cpu_int_vld[59]    = apb1_dummy2_intr;
assign ip_cpu_int_vld[60]    = apb1_dummy3_intr;
assign ip_cpu_int_vld[61]    = apb1_dummy4_intr;
assign ip_cpu_int_vld[62]    = apb1_dummy5_intr | apb1_dummy7_intr;
assign ip_cpu_int_vld[63]    = apb1_dummy6_intr | apb1_dummy8_intr;
assign ip_cpu_int_cfg[63:0] = 64'h0;
assign pad_clic_int_cfg[63:0] = pad_vic_int_cfg[63:0];
assign pad_clic_int_vld[63:0] = pad_vic_int_vld[63:0];
assign dahbl_pad_haddr[31:0] = 32'b0;                        
assign dahbl_pad_hburst[2 :0] = 3'b0;                       
assign dahbl_pad_hprot[3 :0] = 4'b0;                        
assign dahbl_pad_hsize[2 :0] = 3'b0;                        
assign dahbl_pad_htrans[1 :0] = 2'b0;                       
assign dahbl_pad_hwdata[31:0] = 32'b0;                       
assign dahbl_pad_hwrite = 1'b0;   
assign pad_cpu_ext_int_b = 1'b1;
assign pad_had_rst_b = pad_cpu_rst_b;
assign pad_sysio_endian_v2 = 1'b0;
assign sysio_pad_idly4_b = 1'b1;
assign rtu_pad_inst_retire = 1'b0;
endmodule
