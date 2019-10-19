module e902_had_test ();
//===================================================================
`define jtag_tclk 	`TB_MODULE.PAD_JTAG_TCLK
`define jtag_tms        `TB_MODULE.PAD_JTAG_TMS

//-----------------------------------------------
`define id           7'b0000010
`define tracer       7'b0000011
`define mbca         7'b0000100
`define mbcb         7'b0000101
`define pcfifo       7'b0000110
`define baba         7'b0000111
`define babb         7'b0001000
`define bama         7'b0001001
`define bamb         7'b0001010
`define cpuscr       7'b0001011
`define bypass       7'b0001100
`define hcr          7'b0001101
`define hsr          7'b0001110

`define daddr        7'b0011000
`define ddata        7'b0011001

`define wbbr         7'b0010001
`define psr          7'b0010010
`define pc           7'b0010011
`define ir           7'b0010100
`define csr          7'b0010101 

`define wbbr_go_ex   7'b1110001
`define wbbr_go_nex  7'b1010001
`define wbbr_ngo_ex  7'b0110001
`define wbbr_ngo_nex 7'b0010001
`define psr_go_ex    7'b1110010
`define psr_go_nex   7'b1010010
`define psr_ngo_ex   7'b0110010
`define psr_ngo_nex  7'b0010010
`define pc_go_ex     7'b1110011
`define pc_go_nex    7'b1010011
`define pc_ngo_ex    7'b0110011
`define pc_ngo_nex   7'b0010011
`define ir_go_ex     7'b1110100
`define ir_go_nex    7'b1010100
`define ir_ngo_ex    7'b0110100
`define ir_ngo_nex   7'b0010100
`define csr_go_ex    7'b1110101
`define csr_go_nex   7'b1010101
`define csr_ngo_ex   7'b0110101
`define csr_ngo_nex  7'b0010101
`define cpuscr_go_ex 7'b1101011
`define cpuscr_go_nex 7'b1001011


`define bypass_go_ex    7'b1101100
`define bypass_go_nex   7'b1001100
`define bypass_ngo_ex   7'b0101100
`define bypass_ngo_nex  7'b0001100



  task write_ir;
  input [7:0] ir_value;
  integer a;
  reg  parity;
  begin
    parity = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk);
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk);
    for(a=0; a<8; a=a+1)begin
      force `jtag_tms = ir_value[a];
      parity = parity ^ ir_value[a];
      @(negedge `jtag_tclk);  
    end
    force `jtag_tms = parity;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
  end
  endtask
  

  task write_dr;
  input [143:0] jtag_data_in;
  input [8:0]   jtag_data_len;
  integer b;
  reg  parity;
  begin
    parity = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk);
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk);
    for(b=0; b<32; b=b+1)begin
      force `jtag_tms = jtag_data_in[b];
      parity = parity ^ jtag_data_in[b];
      @(negedge `jtag_tclk); 
    end
    force `jtag_tms = parity; 
    @(negedge `jtag_tclk);
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
  end
  endtask
  
  task read_dr;
  input  [8:0]   jtag_data_len;
  output [143:0] jtag_data_out;
  reg    [143:0] jtag_data_out;
  integer c;
  reg  parity;
  begin
    parity = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b0;
    @(negedge `jtag_tclk);
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(posedge `jtag_tclk);
    release `jtag_tms;
    @(posedge `jtag_tclk); 
    for(c=0; c<32; c=c+1)begin
      @(posedge `jtag_tclk);
      jtag_data_out[c] = `jtag_tms;
    end
    @(posedge `jtag_tclk); 
    parity = `jtag_tms;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
    @(negedge `jtag_tclk); 
    force `jtag_tms = 1'b1;
  end
  endtask

task write_hadreg;
  input[6:0] reg_select;
  input[143:0] reg_value;
  begin
    case(reg_select & 7'b0011111)
      `id,
      `pcfifo,
      `baba,
      `babb,
      `wbbr,
      `psr,
      `pc,
      `ir,
      `hcr,
      `daddr,
      `ddata : begin
        write_ir({1'b0,reg_select[6:0]});
      	write_dr(reg_value,32);
      end

      `tracer,
      `mbca,
      `mbcb,
      `bama,
      `bamb,
      `bypass: begin
      	write_ir({1'b0,reg_select[6:0]});
      	write_dr(reg_value,8);
      end

      `hsr,
      `csr : begin
      	write_ir({1'b0,reg_select[6:0]});
      	write_dr(reg_value,16);
      end
      
      `cpuscr : begin
        write_ir({1'b0,reg_select[6:0]});
        write_dr(reg_value,128);
      end

      default:$display("There is no target!");
    endcase
  end
endtask

task read_hadreg;
  input[6:0] reg_select;
  output[143:0] jtag_data_out;
  reg[143:0] jtag_data_out;
  begin
    case(reg_select & 7'b0011111)
      `id,
      `pcfifo,
      `baba,
      `babb,
      `wbbr,
      `psr,
      `pc,
      `ir,
      `hcr,
      `daddr,
      `ddata : begin
        write_ir({1'b1,reg_select[6:0]});
      	read_dr(32, jtag_data_out);
      end

      `tracer,
      `mbca,
      `mbcb,
      `bama,
      `bamb, 
      `bypass:begin
      	write_ir({1'b1,reg_select[6:0]});
      	read_dr(8, jtag_data_out);
      end

      `hsr,
      `csr : begin
      	write_ir({1'b1,reg_select[6:0]});
      	read_dr(16, jtag_data_out);
      end

      `cpuscr : begin
        write_ir({1'b1,reg_select[6:0]});
        read_dr(128, jtag_data_out);
      end

      default:$display("There is no target!");
    endcase
  end
endtask	

task wait_debug_mode;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg(`hsr,hsr_data_out);
    $display("---------------------------------------");
    $display("wait into debug mode......            |");
    $display("<wait_begin> The hsr is: 0x%h       |",
             hsr_data_out[15:0]);  
    while(hsr_data_out[1:0]!=2'b10)
    read_hadreg(`hsr,hsr_data_out);
    $display("<wait_end>   The hsr is: 0x%h       |",
             hsr_data_out[15:0]);  
    $display("Now, CPU is in Debug Mode!            |"); 
    $display("---------------------------------------");
  end
endtask

task check_cpu_mode;
  reg[15:0] hsr_data_out;
  begin
    read_hadreg(`hsr,hsr_data_out);
    if(hsr_data_out[1:0]==2'b00)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Normal Mode!  ***       |"); 
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b01)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in LowPower Mode!  ***     |"); 
      $display("----------------------------------------");
      end
    else if(hsr_data_out[1:0]==2'b10)
      begin
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Debug Mode!  ***        |"); 
      $display("----------------------------------------");
      end
    else  
      begin 
      $display("----------------------------------------");
      $display("*** <CHECK> hsr value is:0x%h  ***   |",
               hsr_data_out[15:0]);
      $display("***  CPU is in Reserve Mode!  ***      |"); 
      $display("----------------------------------------");
      end
  end 
endtask 

reg[31:0] pc_data_out;
reg[31:0] psr_data_out;
static integer FILE;
initial
  begin
    @(posedge `TB_MODULE.PAD_MCURST);
    $display("******    Now is JTAG_2!!!        ******");
    repeat (100) @(posedge `jtag_tclk);        
    write_hadreg(`hcr,32'h8000);       
    wait_debug_mode;
    write_hadreg(`hcr,0);            
    $display("**************************************************");  
    $display("*********** Congratulation!:HAD TEST PASS  *******");
    $display("**************************************************");
    FILE = $fopen("run_case.report","w");
    $fdisplay(FILE,"TEST PASS");
  $finish;
  end

endmodule
