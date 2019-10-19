/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define RAM_USAGE
`define BANK2_SYS_DATA_WIDTH 32
`define BANK2_WE_WIDTH 4
`define BANK2_ADDR_WIDTH 14 
`define BANK2_ADDR_WORDS 16384 
`define BANK2_DATA_WIDTH 32
`define BANK2_ADDR_WIDTH_14
module sms_bank_64k_top(
  big_endian_b,
  mem_haddr,
  mem_hclk,
  mem_hprot,
  mem_hrdata,
  mem_hready,
  mem_hready_resp,
  mem_hresp,
  mem_hrst_b,
  mem_hsel,
  mem_hsize,
  mem_htrans,
  mem_hwdata,
  mem_hwrite,
  region_rd_deny_flag,
  region_wr_deny_flag,
  sms_idle0
);
input           big_endian_b;        
input   [31:0]  mem_haddr;           
input           mem_hclk;            
input   [3 :0]  mem_hprot;           
input           mem_hready;          
input           mem_hrst_b;          
input           mem_hsel;            
input   [2 :0]  mem_hsize;           
input   [1 :0]  mem_htrans;          
input   [31:0]  mem_hwdata;          
input           mem_hwrite;          
input           region_rd_deny_flag; 
input           region_wr_deny_flag; 
output  [31:0]  mem_hrdata;          
output          mem_hready_resp;     
output  [1 :0]  mem_hresp;           
output          sms_idle0;           
reg             rd_deny_resp;        
reg             rd_deny_resp_2_cycle; 
reg             wr_deny_resp;        
reg             wr_deny_resp_2_cycle; 
wire            a_act_burst;         
wire            a_nonseq;            
wire            a_seq;               
wire            big_endian_b;        
wire            deny_hready_resp;    
wire    [1 :0]  deny_hresp;          
wire    [31:0]  mem_haddr;           
wire            mem_hclk;            
wire    [3 :0]  mem_hprot;           
wire    [31:0]  mem_hrdata;          
wire            mem_hready;          
wire            mem_hready_resp;     
wire    [1 :0]  mem_hresp;           
wire            mem_hrst_b;          
wire            mem_hsel;            
wire            mem_hsel_deny;       
wire    [2 :0]  mem_hsize;           
wire    [1 :0]  mem_htrans;          
wire    [1 :0]  mem_htrans_deny;     
wire    [31:0]  mem_hwdata;          
wire            mem_hwrite;          
wire    [15:0]  ram_addr;            
wire    [31:0]  ram_rdata;           
wire            ram_sel;             
wire    [2 :0]  ram_size;            
wire    [31:0]  ram_wdata;           
wire            ram_write;           
wire            region_rd_deny_flag; 
wire            region_wr_deny_flag; 
wire    [3 :0]  resp_cfg;            
wire            sms_idle0;           
parameter  NONSEQ = 2'b10;
parameter  SEQ    = 2'b11;
parameter  ERROR  = 2'b01;  
assign a_nonseq = mem_htrans[1:0] == NONSEQ;
assign a_seq    = mem_htrans[1:0] == SEQ;
assign a_act_burst = (a_nonseq || a_seq) && mem_hsel && mem_hready;
assign mem_hsel_deny =( (a_act_burst&mem_hwrite&region_wr_deny_flag) |
                        (a_act_burst&(~mem_hwrite)&region_rd_deny_flag) )
                        ? 1'b0 : mem_hsel;
assign mem_htrans_deny[1:0] =( (a_act_burst&mem_hwrite&region_wr_deny_flag) |
                               (a_act_burst&(~mem_hwrite)&region_rd_deny_flag) )
                               ? 2'b0 : mem_htrans[1:0];
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		wr_deny_resp <= 1'b0;
        end
	else if(wr_deny_resp && wr_deny_resp_2_cycle) begin
		wr_deny_resp <= 1'b0;
        end
	else if(a_act_burst && mem_hwrite && region_wr_deny_flag) begin
		wr_deny_resp <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		wr_deny_resp_2_cycle <= 1'b0;
        end
	else if(wr_deny_resp && wr_deny_resp_2_cycle) begin
		wr_deny_resp_2_cycle <= 1'b0;
        end
	else if(wr_deny_resp) begin
		wr_deny_resp_2_cycle <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		rd_deny_resp <= 1'b0;
        end
	else if(rd_deny_resp && rd_deny_resp_2_cycle) begin
		rd_deny_resp <= 1'b0;
        end
	else if(a_act_burst && (!mem_hwrite) && region_rd_deny_flag) begin
		rd_deny_resp <= 1'b1;
        end
end
always @(posedge mem_hclk or negedge mem_hrst_b)
begin
	if(!mem_hrst_b) begin
		rd_deny_resp_2_cycle <= 1'b0;
        end
	else if(rd_deny_resp && rd_deny_resp_2_cycle) begin
		rd_deny_resp_2_cycle <= 1'b0;
        end
	else if(rd_deny_resp) begin
		rd_deny_resp_2_cycle <= 1'b1;
        end
end
assign mem_hready_resp = rd_deny_resp ? rd_deny_resp_2_cycle : 
                    (wr_deny_resp ? wr_deny_resp_2_cycle : deny_hready_resp);
assign mem_hresp[1:0] = rd_deny_resp ? ERROR : (wr_deny_resp ? ERROR : deny_hresp);
sms_sms_ahbs_bk2  x_sms_sms_ahbs (
  .ahbs_harb_hrdata    (mem_hrdata         ),
  .ahbs_harb_hready    (deny_hready_resp   ),
  .ahbs_harb_hresp     (deny_hresp         ),
  .harb_ahbs_hsel      (mem_hsel_deny      ),
  .harb_xx_haddr       (mem_haddr          ),
  .harb_xx_hready      (mem_hready         ),
  .harb_xx_hsize       (mem_hsize          ),
  .harb_xx_htrans      (mem_htrans_deny    ),
  .harb_xx_hwdata      (mem_hwdata         ),
  .harb_xx_hwrite      (mem_hwrite         ),
  .i_sys_hclk          (mem_hclk           ),
  .i_sys_rst_b         (mem_hrst_b         ),
  .little_endian_trans (big_endian_b       ),
  .mem_hprot           (mem_hprot          ),
  .ram_addr            (ram_addr           ),
  .ram_idle            (sms_idle0          ),
  .ram_rdata           (ram_rdata          ),
  .ram_sel             (ram_sel            ),
  .ram_size            (ram_size           ),
  .ram_wdata           (ram_wdata          ),
  .ram_write           (ram_write          ),
  .resp_cfg            (resp_cfg           )
);
sms_sram_bk2  x_sms_sram (
  .hrst_b     (mem_hrst_b),
  .ram_addr   (ram_addr  ),
  .ram_clk    (mem_hclk  ),
  .ram_rdata  (ram_rdata ),
  .ram_sel    (ram_sel   ),
  .ram_size   (ram_size  ),
  .ram_wdata  (ram_wdata ),
  .ram_write  (ram_write )
);
assign resp_cfg[3:0] = 4'b1000;
endmodule
`define RAM_USAGE
module sms_sms_ahbs_bk2(
  ahbs_harb_hrdata,
  ahbs_harb_hready,
  ahbs_harb_hresp,
  harb_ahbs_hsel,
  harb_xx_haddr,
  harb_xx_hready,
  harb_xx_hsize,
  harb_xx_htrans,
  harb_xx_hwdata,
  harb_xx_hwrite,
  i_sys_hclk,
  i_sys_rst_b,
  little_endian_trans,
  mem_hprot,
  ram_addr,
  ram_idle,
  ram_rdata,
  ram_sel,
  ram_size,
  ram_wdata,
  ram_write,
  resp_cfg
);
input           harb_ahbs_hsel;         
input   [31:0]  harb_xx_haddr;          
input           harb_xx_hready;         
input   [2 :0]  harb_xx_hsize;          
input   [1 :0]  harb_xx_htrans;         
input   [31:0]  harb_xx_hwdata;         
input           harb_xx_hwrite;         
input           i_sys_hclk;             
input           i_sys_rst_b;            
input           little_endian_trans;    
input   [3 :0]  mem_hprot;              
input   [31:0]  ram_rdata;              
input   [3 :0]  resp_cfg;               
output  [31:0]  ahbs_harb_hrdata;       
output          ahbs_harb_hready;       
output  [1 :0]  ahbs_harb_hresp;        
output  [15:0]  ram_addr;               
output          ram_idle;               
output          ram_sel;                
output  [2 :0]  ram_size;               
output  [31:0]  ram_wdata;              
output          ram_write;              
reg             ahbs_harb_hready_s;     
reg     [1 :0]  ahbs_harb_hresp;        
reg             harb_ahbs_hsel_r;       
reg     [15:0]  harb_xx_haddr_r;        
reg     [2 :0]  harb_xx_hsize_r;        
reg             read_after_write_access; 
reg             rty_first;              
reg             rty_flag;               
reg     [15:0]  w_ram_addr_tmp;         
reg             w_ram_sel_tmp;          
reg     [2 :0]  w_ram_size_tmp;         
reg             w_ram_write_tmp;        
wire            a_act_burst;            
wire            a_byte;                 
wire            a_halfword;             
wire            a_nonseq;               
wire            a_seq;                  
wire            a_word;                 
wire            ahbs_harb_hready;       
wire            harb_ahbs_hsel;         
wire    [31:0]  harb_xx_haddr;          
wire            harb_xx_hready;         
wire    [2 :0]  harb_xx_hsize;          
wire    [1 :0]  harb_xx_htrans;         
wire            harb_xx_hwrite;         
wire            hready_s;               
wire            i_sys_hclk;             
wire            i_sys_rst_b;            
wire    [15:0]  r_ram_addr;             
wire            r_ram_sel;              
wire    [2 :0]  r_ram_size;             
wire            r_ram_write;            
wire    [15:0]  ram_addr;               
wire            ram_idle;               
wire    [31:0]  ram_rdata;              
wire            ram_sel;                
wire    [2 :0]  ram_size;               
wire    [31:0]  ram_wdata;              
wire            ram_write;              
wire    [31:0]  reg_slave_rdata;        
wire    [3 :0]  resp_cfg;               
wire    [31:0]  slave_reg_wdata_t;      
wire    [1 :0]  sms_resp;               
wire    [15:0]  w_ram_addr;             
wire            w_ram_sel;              
wire    [2 :0]  w_ram_size;             
wire            w_ram_write;            
parameter        REG_NUM = 64;
parameter        BIT_WIDTH = 16;
parameter                 NONSEQ  = 2'b10;
parameter                 SEQ     = 2'b11;
parameter[2:0]   BYTE      = 3'b000, 
                 HALFWORD  = 3'b001, 
                 WORD      = 3'b010; 
parameter[1:0]   OKAY  = 2'b00,       
                 ERROR = 2'b01,
                 RETRY = 2'b10;
assign a_nonseq   = harb_xx_htrans[1:0] == NONSEQ;
assign a_seq      = harb_xx_htrans[1:0] == SEQ;
always @( posedge i_sys_hclk or negedge i_sys_rst_b)
begin
  if(!i_sys_rst_b)
    harb_xx_hsize_r[2:0] <= 3'b0;
  else if(harb_xx_hready)
    harb_xx_hsize_r[2:0] <= harb_xx_hsize[2:0];
  else 
    harb_xx_hsize_r[2:0] <= harb_xx_hsize_r[2:0];
end
assign a_byte     = (harb_xx_hsize_r[2:0]  == BYTE);
assign a_halfword = (harb_xx_hsize_r[2:0]  == HALFWORD);
assign a_word     = (harb_xx_hsize_r[2:0]  == WORD);
assign a_act_burst = ( a_nonseq || a_seq ) & harb_ahbs_hsel & harb_xx_hready;
always @(posedge i_sys_hclk  or negedge i_sys_rst_b)
begin
  if(!i_sys_rst_b)
     harb_ahbs_hsel_r <= 1'b0;
  else if(harb_ahbs_hsel)
     harb_ahbs_hsel_r <= 1'b1;
  else if(ahbs_harb_hready)
     harb_ahbs_hsel_r <= 1'b0;
end
always @( posedge i_sys_hclk or negedge i_sys_rst_b)
begin
  if(!i_sys_rst_b)
    harb_xx_haddr_r[BIT_WIDTH-1:0] <= {BIT_WIDTH{1'b0}};
  else if(ahbs_harb_hready)
    harb_xx_haddr_r[BIT_WIDTH-1:0] <= harb_xx_haddr[BIT_WIDTH-1:0];
  else
    harb_xx_haddr_r[BIT_WIDTH-1:0] <= harb_xx_haddr_r[BIT_WIDTH-1:0];
end
reg     [31:0]  ahbs_harb_hrdata;
reg     [31:0]  slave_reg_wdata;
always @(little_endian_trans 
      or harb_ahbs_hsel_r
      or a_byte
      or a_halfword
      or a_word
      or reg_slave_rdata[31:0]
      or harb_xx_haddr_r[1:0]
      or harb_xx_hwdata[31:0])
begin
  if(little_endian_trans & harb_ahbs_hsel_r)
    begin
      ahbs_harb_hrdata[31:0] = reg_slave_rdata[31:0];
      slave_reg_wdata[31:0] = harb_xx_hwdata[31:0];
    end
  else if (~little_endian_trans & harb_ahbs_hsel_r)
    begin
      ahbs_harb_hrdata[31:0] = 32'h0;
      slave_reg_wdata[31:0] = 32'h0;
      case(1'b1)
        a_byte :
        begin
          if(~|harb_xx_haddr_r[1:0])
            begin
              ahbs_harb_hrdata[31:0] = {reg_slave_rdata[7:0], 24'h0};
              slave_reg_wdata[31:0] = {24'h0, harb_xx_hwdata[31:24]};
            end
          else if(harb_xx_haddr_r[1:0] == 2'b01)
            begin
              ahbs_harb_hrdata[31:0] = {8'h0, reg_slave_rdata[15:8], 16'h0};
              slave_reg_wdata[31:0] = {16'h0, harb_xx_hwdata[23:16],8'h0};
            end
          else if(harb_xx_haddr_r[1:0] == 2'b10)
            begin
              ahbs_harb_hrdata[31:0] = {16'h0, reg_slave_rdata[23:16], 8'h0};
              slave_reg_wdata[31:0] = {8'h0, harb_xx_hwdata[15:8],16'h0};
            end
          else
            begin
              ahbs_harb_hrdata[31:0] = {24'h0,reg_slave_rdata[31:24]};
              slave_reg_wdata[31:0] = {harb_xx_hwdata[7:0],24'h0};
            end
        end
        a_halfword :
        begin
          if(~|harb_xx_haddr_r[1:0])
            begin
              ahbs_harb_hrdata[31:0] = {reg_slave_rdata[15:0], 16'h0};
              slave_reg_wdata[31:0] = {16'h0, harb_xx_hwdata[31:16]};
            end
          else if(harb_xx_haddr_r[1:0] == 2'b10)
            begin
              ahbs_harb_hrdata[31:0] = {16'h0, reg_slave_rdata[31:16]};
              slave_reg_wdata[31:0] = {harb_xx_hwdata[15:0],16'h0};
            end
          end
        a_word :
          begin
            ahbs_harb_hrdata[31:0] = reg_slave_rdata[31:0];
            slave_reg_wdata[31:0] = harb_xx_hwdata[31:0];
          end
      endcase
    end
  else
    begin
      ahbs_harb_hrdata[31:0] = reg_slave_rdata[31:0];
      slave_reg_wdata[31:0] = harb_xx_hwdata[31:0];
    end
end
`ifdef RAM_USAGE
assign slave_reg_wdata_t[31:0] = slave_reg_wdata[31:0];
`endif
always @ (posedge i_sys_hclk or negedge i_sys_rst_b)
begin
  if(!i_sys_rst_b)
    begin
      w_ram_sel_tmp <= 1'b0;
      w_ram_size_tmp[2:0] <= 3'b0;
      w_ram_addr_tmp[BIT_WIDTH-1:0] <= {BIT_WIDTH{1'b0}};
      w_ram_write_tmp <= 1'b0;
      read_after_write_access <= 1'b0;
    end
  else if(harb_xx_hwrite) 
    begin
      w_ram_sel_tmp <= a_act_burst;
      w_ram_size_tmp[2:0] <= harb_xx_hsize[2:0];
      w_ram_addr_tmp[BIT_WIDTH-1:0] <= harb_xx_haddr[BIT_WIDTH-1:0];
      w_ram_write_tmp <= 1'b1;
      if(read_after_write_access)
        read_after_write_access <= 1'b0;
      else
        read_after_write_access <= read_after_write_access;
    end
  else if(w_ram_sel & w_ram_write & r_ram_sel) 
    begin
      w_ram_sel_tmp <= a_act_burst;
      w_ram_size_tmp[2:0] <= harb_xx_hsize[2:0];
      w_ram_addr_tmp[BIT_WIDTH-1:0] <= harb_xx_haddr[BIT_WIDTH-1:0];
      w_ram_write_tmp <= 1'b0;
      read_after_write_access <= 1'b1;
    end
  else
    begin
      w_ram_sel_tmp <= 1'b0;
      w_ram_size_tmp[2:0] <= 3'b0;
      w_ram_addr_tmp[BIT_WIDTH-1:0] <= {BIT_WIDTH{1'b0}};
      w_ram_write_tmp <= 1'b0;
      read_after_write_access <= 1'b0;
    end
end
assign w_ram_size[2:0] = w_ram_size_tmp[2:0];
assign w_ram_addr[BIT_WIDTH-1:0] = w_ram_addr_tmp[BIT_WIDTH-1:0];
assign w_ram_sel = w_ram_sel_tmp;
assign w_ram_write = w_ram_write_tmp;
assign ram_wdata[31:0] = slave_reg_wdata_t[31:0];
assign r_ram_sel = a_act_burst & ~r_ram_write;
assign r_ram_write = harb_xx_hwrite;
assign r_ram_size[2:0] = harb_xx_hsize[2:0];
assign r_ram_addr[BIT_WIDTH-1:0] = harb_xx_haddr[BIT_WIDTH-1:0];
assign reg_slave_rdata[31:0] = ram_rdata[31:0];
assign ram_sel = w_ram_sel | r_ram_sel;
assign ram_write = w_ram_sel ? w_ram_write : r_ram_write;
assign ram_size[2:0] = w_ram_sel ? w_ram_size[2:0] : r_ram_size[2:0];
assign ram_addr[BIT_WIDTH-1:0] = w_ram_sel ? w_ram_addr[BIT_WIDTH-1:0] : r_ram_addr[BIT_WIDTH-1:0];
assign ram_idle = (~a_act_burst) & (~w_ram_sel);
always @ (posedge i_sys_hclk or negedge i_sys_rst_b)
begin
  if(~i_sys_rst_b)
    rty_first <= 1'b0;
  else
    rty_first <= rty_flag;
end
assign ahbs_harb_hready = (~read_after_write_access) & ahbs_harb_hready_s;
assign sms_resp[1:0] = OKAY;
assign hready_s = 1'b1;	
always @( hready_s
       or sms_resp[1:0]
       or resp_cfg[3:0]
       or rty_first)
begin
casex ({resp_cfg[3:2], rty_first, resp_cfg[1:0]})  // synopsys parallel_case
  5'b1x_x0_x,                     
  5'b1x_x1_0:                     
    begin
      rty_flag = 1'b0;
      ahbs_harb_hready_s = hready_s;
      ahbs_harb_hresp[1:0] = sms_resp[1:0];
    end
  5'b00_x1_0,
  5'b00_x0_x:                     
    begin
      rty_flag = 1'b0;
      ahbs_harb_hready_s = 1'b0;
      ahbs_harb_hresp[1:0] = OKAY;
    end
  5'b01_00_x,                     
  5'b01_01_0:              
    begin
      rty_flag = 1'b1;
      ahbs_harb_hready_s = 1'b0;
      ahbs_harb_hresp[1:0] = RETRY;
    end
  5'b01_10_x,
  5'b01_11_0:                    
    begin
      rty_flag = 1'b0;
      ahbs_harb_hready_s = 1'b1;
      ahbs_harb_hresp[1:0] = RETRY;
    end
  5'bxx_01_1:                    
    begin
      rty_flag = 1'b1;
      ahbs_harb_hready_s = 1'b0;
      ahbs_harb_hresp[1:0] = ERROR;
    end
  5'bxx_11_1:                    
    begin
      rty_flag = 1'b0;
      ahbs_harb_hready_s = 1'b1;
      ahbs_harb_hresp[1:0] = ERROR;
    end
  default:                      
    begin
      rty_flag = 1'b0;
      ahbs_harb_hready_s = 1'b1;
      ahbs_harb_hresp[1:0] = OKAY;
    end
endcase
end
endmodule
module sms_sram_bk2(
  hrst_b,
  ram_addr,
  ram_clk,
  ram_rdata,
  ram_sel,
  ram_size,
  ram_wdata,
  ram_write
);
input           hrst_b;     
input   [15:0]  ram_addr;   
input           ram_clk;    
input           ram_sel;    
input   [2 :0]  ram_size;   
input   [31:0]  ram_wdata;  
input           ram_write;  
output  [31:0]  ram_rdata;  
reg     [3 :0]  byte_sel_b; 
reg             mbk_cen_f_b; 
reg     [31:0]  ram_rdata;  
wire    [3 :0]  byte_wen_b; 
wire            hrst_b;     
wire            mbk_cen_b;  
wire            mbk_wen_b;  
wire    [31:0]  ram0_rdata; 
wire    [15:0]  ram_addr;   
wire            ram_clk;    
wire            ram_sel;    
wire    [2 :0]  ram_size;   
wire    [31:0]  ram_wdata;  
wire            ram_write;  
parameter[2:0]   BYTE      = 3'b000, 
                 HALFWORD  = 3'b001, 
                 WORD      = 3'b010; 
assign mbk_cen_b = ~ram_sel;
always @( ram_addr[1:0]
       or ram_size[2:0])
begin
  case (ram_size[2:0])   // synopsys parallel_case
    BYTE:
      case (ram_addr[1:0])   // synopsys parallel_case
        2'b00:
          byte_sel_b[3:0] = 4'b1110;    
        2'b01:
          byte_sel_b[3:0] = 4'b1101;
        2'b10:
          byte_sel_b[3:0] = 4'b1011;
        2'b11:
          byte_sel_b[3:0] = 4'b0111;
      endcase
    HALFWORD:
      case (ram_addr[1])     // synopsys parallel_case
        1'b0:
          byte_sel_b[3:0] = 4'b1100;    
        1'b1:
          byte_sel_b[3:0] = 4'b0011;
      endcase
    WORD:
      byte_sel_b[3:0] = 4'b0000;
    default:
      byte_sel_b[3:0] = 4'b1111;
  endcase
end
assign mbk_wen_b = ~ram_write; 
always @( posedge ram_clk or negedge hrst_b)
begin
  if (!hrst_b)
  mbk_cen_f_b <= 1'b0;
  else
  mbk_cen_f_b <= mbk_cen_b;
end
always @( mbk_cen_f_b
       or ram0_rdata[31:0])
begin
  case (mbk_cen_f_b)
    1'b0:
      ram_rdata[31:0] = ram0_rdata[31:0];
    1'b1:
      ram_rdata[31:0] = 32'b0;
  endcase
end
parameter  DATAWIDTH = 32;
parameter  ADDRWIDTH = 14;
parameter  MEMDEPTH  = 2**(ADDRWIDTH);
assign byte_wen_b[3:0] =  byte_sel_b[3:0] | {4{mbk_wen_b}};
fpga_spram #(DATAWIDTH,ADDRWIDTH,MEMDEPTH) x_fpga_spram (
  .A                (ram_addr[15:2]  ),
  .BWEN             (byte_wen_b[3:0] ),
  .CEN              (mbk_cen_b       ),
  .CLK              (ram_clk         ),
  .D                (ram_wdata[31:0] ),
  .Q                (ram0_rdata[31:0])
);
endmodule
module sms_top(
  ahb_sms0_haddr,
  ahb_sms0_hprot,
  ahb_sms0_hsel,
  ahb_sms0_hsize,
  ahb_sms0_htrans,
  ahb_sms0_hwdata,
  ahb_sms0_hwrite,
  ahb_sms1_haddr,
  ahb_sms1_hprot,
  ahb_sms1_hsel,
  ahb_sms1_hsize,
  ahb_sms1_htrans,
  ahb_sms1_hwdata,
  ahb_sms1_hwrite,
  ahb_sms2_haddr,
  ahb_sms2_hprot,
  ahb_sms2_hsel,
  ahb_sms2_hsize,
  ahb_sms2_htrans,
  ahb_sms2_hwdata,
  ahb_sms2_hwrite,
  ahb_sms3_haddr,
  ahb_sms3_hprot,
  ahb_sms3_hsel,
  ahb_sms3_hsize,
  ahb_sms3_htrans,
  ahb_sms3_hwdata,
  ahb_sms3_hwrite,
  pmu_sms_hclk,
  pmu_sms_hrst_b,
  sms0_ahb_hrdata,
  sms0_ahb_hready,
  sms0_ahb_hresp,
  sms0_idle,
  sms1_ahb_hrdata,
  sms1_ahb_hready,
  sms1_ahb_hresp,
  sms1_idle,
  sms2_ahb_hrdata,
  sms2_ahb_hready,
  sms2_ahb_hresp,
  sms2_idle,
  sms3_ahb_hrdata,
  sms3_ahb_hready,
  sms3_ahb_hresp,
  sms3_idle,
  sms_big_endian_b
);
input   [31:0]  ahb_sms0_haddr;      
input   [3 :0]  ahb_sms0_hprot;      
input           ahb_sms0_hsel;       
input   [2 :0]  ahb_sms0_hsize;      
input   [1 :0]  ahb_sms0_htrans;     
input   [31:0]  ahb_sms0_hwdata;     
input           ahb_sms0_hwrite;     
input   [31:0]  ahb_sms1_haddr;      
input   [3 :0]  ahb_sms1_hprot;      
input           ahb_sms1_hsel;       
input   [2 :0]  ahb_sms1_hsize;      
input   [1 :0]  ahb_sms1_htrans;     
input   [31:0]  ahb_sms1_hwdata;     
input           ahb_sms1_hwrite;     
input   [31:0]  ahb_sms2_haddr;      
input   [3 :0]  ahb_sms2_hprot;      
input           ahb_sms2_hsel;       
input   [2 :0]  ahb_sms2_hsize;      
input   [1 :0]  ahb_sms2_htrans;     
input   [31:0]  ahb_sms2_hwdata;     
input           ahb_sms2_hwrite;     
input   [31:0]  ahb_sms3_haddr;      
input   [3 :0]  ahb_sms3_hprot;      
input           ahb_sms3_hsel;       
input   [2 :0]  ahb_sms3_hsize;      
input   [1 :0]  ahb_sms3_htrans;     
input   [31:0]  ahb_sms3_hwdata;     
input           ahb_sms3_hwrite;     
input           pmu_sms_hclk;        
input           pmu_sms_hrst_b;      
input           sms_big_endian_b;    
output  [31:0]  sms0_ahb_hrdata;     
output          sms0_ahb_hready;     
output  [1 :0]  sms0_ahb_hresp;      
output          sms0_idle;           
output  [31:0]  sms1_ahb_hrdata;     
output          sms1_ahb_hready;     
output  [1 :0]  sms1_ahb_hresp;      
output          sms1_idle;           
output  [31:0]  sms2_ahb_hrdata;     
output          sms2_ahb_hready;     
output  [1 :0]  sms2_ahb_hresp;      
output          sms2_idle;           
output  [31:0]  sms3_ahb_hrdata;     
output          sms3_ahb_hready;     
output  [1 :0]  sms3_ahb_hresp;      
output          sms3_idle;           
wire    [31:0]  ahb_sms0_haddr;      
wire    [3 :0]  ahb_sms0_hprot;      
wire            ahb_sms0_hsel;       
wire    [2 :0]  ahb_sms0_hsize;      
wire    [1 :0]  ahb_sms0_htrans;     
wire    [31:0]  ahb_sms0_hwdata;     
wire            ahb_sms0_hwrite;     
wire    [31:0]  ahb_sms1_haddr;      
wire    [3 :0]  ahb_sms1_hprot;      
wire            ahb_sms1_hsel;       
wire    [2 :0]  ahb_sms1_hsize;      
wire    [1 :0]  ahb_sms1_htrans;     
wire    [31:0]  ahb_sms1_hwdata;     
wire            ahb_sms1_hwrite;     
wire    [31:0]  ahb_sms2_haddr;      
wire    [3 :0]  ahb_sms2_hprot;      
wire            ahb_sms2_hsel;       
wire    [2 :0]  ahb_sms2_hsize;      
wire    [1 :0]  ahb_sms2_htrans;     
wire    [31:0]  ahb_sms2_hwdata;     
wire            ahb_sms2_hwrite;     
wire    [31:0]  ahb_sms3_haddr;      
wire    [3 :0]  ahb_sms3_hprot;      
wire            ahb_sms3_hsel;       
wire    [2 :0]  ahb_sms3_hsize;      
wire    [1 :0]  ahb_sms3_htrans;     
wire    [31:0]  ahb_sms3_hwdata;     
wire            ahb_sms3_hwrite;     
wire            pmu_sms_hclk;        
wire            pmu_sms_hrst_b;      
wire            region_rd_deny_flag0; 
wire            region_rd_deny_flag1; 
wire            region_rd_deny_flag2; 
wire            region_rd_deny_flag3; 
wire            region_wr_deny_flag0; 
wire            region_wr_deny_flag1; 
wire            region_wr_deny_flag2; 
wire            region_wr_deny_flag3; 
wire    [31:0]  sms0_ahb_hrdata;     
wire            sms0_ahb_hready;     
wire    [1 :0]  sms0_ahb_hresp;      
wire            sms0_idle;           
wire    [31:0]  sms1_ahb_hrdata;     
wire            sms1_ahb_hready;     
wire    [1 :0]  sms1_ahb_hresp;      
wire            sms1_idle;           
wire    [31:0]  sms2_ahb_hrdata;     
wire            sms2_ahb_hready;     
wire    [1 :0]  sms2_ahb_hresp;      
wire            sms2_idle;           
wire    [31:0]  sms3_ahb_hrdata;     
wire            sms3_ahb_hready;     
wire    [1 :0]  sms3_ahb_hresp;      
wire            sms3_idle;           
wire            sms_big_endian_b;    
sms_bank_64k_top  x_sms0_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms0_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms0_hprot             ),
  .mem_hrdata                  (sms0_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms0_ahb_hready            ),
  .mem_hresp                   (sms0_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms0_hsel              ),
  .mem_hsize                   (ahb_sms0_hsize             ),
  .mem_htrans                  (ahb_sms0_htrans            ),
  .mem_hwdata                  (ahb_sms0_hwdata            ),
  .mem_hwrite                  (ahb_sms0_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag0       ),
  .region_wr_deny_flag         (region_wr_deny_flag0       ),
  .sms_idle0                   (sms0_idle                  )
);
sms_bank_64k_top  x_sms1_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms1_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms1_hprot             ),
  .mem_hrdata                  (sms1_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms1_ahb_hready            ),
  .mem_hresp                   (sms1_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms1_hsel              ),
  .mem_hsize                   (ahb_sms1_hsize             ),
  .mem_htrans                  (ahb_sms1_htrans            ),
  .mem_hwdata                  (ahb_sms1_hwdata            ),
  .mem_hwrite                  (ahb_sms1_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag1       ),
  .region_wr_deny_flag         (region_wr_deny_flag1       ),
  .sms_idle0                   (sms1_idle                  )
);
sms_bank_64k_top  x_sms2_top (
  .big_endian_b                (sms_big_endian_b           ),
  .mem_haddr                   (ahb_sms2_haddr             ),
  .mem_hclk                    (pmu_sms_hclk               ),
  .mem_hprot                   (ahb_sms2_hprot             ),
  .mem_hrdata                  (sms2_ahb_hrdata            ),
  .mem_hready                  (1'b1                       ),
  .mem_hready_resp             (sms2_ahb_hready            ),
  .mem_hresp                   (sms2_ahb_hresp             ),
  .mem_hrst_b                  (pmu_sms_hrst_b             ),
  .mem_hsel                    (ahb_sms2_hsel              ),
  .mem_hsize                   (ahb_sms2_hsize             ),
  .mem_htrans                  (ahb_sms2_htrans            ),
  .mem_hwdata                  (ahb_sms2_hwdata            ),
  .mem_hwrite                  (ahb_sms2_hwrite            ),
  .region_rd_deny_flag         (region_rd_deny_flag2       ),
  .region_wr_deny_flag         (region_wr_deny_flag2       ),
  .sms_idle0                   (sms2_idle                  )
);
sms_bank_64k_top  x_isram_top (
  .big_endian_b                 (sms_big_endian_b            ),
  .mem_haddr                    (ahb_sms3_haddr              ),
  .mem_hclk                     (pmu_sms_hclk                ),
  .mem_hprot                    (ahb_sms3_hprot              ),
  .mem_hrdata                   (sms3_ahb_hrdata             ),
  .mem_hready                   (1'b1                        ),
  .mem_hready_resp              (sms3_ahb_hready             ),
  .mem_hresp                    (sms3_ahb_hresp              ),
  .mem_hrst_b                   (pmu_sms_hrst_b              ),
  .mem_hsel                     (ahb_sms3_hsel               ),
  .mem_hsize                    (ahb_sms3_hsize              ),
  .mem_htrans                   (ahb_sms3_htrans             ),
  .mem_hwdata                   (ahb_sms3_hwdata             ),
  .mem_hwrite                   (ahb_sms3_hwrite             ),
  .region_rd_deny_flag          (region_rd_deny_flag3        ),
  .region_wr_deny_flag          (region_wr_deny_flag3        ),
  .sms_idle0                    (sms3_idle                   )
);
assign region_rd_deny_flag0 = 1'b0;
assign region_rd_deny_flag1 = 1'b0;
assign region_rd_deny_flag2 = 1'b0;
assign region_rd_deny_flag3 = 1'b0;
assign region_wr_deny_flag0 = 1'b0;
assign region_wr_deny_flag1 = 1'b0;
assign region_wr_deny_flag2 = 1'b0;
assign region_wr_deny_flag3 = 1'b0;
endmodule
