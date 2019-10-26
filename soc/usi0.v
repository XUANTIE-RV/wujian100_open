/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define ADDR_USI_EN         12'h000 
`define ADDR_MODE_SEL       12'h004
`define ADDR_TX_FIFO        12'h008
`define ADDR_RX_FIFO        12'h008
`define ADDR_FIFO_STA       12'h00C
`define ADDR_CLK_DIV0       12'h010
`define ADDR_CLK_DIV1       12'h014
`define ADDR_UART_CTRL      12'h018
`define ADDR_UART_STA       12'h01C
`define ADDR_I2C_MODE       12'h020
`define ADDR_I2C_ADDR       12'h024
`define ADDR_I2CM_CTRL      12'h028
`define ADDR_I2CM_CODE      12'h02C
`define ADDR_I2CS_CTRL      12'h030
`define ADDR_I2C_FS_DIV     12'h034
`define ADDR_I2C_HOLD       12'h038
`define ADDR_I2C_STA        12'h03C
`define ADDR_SPI_MODE       12'h040
`define ADDR_SPI_CTRL       12'h044
`define ADDR_SPI_STA        12'h048
`define ADDR_INTR_CTRL      12'h04C
`define ADDR_INTR_EN        12'h050
`define ADDR_INTR_STA       12'h054
`define ADDR_RAW_INTR_STA   12'h058
`define ADDR_INTR_MASK      12'h05C
`define ADDR_INTR_CLR       12'h060
`define ADDR_DMA_CTRL       12'h064
`define ADDR_DMA_TH         12'h068
module apb_if(
  clk,
  clk_div0,
  cpha,
  cpol,
  fifo_intr_en,
  i2c_addr,
  i2c_aerr_clr,
  i2c_aerr_intr,
  i2c_en,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_mode,
  i2c_nack_clr,
  i2c_nack_intr,
  i2c_stop_clr,
  i2c_stop_intr,
  i2cm_amode,
  i2cm_code,
  i2cm_data,
  i2cm_en,
  i2cm_gcall,
  i2cm_hs,
  i2cm_lose_arbi_clr,
  i2cm_lose_arbi_intr,
  i2cm_sbyte,
  i2cm_stop,
  i2cm_work,
  i2cs_amode,
  i2cs_en,
  i2cs_gcall,
  i2cs_gcall_clr,
  i2cs_gcall_intr,
  i2cs_hs,
  i2cs_sbyte,
  i2cs_work,
  intr_edge,
  nss_toggle,
  paddr,
  penable,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  rx_data_cnt,
  rx_dma_en,
  rx_dma_th,
  rx_empty,
  rx_empty_clr,
  rx_empty_intr,
  rx_fifo_en,
  rx_fifo_th,
  rx_full,
  rx_full_clr,
  rx_full_intr,
  rx_rd_data,
  rx_read_err_clr,
  rx_read_err_intr,
  rx_ren,
  rx_thold_clr,
  rx_thold_intr,
  rx_write_err_clr,
  rx_write_err_intr,
  rxd_work,
  sdata_en,
  spi_data_size,
  spi_en,
  spi_intr_en,
  spi_rx_en,
  spi_stop_clr,
  spi_stop_intr,
  spi_tx_en,
  spi_work,
  spim_en,
  spis_en,
  tx_data_cnt,
  tx_dma_en,
  tx_dma_th,
  tx_empty,
  tx_empty_clr,
  tx_empty_intr,
  tx_fifo_en,
  tx_fifo_th,
  tx_full,
  tx_full_clr,
  tx_full_intr,
  tx_read_err_clr,
  tx_read_err_intr,
  tx_thold_clr,
  tx_thold_intr,
  tx_wen,
  tx_write_err_clr,
  tx_write_err_intr,
  txd_work,
  uart_dbit,
  uart_div,
  uart_en,
  uart_eps,
  uart_intr_en,
  uart_pbit,
  uart_pen,
  uart_perr_clr,
  uart_perr_intr,
  uart_stop_clr,
  uart_stop_intr,
  usi_ctrl,
  usi_intr,
  wr_clk_div
);
input           clk;                
input           i2c_aerr_intr;      
input           i2c_nack_intr;      
input           i2c_stop_intr;      
input           i2cm_data;          
input           i2cm_lose_arbi_intr; 
input           i2cm_work;          
input           i2cs_gcall_intr;    
input           i2cs_work;          
input   [31:0]  paddr;              
input           penable;            
input           psel;               
input   [31:0]  pwdata;             
input           pwrite;             
input           rst_n;              
input   [4 :0]  rx_data_cnt;        
input           rx_empty;           
input           rx_empty_intr;      
input           rx_full;            
input           rx_full_intr;       
input   [15:0]  rx_rd_data;         
input           rx_read_err_intr;   
input           rx_thold_intr;      
input           rx_write_err_intr;  
input           rxd_work;           
input           spi_stop_intr;      
input           spi_work;           
input   [4 :0]  tx_data_cnt;        
input           tx_empty;           
input           tx_empty_intr;      
input           tx_full;            
input           tx_full_intr;       
input           tx_read_err_intr;   
input           tx_thold_intr;      
input           tx_write_err_intr;  
input           txd_work;           
input           uart_perr_intr;     
input           uart_stop_intr;     
output  [23:0]  clk_div0;           
output          cpha;               
output          cpol;               
output  [9 :0]  fifo_intr_en;       
output  [9 :0]  i2c_addr;           
output          i2c_aerr_clr;       
output          i2c_en;             
output  [7 :0]  i2c_fs_div;         
output  [23:0]  i2c_hcnt;           
output  [7 :0]  i2c_hold;           
output  [4 :0]  i2c_intr_en;        
output  [23:0]  i2c_lcnt;           
output          i2c_mode;           
output          i2c_nack_clr;       
output          i2c_stop_clr;       
output          i2cm_amode;         
output  [2 :0]  i2cm_code;          
output          i2cm_en;            
output          i2cm_gcall;         
output          i2cm_hs;            
output          i2cm_lose_arbi_clr; 
output          i2cm_sbyte;         
output          i2cm_stop;          
output          i2cs_amode;         
output          i2cs_en;            
output          i2cs_gcall;         
output          i2cs_gcall_clr;     
output          i2cs_hs;            
output          i2cs_sbyte;         
output          intr_edge;          
output          nss_toggle;         
output  [31:0]  prdata;             
output          rx_dma_en;          
output  [4 :0]  rx_dma_th;          
output          rx_empty_clr;       
output          rx_fifo_en;         
output  [1 :0]  rx_fifo_th;         
output          rx_full_clr;        
output          rx_read_err_clr;    
output          rx_ren;             
output          rx_thold_clr;       
output          rx_write_err_clr;   
output          sdata_en;           
output  [3 :0]  spi_data_size;      
output          spi_en;             
output          spi_intr_en;        
output          spi_rx_en;          
output          spi_stop_clr;       
output          spi_tx_en;          
output          spim_en;            
output          spis_en;            
output          tx_dma_en;          
output  [4 :0]  tx_dma_th;          
output          tx_empty_clr;       
output          tx_fifo_en;         
output  [1 :0]  tx_fifo_th;         
output          tx_full_clr;        
output          tx_read_err_clr;    
output          tx_thold_clr;       
output          tx_wen;             
output          tx_write_err_clr;   
output  [1 :0]  uart_dbit;          
output  [23:0]  uart_div;           
output          uart_en;            
output          uart_eps;           
output  [1 :0]  uart_intr_en;       
output  [1 :0]  uart_pbit;          
output          uart_pen;           
output          uart_perr_clr;      
output          uart_stop_clr;      
output  [3 :0]  usi_ctrl;           
output          usi_intr;           
output          wr_clk_div;         
reg     [23:0]  clk_div0;           
reg     [23:0]  clk_div1;           
reg     [1 :0]  dma_ctrl;           
reg     [9 :0]  i2c_addr;           
reg             i2c_en;             
reg     [7 :0]  i2c_fs_div;         
reg     [7 :0]  i2c_hold;           
reg             i2c_mode;           
reg     [2 :0]  i2cm_code;          
reg     [4 :0]  i2cm_ctrl;          
reg             i2cm_en;            
reg             i2cs_ctrl;          
reg             i2cs_en;            
reg             intr_edge;          
reg     [17:0]  intr_en;            
reg     [17:0]  intr_mask;          
reg     [1 :0]  mode_sel;           
reg     [31:0]  prdata;             
reg     [4 :0]  rx_dma_th;          
reg     [1 :0]  rx_fifo_th;         
reg     [8 :0]  spi_ctrl;           
reg             spi_en;             
reg             spi_mode;           
reg             spim_en;            
reg             spis_en;            
reg     [4 :0]  tx_dma_th;          
reg     [1 :0]  tx_fifo_th;         
reg     [5 :0]  uart_ctrl;          
reg             uart_en;            
reg     [3 :0]  usi_ctrl;           
wire            apb_ren;            
wire            apb_wen;            
wire            clk;                
wire            cpha;               
wire            cpol;               
wire    [9 :0]  fifo_intr_en;       
wire            i2c_aerr_clr;       
wire            i2c_aerr_intr;      
wire    [23:0]  i2c_hcnt;           
wire    [4 :0]  i2c_intr_en;        
wire    [23:0]  i2c_lcnt;           
wire            i2c_nack_clr;       
wire            i2c_nack_intr;      
wire            i2c_stop_clr;       
wire            i2c_stop_intr;      
wire            i2cm_amode;         
wire            i2cm_data;          
wire            i2cm_gcall;         
wire            i2cm_hs;            
wire            i2cm_lose_arbi_clr; 
wire            i2cm_lose_arbi_intr; 
wire            i2cm_sbyte;         
wire            i2cm_stop;          
wire            i2cm_work;          
wire            i2cs_amode;         
wire            i2cs_gcall;         
wire            i2cs_gcall_clr;     
wire            i2cs_gcall_intr;    
wire            i2cs_hs;            
wire            i2cs_sbyte;         
wire            i2cs_work;          
wire            intr_clr;           
wire    [17:0]  intr_sta;           
wire            nss_toggle;         
wire    [31:0]  paddr;              
wire            penable;            
wire            psel;               
wire    [31:0]  pwdata;             
wire            pwrite;             
wire    [17:0]  raw_intr_sta;       
wire            rst_n;              
wire    [4 :0]  rx_data_cnt;        
wire            rx_dma_en;          
wire            rx_empty;           
wire            rx_empty_clr;       
wire            rx_empty_intr;      
wire            rx_fifo_en;         
wire            rx_full;            
wire            rx_full_clr;        
wire            rx_full_intr;       
wire    [15:0]  rx_rd_data;         
wire            rx_read_err_clr;    
wire            rx_read_err_intr;   
wire            rx_ren;             
wire            rx_thold_clr;       
wire            rx_thold_intr;      
wire            rx_write_err_clr;   
wire            rx_write_err_intr;  
wire            rxd_work;           
wire            sdata_en;           
wire    [3 :0]  spi_data_size;      
wire            spi_intr_en;        
wire            spi_rx_en;          
wire            spi_stop_clr;       
wire            spi_stop_intr;      
wire            spi_tx_en;          
wire            spi_work;           
wire    [4 :0]  tx_data_cnt;        
wire            tx_dma_en;          
wire            tx_empty;           
wire            tx_empty_clr;       
wire            tx_empty_intr;      
wire            tx_fifo_en;         
wire            tx_full;            
wire            tx_full_clr;        
wire            tx_full_intr;       
wire            tx_read_err_clr;    
wire            tx_read_err_intr;   
wire            tx_thold_clr;       
wire            tx_thold_intr;      
wire            tx_wen;             
wire            tx_write_err_clr;   
wire            tx_write_err_intr;  
wire            txd_work;           
wire    [1 :0]  uart_dbit;          
wire    [23:0]  uart_div;           
wire            uart_eps;           
wire    [1 :0]  uart_intr_en;       
wire    [1 :0]  uart_pbit;          
wire            uart_pen;           
wire            uart_perr_clr;      
wire            uart_perr_intr;     
wire            uart_stop_clr;      
wire            uart_stop_intr;     
wire            usi_intr;           
wire            wr_clk_div;         
parameter TP = 0;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        prdata[31:0]    <= 32'd0;
    else if(apb_ren)
    case(paddr[11:0])
        `ADDR_USI_EN        : prdata[31:0] <= {28'd0, usi_ctrl[3:0]};
        `ADDR_MODE_SEL      : prdata[31:0] <= {30'd0, mode_sel[1:0]};
        `ADDR_RX_FIFO       : prdata[31:0] <= {16'd0, rx_rd_data[15:0]};
        `ADDR_FIFO_STA      : prdata[31:0] <= {11'd0, rx_data_cnt[4:0], 3'd0, tx_data_cnt[4:0], 4'd0, 
                                              rx_full, rx_empty, tx_full, tx_empty};
        `ADDR_CLK_DIV0      : prdata[31:0] <= {8'd0, clk_div0[23:0]};
        `ADDR_CLK_DIV1      : prdata[31:0] <= {8'd0, clk_div1[23:0]};
        `ADDR_UART_CTRL     : prdata[31:0] <= {26'd0, uart_ctrl[5:0]};
        `ADDR_UART_STA      : prdata[31:0] <= {30'd0, rxd_work, txd_work};
        `ADDR_I2C_MODE      : prdata[31:0] <= {31'd0, i2c_mode};
        `ADDR_I2C_ADDR      : prdata[31:0] <= {22'd0, i2c_addr[9:0]};
        `ADDR_I2CM_CTRL     : prdata[31:0] <= {27'd0, i2cm_ctrl[4:0]};
        `ADDR_I2CM_CODE     : prdata[31:0] <= {29'd0, i2cm_code[2:0]};
        `ADDR_I2CS_CTRL     : prdata[31:0] <= {31'd0, i2cs_ctrl};
        `ADDR_I2C_FS_DIV    : prdata[31:0] <= {24'd0, i2c_fs_div[7:0]};
        `ADDR_I2C_HOLD      : prdata[31:0] <= {24'd0, i2c_hold[7:0]};
        `ADDR_I2C_STA       : prdata[31:0] <= {23'd0, i2cs_work, 6'd0, i2cm_data, i2cm_work};
        `ADDR_SPI_MODE      : prdata[31:0] <= {31'd0, spi_mode};
        `ADDR_SPI_CTRL      : prdata[31:0] <= {23'd0, spi_ctrl[8:0]};
        `ADDR_SPI_STA       : prdata[31:0] <= {31'd0, spi_work};
        `ADDR_INTR_CTRL     : prdata[31:0] <= {15'd0, intr_edge, 6'd0, rx_fifo_th[1:0], 6'd0, tx_fifo_th[1:0]};
        `ADDR_INTR_EN       : prdata[31:0] <= {14'd0, intr_en[17:0]};
        `ADDR_INTR_STA      : prdata[31:0] <= {14'd0, intr_sta};
        `ADDR_RAW_INTR_STA  : prdata[31:0] <= {14'd0, raw_intr_sta};
        `ADDR_INTR_MASK     : prdata[31:0] <= {14'd0, intr_mask};
        `ADDR_DMA_CTRL      : prdata[31:0] <= {30'd0, dma_ctrl[1:0]};
        `ADDR_DMA_TH        : prdata[31:0] <= {19'd0, rx_dma_th[4:0], 3'd0, tx_dma_th[4:0]};
        default             : prdata[31:0] <= 32'd0;
    endcase
end
assign  raw_intr_sta[17:0] =   {spi_stop_intr,          
                                i2c_aerr_intr,
                                i2cs_gcall_intr, 
                                i2cm_lose_arbi_intr,
                                i2c_nack_intr,
                                i2c_stop_intr,          
                                uart_perr_intr,
                                uart_stop_intr,         
                                rx_write_err_intr,
                                rx_read_err_intr,
                                rx_full_intr,
                                rx_empty_intr,
                                rx_thold_intr,          
                                tx_write_err_intr,
                                tx_read_err_intr,
                                tx_full_intr, 
                                tx_empty_intr,
                                tx_thold_intr           
                                };
assign  intr_sta[17:0]  = raw_intr_sta[17:0] & intr_mask[17:0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        usi_ctrl[3:0]   <= 4'b0;
        mode_sel[1:0]   <= 2'b00;
        clk_div0[23:0]  <= 24'h20;
        clk_div1[23:0]  <= 24'h30;
        uart_ctrl[5:0]  <= 6'b000011;
        i2c_mode        <= 1'b1;
        i2c_addr[9:0]   <= 10'h133;
        i2cm_ctrl[4:0]  <= 5'd0;
        i2cm_code[2:0]  <= 3'b001;
        i2cs_ctrl       <= 1'd0;
        i2c_fs_div[7:0] <= 8'd5;
        i2c_hold[7:0]   <= 8'd5;
        spi_mode        <= 1'b1;
        spi_ctrl[8:0]   <= 9'd7;
        intr_edge       <= 1'b0;
        tx_fifo_th[1:0]  <= 2'b01;
        rx_fifo_th[1:0]  <= 2'b01;
        intr_en[17:0]   <= 18'd0;
        intr_mask[17:0] <= 18'd0;
        dma_ctrl[1:0]   <= 2'b00;
        rx_dma_th[4:0]  <= 5'd8;
        tx_dma_th[4:0]  <= 5'd8;
    end
    else
    begin
        if(apb_wen && (paddr[11:0] == `ADDR_USI_EN)) 
            usi_ctrl       <= pwdata[3:0];
        if(apb_wen && (paddr[11:0] == `ADDR_MODE_SEL)) 
            mode_sel[1:0] <= pwdata[1:0];
        if(apb_wen && (paddr[11:0] == `ADDR_CLK_DIV0)) 
            clk_div0[23:0] <= pwdata[23:0];
        if(apb_wen && (paddr[11:0] == `ADDR_CLK_DIV1)) 
            clk_div1[23:0] <= pwdata[23:0]; 
        if(apb_wen && (paddr[11:0] == `ADDR_UART_CTRL)) 
            uart_ctrl[5:0]   <= pwdata[5:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_MODE)) 
            i2c_mode         <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_ADDR)) 
            i2c_addr[9:0]    <= pwdata[9:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CM_CTRL)) 
            i2cm_ctrl[4:0]   <= pwdata[4:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CM_CODE)) 
            i2cm_code[2:0]   <= pwdata[2:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2CS_CTRL)) 
            i2cs_ctrl     <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_HOLD)) 
            i2c_hold[7:0]   <= pwdata[7:0];
        if(apb_wen && (paddr[11:0] == `ADDR_I2C_FS_DIV)) 
            i2c_fs_div[7:0]   <= pwdata[7:0];
        if(apb_wen && (paddr[11:0] == `ADDR_SPI_MODE)) 
            spi_mode        <= pwdata[0];
        if(apb_wen && (paddr[11:0] == `ADDR_SPI_CTRL)) 
            spi_ctrl[8:0]    <= pwdata[8:0];
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_CTRL))
        begin
            intr_edge        <= pwdata[16];
            rx_fifo_th[1:0]  <= pwdata[9:8];
            tx_fifo_th[1:0]  <= pwdata[1:0];
        end
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_EN))
            intr_en[17:0]   <= pwdata[17:0];
        if(apb_wen && (paddr[11:0] == `ADDR_INTR_MASK))
            intr_mask[17:0] <= pwdata[17:0];
        if(apb_wen && (paddr[11:0] == `ADDR_DMA_CTRL))
            dma_ctrl[1:0]   <= pwdata[1:0];
        if(apb_wen && (paddr[11:0] == `ADDR_DMA_TH))
        begin
            rx_dma_th[4:0]  <= pwdata[12:8];
            tx_dma_th[4:0]  <= pwdata[4:0];
        end
    end
end
assign  # TP apb_wen = psel & pwrite & (~penable);
assign  #TP  apb_ren = psel & (~pwrite) & (~penable);
assign  intr_clr = apb_wen & (paddr[11:0] == `ADDR_INTR_CLR);
assign  spi_stop_clr        = intr_clr & pwdata[17];
assign  i2c_aerr_clr        = intr_clr & pwdata[16];
assign  i2cs_gcall_clr      = intr_clr & pwdata[15];
assign  i2cm_lose_arbi_clr  = intr_clr & pwdata[14];
assign  i2c_nack_clr        = intr_clr & pwdata[13];
assign  i2c_stop_clr        = intr_clr & pwdata[12];
assign  uart_perr_clr       = intr_clr & pwdata[11];
assign  uart_stop_clr       = intr_clr & pwdata[10];
assign  rx_write_err_clr    = intr_clr & pwdata[9];
assign  rx_read_err_clr     = intr_clr & pwdata[8];
assign  rx_full_clr         = intr_clr & pwdata[7];
assign  rx_empty_clr        = intr_clr & pwdata[6];
assign  rx_thold_clr        = intr_clr & pwdata[5];
assign  tx_write_err_clr    = intr_clr & pwdata[4];
assign  tx_read_err_clr     = intr_clr & pwdata[3];
assign  tx_full_clr         = intr_clr & pwdata[2];
assign  tx_empty_clr        = intr_clr & pwdata[1];
assign  tx_thold_clr        = intr_clr & pwdata[0];
assign  wr_clk_div = apb_wen & ((paddr[11:0] == `ADDR_CLK_DIV0) | (paddr[11:0] == `ADDR_CLK_DIV1));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        uart_en <= 1'b0;
        i2c_en  <= 1'b0;
        spi_en  <= 1'b0;
        i2cm_en <= 1'b0;
        i2cs_en <= 1'b0;
        spim_en <= 1'b0;
        spis_en <= 1'b0;
    end
    else
    begin
        uart_en <= usi_ctrl[0] & usi_ctrl[1] & (mode_sel == 2'b00);
        i2c_en  <= usi_ctrl[1] & usi_ctrl[0] & (mode_sel == 2'b01);
        spi_en  <= usi_ctrl[1] & usi_ctrl[0] & (mode_sel == 2'b10);
        i2cm_en <= i2c_en & i2c_mode;
        i2cs_en <= i2c_en & ~i2c_mode;
        spim_en <= spi_en & spi_mode;
        spis_en <= spi_en & ~spi_mode;
    end
end
assign  sdata_en   = usi_ctrl[1] & usi_ctrl[0];
assign  rx_fifo_en = usi_ctrl[0] & usi_ctrl[3];
assign  tx_fifo_en = usi_ctrl[0] & usi_ctrl[2];
assign  uart_dbit[1:0]  = uart_ctrl[1:0];
assign  uart_pbit[1:0]  = uart_ctrl[3:2];
assign  uart_pen        = uart_ctrl[4];
assign  uart_eps        = uart_ctrl[5];
assign  uart_div[23:0]  = clk_div0[23:0];
assign  i2cm_gcall   = i2cm_ctrl[4];
assign  i2cm_sbyte   = i2cm_ctrl[3];
assign  i2cm_hs      = i2cm_ctrl[2];
assign  i2cm_stop    = i2cm_ctrl[1];
assign  i2cm_amode   = i2cm_ctrl[0];
assign  i2cs_sbyte  = 1'b0;
assign  i2cs_hs     = 1'b0;
assign  i2cs_gcall  = i2cs_ctrl;
assign  i2cs_amode  = 1'b0;
assign  i2c_hcnt[23:0] = clk_div0[23:0];
assign  i2c_lcnt[23:0] = clk_div1[23:0];
assign  spi_data_size[3:0] = (spi_ctrl[3:0] < 4'd3) ? 4'd7 : spi_ctrl[3:0];
assign  cpol    = spi_ctrl[7];
assign  cpha    = spi_ctrl[6];
assign  spi_tx_en = ~spi_ctrl[5] & usi_ctrl[0];
assign  spi_rx_en = ~spi_ctrl[4] & usi_ctrl[0];
assign  nss_toggle = spi_ctrl[8];
assign  tx_wen  = (apb_wen & (paddr[11:0] == `ADDR_TX_FIFO));
assign  rx_ren  = (apb_ren & (paddr[11:0] == `ADDR_RX_FIFO));
assign  usi_intr = |intr_sta[17:0];
assign  spi_intr_en = intr_en[17];
assign  i2c_intr_en[4:0] = intr_en[16:12];
assign  uart_intr_en[1:0] = intr_en[11:10];
assign  fifo_intr_en[9:0] = intr_en[9:0];
assign  rx_dma_en = dma_ctrl[1];
assign  tx_dma_en = dma_ctrl[0];
endmodule
module i2cm(
  clk,
  f_scl,
  f_scl_d,
  i2c_addr,
  i2c_aerr_clr,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_nack_clr,
  i2c_stop_clr,
  i2cm_aerr_intr,
  i2cm_amode,
  i2cm_code,
  i2cm_data,
  i2cm_en,
  i2cm_gcall,
  i2cm_hs,
  i2cm_lose_arbi_clr,
  i2cm_lose_arbi_intr,
  i2cm_nack_intr,
  i2cm_rx,
  i2cm_rx_wen,
  i2cm_sbyte,
  i2cm_stop,
  i2cm_stop_intr,
  i2cm_tx_ren,
  i2cm_work,
  i_scl_in,
  i_sda_in,
  r_scl,
  r_scl_d,
  rst_n,
  scl_out,
  sda_out,
  start_flag,
  stop_flag,
  tx_empty,
  tx_empty_d,
  tx_rd_data,
  wr_clk_div
);
input           clk;                
input           f_scl;              
input   [0 :0]  f_scl_d;            
input   [9 :0]  i2c_addr;           
input           i2c_aerr_clr;       
input   [7 :0]  i2c_fs_div;         
input   [23:0]  i2c_hcnt;           
input   [7 :0]  i2c_hold;           
input   [4 :0]  i2c_intr_en;        
input   [23:0]  i2c_lcnt;           
input           i2c_nack_clr;       
input           i2c_stop_clr;       
input           i2cm_amode;         
input   [2 :0]  i2cm_code;          
input           i2cm_en;            
input           i2cm_gcall;         
input           i2cm_hs;            
input           i2cm_lose_arbi_clr; 
input           i2cm_sbyte;         
input           i2cm_stop;          
input           i_scl_in;           
input           i_sda_in;           
input           r_scl;              
input   [1 :1]  r_scl_d;            
input           rst_n;              
input           start_flag;         
input           stop_flag;          
input           tx_empty;           
input           tx_empty_d;         
input   [9 :0]  tx_rd_data;         
input           wr_clk_div;         
output          i2cm_aerr_intr;     
output          i2cm_data;          
output          i2cm_lose_arbi_intr; 
output          i2cm_nack_intr;     
output  [7 :0]  i2cm_rx;            
output          i2cm_rx_wen;        
output          i2cm_stop_intr;     
output          i2cm_tx_ren;        
output          i2cm_work;          
output          scl_out;            
output          sda_out;            
reg             addr0_sda;          
reg             addr1_sda;          
reg     [23:0]  bit_cnt;            
reg     [3 :0]  byte_cnt;           
reg             data_sda;           
reg     [7 :0]  hold_cnt;           
reg             hsm_flag;           
reg             i2c_busy;           
reg     [7 :0]  i2c_fscnt;          
reg             i2c_sflag;          
reg             i2cm_aerr_intr;     
reg     [2 :0]  i2cm_fsm;           
reg             i2cm_lose_arbi_intr; 
reg             i2cm_nack_intr;     
reg     [7 :0]  i2cm_rx;            
reg             i2cm_rx_wen;        
reg             i2cm_sflag;         
reg             i2cm_stop_d;        
reg             i2cm_stop_intr;     
reg             lose_arbi;          
reg             nack;               
reg             nack_d;             
reg     [23:0]  nxt_bcnt;           
reg     [3 :0]  nxt_bycnt;          
reg     [2 :0]  nxt_i2cm_fsm;       
reg             nxt_scl;            
reg             nxt_sda;            
reg             rw_flag;            
reg             sbyte_flag;         
reg             scl_out;            
reg             sda_out;            
reg             spec_hsmc;          
reg             spec_sbyte;         
reg             sr_flag;            
wire            a0_hs_byeq0;        
wire            a0_scl_clr;         
wire            addr0_end;          
wire            addr1_end;          
wire            addr1_to_sr;        
wire            addr_arbi;          
wire            addr_bcnt_plus;     
wire            arbi_en;            
wire            bcnt_clr;           
wire            bcnt_eq0;           
wire            bcnt_eq4;           
wire            bcnt_eqh;           
wire            bcnt_eql;           
wire            bcnt_plus_hs;       
wire            bycnt_eq0;          
wire            bycnt_eq1;          
wire            bycnt_eq2;          
wire            bycnt_eq3;          
wire            bycnt_eq7;          
wire            bycnt_eq8;          
wire            bycnt_plus;         
wire            clk;                
wire            data_arbi;          
wire            data_bcnt_plus;     
wire            data_by_eq0;        
wire            data_bycnt_clr;     
wire            data_end;           
wire            data_end_1;         
wire            data_end_2;         
wire            data_end_3;         
wire            f_empty;            
wire            f_scl;              
wire    [0 :0]  f_scl_d;            
wire            fscnt_clr;          
wire            fscnt_clr1;         
wire            fscnt_clr2;         
wire            fscnt_plus;         
wire            fscnt_plus_spec;    
wire            fscnt_plus_star;    
wire            hold_clr;           
wire            hold_eq;            
wire            hold_eq0;           
wire            hold_plus;          
wire            hold_plus_0;        
wire            hold_plus_1;        
wire            hs_mode;            
wire    [9 :0]  i2c_addr;           
wire            i2c_aerr_clr;       
wire    [7 :0]  i2c_fs_div;         
wire            i2c_fscnt_eq;       
wire    [23:0]  i2c_hcnt;           
wire    [7 :0]  i2c_hold;           
wire    [4 :0]  i2c_intr_en;        
wire    [23:0]  i2c_lcnt;           
wire            i2c_nack_clr;       
wire            i2c_stop_clr;       
wire            i2cm_aerr;          
wire            i2cm_amode;         
wire    [2 :0]  i2cm_code;          
wire            i2cm_data;          
wire            i2cm_en;            
wire            i2cm_gcall;         
wire            i2cm_hs;            
wire            i2cm_lose_arbi_clr; 
wire            i2cm_sbyte;         
wire            i2cm_stop;          
wire            i2cm_tx_ren;        
wire            i2cm_work;          
wire            i_scl_in;           
wire            i_sda_in;           
wire            idle_end;           
wire            r_nack;             
wire            r_scl;              
wire    [1 :1]  r_scl_d;            
wire            re_nack;            
wire            restart_end;        
wire            rst_n;              
wire            set_sr_flag;        
wire            special_end;        
wire            sta_addr0;          
wire            sta_addr1;          
wire            sta_data;           
wire            sta_idle;           
wire            sta_restart;        
wire            sta_special;        
wire            sta_start;          
wire            sta_stop;           
wire            start_end;          
wire            start_flag;         
wire            stop_end;           
wire            stop_flag;          
wire            to_restart;         
wire            tx_empty;           
wire            tx_empty_d;         
wire            tx_empty_stop;      
wire            tx_juedge;          
wire    [9 :0]  tx_rd_data;         
wire            wr_clk_div;         
parameter   I2CM_IDLE    = 3'b000,
            I2CM_START   = 3'b001,
            I2CM_SPECIAL = 3'b011,
            I2CM_RESTART = 3'b010,
            I2CM_ADDR0   = 3'b110,
            I2CM_ADDR1   = 3'b111,
            I2CM_DATA    = 3'b101,
            I2CM_STOP    = 3'b100;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_fsm[2:0] <= I2CM_IDLE;
    else if(~i2cm_en || i2cm_aerr)
        i2cm_fsm[2:0] <= I2CM_IDLE;
    else
        i2cm_fsm[2:0] <= nxt_i2cm_fsm[2:0];
end
always @( nack
       or hsm_flag
       or data_end
       or i2cm_amode
       or stop_flag
       or stop_end
       or i2cm_hs
       or sbyte_flag
       or start_end
       or special_end
       or start_flag
       or idle_end
       or i2cm_sflag
       or to_restart
       or sr_flag
       or addr1_to_sr
       or restart_end
       or addr1_end
       or addr0_end
       or i2cm_sbyte
       or i2cm_fsm[2:0]
       or lose_arbi)
begin
    case(i2cm_fsm[2:0])
        I2CM_IDLE    :
        begin
            if(idle_end)
                nxt_i2cm_fsm[2:0] = I2CM_START;
            else
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
        end        
        I2CM_START   :
        begin
            if(start_end && ~i2cm_sflag)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else if(start_end)
                if(i2cm_sbyte || i2cm_hs)
                    nxt_i2cm_fsm[2:0] = I2CM_SPECIAL;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
            else
                nxt_i2cm_fsm[2:0] = I2CM_START;
        end
        I2CM_SPECIAL :
        begin
            if(special_end)
                if(lose_arbi)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(i2cm_hs && i2cm_sbyte && sbyte_flag && ~hsm_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_START;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
            else
                nxt_i2cm_fsm[2:0] = I2CM_SPECIAL;
        end
        I2CM_RESTART:
        begin
            if((restart_end && ~i2cm_sflag) || stop_flag)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else if(restart_end)
                nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
            else
                nxt_i2cm_fsm[2:0] = I2CM_RESTART;
        end
        I2CM_ADDR0   :
        begin
            if(addr0_end)
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(nack)
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
                else if(sr_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
                else if(i2cm_amode)
                    nxt_i2cm_fsm[2:0] = I2CM_ADDR1;
                else 
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
            else
                nxt_i2cm_fsm[2:0] = I2CM_ADDR0;
        end
        I2CM_ADDR1   :
        begin
            if(addr1_end)
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(nack)
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
                else if(addr1_to_sr)
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_DATA;
            else
                nxt_i2cm_fsm[2:0] = I2CM_ADDR1;
        end
        I2CM_DATA    :
        begin
            if(data_end)
            begin
                if(lose_arbi || start_flag || stop_flag)
                    nxt_i2cm_fsm[2:0] = I2CM_IDLE;
                else if(to_restart)
                    nxt_i2cm_fsm[2:0] = I2CM_RESTART;
                else
                    nxt_i2cm_fsm[2:0] = I2CM_STOP;
            end
            else
                nxt_i2cm_fsm[2:0] = I2CM_DATA;
        end
        I2CM_STOP    :
        begin
            if(stop_end)
                nxt_i2cm_fsm[2:0] = I2CM_IDLE;
            else
                nxt_i2cm_fsm[2:0] = I2CM_STOP;
        end
        default:
        begin
            nxt_i2cm_fsm[2:0] = I2CM_IDLE;
        end
    endcase
end
assign  sta_idle    = (i2cm_fsm[2:0] == I2CM_IDLE);
assign  sta_start   = (i2cm_fsm[2:0] == I2CM_START);
assign  sta_restart = (i2cm_fsm[2:0] == I2CM_RESTART);
assign  sta_stop    = (i2cm_fsm[2:0] == I2CM_STOP);
assign  sta_special = (i2cm_fsm[2:0] == I2CM_SPECIAL);
assign  sta_addr0   = (i2cm_fsm[2:0] == I2CM_ADDR0);
assign  sta_addr1   = (i2cm_fsm[2:0] == I2CM_ADDR1);
assign  sta_data    = (i2cm_fsm[2:0] == I2CM_DATA);
always @( spec_hsmc
       or bycnt_eq0
       or hsm_flag
       or data_by_eq0
       or f_empty
       or bycnt_eq1
       or f_scl
       or bycnt_plus
       or tx_empty
       or stop_end
       or start_end
       or i_scl_in
       or i2c_fs_div[7:0]
       or bycnt_eq2
       or addr_bcnt_plus
       or restart_end
       or addr1_end
       or data_sda
       or bcnt_eqh
       or bcnt_clr
       or scl_out
       or tx_juedge
       or data_end
       or spec_sbyte
       or byte_cnt[3:0]
       or a0_scl_clr
       or data_bycnt_clr
       or addr1_sda
       or hold_eq
       or bit_cnt[23:0]
       or data_bcnt_plus
       or bcnt_eq0
       or addr0_sda
       or bcnt_eql
       or i2cm_hs
       or bycnt_eq3
       or i2c_hcnt[23:0]
       or sbyte_flag
       or i2c_fscnt[7:0]
       or special_end
       or idle_end
       or bycnt_eq8
       or f_scl_d[0]
       or i2c_fscnt_eq
       or r_scl
       or sda_out
       or i2cm_sbyte
       or addr0_end
       or bcnt_eq4
       or i_sda_in
       or i2cm_fsm[2:0])
begin
    case(i2cm_fsm[2:0])
        I2CM_IDLE:
        begin
            nxt_scl = 1'b1;
            nxt_sda = 1'b1;
            if(bcnt_eqh || idle_end || (~i_scl_in || ~i_sda_in))
                nxt_bcnt[23:0] = 24'd0;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            if(idle_end || (~i_scl_in || ~i_sda_in))
                nxt_bycnt[3:0]  = 4'd0;
            else if(bcnt_eqh)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_START:
        begin
            if(bycnt_eq3 | start_end) 
                nxt_scl = 1'b0;
            else if(bycnt_eq1) 
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq2)
                nxt_sda = 1'b0;
            else if(bycnt_eq0)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || start_end)
                nxt_bcnt[23:0]  = 24'd0;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            if(start_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if((i2cm_hs || i2cm_sbyte) ? 
                    ((bit_cnt[23:0] == i2c_hcnt[23:0]) && i2c_fscnt_eq) : 
                    bcnt_eqh)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[2:0];
        end
        I2CM_SPECIAL:
        begin
            if(hold_eq)
                case({i2cm_hs, i2cm_sbyte}) // synopsys parallel_case
                    2'b00,2'b01: nxt_sda = spec_sbyte;
                    2'b10:  nxt_sda = spec_hsmc;
                    2'b11:
                        if(sbyte_flag == 1'b0)
                            nxt_sda = spec_sbyte;
                        else if(hsm_flag == 1'b0)
                            nxt_sda = spec_hsmc;
                        else
                            nxt_sda = spec_sbyte;
                endcase
            else
                nxt_sda = sda_out;
            if(((i2c_fscnt[7:0] == i2c_fs_div[7:0]) && bcnt_eqh) || f_scl)
                nxt_scl = 1'b0;
            else if((i2c_fscnt[7:0] == i2c_fs_div[7:0]) && (bcnt_eql && ~scl_out))
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bcnt_eqh || bcnt_eql || f_scl || special_end)
                nxt_bcnt[23:0] = 24'd0;
            else if(r_scl || f_scl_d[0] || (i2c_fscnt[7:0] != 8'd0) || ~bcnt_eq0)
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0];
            if(special_end || (bycnt_eq8 && f_scl))
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(f_scl)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end 
        I2CM_RESTART:
        begin
            if(bycnt_eq3 || bycnt_eq0 || restart_end) 
                nxt_scl = 1'b0;
            else if(bycnt_eq1 || bycnt_eq2)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq0)
                nxt_sda = 1'b1;
            else if(bycnt_eq2)
                nxt_sda = 1'b0;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || restart_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(bycnt_eq0 || r_scl || bycnt_eq2 || ~bcnt_eq0)
                nxt_bcnt[23:0] = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0] = bit_cnt[23:0];
            if(restart_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bit_cnt[23:0] == i2c_hcnt[23:0])
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_ADDR0:
        begin
            if(a0_scl_clr)      
                nxt_scl = 1'b0;
            else if(bcnt_eql)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq)
                nxt_sda = addr0_sda;
            else
                nxt_sda = sda_out;
            if(addr0_end || bcnt_clr)
                nxt_bcnt[23:0]  = 24'd0;
            else if(addr_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(addr0_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_ADDR1:
        begin
            if(bcnt_eqh || f_scl)
                nxt_scl = 1'b0;
            else if(bcnt_eql && ~scl_out)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq)
                nxt_sda = addr1_sda;
            else
                nxt_sda = sda_out;
            if(bcnt_clr || addr1_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(addr_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(addr1_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_DATA:
        begin
            if(bcnt_eqh || f_scl)
                nxt_scl = 1'b0;
            else if(bcnt_eql && ~scl_out)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(hold_eq || (data_by_eq0 && f_empty))
                if(tx_empty)
                    nxt_sda = sda_out;
                else
                    nxt_sda = data_sda;
            else if(tx_juedge)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if(bcnt_clr || data_end)
                nxt_bcnt[23:0]  = 24'd0;
            else if(data_bcnt_plus || ~bcnt_eq0)
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0];
            if(data_end || data_bycnt_clr)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq8)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bycnt_plus)
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        I2CM_STOP:    
        begin
            if(bycnt_eq1)
                nxt_scl = 1'b1;
            else
                nxt_scl = scl_out;
            if(bycnt_eq0 && bcnt_eq4)
                nxt_sda = 1'b0;
            else if(bycnt_eq2)
                nxt_sda = 1'b1;
            else
                nxt_sda = sda_out;
            if((bit_cnt[23:0] == i2c_hcnt[23:0]) || stop_end)
                nxt_bcnt[23:0]  = 24'd0;
            else
                nxt_bcnt[23:0]  = bit_cnt[23:0] + 24'd1;
            if(stop_end)
                nxt_bycnt[3:0]  = 4'd0;
            else if(bycnt_eq3)
                nxt_bycnt[3:0]  = byte_cnt[3:0];
            else if(bit_cnt[23:0] == i2c_hcnt[23:0])
                nxt_bycnt[3:0]  = byte_cnt[3:0] + 4'd1;
            else
                nxt_bycnt[3:0]  = byte_cnt[3:0];
        end
        default:
        begin
            nxt_scl = 1'b1;
            nxt_sda = 1'b1;
            nxt_bcnt = 24'd0;
            nxt_bycnt = 4'd0;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        scl_out     <= 1'b1;
        sda_out     <= 1'b1;
        bit_cnt[23:0]   <= 24'd0;
        byte_cnt[3:0]   <= 4'd0;
    end
    else
    begin
        scl_out     <= nxt_scl;
        if(lose_arbi && hold_eq)
            sda_out <= 1'b1;
        else
            sda_out <= nxt_sda;
        if(wr_clk_div)
            bit_cnt[23:0]   <= 24'd0;
        else
            bit_cnt[23:0]   <= nxt_bcnt[23:0];
        byte_cnt[3:0]   <= nxt_bycnt[3:0];
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_stop_d <= 1'b0;
    else
        i2cm_stop_d <= i2cm_stop;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sr_flag         <= 1'b0;
        rw_flag         <= 1'b0;
    end
    else if(sta_idle)
    begin
        sr_flag <= 1'b0;
        rw_flag <= 1'b0;
    end
    else
    begin
        if((addr0_end && sr_flag) || stop_end)
            sr_flag <= 1'b0;
        else if(set_sr_flag)
            sr_flag <= 1'b1;
        if(sta_addr0 && bycnt_eq7 && r_scl_d[1])
            rw_flag <= sda_out;
    end
end
assign  set_sr_flag = tx_rd_data[8] & ~rw_flag & (data_end | addr1_end);
assign  special_end = sta_special && bycnt_eq8 && f_scl;
assign  idle_end    = sta_idle & ~tx_empty & ~i2c_busy;
assign  start_end   = sta_start & i2cm_sflag & f_scl;
assign  restart_end = sta_restart & i2cm_sflag& f_scl;
assign  addr0_end   = sta_addr0 & bycnt_eq8 & (i2cm_hs ? bcnt_eqh : f_scl);
assign  addr1_end   = sta_addr1 & bycnt_eq8 & (i2cm_hs ? bcnt_eqh : f_scl);
assign  data_end_1 = sta_data & bycnt_eq8 & bycnt_plus &
            ((re_nack & rw_flag) |  
             (nack & ~rw_flag) |    
             to_restart |           
             lose_arbi |            
             tx_empty_stop);        
assign  data_end_2 = sta_data & bycnt_eq0 & (i2cm_stop & ~i2cm_stop_d) & tx_empty;
assign  data_end_3 = sta_data & bycnt_eq0 & (tx_empty_d & ~tx_empty) & rw_flag;
assign  data_end   = data_end_3 | data_end_2 | data_end_1;
assign  stop_end    = sta_stop & bycnt_eq3;
assign  to_restart  = (i2cm_gcall & ~i2cm_amode) ? 1'b0 :       
                      ((~tx_empty & (tx_rd_data[9] | (tx_rd_data[8] & ~rw_flag) |
                      (~tx_rd_data[8] & rw_flag & re_nack))) | data_end_3);
assign  tx_empty_stop = tx_empty & i2cm_stop & ~rw_flag;
assign  addr1_to_sr = ~tx_empty & ((tx_rd_data[8] & ~rw_flag) |
                      (~tx_rd_data[8] & rw_flag & re_nack));
assign  bcnt_eql    = (bit_cnt == i2c_lcnt[23:0]) & ~scl_out;
assign  bcnt_eqh    = (bit_cnt == i2c_hcnt[23:0]) & scl_out; 
assign  bcnt_eq0    = (bit_cnt == 24'd0);
assign  bcnt_eq4    = (bit_cnt == 24'd4);
assign  bcnt_clr    = bcnt_eql | bcnt_eqh | (~i2cm_hs & f_scl);
assign  data_by_eq0 = bycnt_eq0 & sta_data;
assign  tx_juedge   = (data_by_eq0 & tx_empty);
assign  addr_bcnt_plus  = i2cm_hs ? bcnt_plus_hs : (r_scl | f_scl_d[0]);
assign  a0_scl_clr  = i2cm_hs ? bcnt_eqh : (bcnt_eqh | f_scl);
assign  data_bcnt_plus  = 
            (bycnt_eq0 & ~i2cm_stop & tx_empty) ? 1'b0 :  
            (bycnt_eq0 & f_empty) ? 1'b1 :                
            i2cm_hs ? bcnt_plus_hs :                      
            (r_scl | f_scl_d[0]);                         
assign  bcnt_plus_hs = (bycnt_eq0 & scl_out) ? r_scl : 1'b1;
assign  data_bycnt_clr = i2cm_hs ? (bycnt_eq8 & bcnt_eqh) : (bycnt_eq8 & f_scl);
assign  bycnt_plus  = i2cm_hs ? bcnt_eqh : f_scl;
assign  bycnt_eq0   = (byte_cnt == 4'd0);
assign  bycnt_eq1   = (byte_cnt == 4'd1);
assign  bycnt_eq2   = (byte_cnt == 4'd2);
assign  bycnt_eq3   = (byte_cnt == 4'd3);
assign  bycnt_eq7   = (byte_cnt == 4'd7);
assign  bycnt_eq8   = (byte_cnt == 4'd8);
always @( i2cm_amode
       or re_nack
       or tx_rd_data[8:0]
       or i2cm_code[2:0]
       or byte_cnt[3:0]
       or rw_flag
       or i2c_addr[9:0]
       or i2cm_gcall
       or sr_flag)
begin
    case(byte_cnt[3:0])
        4'd0:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[6]);
            addr1_sda    = i2c_addr[7];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[7];
        end
        4'd1:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[5]);
            addr1_sda    = i2c_addr[6];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[6];
        end
        4'd2:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[4]);
            addr1_sda    = i2c_addr[5];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[5];
        end
        4'd3:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b0;
            addr0_sda    = i2cm_amode ? 1'b1 : (i2cm_gcall ? 1'b0 : i2c_addr[3]);
            addr1_sda    = i2c_addr[4];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[4];
        end
        4'd4:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = 1'b1;
            addr0_sda    = i2cm_amode ? 1'b0 : (i2cm_gcall ? 1'b0 : i2c_addr[2]);
            addr1_sda    = i2c_addr[3];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[3];
        end
        4'd5:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = i2cm_code[2];
            addr0_sda    = i2cm_amode ? i2c_addr[9] : (i2cm_gcall ? 1'b0 : i2c_addr[1]);
            addr1_sda    = i2c_addr[2];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[2];
        end
        4'd6:
        begin
            spec_sbyte   = 1'b0;
            spec_hsmc    = i2cm_code[1];
            addr0_sda    = i2cm_amode ? i2c_addr[8] : (i2cm_gcall ? 1'b0 : i2c_addr[0]);
            addr1_sda    = i2c_addr[1];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[1];
        end
        4'd7:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = i2cm_code[0];
            addr0_sda    = sr_flag ? tx_rd_data[8] : 
                           i2cm_amode ? 1'b0 : (i2cm_gcall ? 1'b0 : tx_rd_data[8]);   
            addr1_sda    = i2c_addr[0];
            data_sda     = rw_flag    ? 1'b1 : tx_rd_data[0];
        end
        4'd8:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = 1'b1;
            addr0_sda    = 1'b1;
            addr1_sda    = 1'b1;
            data_sda     = rw_flag   ? (re_nack ? 1'b1 : 1'b0) : 1'b1;
        end
        default:
        begin
            spec_sbyte   = 1'b1;
            spec_hsmc    = 1'b0;
            addr0_sda    = 1'b1;
            addr1_sda    = 1'b1;
            data_sda     = 1'b1;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_rx[7:0]    <= 8'd0;
    else if(sta_data && rw_flag && r_scl_d[1])
        case(byte_cnt[3:0])
            4'd0:   i2cm_rx[7] <= i_sda_in;
            4'd1:   i2cm_rx[6] <= i_sda_in;
            4'd2:   i2cm_rx[5] <= i_sda_in;
            4'd3:   i2cm_rx[4] <= i_sda_in;
            4'd4:   i2cm_rx[3] <= i_sda_in;
            4'd5:   i2cm_rx[2] <= i_sda_in;
            4'd6:   i2cm_rx[1] <= i_sda_in;
            4'd7:   i2cm_rx[0] <= i_sda_in;
            default: i2cm_rx[7:0] <= i2cm_rx[7:0];
        endcase
end
assign  f_empty = ~tx_empty & tx_empty_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nack    <= 1'b0;
    else if(stop_end)
        nack    <= 1'b0;
    else if((bycnt_eq8 && r_scl_d[1]) && ~sta_special)
        nack    <= i_sda_in;
end
assign  re_nack = ((tx_empty & i2cm_stop) | ~tx_rd_data[8]) & rw_flag & sta_data & bycnt_eq8;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        hold_cnt[7:0]    <= 8'd0;
    else if(hold_clr)
        hold_cnt[7:0]    <= 8'd0;
    else if(hold_plus)
        hold_cnt[7:0]   <= hold_cnt[7:0] + 8'd1;
end
assign  hold_clr    = hold_eq | (i2c_hold[7:0] == 8'd0);
assign  hold_eq     = (i2c_hold[7:0] == 8'd0)? f_scl_d[0] :
                      (hold_cnt[7:0] == i2c_hold[7:0]);
assign  hold_eq0    = (hold_cnt[7:0] == 8'd0);
assign  hold_plus   = hold_plus_1 | hold_plus_0 | ~hold_eq0;
assign  hold_plus_1 = sta_special & f_scl_d[0];
assign  hold_plus_0 = (sta_addr0 | sta_data | sta_addr1) & hs_mode; 
assign  hs_mode     = i2cm_hs ? (bcnt_eqh | a0_hs_byeq0) : f_scl_d[0];
assign  a0_hs_byeq0 = sta_addr0 & bycnt_eq0 & f_scl_d[0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_fscnt[7:0]  <= 8'd0;
    else if(fscnt_clr)
        i2c_fscnt[7:0]  <= 8'd0;
    else if(fscnt_plus)
        i2c_fscnt[7:0]  <= i2c_fscnt[7:0] + 8'd1;
end
assign  fscnt_clr   = fscnt_clr1 | fscnt_clr2;
assign  fscnt_clr1  = sta_special & (bcnt_eqh | bcnt_eql) & i2c_fscnt_eq;
assign  fscnt_clr2  = sta_start & (bit_cnt[23:0] == i2c_hcnt[23:0]) &
                      i2c_fscnt_eq;
assign  fscnt_plus      = fscnt_plus_spec | fscnt_plus_star;
assign  fscnt_plus_spec = sta_special & (bcnt_eqh | bcnt_eql);
assign  fscnt_plus_star = sta_start & (bit_cnt[23:0] == i2c_hcnt[23:0]) &
                          (i2cm_hs | i2cm_sbyte);
assign  i2c_fscnt_eq = (i2c_fscnt[7:0] == i2c_fs_div[7:0]);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sbyte_flag  <= 1'b0;
    else if(sta_restart)
        sbyte_flag  <= 1'b0;
    else if(sta_special && i2cm_sbyte && bycnt_eq8 && r_scl)
        sbyte_flag  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        hsm_flag <= 1'b0;
    else if(sta_restart)
        hsm_flag <= 1'b0;
    else if(sta_special && i2cm_hs && bycnt_eq8 && r_scl &&
        (i2cm_sbyte ? sbyte_flag : 1'b1))
        hsm_flag <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        i2cm_sflag  <= 1'b0;
    end
    else
    begin
        if(start_end | restart_end)
            i2cm_sflag  <= 1'b0;
        else if((sta_start | sta_restart) & start_flag)
            i2cm_sflag  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_busy <= 1'b1;
    else if((start_flag && sta_idle) || lose_arbi)
        i2c_busy    <= 1'b1;
    else
        if((bycnt_eq2 && i2c_sflag) || stop_flag)
            i2c_busy <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2c_sflag  <= 1'b1;
    else if(stop_flag)
        i2c_sflag  <= 1'b1;
    else if(sta_idle && start_flag)
        i2c_sflag  <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        lose_arbi   <= 1'b0;
    else if(special_end || addr0_end || addr1_end || data_end)
        lose_arbi   <= 1'b0;
    else if(arbi_en && ~lose_arbi)
        lose_arbi   <= sda_out ^ i_sda_in;
end
assign  arbi_en   = r_scl_d[1] & (data_arbi | addr_arbi);
assign  data_arbi = sta_data & (rw_flag ? bycnt_eq8 : 
                    ((byte_cnt[3:0] >= 4'd0) & (byte_cnt[3:0] <= 4'd7)));
assign  addr_arbi = (sta_special | sta_addr0 | sta_addr1) & 
                    (byte_cnt[3:0] >= 4'd0) & (byte_cnt[3:0] <= 4'd7);
assign  i2cm_tx_ren  = sta_data & bycnt_eq7 & r_scl_d[1];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_rx_wen <= 1'b0;
    else if(rw_flag && sta_data)
        i2cm_rx_wen <= r_scl_d[1] & (byte_cnt[3:0] == 4'd7);
end
assign  i2cm_work   = ~sta_idle;
assign  i2cm_data   = sta_data;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_aerr_intr  <= 1'b0;
    else if(i2c_aerr_clr || ~i2c_intr_en[4])
        i2cm_aerr_intr  <= 1'b0;
    else if(i2cm_aerr && i2cm_en)
        i2cm_aerr_intr  <= 1'b1;
end
assign  i2cm_aerr = (i2cm_amode == 1'b0) & ((i2c_addr[6:3] == 4'b0000) | (i2c_addr[6:3] == 4'b1111));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_stop_intr  <= 1'b0;
    else if(i2c_stop_clr | ~i2c_intr_en[0])
        i2cm_stop_intr  <= 1'b0;
    else if(stop_end && i2cm_en)
        i2cm_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_lose_arbi_intr  <= 1'b0;
    else if(i2cm_lose_arbi_clr | ~i2c_intr_en[2])
        i2cm_lose_arbi_intr  <= 1'b0;
    else if(arbi_en && (sda_out ^ i_sda_in) && i2cm_en)
        i2cm_lose_arbi_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cm_nack_intr  <= 1'b0;
    else if(i2c_nack_clr | ~i2c_intr_en[1])
        i2cm_nack_intr  <= 1'b0;
    else if((r_nack && ~rw_flag) && i2cm_en)
        i2cm_nack_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nack_d  <= 1'b0;
    else
        nack_d  <= nack;
end
assign  r_nack = nack & ~nack_d;
endmodule
module i2cs(
  clk,
  f_scl,
  f_scl_d,
  i2c_addr,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_nack_clr,
  i2c_stop_clr,
  i2cs_amode,
  i2cs_en,
  i2cs_gcall,
  i2cs_gcall_clr,
  i2cs_gcall_intr,
  i2cs_hs,
  i2cs_nack_intr,
  i2cs_rx,
  i2cs_rx_wen,
  i2cs_sbyte,
  i2cs_stop_intr,
  i2cs_tx_data,
  i2cs_tx_ren,
  i2cs_work,
  i_sda_in,
  r_scl_d2,
  rst_n,
  rx_full,
  scl_out,
  sda_out,
  start_flag,
  stop_flag,
  tx_empty
);
input           clk;             
input           f_scl;           
input   [2 :1]  f_scl_d;         
input   [9 :0]  i2c_addr;        
input   [7 :0]  i2c_hold;        
input   [3 :0]  i2c_intr_en;     
input   [23:0]  i2c_lcnt;        
input           i2c_nack_clr;    
input           i2c_stop_clr;    
input           i2cs_amode;      
input           i2cs_en;         
input           i2cs_gcall;      
input           i2cs_gcall_clr;  
input           i2cs_hs;         
input           i2cs_sbyte;      
input   [7 :0]  i2cs_tx_data;    
input           i_sda_in;        
input           r_scl_d2;        
input           rst_n;           
input           rx_full;         
input           start_flag;      
input           stop_flag;       
input           tx_empty;        
output          i2cs_gcall_intr; 
output          i2cs_nack_intr;  
output  [7 :0]  i2cs_rx;         
output          i2cs_rx_wen;     
output          i2cs_stop_intr;  
output          i2cs_tx_ren;     
output          i2cs_work;       
output          scl_out;         
output          sda_out;         
reg             addr0_cmp;       
reg             addr1_cmp;       
reg             addr_10;         
reg             gcall_flag;      
reg             gcall_flag_d;    
reg             hs_flag;         
reg             i2cs_ack;        
reg     [23:0]  i2cs_bcnt;       
reg             i2cs_bus;        
reg     [3 :0]  i2cs_bycnt;      
reg     [1 :0]  i2cs_fsm;        
reg             i2cs_gcall_intr; 
reg             i2cs_nack;       
reg             i2cs_nack_intr;  
reg     [7 :0]  i2cs_rx;         
reg             i2cs_stop_intr;  
reg             i2cs_tx;         
reg     [1 :0]  nxt_i2cs_fsm;    
reg             r_scl_d3;        
reg     [7 :0]  s_hold_cnt;      
reg             s_rw_flag;       
reg             sbyte_flag;      
reg             scl_out;         
reg             sda_out;         
reg             start_hold;      
wire            clk;             
wire            f_scl;           
wire    [2 :1]  f_scl_d;         
wire    [9 :0]  i2c_addr;        
wire    [7 :0]  i2c_hold;        
wire    [3 :0]  i2c_intr_en;     
wire    [23:0]  i2c_lcnt;        
wire            i2c_nack_clr;    
wire            i2c_stop_clr;    
wire            i2cs_a0_ack;     
wire            i2cs_a0end;      
wire            i2cs_a1end;      
wire            i2cs_addr0;      
wire            i2cs_addr1;      
wire            i2cs_amode;      
wire            i2cs_bcnt_eql;   
wire            i2cs_bycnt_clr;  
wire            i2cs_bycnt_eq0;  
wire            i2cs_bycnt_eq8;  
wire            i2cs_data;       
wire            i2cs_en;         
wire            i2cs_gcall;      
wire            i2cs_gcall_clr;  
wire            i2cs_hs;         
wire            i2cs_idle;       
wire            i2cs_rx_wen;     
wire            i2cs_sbyte;      
wire            i2cs_send;       
wire    [7 :0]  i2cs_tx_data;    
wire            i2cs_tx_ren;     
wire            i2cs_work;       
wire            i_sda_in;        
wire            r_gcall;         
wire            r_scl_d2;        
wire            rst_n;           
wire            rx_full;         
wire            s_hold_eq;       
wire            s_hold_eq0;      
wire            start_flag;      
wire            stop_flag;       
wire            strech_scl;      
wire            tim_i2cs_fifo_op; 
wire            tx_empty;        
parameter   I2CS_IDLE   = 2'b00,
            I2CS_ADDR0  = 2'b01,
            I2CS_ADDR1  = 2'b11,
            I2CS_DATA   = 2'b10;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_fsm[1:0]   <= I2CS_IDLE;
    else if(~i2cs_en)
        i2cs_fsm[1:0]   <= I2CS_IDLE;
    else
        i2cs_fsm[1:0]   <= nxt_i2cs_fsm[1:0];
end
always @( start_flag
       or addr_10
       or hs_flag
       or i2cs_bus
       or i2cs_fsm[1:0]
       or addr1_cmp
       or f_scl
       or i2cs_a1end
       or stop_flag
       or s_rw_flag
       or gcall_flag
       or i2cs_a0end
       or addr0_cmp
       or start_hold
       or sbyte_flag)
begin
    case(i2cs_fsm[1:0])
        I2CS_IDLE:
        begin
            if(start_hold && f_scl && i2cs_bus)
                nxt_i2cs_fsm[1:0] = I2CS_ADDR0;
            else
                nxt_i2cs_fsm[1:0] = I2CS_IDLE;
        end
        I2CS_ADDR0:
        begin
            if(stop_flag || start_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else if(i2cs_a0end)
            begin
                if(hs_flag | sbyte_flag)
                    nxt_i2cs_fsm[1:0]   = I2CS_ADDR0;
                else if(addr_10 && addr0_cmp)
                    if(s_rw_flag)
                        if(addr1_cmp)
                            nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                        else 
                            nxt_i2cs_fsm[1:0] = I2CS_IDLE;
                    else
                        nxt_i2cs_fsm[1:0]   = I2CS_ADDR1;
                else if(addr0_cmp || gcall_flag) 
                    nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                else
                    nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            end
            else
            begin
                nxt_i2cs_fsm[1:0]   = i2cs_fsm[1:0];
            end
        end
        I2CS_ADDR1:
        begin
            if(start_flag || stop_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else if(i2cs_a1end)
                if(addr1_cmp)
                    nxt_i2cs_fsm[1:0]   = I2CS_DATA;
                else
                    nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else
                nxt_i2cs_fsm[1:0]   = I2CS_ADDR1;
        end
        I2CS_DATA:
        begin
            if(stop_flag || start_flag)
                nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
            else
                nxt_i2cs_fsm[1:0]   = i2cs_fsm[1:0];
        end
        default:
        begin
            nxt_i2cs_fsm[1:0]   = I2CS_IDLE;
        end
    endcase
end
assign  i2cs_idle   = (i2cs_fsm[1:0] == I2CS_IDLE);
assign  i2cs_addr0  = (i2cs_fsm[1:0] == I2CS_ADDR0);
assign  i2cs_addr1  = (i2cs_fsm[1:0] == I2CS_ADDR1);
assign  i2cs_data   = (i2cs_fsm[1:0] == I2CS_DATA);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sda_out     <= 1'b1;
    end
    else if(i2cs_addr0 && i2cs_bycnt_eq8)
    begin
        if(i2cs_a0_ack) 
            sda_out <= 1'b0;
        else
            sda_out <= 1'b1;
    end
    else if(i2cs_addr1 && addr1_cmp && i2cs_bycnt_eq8)
    begin
        if(addr1_cmp)
            sda_out <= 1'b0;
        else
            sda_out <= 1'b1;
    end
    else if(i2cs_data && i2cs_bycnt_eq8 && ~s_rw_flag)      
        sda_out     <= i2cs_ack;
    else if(i2cs_data && i2cs_bycnt_eq0 && tx_empty && s_rw_flag)
        sda_out     <= 1'b1;
    else if(i2cs_data && s_rw_flag)
    begin
        if(i2cs_nack && s_hold_eq)
            sda_out     <= 1'b1;
        else
            sda_out     <= i2cs_tx;
    end
    else
        sda_out <= 1'b1;
end
assign  i2cs_a0_ack = (s_rw_flag & addr_10) ? (addr0_cmp & addr1_cmp) : addr0_cmp;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        scl_out <= 1'b1;
    else if(i2cs_data & i2cs_bycnt_eq0 && i2cs_bcnt_eql && s_rw_flag)
        scl_out <= 1'b1;
    else if(strech_scl)
        scl_out <= 1'b0;
end
assign  strech_scl  = i2cs_data & i2cs_bycnt_eq8 & f_scl & ~i2cs_nack &
                      ((tx_empty & s_rw_flag) | (rx_full & ~s_rw_flag));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bcnt[23:0] <= 24'd0;
    else if(i2cs_bcnt[23:0] == i2c_lcnt[23:0])
        i2cs_bcnt[23:0] <= 24'd0;
    else if((i2cs_data && i2cs_bycnt_eq0 && s_rw_flag && ~scl_out && ~tx_empty) ||
            (i2cs_bcnt[23:0] != 24'd0))
        i2cs_bcnt[23:0] <= i2cs_bcnt[23:0] + 24'd1;
end
assign  i2cs_bcnt_eql = (i2cs_bcnt[23:0] == i2c_lcnt[23:0]);
always @( i2cs_tx_data[7:0]
       or i2cs_bycnt[3:0]
       or s_hold_eq
       or sda_out)
begin
    if(s_hold_eq)
    case(i2cs_bycnt[3:0])
        4'd0: i2cs_tx = i2cs_tx_data[7];
        4'd1: i2cs_tx = i2cs_tx_data[6];
        4'd2: i2cs_tx = i2cs_tx_data[5];
        4'd3: i2cs_tx = i2cs_tx_data[4];
        4'd4: i2cs_tx = i2cs_tx_data[3];
        4'd5: i2cs_tx = i2cs_tx_data[2];
        4'd6: i2cs_tx = i2cs_tx_data[1];
        4'd7: i2cs_tx = i2cs_tx_data[0];
        default: i2cs_tx = 1'b1;
    endcase
    else
        i2cs_tx = sda_out;
end
always @( s_hold_eq
       or sda_out)
begin
    if(s_hold_eq)
        i2cs_ack    = 1'b0;
    else
        i2cs_ack    = sda_out;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        s_hold_cnt[7:0]    <= 8'd0;
    else if(s_hold_eq)
        s_hold_cnt[7:0]    <= 8'd0;
    else if(f_scl_d[1] && (i2cs_addr0 || i2cs_data || i2cs_addr1))
        s_hold_cnt[7:0]    <= 8'd1;
    else if(|s_hold_cnt[7:0])
        s_hold_cnt[7:0]    <= s_hold_cnt[7:0] + 8'd1;
end
assign  s_hold_eq     = s_hold_eq0 ? f_scl_d[2] : (s_hold_cnt[7:0] == i2c_hold[7:0]);
assign  s_hold_eq0    = (i2c_hold[7:0] == 8'd0);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        i2cs_rx[7:0]  <= 8'd0;
    end
    else if((i2cs_addr0 | i2cs_addr1 | i2cs_data) && r_scl_d2)
    begin
        case(i2cs_bycnt)
            4'd0:   i2cs_rx[7] <= i_sda_in;
            4'd1:   i2cs_rx[6] <= i_sda_in;
            4'd2:   i2cs_rx[5] <= i_sda_in;
            4'd3:   i2cs_rx[4] <= i_sda_in;
            4'd4:   i2cs_rx[3] <= i_sda_in;
            4'd5:   i2cs_rx[2] <= i_sda_in;
            4'd6:   i2cs_rx[1] <= i_sda_in;
            4'd7:   i2cs_rx[0] <= i_sda_in;
            default: i2cs_rx[7:0] <= i2cs_rx[7:0];
        endcase
    end
end
assign  i2cs_rx_wen = i2cs_data & ~s_rw_flag & tim_i2cs_fifo_op;
assign  i2cs_tx_ren = i2cs_data & s_rw_flag & tim_i2cs_fifo_op;
assign  tim_i2cs_fifo_op = (i2cs_bycnt[3:0] == 4'd7) & f_scl;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        s_rw_flag <= 1'b0;
    else if(i2cs_send)
        s_rw_flag <= 1'b0;
    else if(i2cs_addr0 && i2cs_bycnt == 4'd7 && r_scl_d2)
        s_rw_flag <= i_sda_in;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        hs_flag <= 1'b0;
        gcall_flag  <= 1'b0;
        sbyte_flag     <= 1'b0;
    end        
    else if(i2cs_a0end)
    begin
        hs_flag <= 1'b0;
        gcall_flag  <= 1'b0;
        sbyte_flag     <= 1'b0;
    end
    else if(i2cs_addr0)
    begin
        if(~i2cs_hs && (i2cs_rx[7:3] == 5'b00001) && (i2cs_bycnt == 4'd4) && r_scl_d2)
            hs_flag <= 1'b1;
        if(~i2cs_gcall && (i2cs_rx[7:0] == 8'd0) && (i2cs_bycnt == 4'd7) && r_scl_d2)
            gcall_flag  <= 1'b1;
        if(~i2cs_sbyte && (i2cs_rx[7:0] == 8'd1) && (i2cs_bycnt == 4'd7) && r_scl_d2)
            sbyte_flag  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        addr0_cmp   <= 1'b0;
        addr_10     <= 1'b0;    
    end
    else if(stop_flag)               
    begin
        addr0_cmp   <= 1'b0;
        addr_10     <= 1'b0;
    end
    else if(i2cs_addr0)
    begin
        if((i2cs_bycnt == 4'd7) && r_scl_d3)
        begin
            if(addr_10)
                addr0_cmp   <= (i2cs_rx[2:1] == i2c_addr[9:8]);
            else
                addr0_cmp   <= (i2cs_rx[7:1] == i2c_addr[6:0]) | (~i2cs_gcall & (i2cs_rx[7:0] == 8'd0));
        end
        if((i2cs_rx[7:3] == 5'b11110) && (i2cs_bycnt == 4'd5) && r_scl_d3)
        begin
            if(~i2cs_amode)
                addr_10     <= 1'b1;
            else
                addr_10     <= 1'b0;
        end
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        addr1_cmp   <= 1'b0;
    else if(stop_flag)
        addr1_cmp   <= 1'b0;
    else if(i2cs_addr1 && (i2cs_bycnt == 4'd7) && f_scl)
        addr1_cmp   <= (i2cs_rx[7:0] == i2c_addr[7:0]);
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bus    <= 1'b1;
    else if(start_flag || stop_flag)
        i2cs_bus    <= 1'b1;
    else if((~addr0_cmp && i2cs_a0end) || (~addr1_cmp && i2cs_a1end))
        i2cs_bus    <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        start_hold  <= 1'b0;
    end
    else if(f_scl)
        start_hold  <= 1'b0;
    else if(start_flag)
    begin
        start_hold  <= 1'b1;
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_bycnt[3:0] <= 4'd0;
    else if(i2cs_bycnt_clr || start_flag || ~i2cs_en)
        i2cs_bycnt[3:0] <= 4'd0;
    else if((i2cs_fsm != I2CS_IDLE) && f_scl)
        i2cs_bycnt[3:0] <= i2cs_bycnt[3:0] + 4'd1;
end
assign  i2cs_bycnt_clr = i2cs_bycnt_eq8 & f_scl;
assign  i2cs_send   = i2cs_idle & f_scl & start_flag;
assign  i2cs_a0end  = (i2cs_addr0 & i2cs_bycnt_eq8 & f_scl);
assign  i2cs_a1end  = (i2cs_addr1 & i2cs_bycnt_eq8 & f_scl);
assign  i2cs_bycnt_eq8 = (i2cs_bycnt[3:0] == 4'd8);
assign  i2cs_bycnt_eq0 = (i2cs_bycnt[3:0] == 4'd0);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_nack   <= 1'b0;
    else if(i2cs_addr0 && i2cs_bycnt_eq8)
        i2cs_nack   <= 1'b0;
    else if(i2cs_data && i2cs_bycnt_eq8 && r_scl_d2 && s_rw_flag)
        i2cs_nack   <= i_sda_in;
end
assign  i2cs_work = ~(i2cs_fsm[1:0] == I2CS_IDLE);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_stop_intr  <= 1'b0;
    else if(i2c_stop_clr | ~i2c_intr_en[0])
        i2cs_stop_intr  <= 1'b0;
    else if(stop_flag && ~i2cs_en)
        i2cs_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_gcall_intr <= 1'b0;
    else if(i2cs_gcall_clr | ~i2c_intr_en[3])
        i2cs_gcall_intr <= 1'b0;
    else if(r_gcall)
        i2cs_gcall_intr <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        gcall_flag_d    <= 1'b0;
        r_scl_d3        <= 1'b0;
    end
    else
    begin
        gcall_flag_d    <= gcall_flag;
        r_scl_d3        <= r_scl_d2;
    end
end
assign  r_gcall = gcall_flag & ~gcall_flag_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        i2cs_nack_intr <= 1'b0;
    else if(i2c_nack_clr | ~i2c_intr_en[1])
        i2cs_nack_intr <= 1'b0;
    else if(i2cs_data && i2cs_bycnt_eq8 && r_scl_d2 && s_rw_flag && i_sda_in)
        i2cs_nack_intr <= 1'b1;
end
endmodule
module i2c_top(
  clk,
  f_scl,
  f_scl_d,
  f_sda,
  i2c_addr,
  i2c_aerr_clr,
  i2c_fs_div,
  i2c_hcnt,
  i2c_hold,
  i2c_intr_en,
  i2c_lcnt,
  i2c_mode,
  i2c_nack_clr,
  i2c_nack_intr,
  i2c_rx,
  i2c_rx_wen,
  i2c_stop_clr,
  i2c_stop_intr,
  i2c_tx_ren,
  i2cm_aerr_intr,
  i2cm_amode,
  i2cm_code,
  i2cm_data,
  i2cm_en,
  i2cm_gcall,
  i2cm_hs,
  i2cm_lose_arbi_clr,
  i2cm_lose_arbi_intr,
  i2cm_sbyte,
  i2cm_stop,
  i2cm_work,
  i2cs_amode,
  i2cs_en,
  i2cs_gcall,
  i2cs_gcall_clr,
  i2cs_gcall_intr,
  i2cs_hs,
  i2cs_sbyte,
  i2cs_tx_data,
  i2cs_work,
  i_scl_in,
  i_sda_in,
  r_scl,
  r_scl_d,
  r_sda,
  rst_n,
  rx_full,
  scl_out,
  sda_out,
  tx_empty,
  tx_empty_d,
  tx_rd_data,
  wr_clk_div
);
input           clk;                
input           f_scl;              
input   [2 :0]  f_scl_d;            
input           f_sda;              
input   [9 :0]  i2c_addr;           
input           i2c_aerr_clr;       
input   [7 :0]  i2c_fs_div;         
input   [23:0]  i2c_hcnt;           
input   [7 :0]  i2c_hold;           
input   [4 :0]  i2c_intr_en;        
input   [23:0]  i2c_lcnt;           
input           i2c_mode;           
input           i2c_nack_clr;       
input           i2c_stop_clr;       
input           i2cm_amode;         
input   [2 :0]  i2cm_code;          
input           i2cm_en;            
input           i2cm_gcall;         
input           i2cm_hs;            
input           i2cm_lose_arbi_clr; 
input           i2cm_sbyte;         
input           i2cm_stop;          
input           i2cs_amode;         
input           i2cs_en;            
input           i2cs_gcall;         
input           i2cs_gcall_clr;     
input           i2cs_hs;            
input           i2cs_sbyte;         
input   [7 :0]  i2cs_tx_data;       
input           i_scl_in;           
input           i_sda_in;           
input           r_scl;              
input   [2 :1]  r_scl_d;            
input           r_sda;              
input           rst_n;              
input           rx_full;            
input           tx_empty;           
input           tx_empty_d;         
input   [9 :0]  tx_rd_data;         
input           wr_clk_div;         
output          i2c_nack_intr;      
output  [7 :0]  i2c_rx;             
output          i2c_rx_wen;         
output          i2c_stop_intr;      
output          i2c_tx_ren;         
output          i2cm_aerr_intr;     
output          i2cm_data;          
output          i2cm_lose_arbi_intr; 
output          i2cm_work;          
output          i2cs_gcall_intr;    
output          i2cs_work;          
output          scl_out;            
output          sda_out;            
wire            clk;                
wire            f_scl;              
wire    [2 :0]  f_scl_d;            
wire            f_sda;              
wire    [9 :0]  i2c_addr;           
wire            i2c_aerr_clr;       
wire    [7 :0]  i2c_fs_div;         
wire    [23:0]  i2c_hcnt;           
wire    [7 :0]  i2c_hold;           
wire    [4 :0]  i2c_intr_en;        
wire    [23:0]  i2c_lcnt;           
wire            i2c_mode;           
wire            i2c_nack_clr;       
wire            i2c_nack_intr;      
wire    [7 :0]  i2c_rx;             
wire            i2c_rx_wen;         
wire            i2c_stop_clr;       
wire            i2c_stop_intr;      
wire            i2c_tx_ren;         
wire            i2cm_aerr_intr;     
wire            i2cm_amode;         
wire    [2 :0]  i2cm_code;          
wire            i2cm_data;          
wire            i2cm_en;            
wire            i2cm_gcall;         
wire            i2cm_hs;            
wire            i2cm_lose_arbi_clr; 
wire            i2cm_lose_arbi_intr; 
wire            i2cm_nack_intr;     
wire    [7 :0]  i2cm_rx;            
wire            i2cm_rx_wen;        
wire            i2cm_sbyte;         
wire            i2cm_scl_out;       
wire            i2cm_sda_out;       
wire            i2cm_stop;          
wire            i2cm_stop_intr;     
wire            i2cm_tx_ren;        
wire            i2cm_work;          
wire            i2cs_amode;         
wire            i2cs_en;            
wire            i2cs_gcall;         
wire            i2cs_gcall_clr;     
wire            i2cs_gcall_intr;    
wire            i2cs_hs;            
wire            i2cs_nack_intr;     
wire    [7 :0]  i2cs_rx;            
wire            i2cs_rx_wen;        
wire            i2cs_sbyte;         
wire            i2cs_scl_out;       
wire            i2cs_sda_out;       
wire            i2cs_stop_intr;     
wire    [7 :0]  i2cs_tx_data;       
wire            i2cs_tx_ren;        
wire            i2cs_work;          
wire            i_scl_in;           
wire            i_sda_in;           
wire            r_scl;              
wire    [2 :1]  r_scl_d;            
wire            r_sda;              
wire            rst_n;              
wire            rx_full;            
wire            scl_out;            
wire            sda_out;            
wire            start_flag;         
wire            stop_flag;          
wire            tx_empty;           
wire            tx_empty_d;         
wire    [9 :0]  tx_rd_data;         
wire            wr_clk_div;         
i2cm  x_i2cm (
  .clk                 (clk                ),
  .f_scl               (f_scl              ),
  .f_scl_d             (f_scl_d[0]         ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2cm_aerr_intr      (i2cm_aerr_intr     ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_nack_intr      (i2cm_nack_intr     ),
  .i2cm_rx             (i2cm_rx            ),
  .i2cm_rx_wen         (i2cm_rx_wen        ),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_stop_intr      (i2cm_stop_intr     ),
  .i2cm_tx_ren         (i2cm_tx_ren        ),
  .i2cm_work           (i2cm_work          ),
  .i_scl_in            (i_scl_in           ),
  .i_sda_in            (i_sda_in           ),
  .r_scl               (r_scl              ),
  .r_scl_d             (r_scl_d[1]         ),
  .rst_n               (rst_n              ),
  .scl_out             (i2cm_scl_out       ),
  .sda_out             (i2cm_sda_out       ),
  .start_flag          (start_flag         ),
  .stop_flag           (stop_flag          ),
  .tx_empty            (tx_empty           ),
  .tx_empty_d          (tx_empty_d         ),
  .tx_rd_data          (tx_rd_data         ),
  .wr_clk_div          (wr_clk_div         )
);
i2cs  x_i2cs (
  .clk              (clk             ),
  .f_scl            (f_scl           ),
  .f_scl_d          (f_scl_d[2:1]    ),
  .i2c_addr         (i2c_addr        ),
  .i2c_hold         (i2c_hold        ),
  .i2c_intr_en      (i2c_intr_en[3:0]),
  .i2c_lcnt         (i2c_lcnt        ),
  .i2c_nack_clr     (i2c_nack_clr    ),
  .i2c_stop_clr     (i2c_stop_clr    ),
  .i2cs_amode       (i2cs_amode      ),
  .i2cs_en          (i2cs_en         ),
  .i2cs_gcall       (i2cs_gcall      ),
  .i2cs_gcall_clr   (i2cs_gcall_clr  ),
  .i2cs_gcall_intr  (i2cs_gcall_intr ),
  .i2cs_hs          (i2cs_hs         ),
  .i2cs_nack_intr   (i2cs_nack_intr  ),
  .i2cs_rx          (i2cs_rx         ),
  .i2cs_rx_wen      (i2cs_rx_wen     ),
  .i2cs_sbyte       (i2cs_sbyte      ),
  .i2cs_stop_intr   (i2cs_stop_intr  ),
  .i2cs_tx_data     (i2cs_tx_data    ),
  .i2cs_tx_ren      (i2cs_tx_ren     ),
  .i2cs_work        (i2cs_work       ),
  .i_sda_in         (i_sda_in        ),
  .r_scl_d2         (r_scl_d[2]      ),
  .rst_n            (rst_n           ),
  .rx_full          (rx_full         ),
  .scl_out          (i2cs_scl_out    ),
  .sda_out          (i2cs_sda_out    ),
  .start_flag       (start_flag      ),
  .stop_flag        (stop_flag       ),
  .tx_empty         (tx_empty        )
);
assign  sda_out = i2c_mode ? i2cm_sda_out : i2cs_sda_out;
assign  i2c_rx[7:0] = ({8{i2cm_en}} & i2cm_rx[7:0]) | ({8{i2cs_en}} & i2cs_rx[7:0]);
assign  i2c_rx_wen  = (i2cm_en & i2cm_rx_wen) | (i2cs_en & i2cs_rx_wen);
assign  i2c_tx_ren  = (i2cm_en & i2cm_tx_ren) | (i2cs_en & i2cs_tx_ren);
assign  scl_out = i2c_mode ? i2cm_scl_out : i2cs_scl_out;
assign  i2c_stop_intr = (i2cm_en & i2cm_stop_intr) | (i2cs_en & i2cs_stop_intr);
assign  i2c_nack_intr = (i2cm_en & i2cm_nack_intr) | (i2cs_en & i2cs_nack_intr);
assign  start_flag  = i_scl_in & f_sda;
assign  stop_flag   = i_scl_in & r_sda;
endmodule
module sdata_if(
  clk,
  f_nss,
  f_rxd,
  f_scl,
  f_scl_d,
  f_sda,
  i2c_en,
  i2c_mode,
  i2cm_en,
  i2cs_en,
  i_nss_in,
  i_scl_in,
  i_sd1_in,
  i_sda_in,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  r_scl,
  r_scl_d,
  r_sda,
  rst_n,
  scl_out,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  sda_out,
  sdata_en,
  spi_mo,
  spi_rx_en,
  spi_so,
  spim_en,
  spim_nss,
  spim_sck,
  spis_en,
  txd_out,
  uart_en
);
input          clk;      
input          i2c_en;   
input          i2c_mode; 
input          i2cm_en;  
input          i2cs_en;  
input          nss_in;   
input          rst_n;    
input          scl_out;  
input          sclk_in;  
input          sd0_in;   
input          sd1_in;   
input          sda_out;  
input          sdata_en; 
input          spi_mo;   
input          spi_rx_en; 
input          spi_so;   
input          spim_en;  
input          spim_nss; 
input          spim_sck; 
input          spis_en;  
input          txd_out;  
input          uart_en;  
output         f_nss;    
output         f_rxd;    
output         f_scl;    
output  [2:0]  f_scl_d;  
output         f_sda;    
output         i_nss_in; 
output         i_scl_in; 
output         i_sd1_in; 
output         i_sda_in; 
output         nss_ie_n; 
output         nss_oe_n; 
output         nss_out;  
output         r_scl;    
output  [2:0]  r_scl_d;  
output         r_sda;    
output         sclk_ie_n; 
output         sclk_oe_n; 
output         sclk_out; 
output         sd0_ie_n; 
output         sd0_oe_n; 
output         sd0_out;  
output         sd1_ie_n; 
output         sd1_oe_n; 
output         sd1_out;  
reg     [2:0]  f_sclk_d; 
reg     [3:0]  nss_in_d; 
reg     [2:0]  r_sclk_d; 
reg     [3:0]  sclk_in_d; 
reg     [3:0]  sd0_in_d; 
reg     [3:0]  sd1_in_d; 
wire           clk;      
wire           f_nss;    
wire           f_rxd;    
wire           f_scl;    
wire    [2:0]  f_scl_d;  
wire           f_sclk;   
wire           f_sd0;    
wire           f_sda;    
wire           i2c_en;   
wire           i2c_mode; 
wire           i2cm_en;  
wire           i2cs_en;  
wire           i_nss_in; 
wire           i_scl_in; 
wire           i_sd1_in; 
wire           i_sda_in; 
wire           nss_ie_n; 
wire           nss_in;   
wire           nss_oe_n; 
wire           nss_out;  
wire           r_scl;    
wire    [2:0]  r_scl_d;  
wire           r_sclk;   
wire           r_sd0;    
wire           r_sda;    
wire           rst_n;    
wire           scl_out;  
wire           sclk_ie_n; 
wire           sclk_in;  
wire           sclk_oe_n; 
wire           sclk_out; 
wire           sd0_ie_n; 
wire           sd0_in;   
wire           sd0_oe_n; 
wire           sd0_out;  
wire           sd1_ie_n; 
wire           sd1_in;   
wire           sd1_oe_n; 
wire           sd1_out;  
wire           sda_out;  
wire           sdata_en; 
wire           spi_mo;   
wire           spi_rx_en; 
wire           spi_so;   
wire           spim_en;  
wire           spim_nss; 
wire           spim_sck; 
wire           spis_en;  
wire           txd_out;  
wire           uart_en;  
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sd0_in_d[3:0] <= 4'hf;
    else if(sdata_en)
        sd0_in_d[3:0] <= {sd0_in_d[2:0], sd0_in};
    else
        sd0_in_d[3:0] <= 4'hf;
end
assign  r_sd0 = sd0_in_d[2] & ~sd0_in_d[3];
assign  f_sd0 = ~sd0_in_d[2] & sd0_in_d[3];
assign  r_sda = r_sd0;
assign  f_sda = f_sd0;
assign  i_sda_in = sd0_in_d[2];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sd1_in_d[3:0] <= 4'd15;
    else if(sdata_en)
        sd1_in_d[3:0] <= {sd1_in_d[2:0], sd1_in};
    else
        sd1_in_d[3:0] <= 4'd15;
end
assign  i_sd1_in = sd1_in_d[2];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sclk_in_d[3:0] <= 4'hf;
    else if(sdata_en)
        sclk_in_d[3:0] <= {sclk_in_d[2:0], sclk_in};
    else
        sclk_in_d[3:0] <= 4'hf;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        f_sclk_d[2:0]   <= 3'd0;    
        r_sclk_d[2:0]   <= 3'd0;    
    end
    else if(i2c_en)
    begin
        f_sclk_d[2:0]   <= {f_sclk_d[1:0], f_sclk};
        r_sclk_d[2:0]   <= {r_sclk_d[1:0], r_sclk};
    end
end
assign  r_sclk = sclk_in_d[2] & ~sclk_in_d[3];
assign  f_sclk = ~sclk_in_d[2] & sclk_in_d[3];
assign  r_scl  = r_sclk;
assign  f_scl  = f_sclk;
assign  f_rxd  = f_sclk;
assign  i_scl_in  = sclk_in_d[2];
assign  r_scl_d[2:0] = r_sclk_d[2:0];
assign  f_scl_d[2:0] = f_sclk_d[2:0];
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        nss_in_d[3:0]   <= 4'hf;
    else
        nss_in_d[3:0]   <= {nss_in_d[2:0], nss_in};
end
assign  f_nss = ~nss_in_d[2] & nss_in_d[3];
assign  i_nss_in = nss_in_d[2];
assign  sclk_oe_n = (scl_out | (i2c_mode ? ~i2cm_en : ~i2cs_en)) & (~spim_en);
assign  sclk_out  = (scl_out & i2cm_en) | (spim_sck & spim_en);
assign  sclk_ie_n = ~uart_en & ~(i2cm_en | i2cs_en) & ~((spim_en & spi_rx_en) | spis_en);
assign  sd0_oe_n  = ((sda_out | ~i2c_en) & ~uart_en & ~spim_en);
assign  sd0_out   = (sda_out & i2c_en) | (txd_out & uart_en) | (spi_mo & spim_en);
assign  sd0_ie_n  = ~spis_en & ~i2c_en; 
assign  sd1_oe_n  = ~spis_en;
assign  sd1_out   = (spi_so & spis_en);
assign  sd1_ie_n  = ~spim_en;
assign  nss_oe_n  = ~spim_en;
assign  nss_out   = (spim_nss | ~spim_en);
assign  nss_ie_n  = spim_en; 
endmodule
module spi(
  clk,
  clk_div0,
  cpha,
  cpol,
  f_nss,
  f_sclk,
  i_nss_in,
  nss_toggle,
  r_sclk,
  rst_n,
  rx_full,
  rx_wr_data,
  spi_data_size,
  spi_intr_en,
  spi_mi,
  spi_mo,
  spi_rx_en,
  spi_rx_wen,
  spi_si,
  spi_so,
  spi_stop_clr,
  spi_stop_intr,
  spi_tx_en,
  spi_tx_ren,
  spi_work,
  spim_en,
  spim_nss,
  spim_sck,
  spis_en,
  tx_empty,
  tx_rd_data
);
input           clk;           
input   [23:1]  clk_div0;      
input           cpha;          
input           cpol;          
input           f_nss;         
input           f_sclk;        
input           i_nss_in;      
input           nss_toggle;    
input           r_sclk;        
input           rst_n;         
input           rx_full;       
input   [3 :0]  spi_data_size; 
input           spi_intr_en;   
input           spi_mi;        
input           spi_rx_en;     
input           spi_si;        
input           spi_stop_clr;  
input           spi_tx_en;     
input           spim_en;       
input           spis_en;       
input           tx_empty;      
input   [15:0]  tx_rd_data;    
output  [15:0]  rx_wr_data;    
output          spi_mo;        
output          spi_rx_wen;    
output          spi_so;        
output          spi_stop_intr; 
output          spi_tx_ren;    
output          spi_work;      
output          spim_nss;      
output          spim_sck;      
reg     [3 :0]  cnt_bits;      
reg             cnt_bits0_d;   
reg             data_chg;      
reg             data_smp;      
reg             f_nss_d;       
reg     [1 :0]  nxt_spim_fsm;  
reg             spi_mo;        
reg             spi_so;        
reg             spi_stop_intr; 
reg             spim_1st_bit;  
reg     [1 :0]  spim_fsm;      
reg             spim_nss;      
reg     [15:0]  spim_rx;       
reg             spim_sck;      
reg             spis_1st_bit;  
reg     [15:0]  spis_rx;       
reg             spis_rx_en;    
reg             spis_rx_wen;   
reg     [1 :0]  stop_cnt;      
reg     [4 :0]  txcnt_bits;    
reg     [22:0]  txcnt_div;     
wire            clk;           
wire    [23:1]  clk_div0;      
wire            cpha;          
wire            cpol;          
wire            f_nss;         
wire            f_sclk;        
wire            i_nss_in;      
wire            nss_toggle;    
wire            r_sclk;        
wire            rst_n;         
wire            rx_full;       
wire    [15:0]  rx_wr_data;    
wire    [3 :0]  spi_data_size; 
wire            spi_intr_en;   
wire            spi_mi;        
wire            spi_rx_en;     
wire            spi_rx_wen;    
wire            spi_si;        
wire            spi_stop_clr;  
wire            spi_tx_en;     
wire            spi_tx_ren;    
wire            spi_work;      
wire            spim_all_end;  
wire            spim_data;     
wire            spim_data_end; 
wire            spim_en;       
wire            spim_idle;     
wire            spim_idle_end; 
wire            spim_nss_clr;  
wire            spim_nss_set;  
wire            spim_rx_wen;   
wire            spim_start;    
wire            spim_start_end; 
wire            spim_stop;     
wire            spim_stop_end; 
wire            spim_stop_intr; 
wire            spim_tx_ren;   
wire            spis_cnt_load; 
wire            spis_en;       
wire            spis_stop_intr; 
wire            spis_tx_ren;   
wire            stop_judge;    
wire            tx_empty;      
wire    [15:0]  tx_rd_data;    
wire            txcnt_div_eq;  
parameter   SPIM_IDLE  = 2'b00,
            SPIM_START = 2'b01,
            SPIM_DATA  = 2'b11,
            SPIM_STOP  = 2'b10;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_fsm[1:0]   <= SPIM_IDLE;
    else
        spim_fsm[1:0]   <= nxt_spim_fsm[1:0];
end
always @( stop_judge
       or spim_data_end
       or spim_fsm[1:0]
       or spim_idle_end
       or spim_start_end
       or spim_stop_end)
begin
    case(spim_fsm[1:0])
        SPIM_IDLE:
            if(spim_idle_end)
                nxt_spim_fsm[1:0] = SPIM_START;
            else
                nxt_spim_fsm[1:0] = SPIM_IDLE;
        SPIM_START:
            if(spim_start_end)
                nxt_spim_fsm[1:0] = SPIM_DATA;
            else
                nxt_spim_fsm[1:0] = SPIM_START;
        SPIM_DATA:
            if(spim_data_end)
                nxt_spim_fsm[1:0] = SPIM_STOP;
            else
                nxt_spim_fsm[1:0] = SPIM_DATA;
        SPIM_STOP:
            if(spim_stop_end)
                if(stop_judge)
                    nxt_spim_fsm[1:0] = SPIM_IDLE;
                else
                    nxt_spim_fsm[1:0] = SPIM_START;
            else
                nxt_spim_fsm[1:0] = SPIM_STOP;
    endcase
end
assign  spim_idle_end = spim_idle & ((spi_tx_en & (~spi_rx_en) & (~tx_empty)) 
                        | ((~spi_tx_en) & spi_rx_en & (~rx_full)) 
                        | (spi_tx_en & spi_rx_en & (~tx_empty) & (~rx_full)));
assign  spim_start_end = spim_start & txcnt_div_eq;
assign  spim_data_end = spim_data & (~|txcnt_bits[4:0]) & txcnt_div_eq;
assign  spim_stop_end = spim_stop & txcnt_div_eq & (nss_toggle ? (stop_cnt[1:0] == 2'b10) : 1'b1);
assign  spim_all_end = spim_idle_end | spim_start_end | spim_data_end | spim_stop_end;
assign  stop_judge = (spi_tx_en & tx_empty) | (spi_rx_en & rx_full);
assign  spim_idle = (spim_fsm[1:0] == SPIM_IDLE);
assign  spim_start = (spim_fsm[1:0] == SPIM_START);
assign  spim_data = (spim_fsm[1:0] == SPIM_DATA);
assign  spim_stop = (spim_fsm[1:0] == SPIM_STOP);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_bits[4:0] <= 5'd0;
    else if(spim_start_end || ((~tx_empty) && spim_stop_end))
        txcnt_bits[4:0] <= {spi_data_size[3:0], 1'b1};
    else if(spim_idle || spim_start || spim_stop || spim_data_end)
        txcnt_bits[4:0] <= 5'd0;
    else if(txcnt_div_eq)
        txcnt_bits[4:0] <= txcnt_bits[4:0] - 5'd1;
end
assign  txcnt_div_eq  = (txcnt_div[22:0] == clk_div0[23:1]);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_div[22:0] <= 23'd0;
    else if(txcnt_div_eq || spim_all_end)
        txcnt_div[22:0] <= 23'd0;
    else
        txcnt_div[22:0] <= txcnt_div[22:0] + 23'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_mo  <= 1'b0;
    else if(~spim_en)
        spi_mo  <= 1'b0;
    else if((~txcnt_bits[0]) && txcnt_div_eq && spi_tx_en && (~tx_empty))
        case(txcnt_bits[4:1]) // synopsys parallel_case
            4'd0:  spi_mo <= spim_1st_bit;
            4'd1:  spi_mo <= tx_rd_data[0];
            4'd2:  spi_mo <= tx_rd_data[1];
            4'd3:  spi_mo <= tx_rd_data[2];
            4'd4:  spi_mo <= tx_rd_data[3];
            4'd5:  spi_mo <= tx_rd_data[4];
            4'd6:  spi_mo <= tx_rd_data[5];
            4'd7:  spi_mo <= tx_rd_data[6];
            4'd8:  spi_mo <= tx_rd_data[7];
            4'd9:  spi_mo <= tx_rd_data[8];
            4'd10: spi_mo <= tx_rd_data[9];
            4'd11: spi_mo <= tx_rd_data[10];
            4'd12: spi_mo <= tx_rd_data[11];
            4'd13: spi_mo <= tx_rd_data[12];
            4'd14: spi_mo <= tx_rd_data[13];
            4'd15: spi_mo <= tx_rd_data[14];
        endcase
end
always @( tx_rd_data[15:3]
       or spim_start_end
       or spi_mo
       or spi_data_size[3:0]
       or tx_rd_data[4:3]
       or spim_stop_end)
begin
    if(spim_stop_end || spim_start_end)
    case(spi_data_size[3:0]) // synopsys parallel_case
        4'd0, 4'h1, 4'h2: spim_1st_bit = tx_rd_data[7];
        4'd3:  spim_1st_bit = tx_rd_data[3];
        4'd4:  spim_1st_bit = tx_rd_data[4];
        4'd5:  spim_1st_bit = tx_rd_data[5];
        4'd6:  spim_1st_bit = tx_rd_data[6];
        4'd7:  spim_1st_bit = tx_rd_data[7];
        4'd8:  spim_1st_bit = tx_rd_data[8];
        4'd9:  spim_1st_bit = tx_rd_data[9];
        4'd10: spim_1st_bit = tx_rd_data[10];
        4'd11: spim_1st_bit = tx_rd_data[11];
        4'd12: spim_1st_bit = tx_rd_data[12];
        4'd13: spim_1st_bit = tx_rd_data[13];
        4'd14: spim_1st_bit = tx_rd_data[14];
        4'd15: spim_1st_bit = tx_rd_data[15];
    endcase
    else
        spim_1st_bit = spi_mo;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_sck <= 1'b0;
    else if(~spim_en)
        spim_sck <= cpol;
    else
        if(~cpha) 
        begin
            if(spim_idle || spim_start || spim_stop)
                spim_sck <= cpol;
            else if(spim_data && txcnt_div_eq)
                spim_sck <= ~spim_sck;
        end
        else
        begin
            if(spim_idle || spim_stop)
                spim_sck <= cpol;
            else if(spim_start_end)
                spim_sck <= ~spim_sck;
            else if(spim_data_end || spim_start)
                spim_sck <= cpol;
            else if(spim_data && txcnt_div_eq)
                spim_sck <= ~spim_sck;
        end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_rx <= 16'd0;
    else if(spi_rx_en && spim_data && data_smp)
        case(txcnt_bits[4:1]) // synopsys parallel_case
            4'd0: spim_rx[0] <= spi_mi;
            4'd1: spim_rx[1] <= spi_mi;
            4'd2: spim_rx[2] <= spi_mi;
            4'd3: spim_rx[3] <= spi_mi;
            4'd4: spim_rx[4] <= spi_mi;
            4'd5: spim_rx[5] <= spi_mi;
            4'd6: spim_rx[6] <= spi_mi;
            4'd7: spim_rx[7] <= spi_mi;
            4'd8: spim_rx[8] <= spi_mi;
            4'd9: spim_rx[9] <= spi_mi;
            4'd10: spim_rx[10] <= spi_mi;
            4'd11: spim_rx[11] <= spi_mi;
            4'd12: spim_rx[12] <= spi_mi;
            4'd13: spim_rx[13] <= spi_mi;
            4'd14: spim_rx[14] <= spi_mi;
            4'd15: spim_rx[15] <= spi_mi;
        endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        stop_cnt[1:0]   <= 2'b00;
    else if(spim_stop_end)
        stop_cnt[1:0]   <= 2'b00;
    else if(txcnt_div_eq && spim_stop)
        stop_cnt[1:0]   <= stop_cnt[1:0] + 2'b01;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spim_nss <= 1'b1;
    else if(spim_nss_clr)
        spim_nss <= 1'b0;
    else if(spim_nss_set)
        spim_nss <= 1'b1;
end
assign  spim_nss_clr = spim_idle_end | (nss_toggle ? (spim_stop_end & (~stop_judge)) : 1'b0);
assign  spim_nss_set = spim_idle | (nss_toggle ? (spim_stop & txcnt_div_eq) : (spim_stop_end & stop_judge));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        cnt_bits[3:0] <= 4'd0;
    else if(~spis_en | i_nss_in)
        cnt_bits[3:0] <= 4'd0;
    else if(spis_cnt_load)
        cnt_bits[3:0] <= spi_data_size[3:0];
    else if(data_chg && ~i_nss_in)
        cnt_bits[3:0] <= cnt_bits[3:0] - 4'd1;
end
assign  spis_cnt_load = cpha ? ((~|cnt_bits) & data_chg & ~i_nss_in) : (((~|cnt_bits) & data_chg & (~i_nss_in)) | f_nss_d);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        f_nss_d <= 1'b0;
    else
        f_nss_d <= f_nss;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx[15:0] <= 16'd0;
    else if(~spis_en)
        spis_rx[15:0] <= 16'd0;
    else if(data_smp && spi_rx_en)
        case(cnt_bits[3:0]) // synopsys parallel_case
            4'd0:  spis_rx[0] <= spi_si;
            4'd1:  spis_rx[1] <= spi_si;
            4'd2:  spis_rx[2] <= spi_si;
            4'd3:  spis_rx[3] <= spi_si;
            4'd4:  spis_rx[4] <= spi_si;
            4'd5:  spis_rx[5] <= spi_si;
            4'd6:  spis_rx[6] <= spi_si;
            4'd7:  spis_rx[7] <= spi_si;
            4'd8:  spis_rx[8] <= spi_si;
            4'd9:  spis_rx[9] <= spi_si;
            4'd10: spis_rx[10] <= spi_si;
            4'd11: spis_rx[11] <= spi_si;
            4'd12: spis_rx[12] <= spi_si;
            4'd13: spis_rx[13] <= spi_si;
            4'd14: spis_rx[14] <= spi_si;
            4'd15: spis_rx[15] <= spi_si;
        endcase
end
always @( cpha
       or f_sclk
       or r_sclk
       or cpol)
begin
    if(cpha)
    begin
        data_smp = cpol ? r_sclk : f_sclk;
        data_chg = cpol ? f_sclk : r_sclk;
    end
    else
    begin
        data_smp = cpol ? f_sclk : r_sclk;
        data_chg = (cpol ? r_sclk : f_sclk);
    end
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        cnt_bits0_d <= 1'b0;
    else 
        cnt_bits0_d <= (cnt_bits[3:0] == 4'd1);
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx_en  <= 1'b0;
    else if(spis_rx_wen)
        spis_rx_en  <= 1'b0;
    else if(~|cnt_bits[3:0] && cnt_bits0_d)
        spis_rx_en  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spis_rx_wen <= 1'b0;
    else if(spis_rx_en && data_smp && spi_rx_en && spis_en)
        spis_rx_wen <= 1'b1;
    else
        spis_rx_wen <= 1'b0;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_so  <= 1'b0;
    else if(f_nss_d)
        spi_so <= spis_1st_bit;
    else if((spis_cnt_load | ((~i_nss_in) && data_chg)) && spi_tx_en && (~tx_empty))
        case(cnt_bits[3:0])
            4'd0:  spi_so <= spis_1st_bit;
            4'd1:  spi_so <= tx_rd_data[0];
            4'd2:  spi_so <= tx_rd_data[1];
            4'd3:  spi_so <= tx_rd_data[2];
            4'd4:  spi_so <= tx_rd_data[3];
            4'd5:  spi_so <= tx_rd_data[4];
            4'd6:  spi_so <= tx_rd_data[5];
            4'd7:  spi_so <= tx_rd_data[6];
            4'd8:  spi_so <= tx_rd_data[7];
            4'd9:  spi_so <= tx_rd_data[8];
            4'd10: spi_so <= tx_rd_data[9];
            4'd11: spi_so <= tx_rd_data[10];
            4'd12: spi_so <= tx_rd_data[11];
            4'd13: spi_so <= tx_rd_data[12];
            4'd14: spi_so <= tx_rd_data[13];
            4'd15: spi_so <= tx_rd_data[14];
        endcase
end
always @( tx_rd_data[15:3]
       or spi_data_size[3:0]
       or tx_rd_data[4:3])
begin
    case(spi_data_size[3:0]) // synopsys parallel_case
        4'd0, 4'h1, 4'h2: spis_1st_bit = tx_rd_data[7];
        4'd3:  spis_1st_bit = tx_rd_data[3];
        4'd4:  spis_1st_bit = tx_rd_data[4];
        4'd5:  spis_1st_bit = tx_rd_data[5];
        4'd6:  spis_1st_bit = tx_rd_data[6];
        4'd7:  spis_1st_bit = tx_rd_data[7];
        4'd8:  spis_1st_bit = tx_rd_data[8];
        4'd9:  spis_1st_bit = tx_rd_data[9];
        4'd10: spis_1st_bit = tx_rd_data[10];
        4'd11: spis_1st_bit = tx_rd_data[11];
        4'd12: spis_1st_bit = tx_rd_data[12];
        4'd13: spis_1st_bit = tx_rd_data[13];
        4'd14: spis_1st_bit = tx_rd_data[14];
        4'd15: spis_1st_bit = tx_rd_data[15];
    endcase
end
assign  rx_wr_data[15:0]  = ({16{spis_en}} & spis_rx) | ({16{spim_en}} & spim_rx);
assign  spis_tx_ren = spis_en & spi_tx_en & (~i_nss_in) & (~|cnt_bits[3:0]) & data_smp;
assign  spim_tx_ren = spim_data & (txcnt_bits[4:0] == 5'd0) & txcnt_div_eq & spi_tx_en;
assign  spim_rx_wen = spim_data & (~|txcnt_bits[4:0]) & txcnt_div_eq;
assign  spi_tx_ren  = (spis_en & spis_tx_ren) | (spim_en & spim_tx_ren);
assign  spi_rx_wen  = (spis_en & spis_rx_wen) | (spim_en & spim_rx_wen);
assign  spi_work  = (spim_en & (~spim_idle)) | (spis_en & (~i_nss_in));
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        spi_stop_intr   <= 1'b0;
    else if(spi_stop_clr || (~spi_intr_en))
        spi_stop_intr   <= 1'b0;
    else if((spim_en && spim_stop_intr) | (spis_en && spis_stop_intr))
        spi_stop_intr   <= 1'b1;
end
assign  spim_stop_intr  = (spim_stop_end & stop_judge);
assign  spis_stop_intr  = (cnt_bits[3:0] == 4'd0) & data_smp & spis_rx_en;
endmodule
module sync_fifo_16x16(
  clk,
  empty,
  empty_clr,
  empty_d,
  empty_intr,
  fifo_en,
  fifo_intr_en,
  fifo_thold,
  flag_counter,
  full,
  full_clr,
  full_intr,
  intr_edge,
  rd_data,
  rd_en,
  read_err_clr,
  read_err_intr,
  rst_n,
  thold_clr,
  thold_intr,
  wr_data,
  wr_en,
  write_err_clr,
  write_err_intr
);
input           clk;           
input           empty_clr;     
input           fifo_en;       
input   [4 :0]  fifo_intr_en;  
input   [1 :0]  fifo_thold;    
input           full_clr;      
input           intr_edge;     
input           rd_en;         
input           read_err_clr;  
input           rst_n;         
input           thold_clr;     
input   [15:0]  wr_data;       
input           wr_en;         
input           write_err_clr; 
output          empty;         
output          empty_d;       
output          empty_intr;    
output  [4 :0]  flag_counter;  
output          full;          
output          full_intr;     
output  [15:0]  rd_data;       
output          read_err_intr; 
output          thold_intr;    
output          write_err_intr; 
wire            clk;           
wire            empty_clr;     
wire            fifo_en;       
wire    [4 :0]  fifo_intr_en;  
wire    [1 :0]  fifo_thold;    
wire            full_clr;      
wire            ge_cnt_eq12;   
wire            ge_cnt_eq4;    
wire            ge_cnt_eq8;    
wire            intr_edge;     
wire            le_cnt_eq12;   
wire            le_cnt_eq4;    
wire            le_cnt_eq8;    
wire    [15:0]  rd_data;       
wire            rd_en;         
wire            read_err_clr;  
wire            rst_n;         
wire            thold_clr;     
wire    [15:0]  wr_data;       
wire            wr_en;         
wire            write_err_clr; 
reg             empty;         
reg             empty_d;       
reg             empty_intr;    
reg     [4 :0]  flag_counter;  
reg             full;          
reg             full_d;        
reg             full_intr;     
reg     [15:0]  mem_fifo  [0:15]; 
reg     [3 :0]  rd_ptr;        
reg             read_err_intr; 
reg             thold_en;      
reg             thold_intr;    
reg     [3 :0]  wr_ptr;        
reg             write_err_intr; 
parameter   FIFO_DW = 16,
            FIFO_AW = 4; 
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        wr_ptr[FIFO_AW-1:0] <= 0;
    else if(~fifo_en)
        wr_ptr[FIFO_AW-1:0] <= 0;
    else if(wr_en) 
        wr_ptr[FIFO_AW-1:0] <= wr_ptr[FIFO_AW-1:0] + 1;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        rd_ptr[FIFO_AW-1:0] <= 0;
    else if(~fifo_en)
        rd_ptr[FIFO_AW-1:0] <= 0;
    else if((~empty && rd_en) || (full && wr_en)) 
        rd_ptr[FIFO_AW-1:0] <= rd_ptr[FIFO_AW-1:0] + 1;
end
always @(posedge clk)
begin
    if (wr_en && fifo_en)
    begin
         mem_fifo[wr_ptr[FIFO_AW-1:0]] <= wr_data[FIFO_DW-1:0];
    end
end
assign rd_data[FIFO_DW-1:0] = mem_fifo[rd_ptr[FIFO_AW-1:0]];
always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        flag_counter[FIFO_AW:0] <= 0;
    else if(~fifo_en)
        flag_counter[FIFO_AW:0] <= 0;
    else if (rd_en && ~wr_en && ~empty)
        flag_counter[FIFO_AW:0] <= flag_counter[FIFO_AW:0] - 1;
    else if (~rd_en && wr_en && ~full)
        flag_counter[FIFO_AW:0] <= flag_counter[FIFO_AW:0] + 1;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        empty <= 1'b1;
    else if(~fifo_en)
        empty <= 1'b1;
    else if ((flag_counter[FIFO_AW:0] == 1) && rd_en && ~wr_en)
        empty <= 1'b1;
    else if(flag_counter[FIFO_AW:0] > 0)
        empty <= 1'b0;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        full <= 1'b0;
    else if(~fifo_en)
        full <= 1'b0;
    else if (flag_counter[FIFO_AW:0] == (1 << FIFO_AW)) 
        full <= 1'b1;
    else
        full <= 1'b0;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        thold_intr  <= 1'b0;
    else if(thold_clr | ~fifo_intr_en[0])
        thold_intr  <= 1'b0;
    else if(thold_en)
        thold_intr  <= 1'b1;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
    begin
        full_d      <= 1'b0;
        empty_d     <= 1'b0;
    end
    else
    begin
        full_d      <= full;
        empty_d     <= empty;
    end
end
assign  ge_cnt_eq4  = (flag_counter[FIFO_AW:0] >= 4); 
assign  ge_cnt_eq8  = (flag_counter[FIFO_AW:0] >= 8);
assign  ge_cnt_eq12 = (flag_counter[FIFO_AW:0] >= 12);
assign  le_cnt_eq4  = (flag_counter[FIFO_AW:0] <= 4);
assign  le_cnt_eq8  = (flag_counter[FIFO_AW:0] <= 8);
assign  le_cnt_eq12 = (flag_counter[FIFO_AW:0] <= 12);
always @( le_cnt_eq12
       or ge_cnt_eq8
       or le_cnt_eq4
       or ge_cnt_eq12
       or le_cnt_eq8
       or fifo_thold[1:0]
       or ge_cnt_eq4
       or intr_edge)
begin
    case(fifo_thold[1:0])
        2'b00:  thold_en = 1'b0;
        2'b01:  thold_en = intr_edge ? ge_cnt_eq4 : le_cnt_eq4;
        2'b10:  thold_en = intr_edge ? ge_cnt_eq8 : le_cnt_eq8;
        2'b11:  thold_en = intr_edge ? ge_cnt_eq12 : le_cnt_eq12;
    endcase
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
    begin
        full_intr   <= 1'b0;
        empty_intr  <= 1'b0;
    end
    else
    begin
        if(full_clr | ~fifo_intr_en[2])
            full_intr <= 1'b0;
        else if(full)
            full_intr <= 1'b1;
        if(empty_clr | ~fifo_intr_en[1])
            empty_intr  <= 1'b0;
        else if(empty)
            empty_intr  <= 1'b1;
    end
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        read_err_intr   <= 1'b0;
    else if(read_err_clr | ~fifo_intr_en[3])
        read_err_intr   <= 1'b0;
    else if(empty && rd_en)
        read_err_intr   <= 1'b1;
end
always @(posedge clk or negedge rst_n) 
begin
    if (!rst_n)
        write_err_intr  <= 1'b0;
    else if(write_err_clr | ~fifo_intr_en[4])
        write_err_intr  <= 1'b0;
    else if(full && wr_en)
        write_err_intr  <= 1'b1;
end
endmodule
module uart(
  clk,
  f_rxd,
  i_rxd_in,
  rst_n,
  rx_shift,
  rxd_work,
  tx_empty,
  tx_rd_data,
  txd_out,
  txd_work,
  uart_dbit,
  uart_div,
  uart_en,
  uart_eps,
  uart_intr_en,
  uart_pbit,
  uart_pen,
  uart_perr_clr,
  uart_perr_intr,
  uart_rx_wen,
  uart_rxd,
  uart_stop_clr,
  uart_stop_intr,
  uart_tx_ren
);
input           clk;            
input           f_rxd;          
input           i_rxd_in;       
input           rst_n;          
input           tx_empty;       
input   [7 :0]  tx_rd_data;     
input   [1 :0]  uart_dbit;      
input   [23:0]  uart_div;       
input           uart_en;        
input           uart_eps;       
input   [1 :0]  uart_intr_en;   
input   [1 :0]  uart_pbit;      
input           uart_pen;       
input           uart_perr_clr;  
input           uart_rxd;       
input           uart_stop_clr;  
output  [7 :0]  rx_shift;       
output          rxd_work;       
output          txd_out;        
output          txd_work;       
output          uart_perr_intr; 
output          uart_rx_wen;    
output          uart_stop_intr; 
output          uart_tx_ren;    
reg             data_parity;    
reg             dbit_en;        
reg     [2 :0]  nxt_uart_fsm;   
reg             parity_check;   
reg             rx_en;          
reg     [7 :0]  rx_shift;       
reg     [3 :0]  rxcnt_1bit;     
reg     [3 :0]  rxcnt_bits;     
reg     [23:0]  rxcnt_div16;    
reg     [3 :0]  txcnt_1bit;     
reg     [2 :0]  txcnt_bits;     
reg     [23:0]  txcnt_div16;    
reg             txd_out;        
reg             uart_bit0_en;   
reg             uart_data_end;  
reg     [2 :0]  uart_fsm;       
reg             uart_perr_intr; 
reg             uart_stop_end;  
reg             uart_stop_intr; 
wire            clk;            
wire            f_rxd;          
wire            i_rxd_in;       
wire            parity_comp;    
wire            rst_n;          
wire            rxcnt_1bit_eq;  
wire            rxcnt_div16_eq; 
wire            rxcnt_plus;     
wire            rxd_work;       
wire            tx_empty;       
wire    [7 :0]  tx_rd_data;     
wire            txcnt_1bit_eq;  
wire            txcnt_bits_eq1; 
wire            txcnt_div16_eq; 
wire            txd_work;       
wire            uart_all_end;   
wire            uart_data;      
wire    [1 :0]  uart_dbit;      
wire    [23:0]  uart_div;       
wire            uart_en;        
wire            uart_eps;       
wire            uart_idle;      
wire            uart_idle_end;  
wire    [1 :0]  uart_intr_en;   
wire            uart_parity;    
wire            uart_parity_end; 
wire    [1 :0]  uart_pbit;      
wire            uart_pen;       
wire            uart_perr_clr;  
wire            uart_rx_end;    
wire            uart_rx_wen;    
wire            uart_rxd;       
wire            uart_start;     
wire            uart_start_end; 
wire            uart_stop;      
wire            uart_stop_clr;  
wire            uart_tx_ren;    
parameter UART_IDLE   = 3'b000,
          UART_STOP   = 3'b001,
          UART_START  = 3'b011,
          UART_DATA   = 3'b010,
          UART_PARITY = 3'b110;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_fsm[2:0]   <= UART_IDLE;
    else if(uart_en)
        uart_fsm[2:0]   <= nxt_uart_fsm[2:0];
    else
        uart_fsm[2:0]   <= UART_IDLE;
end
always @( uart_stop_end
       or uart_data_end
       or uart_idle_end
       or uart_pen
       or tx_empty
       or uart_parity_end
       or uart_fsm[2:0]
       or uart_start_end)
begin
    case(uart_fsm[2:0])  
        UART_IDLE :
            if(uart_idle_end)
                nxt_uart_fsm[2:0]   = UART_START;
            else
                nxt_uart_fsm[2:0]   = UART_IDLE;
        UART_START:
            if(uart_start_end)
                nxt_uart_fsm[2:0]   = UART_DATA;
            else
                nxt_uart_fsm[2:0]   = UART_START;
        UART_DATA:
            if(uart_data_end)
            begin
                if(uart_pen)
                    nxt_uart_fsm[2:0]   = UART_PARITY;
                else
                    nxt_uart_fsm[2:0]   = UART_STOP;
            end
            else
                nxt_uart_fsm[2:0]   = UART_DATA;
        UART_PARITY:
            if(uart_parity_end)
                nxt_uart_fsm[2:0]   = UART_STOP;
            else
                nxt_uart_fsm[2:0]   = UART_PARITY;
        UART_STOP:
            if(uart_stop_end)
                if(tx_empty)
                    nxt_uart_fsm[2:0] = UART_IDLE;
                else
                    nxt_uart_fsm[2:0] = UART_START;
            else
                nxt_uart_fsm[2:0]   = UART_STOP;
        default:
            nxt_uart_fsm[2:0]   = UART_IDLE;
    endcase
end
assign  uart_idle  = (uart_fsm[2:0] == UART_IDLE);
assign  uart_start = (uart_fsm[2:0] == UART_START);
assign  uart_data  = (uart_fsm[2:0] == UART_DATA);
assign  uart_parity = (uart_fsm[2:0] == UART_PARITY);
assign  uart_stop   = (uart_fsm[2:0] == UART_STOP);
assign  txcnt_bits_eq1  = (txcnt_bits[2:0] == 3'd1);
assign  txcnt_1bit_eq   = (txcnt_1bit[3:0] == 4'd15);
assign  txcnt_div16_eq  = (txcnt_div16[23:0] == uart_div[23:0]);
assign  uart_idle_end   = uart_idle & (~tx_empty);
assign  uart_start_end  = uart_start & txcnt_div16_eq & txcnt_1bit_eq;
assign  uart_parity_end = uart_parity & txcnt_div16_eq & txcnt_1bit_eq;
assign  uart_all_end = uart_idle_end | uart_start_end | uart_data_end | 
                       uart_parity_end | uart_stop_end;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_bits[2:0] <= 3'b000;
    else if(uart_all_end || ~uart_en || uart_idle)
        txcnt_bits[2:0] <= 3'b000;
    else if(txcnt_div16_eq && txcnt_1bit_eq)
        txcnt_bits[2:0] <= txcnt_bits[2:0] + 3'b001;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_div16[23:0] <= 24'd0;
    else if(uart_stop && txcnt_bits_eq1 && (txcnt_1bit[3:0] == 4'd7) && txcnt_div16_eq)
        txcnt_div16[23:0] <= 24'd0;
    else if(txcnt_div16_eq | uart_idle)
        txcnt_div16[23:0] <= 24'd0;
    else
        txcnt_div16[23:0] <= txcnt_div16[23:0] + 24'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txcnt_1bit[3:0] <= 4'd0;
    else if(~uart_en || uart_idle || uart_stop_end)
        txcnt_1bit[3:0] <= 4'd0;
    else if(txcnt_div16_eq)
        txcnt_1bit[3:0] <= txcnt_1bit[3:0] + 4'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        txd_out <= 1'b1;
    else
    begin
        case(uart_fsm[2:0])
            UART_IDLE:  txd_out <= 1'b1;
            UART_START: txd_out <= 1'b0;
            UART_DATA: 
            begin
                case(txcnt_bits[2:0]) // synopsys parallel_case
                    3'd0: txd_out <= tx_rd_data[0];
                    3'd1: txd_out <= tx_rd_data[1];
                    3'd2: txd_out <= tx_rd_data[2];
                    3'd3: txd_out <= tx_rd_data[3];
                    3'd4: txd_out <= tx_rd_data[4];
                    3'd5: txd_out <= tx_rd_data[5];
                    3'd6: txd_out <= tx_rd_data[6];
                    3'd7: txd_out <= tx_rd_data[7];
                endcase
            end
            UART_PARITY: txd_out <= uart_eps ? data_parity : ~data_parity;
            UART_STOP:   txd_out <= 1'b1;
            default: txd_out <= txd_out;
        endcase
    end
end
always @( tx_rd_data[7:0]
       or txcnt_1bit_eq
       or txcnt_div16_eq
       or uart_dbit[1:0]
       or txcnt_bits
       or rx_shift[7:0]
       or uart_data
       or i_rxd_in)
begin
    case(uart_dbit[1:0])  // synopsys parallel_case
        2'b00: 
        begin
            data_parity  = (^tx_rd_data[4:0]);
            parity_check = (^rx_shift[4:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd4) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b01: 
        begin
            data_parity = (^tx_rd_data[5:0]);
            parity_check = (^rx_shift[5:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd5) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b10: 
        begin
            data_parity = (^tx_rd_data[6:0]);
            parity_check = (^rx_shift[6:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd6) & txcnt_div16_eq & txcnt_1bit_eq;
        end
        2'b11: 
        begin
            data_parity = (^tx_rd_data[7:0]);
            parity_check = (^rx_shift[7:0]) ^ i_rxd_in;
            uart_data_end    = uart_data & (txcnt_bits == 3'd7) & txcnt_div16_eq & txcnt_1bit_eq;
        end
    endcase
end
always @( uart_stop
       or txcnt_1bit_eq
       or uart_pbit[1:0]
       or txcnt_div16_eq
       or txcnt_bits_eq1
       or txcnt_1bit)
begin
    if(uart_stop && txcnt_div16_eq)
        case(uart_pbit[1:0]) // synopsys parallel_case
            2'b00:  uart_stop_end = txcnt_1bit_eq;
            2'b01:  uart_stop_end = (txcnt_1bit == 4'd7) & txcnt_bits_eq1;
            2'b10:  uart_stop_end = txcnt_1bit_eq & txcnt_bits_eq1;
            2'b11:  uart_stop_end = txcnt_1bit_eq;  
        endcase
    else
        uart_stop_end = 1'b0;
end
assign  uart_tx_ren = uart_stop & ((~|txcnt_bits[2:0])) & (txcnt_1bit[3:0] == 4'd1) 
                     & txcnt_div16_eq;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_div16[23:0]   <= 24'd0;
    else if(~uart_en || (rxcnt_div16[23:0] == uart_div[23:0]) || uart_rx_end)
        rxcnt_div16[23:0]   <= 24'd0;
    else if(rxcnt_plus)
        rxcnt_div16[23:0] <= rxcnt_div16[23:0] + 24'd1;
end
assign  rxcnt_plus = ((rxcnt_bits[3:0] == 4'd0) & (f_rxd | uart_bit0_en)) 
                     | (rxcnt_bits[3:0] != 4'd0);
assign  uart_rx_end = (rxcnt_bits[3:0] == 4'ha) & rxcnt_div16_eq &
                      (rxcnt_1bit[3:0] == 4'd7);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_bit0_en    <= 1'b0;
    else if(uart_rx_end || (rxcnt_bits[3:0] != 4'd0))
        uart_bit0_en    <= 1'b0;
    else if(f_rxd && (rxcnt_bits[3:0] == 4'd0))
        uart_bit0_en    <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_bits[3:0] <= 4'd0;
    else if(~rx_en || ~uart_en || uart_rx_end)
        rxcnt_bits[3:0] <= 4'd0;
    else if(rxcnt_div16_eq && rxcnt_1bit_eq)
        case(rxcnt_bits[3:0])
            4'd5,4'd6,4'd7,4'd8:
                if(dbit_en)
                    rxcnt_bits[3:0] <= 4'd9 + (uart_pen ? 4'd0 : 4'd1);
                else
                    rxcnt_bits[3:0] <= rxcnt_bits[3:0] + 4'd1;
            4'd10: rxcnt_bits[3:0] <= 4'd0;
            default:rxcnt_bits[3:0] <= rxcnt_bits[3:0] + 4'd1; 
        endcase
end
always @( uart_dbit[1:0]
       or rxcnt_bits[3:0])
begin
    case(uart_dbit[1:0]) // synopsys parallel_case
        2'b00: 
        begin
            if(rxcnt_bits[3:0] == 4'd5)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b01:
        begin
            if(rxcnt_bits[3:0] == 4'd6)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b10:
        begin
            if(rxcnt_bits[3:0] == 4'd7)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
        2'b11:
        begin
            if(rxcnt_bits[3:0] == 4'd8)
                dbit_en = 1'b1;
            else
                dbit_en = 1'b0;
        end
    endcase
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rx_en   <= 1'b0;
    else if(~uart_en)
        rx_en   <= 1'b0;
    else if((rxcnt_bits[3:0] == 4'd10) && (rxcnt_1bit[3:0] == 4'd7) && rxcnt_div16_eq)
        rx_en   <= 1'b0;
    else if((rxcnt_bits[3:0] == 4'd0) && (rxcnt_1bit[3:0] < 4'd7)  && rxcnt_div16_eq)
        rx_en   <= ~uart_rxd; 
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rxcnt_1bit[3:0] <= 4'd0;
    else if(~uart_en || uart_rx_end)
        rxcnt_1bit[3:0] <= 4'd0;
    else if(rxcnt_div16_eq)
        rxcnt_1bit[3:0]     <= rxcnt_1bit[3:0] + 4'd1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rx_shift[7:0]   <= 8'd0;
    else if((rxcnt_1bit[3:0] == 4'd7) && rxcnt_div16_eq)
        case(rxcnt_bits[3:0])
            4'd1: rx_shift[0] <= i_rxd_in;
            4'd2: rx_shift[1] <= i_rxd_in;
            4'd3: rx_shift[2] <= i_rxd_in;
            4'd4: rx_shift[3] <= i_rxd_in;
            4'd5: rx_shift[4] <= i_rxd_in;
            4'd6: rx_shift[5] <= i_rxd_in;
            4'd7: rx_shift[6] <= i_rxd_in;
            4'd8: rx_shift[7] <= i_rxd_in;
            default: rx_shift[7:0] <= rx_shift[7:0];
        endcase
end
assign  uart_rx_wen = (rxcnt_bits[3:0] == 4'd10) & (rxcnt_1bit[3:0] == 4'd1) & rxcnt_div16_eq;
assign  rxcnt_1bit_eq   = (rxcnt_1bit[3:0] == 4'hf);
assign  rxcnt_div16_eq  = (rxcnt_div16[23:0] == uart_div[23:0]);
assign  rxd_work  = rx_en;
assign  txd_work  = ~uart_idle;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_stop_intr  <= 1'b0;
    else if(uart_stop_clr || (~uart_intr_en[0]))
        uart_stop_intr  <= 1'b0;
    else if((tx_empty && uart_stop_end) || uart_rx_wen)
        uart_stop_intr  <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        uart_perr_intr  <= 1'b0;
    else if(uart_perr_clr || (~uart_intr_en[1]))
        uart_perr_intr  <= 1'b0;
    else if(parity_comp)
        uart_perr_intr  <= 1'b1;
end
assign  parity_comp = (rxcnt_bits[3:0] == 4'd9) &
                      (rxcnt_1bit[3:0] == 4'd7) &
                      (rxcnt_div16[23:0] == uart_div[23:0]) &
                      (uart_eps ? parity_check : (~parity_check)); 
endmodule
module usi0_sec_top(
  clk,
  dma_ack_rx,
  dma_ack_tx,
  dma_req_rx,
  dma_req_tx,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  paddr,
  penable,
  pprot,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  sec_rx_req,
  sec_tx_req,
  tipc_usi0_trust,
  usi_etb_rx_trig,
  usi_etb_tx_trig,
  usi_intr
);
input           clk;            
input           dma_ack_rx;     
input           dma_ack_tx;     
input           nss_in;         
input   [31:0]  paddr;          
input           penable;        
input   [2 :0]  pprot;          
input           psel;           
input   [31:0]  pwdata;         
input           pwrite;         
input           rst_n;          
input           sclk_in;        
input           sd0_in;         
input           sd1_in;         
input           tipc_usi0_trust; 
output          dma_req_rx;     
output          dma_req_tx;     
output          nss_ie_n;       
output          nss_oe_n;       
output          nss_out;        
output  [31:0]  prdata;         
output          sclk_ie_n;      
output          sclk_oe_n;      
output          sclk_out;       
output          sd0_ie_n;       
output          sd0_oe_n;       
output          sd0_out;        
output          sd1_ie_n;       
output          sd1_oe_n;       
output          sd1_out;        
output          sec_rx_req;     
output          sec_tx_req;     
output          usi_etb_rx_trig; 
output          usi_etb_tx_trig; 
output          usi_intr;       
wire            clk;            
wire            dma_ack_rx;     
wire            dma_ack_tx;     
wire            dma_req_rx;     
wire            dma_req_tx;     
wire    [31:0]  i_prdata;       
wire            i_psel;         
wire            i_pwrite;       
wire            nss_ie_n;       
wire            nss_in;         
wire            nss_oe_n;       
wire            nss_out;        
wire    [31:0]  paddr;          
wire            penable;        
wire    [2 :0]  pprot;          
wire    [31:0]  prdata;         
wire            psel;           
wire    [31:0]  pwdata;         
wire            pwrite;         
wire            rst_n;          
wire            sclk_ie_n;      
wire            sclk_in;        
wire            sclk_oe_n;      
wire            sclk_out;       
wire            sd0_ie_n;       
wire            sd0_in;         
wire            sd0_oe_n;       
wire            sd0_out;        
wire            sd1_ie_n;       
wire            sd1_in;         
wire            sd1_oe_n;       
wire            sd1_out;        
wire            sec_rx_req;     
wire            sec_tx_req;     
wire            tipc_usi0_trust; 
wire            usi_etb_rx_trig; 
wire            usi_etb_tx_trig; 
wire            usi_intr;       
usi_top  x_usi0 (
  .clk             (clk            ),
  .dma_ack_rx      (dma_ack_rx     ),
  .dma_ack_tx      (dma_ack_tx     ),
  .dma_req_rx      (dma_req_rx     ),
  .dma_req_tx      (dma_req_tx     ),
  .nss_ie_n        (nss_ie_n       ),
  .nss_in          (nss_in         ),
  .nss_oe_n        (nss_oe_n       ),
  .nss_out         (nss_out        ),
  .paddr           (paddr          ),
  .penable         (penable        ),
  .prdata          (i_prdata       ),
  .psel            (i_psel         ),
  .pwdata          (pwdata         ),
  .pwrite          (i_pwrite       ),
  .rst_n           (rst_n          ),
  .sclk_ie_n       (sclk_ie_n      ),
  .sclk_in         (sclk_in        ),
  .sclk_oe_n       (sclk_oe_n      ),
  .sclk_out        (sclk_out       ),
  .sd0_ie_n        (sd0_ie_n       ),
  .sd0_in          (sd0_in         ),
  .sd0_oe_n        (sd0_oe_n       ),
  .sd0_out         (sd0_out        ),
  .sd1_ie_n        (sd1_ie_n       ),
  .sd1_in          (sd1_in         ),
  .sd1_oe_n        (sd1_oe_n       ),
  .sd1_out         (sd1_out        ),
  .usi_etb_rx_trig (usi_etb_rx_trig),
  .usi_etb_tx_trig (usi_etb_tx_trig),
  .usi_intr        (usi_intr       )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite = pwrite;
assign i_psel = psel;

assign sec_rx_req = dma_req_rx;
assign sec_tx_req = dma_req_tx;

endmodule
module usi_top(
  clk,
  dma_ack_rx,
  dma_ack_tx,
  dma_req_rx,
  dma_req_tx,
  nss_ie_n,
  nss_in,
  nss_oe_n,
  nss_out,
  paddr,
  penable,
  prdata,
  psel,
  pwdata,
  pwrite,
  rst_n,
  sclk_ie_n,
  sclk_in,
  sclk_oe_n,
  sclk_out,
  sd0_ie_n,
  sd0_in,
  sd0_oe_n,
  sd0_out,
  sd1_ie_n,
  sd1_in,
  sd1_oe_n,
  sd1_out,
  usi_etb_rx_trig,
  usi_etb_tx_trig,
  usi_intr
);
input           clk;                 
input           dma_ack_rx;          
input           dma_ack_tx;          
input           nss_in;              
input   [31:0]  paddr;               
input           penable;             
input           psel;                
input   [31:0]  pwdata;              
input           pwrite;              
input           rst_n;               
input           sclk_in;             
input           sd0_in;              
input           sd1_in;              
output          dma_req_rx;          
output          dma_req_tx;          
output          nss_ie_n;            
output          nss_oe_n;            
output          nss_out;             
output  [31:0]  prdata;              
output          sclk_ie_n;           
output          sclk_oe_n;           
output          sclk_out;            
output          sd0_ie_n;            
output          sd0_oe_n;            
output          sd0_out;             
output          sd1_ie_n;            
output          sd1_oe_n;            
output          sd1_out;             
output          usi_etb_rx_trig;     
output          usi_etb_tx_trig;     
output          usi_intr;            
reg             dma_req_rx;          
reg             dma_req_tx;          
reg             set_rx_req_trig_dly; 
reg             set_tx_req_trig_dly; 
reg     [15:0]  tx_rd_data;          
reg             tx_ren_d;            
reg             tx_wen_d;            
reg             usi_etb_rx_trig;     
reg             usi_etb_tx_trig;     
wire            clk;                 
wire    [23:0]  clk_div0;            
wire            cpha;                
wire            cpol;                
wire            dma_ack_rx;          
wire            dma_ack_tx;          
wire            f_nss;               
wire            f_rxd;               
wire            f_scl;               
wire    [2 :0]  f_scl_d;             
wire            f_sda;               
wire    [9 :0]  fifo_intr_en;        
wire    [9 :0]  i2c_addr;            
wire            i2c_aerr_clr;        
wire            i2c_en;              
wire    [7 :0]  i2c_fs_div;          
wire    [23:0]  i2c_hcnt;            
wire    [7 :0]  i2c_hold;            
wire    [4 :0]  i2c_intr_en;         
wire    [23:0]  i2c_lcnt;            
wire            i2c_mode;            
wire            i2c_nack_clr;        
wire            i2c_nack_intr;       
wire    [7 :0]  i2c_rx;              
wire            i2c_rx_wen;          
wire            i2c_stop_clr;        
wire            i2c_stop_intr;       
wire            i2c_tx_ren;          
wire            i2cm_aerr_intr;      
wire            i2cm_amode;          
wire    [2 :0]  i2cm_code;           
wire            i2cm_data;           
wire            i2cm_en;             
wire            i2cm_gcall;          
wire            i2cm_hs;             
wire            i2cm_lose_arbi_clr;  
wire            i2cm_lose_arbi_intr; 
wire            i2cm_sbyte;          
wire            i2cm_stop;           
wire            i2cm_work;           
wire            i2cs_amode;          
wire            i2cs_en;             
wire            i2cs_gcall;          
wire            i2cs_gcall_clr;      
wire            i2cs_gcall_intr;     
wire            i2cs_hs;             
wire            i2cs_sbyte;          
wire            i2cs_work;           
wire            i_nss_in;            
wire            i_scl_in;            
wire            i_sd1_in;            
wire            i_sda_in;            
wire            intr_edge;           
wire            nss_ie_n;            
wire            nss_in;              
wire            nss_oe_n;            
wire            nss_out;             
wire            nss_toggle;          
wire    [31:0]  paddr;               
wire            penable;             
wire    [31:0]  prdata;              
wire            psel;                
wire    [31:0]  pwdata;              
wire            pwrite;              
wire            r_scl;               
wire    [2 :0]  r_scl_d;             
wire            r_sda;               
wire            rst_n;               
wire    [4 :0]  rx_data_cnt;         
wire            rx_dma_en;           
wire    [4 :0]  rx_dma_th;           
wire            rx_empty;            
wire            rx_empty_clr;        
wire            rx_empty_d;          
wire            rx_empty_intr;       
wire            rx_fifo_en;          
wire    [1 :0]  rx_fifo_th;          
wire            rx_full;             
wire            rx_full_clr;         
wire            rx_full_intr;        
wire    [15:0]  rx_rd_data;          
wire            rx_read_err_clr;     
wire            rx_read_err_intr;    
wire            rx_ren;              
wire            rx_thold_clr;        
wire            rx_thold_intr;       
wire            rx_wen;              
wire    [15:0]  rx_wr_data;          
wire            rx_write_err_clr;    
wire            rx_write_err_intr;   
wire            rxd_work;            
wire            scl_out;             
wire            sclk_ie_n;           
wire            sclk_in;             
wire            sclk_oe_n;           
wire            sclk_out;            
wire            sd0_ie_n;            
wire            sd0_in;              
wire            sd0_oe_n;            
wire            sd0_out;             
wire            sd1_ie_n;            
wire            sd1_in;              
wire            sd1_oe_n;            
wire            sd1_out;             
wire            sda_out;             
wire            sdata_en;            
wire            set_rx_req_trig;     
wire            set_rx_req_trig_psdg; 
wire            set_tx_req_trig;     
wire            set_tx_req_trig_psdg; 
wire    [3 :0]  spi_data_size;       
wire            spi_en;              
wire            spi_intr_en;         
wire            spi_mo;              
wire    [15:0]  spi_rx;              
wire            spi_rx_en;           
wire            spi_rx_wen;          
wire            spi_so;              
wire            spi_stop_clr;        
wire            spi_stop_intr;       
wire            spi_tx_en;           
wire            spi_tx_ren;          
wire            spi_work;            
wire            spim_en;             
wire            spim_nss;            
wire            spim_sck;            
wire            spis_en;             
wire    [4 :0]  tx_data_cnt;         
wire            tx_dma_en;           
wire    [4 :0]  tx_dma_th;           
wire            tx_empty;            
wire            tx_empty_clr;        
wire            tx_empty_d;          
wire            tx_empty_intr;       
wire            tx_fifo_en;          
wire            tx_fifo_latch_en;    
wire    [1 :0]  tx_fifo_th;          
wire            tx_full;             
wire            tx_full_clr;         
wire            tx_full_intr;        
wire    [15:0]  tx_rd_data_tmp;      
wire            tx_read_err_clr;     
wire            tx_read_err_intr;    
wire            tx_ren;              
wire            tx_thold_clr;        
wire            tx_thold_intr;       
wire            tx_wen;              
wire            tx_write_err_clr;    
wire            tx_write_err_intr;   
wire            txd_out;             
wire            txd_work;            
wire    [1 :0]  uart_dbit;           
wire    [23:0]  uart_div;            
wire            uart_en;             
wire            uart_eps;            
wire    [1 :0]  uart_intr_en;        
wire    [1 :0]  uart_pbit;           
wire            uart_pen;            
wire            uart_perr_clr;       
wire            uart_perr_intr;      
wire    [7 :0]  uart_rx;             
wire            uart_rx_wen;         
wire            uart_stop_clr;       
wire            uart_stop_intr;      
wire            uart_tx_ren;         
wire    [3 :0]  usi_ctrl;            
wire            usi_intr;            
wire            wr_clk_div;          
uart  x_uart (
  .clk             (clk            ),
  .f_rxd           (f_rxd          ),
  .i_rxd_in        (i_scl_in       ),
  .rst_n           (rst_n          ),
  .rx_shift        (uart_rx[7:0]   ),
  .rxd_work        (rxd_work       ),
  .tx_empty        (tx_empty       ),
  .tx_rd_data      (tx_rd_data[7:0]),
  .txd_out         (txd_out        ),
  .txd_work        (txd_work       ),
  .uart_dbit       (uart_dbit      ),
  .uart_div        (uart_div       ),
  .uart_en         (uart_en        ),
  .uart_eps        (uart_eps       ),
  .uart_intr_en    (uart_intr_en   ),
  .uart_pbit       (uart_pbit      ),
  .uart_pen        (uart_pen       ),
  .uart_perr_clr   (uart_perr_clr  ),
  .uart_perr_intr  (uart_perr_intr ),
  .uart_rx_wen     (uart_rx_wen    ),
  .uart_rxd        (i_scl_in       ),
  .uart_stop_clr   (uart_stop_clr  ),
  .uart_stop_intr  (uart_stop_intr ),
  .uart_tx_ren     (uart_tx_ren    )
);
i2c_top  x_i2c_top (
  .clk                 (clk                ),
  .f_scl               (f_scl              ),
  .f_scl_d             (f_scl_d            ),
  .f_sda               (f_sda              ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_mode            (i2c_mode           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_nack_intr       (i2c_nack_intr      ),
  .i2c_rx              (i2c_rx             ),
  .i2c_rx_wen          (i2c_rx_wen         ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2c_stop_intr       (i2c_stop_intr      ),
  .i2c_tx_ren          (i2c_tx_ren         ),
  .i2cm_aerr_intr      (i2cm_aerr_intr     ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_work           (i2cm_work          ),
  .i2cs_amode          (i2cs_amode         ),
  .i2cs_en             (i2cs_en            ),
  .i2cs_gcall          (i2cs_gcall         ),
  .i2cs_gcall_clr      (i2cs_gcall_clr     ),
  .i2cs_gcall_intr     (i2cs_gcall_intr    ),
  .i2cs_hs             (i2cs_hs            ),
  .i2cs_sbyte          (i2cs_sbyte         ),
  .i2cs_tx_data        (tx_rd_data[7:0]    ),
  .i2cs_work           (i2cs_work          ),
  .i_scl_in            (i_scl_in           ),
  .i_sda_in            (i_sda_in           ),
  .r_scl               (r_scl              ),
  .r_scl_d             (r_scl_d[2:1]       ),
  .r_sda               (r_sda              ),
  .rst_n               (rst_n              ),
  .rx_full             (rx_full            ),
  .scl_out             (scl_out            ),
  .sda_out             (sda_out            ),
  .tx_empty            (tx_empty           ),
  .tx_empty_d          (tx_empty_d         ),
  .tx_rd_data          (tx_rd_data[9:0]    ),
  .wr_clk_div          (wr_clk_div         )
);
spi  x_spi (
  .clk            (clk           ),
  .clk_div0       (clk_div0[23:1]),
  .cpha           (cpha          ),
  .cpol           (cpol          ),
  .f_nss          (f_nss         ),
  .f_sclk         (f_scl         ),
  .i_nss_in       (i_nss_in      ),
  .nss_toggle     (nss_toggle    ),
  .r_sclk         (r_scl         ),
  .rst_n          (rst_n         ),
  .rx_full        (rx_full       ),
  .rx_wr_data     (spi_rx[15:0]  ),
  .spi_data_size  (spi_data_size ),
  .spi_intr_en    (spi_intr_en   ),
  .spi_mi         (i_sd1_in      ),
  .spi_mo         (spi_mo        ),
  .spi_rx_en      (spi_rx_en     ),
  .spi_rx_wen     (spi_rx_wen    ),
  .spi_si         (i_sda_in      ),
  .spi_so         (spi_so        ),
  .spi_stop_clr   (spi_stop_clr  ),
  .spi_stop_intr  (spi_stop_intr ),
  .spi_tx_en      (spi_tx_en     ),
  .spi_tx_ren     (spi_tx_ren    ),
  .spi_work       (spi_work      ),
  .spim_en        (spim_en       ),
  .spim_nss       (spim_nss      ),
  .spim_sck       (spim_sck      ),
  .spis_en        (spis_en       ),
  .tx_empty       (tx_empty      ),
  .tx_rd_data     (tx_rd_data    )
);
sdata_if  x_sdata_if (
  .clk       (clk      ),
  .f_nss     (f_nss    ),
  .f_rxd     (f_rxd    ),
  .f_scl     (f_scl    ),
  .f_scl_d   (f_scl_d  ),
  .f_sda     (f_sda    ),
  .i2c_en    (i2c_en   ),
  .i2c_mode  (i2c_mode ),
  .i2cm_en   (i2cm_en  ),
  .i2cs_en   (i2cs_en  ),
  .i_nss_in  (i_nss_in ),
  .i_scl_in  (i_scl_in ),
  .i_sd1_in  (i_sd1_in ),
  .i_sda_in  (i_sda_in ),
  .nss_ie_n  (nss_ie_n ),
  .nss_in    (nss_in   ),
  .nss_oe_n  (nss_oe_n ),
  .nss_out   (nss_out  ),
  .r_scl     (r_scl    ),
  .r_scl_d   (r_scl_d  ),
  .r_sda     (r_sda    ),
  .rst_n     (rst_n    ),
  .scl_out   (scl_out  ),
  .sclk_ie_n (sclk_ie_n),
  .sclk_in   (sclk_in  ),
  .sclk_oe_n (sclk_oe_n),
  .sclk_out  (sclk_out ),
  .sd0_ie_n  (sd0_ie_n ),
  .sd0_in    (sd0_in   ),
  .sd0_oe_n  (sd0_oe_n ),
  .sd0_out   (sd0_out  ),
  .sd1_ie_n  (sd1_ie_n ),
  .sd1_in    (sd1_in   ),
  .sd1_oe_n  (sd1_oe_n ),
  .sd1_out   (sd1_out  ),
  .sda_out   (sda_out  ),
  .sdata_en  (sdata_en ),
  .spi_mo    (spi_mo   ),
  .spi_rx_en (spi_rx_en),
  .spi_so    (spi_so   ),
  .spim_en   (spim_en  ),
  .spim_nss  (spim_nss ),
  .spim_sck  (spim_sck ),
  .spis_en   (spis_en  ),
  .txd_out   (txd_out  ),
  .uart_en   (uart_en  )
);
apb_if  x_apb_if (
  .clk                 (clk                ),
  .clk_div0            (clk_div0           ),
  .cpha                (cpha               ),
  .cpol                (cpol               ),
  .fifo_intr_en        (fifo_intr_en       ),
  .i2c_addr            (i2c_addr           ),
  .i2c_aerr_clr        (i2c_aerr_clr       ),
  .i2c_aerr_intr       (i2cm_aerr_intr     ),
  .i2c_en              (i2c_en             ),
  .i2c_fs_div          (i2c_fs_div         ),
  .i2c_hcnt            (i2c_hcnt           ),
  .i2c_hold            (i2c_hold           ),
  .i2c_intr_en         (i2c_intr_en        ),
  .i2c_lcnt            (i2c_lcnt           ),
  .i2c_mode            (i2c_mode           ),
  .i2c_nack_clr        (i2c_nack_clr       ),
  .i2c_nack_intr       (i2c_nack_intr      ),
  .i2c_stop_clr        (i2c_stop_clr       ),
  .i2c_stop_intr       (i2c_stop_intr      ),
  .i2cm_amode          (i2cm_amode         ),
  .i2cm_code           (i2cm_code          ),
  .i2cm_data           (i2cm_data          ),
  .i2cm_en             (i2cm_en            ),
  .i2cm_gcall          (i2cm_gcall         ),
  .i2cm_hs             (i2cm_hs            ),
  .i2cm_lose_arbi_clr  (i2cm_lose_arbi_clr ),
  .i2cm_lose_arbi_intr (i2cm_lose_arbi_intr),
  .i2cm_sbyte          (i2cm_sbyte         ),
  .i2cm_stop           (i2cm_stop          ),
  .i2cm_work           (i2cm_work          ),
  .i2cs_amode          (i2cs_amode         ),
  .i2cs_en             (i2cs_en            ),
  .i2cs_gcall          (i2cs_gcall         ),
  .i2cs_gcall_clr      (i2cs_gcall_clr     ),
  .i2cs_gcall_intr     (i2cs_gcall_intr    ),
  .i2cs_hs             (i2cs_hs            ),
  .i2cs_sbyte          (i2cs_sbyte         ),
  .i2cs_work           (i2cs_work          ),
  .intr_edge           (intr_edge          ),
  .nss_toggle          (nss_toggle         ),
  .paddr               (paddr              ),
  .penable             (penable            ),
  .prdata              (prdata             ),
  .psel                (psel               ),
  .pwdata              (pwdata             ),
  .pwrite              (pwrite             ),
  .rst_n               (rst_n              ),
  .rx_data_cnt         (rx_data_cnt        ),
  .rx_dma_en           (rx_dma_en          ),
  .rx_dma_th           (rx_dma_th          ),
  .rx_empty            (rx_empty           ),
  .rx_empty_clr        (rx_empty_clr       ),
  .rx_empty_intr       (rx_empty_intr      ),
  .rx_fifo_en          (rx_fifo_en         ),
  .rx_fifo_th          (rx_fifo_th         ),
  .rx_full             (rx_full            ),
  .rx_full_clr         (rx_full_clr        ),
  .rx_full_intr        (rx_full_intr       ),
  .rx_rd_data          (rx_rd_data         ),
  .rx_read_err_clr     (rx_read_err_clr    ),
  .rx_read_err_intr    (rx_read_err_intr   ),
  .rx_ren              (rx_ren             ),
  .rx_thold_clr        (rx_thold_clr       ),
  .rx_thold_intr       (rx_thold_intr      ),
  .rx_write_err_clr    (rx_write_err_clr   ),
  .rx_write_err_intr   (rx_write_err_intr  ),
  .rxd_work            (rxd_work           ),
  .sdata_en            (sdata_en           ),
  .spi_data_size       (spi_data_size      ),
  .spi_en              (spi_en             ),
  .spi_intr_en         (spi_intr_en        ),
  .spi_rx_en           (spi_rx_en          ),
  .spi_stop_clr        (spi_stop_clr       ),
  .spi_stop_intr       (spi_stop_intr      ),
  .spi_tx_en           (spi_tx_en          ),
  .spi_work            (spi_work           ),
  .spim_en             (spim_en            ),
  .spis_en             (spis_en            ),
  .tx_data_cnt         (tx_data_cnt        ),
  .tx_dma_en           (tx_dma_en          ),
  .tx_dma_th           (tx_dma_th          ),
  .tx_empty            (tx_empty           ),
  .tx_empty_clr        (tx_empty_clr       ),
  .tx_empty_intr       (tx_empty_intr      ),
  .tx_fifo_en          (tx_fifo_en         ),
  .tx_fifo_th          (tx_fifo_th         ),
  .tx_full             (tx_full            ),
  .tx_full_clr         (tx_full_clr        ),
  .tx_full_intr        (tx_full_intr       ),
  .tx_read_err_clr     (tx_read_err_clr    ),
  .tx_read_err_intr    (tx_read_err_intr   ),
  .tx_thold_clr        (tx_thold_clr       ),
  .tx_thold_intr       (tx_thold_intr      ),
  .tx_wen              (tx_wen             ),
  .tx_write_err_clr    (tx_write_err_clr   ),
  .tx_write_err_intr   (tx_write_err_intr  ),
  .txd_work            (txd_work           ),
  .uart_dbit           (uart_dbit          ),
  .uart_div            (uart_div           ),
  .uart_en             (uart_en            ),
  .uart_eps            (uart_eps           ),
  .uart_intr_en        (uart_intr_en       ),
  .uart_pbit           (uart_pbit          ),
  .uart_pen            (uart_pen           ),
  .uart_perr_clr       (uart_perr_clr      ),
  .uart_perr_intr      (uart_perr_intr     ),
  .uart_stop_clr       (uart_stop_clr      ),
  .uart_stop_intr      (uart_stop_intr     ),
  .usi_ctrl            (usi_ctrl           ),
  .usi_intr            (usi_intr           ),
  .wr_clk_div          (wr_clk_div         )
);
sync_fifo_16x16  x_tx_sync_fifo_16x16 (
  .clk                  (clk                 ),
  .empty                (tx_empty            ),
  .empty_clr            (tx_empty_clr        ),
  .empty_d              (tx_empty_d          ),
  .empty_intr           (tx_empty_intr       ),
  .fifo_en              (tx_fifo_en          ),
  .fifo_intr_en         (fifo_intr_en[4:0]   ),
  .fifo_thold           (tx_fifo_th          ),
  .flag_counter         (tx_data_cnt[4:0]    ),
  .full                 (tx_full             ),
  .full_clr             (tx_full_clr         ),
  .full_intr            (tx_full_intr        ),
  .intr_edge            (intr_edge           ),
  .rd_data              (tx_rd_data_tmp[15:0]),
  .rd_en                (tx_ren              ),
  .read_err_clr         (tx_read_err_clr     ),
  .read_err_intr        (tx_read_err_intr    ),
  .rst_n                (rst_n               ),
  .thold_clr            (tx_thold_clr        ),
  .thold_intr           (tx_thold_intr       ),
  .wr_data              (pwdata[15:0]        ),
  .wr_en                (tx_wen              ),
  .write_err_clr        (tx_write_err_clr    ),
  .write_err_intr       (tx_write_err_intr   )
);
sync_fifo_16x16  x_rx_sync_fifo_16x16 (
  .clk               (clk              ),
  .empty             (rx_empty         ),
  .empty_clr         (rx_empty_clr     ),
  .empty_d           (rx_empty_d       ),
  .empty_intr        (rx_empty_intr    ),
  .fifo_en           (rx_fifo_en       ),
  .fifo_intr_en      (fifo_intr_en[9:5]),
  .fifo_thold        (rx_fifo_th       ),
  .flag_counter      (rx_data_cnt[4:0] ),
  .full              (rx_full          ),
  .full_clr          (rx_full_clr      ),
  .full_intr         (rx_full_intr     ),
  .intr_edge         (intr_edge        ),
  .rd_data           (rx_rd_data[15:0] ),
  .rd_en             (rx_ren           ),
  .read_err_clr      (rx_read_err_clr  ),
  .read_err_intr     (rx_read_err_intr ),
  .rst_n             (rst_n            ),
  .thold_clr         (rx_thold_clr     ),
  .thold_intr        (rx_thold_intr    ),
  .wr_data           (rx_wr_data[15:0] ),
  .wr_en             (rx_wen           ),
  .write_err_clr     (rx_write_err_clr ),
  .write_err_intr    (rx_write_err_intr)
);
assign  rx_wr_data[15:0] = ({8'd0, ({8{uart_en}} & uart_rx[7:0])}) |
                           ({8'd0, ({8{i2c_en}} & i2c_rx[7:0])}) |
                           ({16{spi_en}} & spi_rx[15:0]);
assign  rx_wen  = (uart_en & uart_rx_wen) | (i2c_en & i2c_rx_wen) | 
                  (spi_en & spi_rx_wen); 
assign  tx_ren  = (uart_en & uart_tx_ren) | (i2c_en & i2c_tx_ren) | (spi_en & spi_tx_ren);
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        tx_wen_d <= 1'b0;
        tx_ren_d <= 1'b0;
    end
    else if(~tx_fifo_en)
    begin
        tx_wen_d <= 1'b0;
        tx_ren_d <= 1'b0;
    end
    else
    begin
        tx_wen_d <= tx_wen;
        tx_ren_d <= tx_ren;
    end
end
always@(posedge clk)
begin
    if(tx_fifo_latch_en)
        tx_rd_data[15:0]    <= tx_rd_data_tmp[15:0];
end
assign  tx_fifo_latch_en = tx_wen_d | tx_ren_d;
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        dma_req_rx  <= 1'b0;
        dma_req_tx  <= 1'b0;
    end
    else
    begin
        if(~rx_dma_en || dma_ack_rx)
            dma_req_rx  <= 1'b0;
        else if(rx_dma_th[4:0] <= rx_data_cnt[4:0])
            dma_req_rx  <= 1'b1;
        if(~tx_dma_en || dma_ack_tx)
            dma_req_tx  <= 1'b0;
        else if(tx_dma_th[4:0] >= tx_data_cnt[4:0])
            dma_req_tx  <= 1'b1;
    end
end
assign set_rx_req_trig = ((rx_dma_th[4:0] + 1'b1) <= rx_data_cnt[4:0]) && usi_ctrl[0];
assign set_tx_req_trig = (0 == tx_data_cnt[4:0]) && usi_ctrl[0];
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        set_rx_req_trig_dly <= 1'b0;
    end
    else  begin
       set_rx_req_trig_dly  <= set_rx_req_trig;
    end
end
assign set_rx_req_trig_psdg = set_rx_req_trig & (!set_rx_req_trig_dly);
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        set_tx_req_trig_dly <= 1'b0;
    end
    else  begin
       set_tx_req_trig_dly  <= set_tx_req_trig;
    end
end
assign set_tx_req_trig_psdg = set_tx_req_trig & (!set_tx_req_trig_dly);
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) 
        usi_etb_rx_trig <= 1'b0;
    else if(!usi_ctrl[0])
        usi_etb_rx_trig <= 1'b0;
    else if(usi_etb_rx_trig)
        usi_etb_rx_trig <= 1'b0;
    else if(set_rx_req_trig_psdg)
        usi_etb_rx_trig <= 1'b1;
end
always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        usi_etb_tx_trig <= 1'b0;
    else if(!usi_ctrl[0])
        usi_etb_tx_trig <= 1'b0;
    else if(usi_etb_tx_trig)
        usi_etb_tx_trig <= 1'b0;
    else if(set_tx_req_trig_psdg)
        usi_etb_tx_trig <= 1'b1;
end
endmodule
