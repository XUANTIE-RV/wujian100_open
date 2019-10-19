/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
`define pwmcfg_OFFSET          7'b0000000
`define pwminverttrig_OFFSET   7'b0000001
`define pwm01trig_OFFSET       7'b0000010
`define pwm23trig_OFFSET       7'b0000011
`define pwm45trig_OFFSET       7'b0000100
`define pwminten1_OFFSET       7'b0000101
`define pwminten2_OFFSET       7'b0000110
`define pwmris1_OFFSET         7'b0000111
`define pwmris2_OFFSET         7'b0001000
`define pwmic1_OFFSET          7'b0001001
`define pwmic2_OFFSET          7'b0001010
`define pwmis1_OFFSET          7'b0001011
`define pwmis2_OFFSET          7'b0001100
`define pwmctl_OFFSET          7'b0001101
`define pwm01load_OFFSET       7'b0001110
`define pwm23load_OFFSET       7'b0001111
`define pwm45load_OFFSET       7'b0010000
`define pwm01count_OFFSET      7'b0010001
`define pwm23count_OFFSET      7'b0010010
`define pwm45count_OFFSET      7'b0010011
`define pwm0cmp_OFFSET         7'b0010100
`define pwm1cmp_OFFSET         7'b0010101
`define pwm2cmp_OFFSET         7'b0010110
`define pwm3cmp_OFFSET         7'b0010111
`define pwm4cmp_OFFSET         7'b0011000
`define pwm5cmp_OFFSET         7'b0011001
`define pwm01db_OFFSET         7'b0011010
`define pwm23db_OFFSET         7'b0011011
`define pwm45db_OFFSET         7'b0011100
`define capctl_OFFSET          7'b0011101
`define capinten_OFFSET        7'b0011110
`define capris_OFFSET          7'b0011111
`define capic_OFFSET           7'b0100000
`define capis_OFFSET           7'b0100001
`define cap01t_OFFSET          7'b0100010
`define cap23t_OFFSET          7'b0100011
`define cap45t_OFFSET          7'b0100100
`define cap01match_OFFSET      7'b0100101
`define cap23match_OFFSET      7'b0100110
`define cap45match_OFFSET      7'b0100111
`define timinten_OFFSET        7'b0101000
`define timris_OFFSET          7'b0101001
`define timic_OFFSET           7'b0101010
`define timis_OFFSET           7'b0101011
`define tim01load_OFFSET       7'b0101100
`define tim23load_OFFSET       7'b0101101
`define tim45load_OFFSET       7'b0101110
`define tim01count_OFFSET      7'b0101111
`define tim23count_OFFSET      7'b0110000
`define tim45count_OFFSET      7'b0110001
`define cnt01val_OFFSET        7'b0110010
`define cnt23val_OFFSET        7'b0110011
`define cnt45val_OFFSET        7'b0110100
module pwm(
  etb_pwm_trig_tim0_off,
  etb_pwm_trig_tim0_on,
  etb_pwm_trig_tim1_off,
  etb_pwm_trig_tim1_on,
  etb_pwm_trig_tim2_off,
  etb_pwm_trig_tim2_on,
  etb_pwm_trig_tim3_off,
  etb_pwm_trig_tim3_on,
  etb_pwm_trig_tim4_off,
  etb_pwm_trig_tim4_on,
  etb_pwm_trig_tim5_off,
  etb_pwm_trig_tim5_on,
  fault,
  i_capedge0,
  i_capedge10,
  i_capedge2,
  i_capedge4,
  i_capedge6,
  i_capedge8,
  o_pwm0,
  o_pwm1,
  o_pwm10,
  o_pwm11,
  o_pwm2,
  o_pwm3,
  o_pwm4,
  o_pwm5,
  o_pwm6,
  o_pwm7,
  o_pwm8,
  o_pwm9,
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwm0oe_n,
  pwm10oe_n,
  pwm11oe_n,
  pwm1oe_n,
  pwm2oe_n,
  pwm3oe_n,
  pwm4oe_n,
  pwm5oe_n,
  pwm6oe_n,
  pwm7oe_n,
  pwm8oe_n,
  pwm9oe_n,
  pwm_idle,
  pwm_tim0_etb_trig,
  pwm_tim1_etb_trig,
  pwm_tim2_etb_trig,
  pwm_tim3_etb_trig,
  pwm_tim4_etb_trig,
  pwm_tim5_etb_trig,
  pwm_xx_trig,
  pwmint,
  pwrite,
  test_mode
);
input           etb_pwm_trig_tim0_off; 
input           etb_pwm_trig_tim0_on; 
input           etb_pwm_trig_tim1_off; 
input           etb_pwm_trig_tim1_on; 
input           etb_pwm_trig_tim2_off; 
input           etb_pwm_trig_tim2_on; 
input           etb_pwm_trig_tim3_off; 
input           etb_pwm_trig_tim3_on; 
input           etb_pwm_trig_tim4_off; 
input           etb_pwm_trig_tim4_on; 
input           etb_pwm_trig_tim5_off; 
input           etb_pwm_trig_tim5_on; 
input           fault;                
input           i_capedge0;           
input           i_capedge10;          
input           i_capedge2;           
input           i_capedge4;           
input           i_capedge6;           
input           i_capedge8;           
input   [31:0]  paddr;                
input           pclk;                 
input           penable;              
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input           pwrite;               
input           test_mode;            
output          o_pwm0;               
output          o_pwm1;               
output          o_pwm10;              
output          o_pwm11;              
output          o_pwm2;               
output          o_pwm3;               
output          o_pwm4;               
output          o_pwm5;               
output          o_pwm6;               
output          o_pwm7;               
output          o_pwm8;               
output          o_pwm9;               
output  [31:0]  prdata;               
output          pwm0oe_n;             
output          pwm10oe_n;            
output          pwm11oe_n;            
output          pwm1oe_n;             
output          pwm2oe_n;             
output          pwm3oe_n;             
output          pwm4oe_n;             
output          pwm5oe_n;             
output          pwm6oe_n;             
output          pwm7oe_n;             
output          pwm8oe_n;             
output          pwm9oe_n;             
output          pwm_idle;             
output          pwm_tim0_etb_trig;    
output          pwm_tim1_etb_trig;    
output          pwm_tim2_etb_trig;    
output          pwm_tim3_etb_trig;    
output          pwm_tim4_etb_trig;    
output          pwm_tim5_etb_trig;    
output          pwm_xx_trig;          
output          pwmint;               
reg             fault_d;              
reg             fault_d2;             
wire    [31:0]  cap01t;               
wire    [31:0]  cap01t_h;             
wire            cap0cntic;            
wire            cap0cntie;            
wire            cap0en;               
wire    [1 :0]  cap0eventa;           
wire    [31:0]  cap0match;            
wire            cap0mode;             
wire            cap0timic;            
wire            cap0timie;            
wire            cap1cntic;            
wire            cap1cntie;            
wire            cap1en;               
wire    [1 :0]  cap1eventa;           
wire    [31:0]  cap1match;            
wire            cap1mode;             
wire            cap1timic;            
wire            cap1timie;            
wire    [31:0]  cap23t;               
wire    [31:0]  cap23t_h;             
wire            cap2cntic;            
wire            cap2cntie;            
wire            cap2en;               
wire    [1 :0]  cap2eventa;           
wire    [31:0]  cap2match;            
wire            cap2mode;             
wire            cap2timic;            
wire            cap2timie;            
wire            cap3cntic;            
wire            cap3cntie;            
wire            cap3en;               
wire    [1 :0]  cap3eventa;           
wire    [31:0]  cap3match;            
wire            cap3mode;             
wire            cap3timic;            
wire            cap3timie;            
wire    [31:0]  cap45t;               
wire    [31:0]  cap45t_h;             
wire            cap4cntic;            
wire            cap4cntie;            
wire            cap4en;               
wire    [1 :0]  cap4eventa;           
wire    [31:0]  cap4match;            
wire            cap4mode;             
wire            cap4timic;            
wire            cap4timie;            
wire            cap5cntic;            
wire            cap5cntie;            
wire            cap5en;               
wire    [1 :0]  cap5eventa;           
wire    [31:0]  cap5match;            
wire            cap5mode;             
wire            cap5timic;            
wire            cap5timie;            
wire    [31:0]  capis;                
wire    [31:0]  capris;               
wire    [31:0]  cnt0val;              
wire    [31:0]  cnt1val;              
wire    [31:0]  cnt2val;              
wire    [31:0]  cnt3val;              
wire    [31:0]  cnt4val;              
wire    [31:0]  cnt5val;              
wire    [2 :0]  cntdiv;               
wire            cntdiven;             
wire    [31:0]  compa_val_0;          
wire    [31:0]  compa_val_1;          
wire    [31:0]  compa_val_2;          
wire    [31:0]  compa_val_3;          
wire    [31:0]  compa_val_4;          
wire    [31:0]  compa_val_5;          
wire    [31:0]  compb_val_0;          
wire    [31:0]  compb_val_1;          
wire    [31:0]  compb_val_2;          
wire    [31:0]  compb_val_3;          
wire    [31:0]  compb_val_4;          
wire    [31:0]  compb_val_5;          
wire            db0en;                
wire            db1en;                
wire            db2en;                
wire            db3en;                
wire            db4en;                
wire            db5en;                
wire    [11:0]  delay0;               
wire    [11:0]  delay1;               
wire    [11:0]  delay2;               
wire    [11:0]  delay3;               
wire    [11:0]  delay4;               
wire    [11:0]  delay5;               
wire            etb_pwm_trig_tim0_off; 
wire            etb_pwm_trig_tim0_on; 
wire            etb_pwm_trig_tim1_off; 
wire            etb_pwm_trig_tim1_on; 
wire            etb_pwm_trig_tim2_off; 
wire            etb_pwm_trig_tim2_on; 
wire            etb_pwm_trig_tim3_off; 
wire            etb_pwm_trig_tim3_on; 
wire            etb_pwm_trig_tim4_off; 
wire            etb_pwm_trig_tim4_on; 
wire            etb_pwm_trig_tim5_off; 
wire            etb_pwm_trig_tim5_on; 
wire            fault;                
wire            i_capedge0;           
wire            i_capedge10;          
wire            i_capedge2;           
wire            i_capedge4;           
wire            i_capedge6;           
wire            i_capedge8;           
wire            int0encmpad;          
wire            int0encmpau;          
wire            int0encmpbd;          
wire            int0encmpbu;          
wire            int0encntload;        
wire            int0encntzero;        
wire            int1encmpad;          
wire            int1encmpau;          
wire            int1encmpbd;          
wire            int1encmpbu;          
wire            int1encntload;        
wire            int1encntzero;        
wire            int2encmpad;          
wire            int2encmpau;          
wire            int2encmpbd;          
wire            int2encmpbu;          
wire            int2encntload;        
wire            int2encntzero;        
wire            int3encmpad;          
wire            int3encmpau;          
wire            int3encmpbd;          
wire            int3encmpbu;          
wire            int3encntload;        
wire            int3encntzero;        
wire            int4encmpad;          
wire            int4encmpau;          
wire            int4encmpbd;          
wire            int4encmpbu;          
wire            int4encntload;        
wire            int4encntzero;        
wire            int5encmpad;          
wire            int5encmpau;          
wire            int5encmpbd;          
wire            int5encmpbu;          
wire            int5encntload;        
wire            int5encntzero;        
wire            intenfault;           
wire            intic0cmpad;          
wire            intic0cmpau;          
wire            intic0cmpbd;          
wire            intic0cmpbu;          
wire            intic0cntload;        
wire            intic0cntzero;        
wire            intic1cmpad;          
wire            intic1cmpau;          
wire            intic1cmpbd;          
wire            intic1cmpbu;          
wire            intic1cntload;        
wire            intic1cntzero;        
wire            intic2cmpad;          
wire            intic2cmpau;          
wire            intic2cmpbd;          
wire            intic2cmpbu;          
wire            intic2cntload;        
wire            intic2cntzero;        
wire            intic3cmpad;          
wire            intic3cmpau;          
wire            intic3cmpbd;          
wire            intic3cmpbu;          
wire            intic3cntload;        
wire            intic3cntzero;        
wire            intic4cmpad;          
wire            intic4cmpau;          
wire            intic4cmpbd;          
wire            intic4cmpbu;          
wire            intic4cntload;        
wire            intic4cntzero;        
wire            intic5cmpad;          
wire            intic5cmpau;          
wire            intic5cmpbd;          
wire            intic5cmpbu;          
wire            intic5cntload;        
wire            intic5cntzero;        
wire            inticfault;           
wire            o_pwm0;               
wire            o_pwm1;               
wire            o_pwm10;              
wire            o_pwm11;              
wire            o_pwm2;               
wire            o_pwm3;               
wire            o_pwm4;               
wire            o_pwm5;               
wire            o_pwm6;               
wire            o_pwm7;               
wire            o_pwm8;               
wire            o_pwm9;               
wire    [31:0]  paddr;                
wire            pclk;                 
wire            penable;              
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire    [31:0]  pwm01count;           
wire    [31:0]  pwm01count_h;         
wire            pwm0en;               
wire            pwm0inv;              
wire    [31:0]  pwm0load;             
wire            pwm0mode;             
wire            pwm0oe;               
wire            pwm0oe_n;             
wire    [31:0]  pwm0trig_val;         
wire            pwm10en;              
wire            pwm10inv;             
wire            pwm10oe;              
wire            pwm10oe_n;            
wire            pwm11en;              
wire            pwm11inv;             
wire            pwm11oe;              
wire            pwm11oe_n;            
wire            pwm1en;               
wire            pwm1inv;              
wire    [31:0]  pwm1load;             
wire            pwm1mode;             
wire            pwm1oe;               
wire            pwm1oe_n;             
wire    [31:0]  pwm1trig_val;         
wire    [31:0]  pwm23count;           
wire    [31:0]  pwm23count_h;         
wire            pwm2en;               
wire            pwm2inv;              
wire    [31:0]  pwm2load;             
wire            pwm2mode;             
wire            pwm2oe;               
wire            pwm2oe_n;             
wire    [31:0]  pwm2trig_val;         
wire            pwm3en;               
wire            pwm3inv;              
wire    [31:0]  pwm3load;             
wire            pwm3mode;             
wire            pwm3oe;               
wire            pwm3oe_n;             
wire    [31:0]  pwm3trig_val;         
wire    [31:0]  pwm45count;           
wire    [31:0]  pwm45count_h;         
wire            pwm4en;               
wire            pwm4inv;              
wire    [31:0]  pwm4load;             
wire            pwm4mode;             
wire            pwm4oe;               
wire            pwm4oe_n;             
wire    [31:0]  pwm4trig_val;         
wire            pwm5en;               
wire            pwm5inv;              
wire    [31:0]  pwm5load;             
wire            pwm5mode;             
wire            pwm5oe;               
wire            pwm5oe_n;             
wire    [31:0]  pwm5trig_val;         
wire            pwm6en;               
wire            pwm6inv;              
wire            pwm6oe;               
wire            pwm6oe_n;             
wire            pwm7en;               
wire            pwm7inv;              
wire            pwm7oe;               
wire            pwm7oe_n;             
wire            pwm8en;               
wire            pwm8inv;              
wire            pwm8oe;               
wire            pwm8oe_n;             
wire            pwm9en;               
wire            pwm9inv;              
wire            pwm9oe;               
wire            pwm9oe_n;             
wire            pwm_idle;             
wire            pwm_tim0_etb_trig;    
wire            pwm_tim1_etb_trig;    
wire            pwm_tim2_etb_trig;    
wire            pwm_tim3_etb_trig;    
wire            pwm_tim4_etb_trig;    
wire            pwm_tim5_etb_trig;    
wire            pwm_xx_trig;          
wire            pwmint;               
wire    [31:0]  pwmis1;               
wire    [31:0]  pwmis2;               
wire    [31:0]  pwmris1;              
wire    [31:0]  pwmris2;              
wire            pwrite;               
wire    [1 :0]  sync0mode;            
wire    [1 :0]  sync1mode;            
wire    [1 :0]  sync2mode;            
wire    [1 :0]  sync3mode;            
wire    [1 :0]  sync4mode;            
wire    [1 :0]  sync5mode;            
wire            test_mode;            
wire    [31:0]  tim01count;           
wire    [31:0]  tim01count_h;         
wire            tim0en;               
wire            tim0ic;               
wire            tim0ie;               
wire    [31:0]  tim0load;             
wire            tim1en;               
wire            tim1ic;               
wire            tim1ie;               
wire    [31:0]  tim1load;             
wire    [31:0]  tim23count;           
wire    [31:0]  tim23count_h;         
wire            tim2en;               
wire            tim2ic;               
wire            tim2ie;               
wire    [31:0]  tim2load;             
wire            tim3en;               
wire            tim3ic;               
wire            tim3ie;               
wire    [31:0]  tim3load;             
wire    [31:0]  tim45count;           
wire    [31:0]  tim45count_h;         
wire            tim4en;               
wire            tim4ic;               
wire            tim4ie;               
wire    [31:0]  tim4load;             
wire            tim5en;               
wire            tim5ic;               
wire            tim5ie;               
wire    [31:0]  tim5load;             
wire    [31:0]  timis;                
wire    [31:0]  timris;               
wire            tr0end;               
wire            tr0enu;               
wire            tr1end;               
wire            tr1enu;               
wire            tr2end;               
wire            tr2enu;               
wire            tr3end;               
wire            tr3enu;               
wire            tr4end;               
wire            tr4enu;               
wire            tr5end;               
wire            tr5enu;               
wire            triginv;              
always@(posedge pclk or negedge presetn)
    if(!presetn)begin
	fault_d  <= 0;
        fault_d2 <= 0;
    end
    else begin
        fault_d  <= fault;
        fault_d2 <= fault_d;
    end
pwm_ctrl  x_pwm_ctrl (
  .cap01t            (cap01t           ),
  .cap01t_h          (cap01t_h         ),
  .cap0cntic         (cap0cntic        ),
  .cap0cntie         (cap0cntie        ),
  .cap0en            (cap0en           ),
  .cap0eventa        (cap0eventa       ),
  .cap0match         (cap0match        ),
  .cap0mode          (cap0mode         ),
  .cap0timic         (cap0timic        ),
  .cap0timie         (cap0timie        ),
  .cap1cntic         (cap1cntic        ),
  .cap1cntie         (cap1cntie        ),
  .cap1en            (cap1en           ),
  .cap1eventa        (cap1eventa       ),
  .cap1match         (cap1match        ),
  .cap1mode          (cap1mode         ),
  .cap1timic         (cap1timic        ),
  .cap1timie         (cap1timie        ),
  .cap23t            (cap23t           ),
  .cap23t_h          (cap23t_h         ),
  .cap2cntic         (cap2cntic        ),
  .cap2cntie         (cap2cntie        ),
  .cap2en            (cap2en           ),
  .cap2eventa        (cap2eventa       ),
  .cap2match         (cap2match        ),
  .cap2mode          (cap2mode         ),
  .cap2timic         (cap2timic        ),
  .cap2timie         (cap2timie        ),
  .cap3cntic         (cap3cntic        ),
  .cap3cntie         (cap3cntie        ),
  .cap3en            (cap3en           ),
  .cap3eventa        (cap3eventa       ),
  .cap3match         (cap3match        ),
  .cap3mode          (cap3mode         ),
  .cap3timic         (cap3timic        ),
  .cap3timie         (cap3timie        ),
  .cap45t            (cap45t           ),
  .cap45t_h          (cap45t_h         ),
  .cap4cntic         (cap4cntic        ),
  .cap4cntie         (cap4cntie        ),
  .cap4en            (cap4en           ),
  .cap4eventa        (cap4eventa       ),
  .cap4match         (cap4match        ),
  .cap4mode          (cap4mode         ),
  .cap4timic         (cap4timic        ),
  .cap4timie         (cap4timie        ),
  .cap5cntic         (cap5cntic        ),
  .cap5cntie         (cap5cntie        ),
  .cap5en            (cap5en           ),
  .cap5eventa        (cap5eventa       ),
  .cap5match         (cap5match        ),
  .cap5mode          (cap5mode         ),
  .cap5timic         (cap5timic        ),
  .cap5timie         (cap5timie        ),
  .capis             (capis            ),
  .capris            (capris           ),
  .cnt0val           (cnt0val          ),
  .cnt1val           (cnt1val          ),
  .cnt2val           (cnt2val          ),
  .cnt3val           (cnt3val          ),
  .cnt4val           (cnt4val          ),
  .cnt5val           (cnt5val          ),
  .cntdiv            (cntdiv           ),
  .cntdiven          (cntdiven         ),
  .compa_val_0       (compa_val_0      ),
  .compa_val_1       (compa_val_1      ),
  .compa_val_2       (compa_val_2      ),
  .compa_val_3       (compa_val_3      ),
  .compa_val_4       (compa_val_4      ),
  .compa_val_5       (compa_val_5      ),
  .compb_val_0       (compb_val_0      ),
  .compb_val_1       (compb_val_1      ),
  .compb_val_2       (compb_val_2      ),
  .compb_val_3       (compb_val_3      ),
  .compb_val_4       (compb_val_4      ),
  .compb_val_5       (compb_val_5      ),
  .db0en             (db0en            ),
  .db1en             (db1en            ),
  .db2en             (db2en            ),
  .db3en             (db3en            ),
  .db4en             (db4en            ),
  .db5en             (db5en            ),
  .delay0            (delay0           ),
  .delay1            (delay1           ),
  .delay2            (delay2           ),
  .delay3            (delay3           ),
  .delay4            (delay4           ),
  .delay5            (delay5           ),
  .fault             (fault_d2         ),
  .i_capture_0       (i_capedge0       ),
  .i_capture_10      (i_capedge10      ),
  .i_capture_2       (i_capedge2       ),
  .i_capture_4       (i_capedge4       ),
  .i_capture_6       (i_capedge6       ),
  .i_capture_8       (i_capedge8       ),
  .int0encmpad       (int0encmpad      ),
  .int0encmpau       (int0encmpau      ),
  .int0encmpbd       (int0encmpbd      ),
  .int0encmpbu       (int0encmpbu      ),
  .int0encntload     (int0encntload    ),
  .int0encntzero     (int0encntzero    ),
  .int1encmpad       (int1encmpad      ),
  .int1encmpau       (int1encmpau      ),
  .int1encmpbd       (int1encmpbd      ),
  .int1encmpbu       (int1encmpbu      ),
  .int1encntload     (int1encntload    ),
  .int1encntzero     (int1encntzero    ),
  .int2encmpad       (int2encmpad      ),
  .int2encmpau       (int2encmpau      ),
  .int2encmpbd       (int2encmpbd      ),
  .int2encmpbu       (int2encmpbu      ),
  .int2encntload     (int2encntload    ),
  .int2encntzero     (int2encntzero    ),
  .int3encmpad       (int3encmpad      ),
  .int3encmpau       (int3encmpau      ),
  .int3encmpbd       (int3encmpbd      ),
  .int3encmpbu       (int3encmpbu      ),
  .int3encntload     (int3encntload    ),
  .int3encntzero     (int3encntzero    ),
  .int4encmpad       (int4encmpad      ),
  .int4encmpau       (int4encmpau      ),
  .int4encmpbd       (int4encmpbd      ),
  .int4encmpbu       (int4encmpbu      ),
  .int4encntload     (int4encntload    ),
  .int4encntzero     (int4encntzero    ),
  .int5encmpad       (int5encmpad      ),
  .int5encmpau       (int5encmpau      ),
  .int5encmpbd       (int5encmpbd      ),
  .int5encmpbu       (int5encmpbu      ),
  .int5encntload     (int5encntload    ),
  .int5encntzero     (int5encntzero    ),
  .intenfault        (intenfault       ),
  .intic0cmpad       (intic0cmpad      ),
  .intic0cmpau       (intic0cmpau      ),
  .intic0cmpbd       (intic0cmpbd      ),
  .intic0cmpbu       (intic0cmpbu      ),
  .intic0cntload     (intic0cntload    ),
  .intic0cntzero     (intic0cntzero    ),
  .intic1cmpad       (intic1cmpad      ),
  .intic1cmpau       (intic1cmpau      ),
  .intic1cmpbd       (intic1cmpbd      ),
  .intic1cmpbu       (intic1cmpbu      ),
  .intic1cntload     (intic1cntload    ),
  .intic1cntzero     (intic1cntzero    ),
  .intic2cmpad       (intic2cmpad      ),
  .intic2cmpau       (intic2cmpau      ),
  .intic2cmpbd       (intic2cmpbd      ),
  .intic2cmpbu       (intic2cmpbu      ),
  .intic2cntload     (intic2cntload    ),
  .intic2cntzero     (intic2cntzero    ),
  .intic3cmpad       (intic3cmpad      ),
  .intic3cmpau       (intic3cmpau      ),
  .intic3cmpbd       (intic3cmpbd      ),
  .intic3cmpbu       (intic3cmpbu      ),
  .intic3cntload     (intic3cntload    ),
  .intic3cntzero     (intic3cntzero    ),
  .intic4cmpad       (intic4cmpad      ),
  .intic4cmpau       (intic4cmpau      ),
  .intic4cmpbd       (intic4cmpbd      ),
  .intic4cmpbu       (intic4cmpbu      ),
  .intic4cntload     (intic4cntload    ),
  .intic4cntzero     (intic4cntzero    ),
  .intic5cmpad       (intic5cmpad      ),
  .intic5cmpau       (intic5cmpau      ),
  .intic5cmpbd       (intic5cmpbd      ),
  .intic5cmpbu       (intic5cmpbu      ),
  .intic5cntload     (intic5cntload    ),
  .intic5cntzero     (intic5cntzero    ),
  .inticfault        (inticfault       ),
  .pclk              (pclk             ),
  .presetn           (presetn          ),
  .pwm01count        (pwm01count       ),
  .pwm01count_h      (pwm01count_h     ),
  .pwm0en            (pwm0en           ),
  .pwm0inv           (pwm0inv          ),
  .pwm0load          (pwm0load         ),
  .pwm0mode          (pwm0mode         ),
  .pwm0trig_val      (pwm0trig_val     ),
  .pwm10en           (pwm10en          ),
  .pwm10inv          (pwm10inv         ),
  .pwm11en           (pwm11en          ),
  .pwm11inv          (pwm11inv         ),
  .pwm1en            (pwm1en           ),
  .pwm1inv           (pwm1inv          ),
  .pwm1load          (pwm1load         ),
  .pwm1mode          (pwm1mode         ),
  .pwm1trig_val      (pwm1trig_val     ),
  .pwm23count        (pwm23count       ),
  .pwm23count_h      (pwm23count_h     ),
  .pwm2en            (pwm2en           ),
  .pwm2inv           (pwm2inv          ),
  .pwm2load          (pwm2load         ),
  .pwm2mode          (pwm2mode         ),
  .pwm2trig_val      (pwm2trig_val     ),
  .pwm3en            (pwm3en           ),
  .pwm3inv           (pwm3inv          ),
  .pwm3load          (pwm3load         ),
  .pwm3mode          (pwm3mode         ),
  .pwm3trig_val      (pwm3trig_val     ),
  .pwm45count        (pwm45count       ),
  .pwm45count_h      (pwm45count_h     ),
  .pwm4en            (pwm4en           ),
  .pwm4inv           (pwm4inv          ),
  .pwm4load          (pwm4load         ),
  .pwm4mode          (pwm4mode         ),
  .pwm4trig_val      (pwm4trig_val     ),
  .pwm5en            (pwm5en           ),
  .pwm5inv           (pwm5inv          ),
  .pwm5load          (pwm5load         ),
  .pwm5mode          (pwm5mode         ),
  .pwm5trig_val      (pwm5trig_val     ),
  .pwm6en            (pwm6en           ),
  .pwm6inv           (pwm6inv          ),
  .pwm7en            (pwm7en           ),
  .pwm7inv           (pwm7inv          ),
  .pwm8en            (pwm8en           ),
  .pwm8inv           (pwm8inv          ),
  .pwm9en            (pwm9en           ),
  .pwm9inv           (pwm9inv          ),
  .pwm_0_oe          (pwm0oe           ),
  .pwm_0_out         (o_pwm0           ),
  .pwm_10_oe         (pwm10oe          ),
  .pwm_10_out        (o_pwm10          ),
  .pwm_11_oe         (pwm11oe          ),
  .pwm_11_out        (o_pwm11          ),
  .pwm_1_oe          (pwm1oe           ),
  .pwm_1_out         (o_pwm1           ),
  .pwm_2_oe          (pwm2oe           ),
  .pwm_2_out         (o_pwm2           ),
  .pwm_3_oe          (pwm3oe           ),
  .pwm_3_out         (o_pwm3           ),
  .pwm_4_oe          (pwm4oe           ),
  .pwm_4_out         (o_pwm4           ),
  .pwm_5_oe          (pwm5oe           ),
  .pwm_5_out         (o_pwm5           ),
  .pwm_6_oe          (pwm6oe           ),
  .pwm_6_out         (o_pwm6           ),
  .pwm_7_oe          (pwm7oe           ),
  .pwm_7_out         (o_pwm7           ),
  .pwm_8_oe          (pwm8oe           ),
  .pwm_8_out         (o_pwm8           ),
  .pwm_9_oe          (pwm9oe           ),
  .pwm_9_out         (o_pwm9           ),
  .pwm_idle          (pwm_idle         ),
  .pwm_tim0_etb_trig (pwm_tim0_etb_trig),
  .pwm_tim1_etb_trig (pwm_tim1_etb_trig),
  .pwm_tim2_etb_trig (pwm_tim2_etb_trig),
  .pwm_tim3_etb_trig (pwm_tim3_etb_trig),
  .pwm_tim4_etb_trig (pwm_tim4_etb_trig),
  .pwm_tim5_etb_trig (pwm_tim5_etb_trig),
  .pwm_xx_trig       (pwm_xx_trig      ),
  .pwmint            (pwmint           ),
  .pwmis1            (pwmis1           ),
  .pwmis2            (pwmis2           ),
  .pwmris1           (pwmris1          ),
  .pwmris2           (pwmris2          ),
  .sync0mode         (sync0mode        ),
  .sync1mode         (sync1mode        ),
  .sync2mode         (sync2mode        ),
  .sync3mode         (sync3mode        ),
  .sync4mode         (sync4mode        ),
  .sync5mode         (sync5mode        ),
  .test_mode         (test_mode        ),
  .tim01count        (tim01count       ),
  .tim01count_h      (tim01count_h     ),
  .tim0en            (tim0en           ),
  .tim0ic            (tim0ic           ),
  .tim0ie            (tim0ie           ),
  .tim0load          (tim0load         ),
  .tim1en            (tim1en           ),
  .tim1ic            (tim1ic           ),
  .tim1ie            (tim1ie           ),
  .tim1load          (tim1load         ),
  .tim23count        (tim23count       ),
  .tim23count_h      (tim23count_h     ),
  .tim2en            (tim2en           ),
  .tim2ic            (tim2ic           ),
  .tim2ie            (tim2ie           ),
  .tim2load          (tim2load         ),
  .tim3en            (tim3en           ),
  .tim3ic            (tim3ic           ),
  .tim3ie            (tim3ie           ),
  .tim3load          (tim3load         ),
  .tim45count        (tim45count       ),
  .tim45count_h      (tim45count_h     ),
  .tim4en            (tim4en           ),
  .tim4ic            (tim4ic           ),
  .tim4ie            (tim4ie           ),
  .tim4load          (tim4load         ),
  .tim5en            (tim5en           ),
  .tim5ic            (tim5ic           ),
  .tim5ie            (tim5ie           ),
  .tim5load          (tim5load         ),
  .timis             (timis            ),
  .timris            (timris           ),
  .tr0end            (tr0end           ),
  .tr0enu            (tr0enu           ),
  .tr1end            (tr1end           ),
  .tr1enu            (tr1enu           ),
  .tr2end            (tr2end           ),
  .tr2enu            (tr2enu           ),
  .tr3end            (tr3end           ),
  .tr3enu            (tr3enu           ),
  .tr4end            (tr4end           ),
  .tr4enu            (tr4enu           ),
  .tr5end            (tr5end           ),
  .tr5enu            (tr5enu           ),
  .triginv           (triginv          )
);
pwm_apbif  x_pwm_apbif (
  .cap01t                (cap01t               ),
  .cap01t_h              (cap01t_h             ),
  .cap0cntic             (cap0cntic            ),
  .cap0cntie             (cap0cntie            ),
  .cap0en                (cap0en               ),
  .cap0eventa            (cap0eventa           ),
  .cap0match             (cap0match            ),
  .cap0mode              (cap0mode             ),
  .cap0timic             (cap0timic            ),
  .cap0timie             (cap0timie            ),
  .cap1cntic             (cap1cntic            ),
  .cap1cntie             (cap1cntie            ),
  .cap1en                (cap1en               ),
  .cap1eventa            (cap1eventa           ),
  .cap1match             (cap1match            ),
  .cap1mode              (cap1mode             ),
  .cap1timic             (cap1timic            ),
  .cap1timie             (cap1timie            ),
  .cap23t                (cap23t               ),
  .cap23t_h              (cap23t_h             ),
  .cap2cntic             (cap2cntic            ),
  .cap2cntie             (cap2cntie            ),
  .cap2en                (cap2en               ),
  .cap2eventa            (cap2eventa           ),
  .cap2match             (cap2match            ),
  .cap2mode              (cap2mode             ),
  .cap2timic             (cap2timic            ),
  .cap2timie             (cap2timie            ),
  .cap3cntic             (cap3cntic            ),
  .cap3cntie             (cap3cntie            ),
  .cap3en                (cap3en               ),
  .cap3eventa            (cap3eventa           ),
  .cap3match             (cap3match            ),
  .cap3mode              (cap3mode             ),
  .cap3timic             (cap3timic            ),
  .cap3timie             (cap3timie            ),
  .cap45t                (cap45t               ),
  .cap45t_h              (cap45t_h             ),
  .cap4cntic             (cap4cntic            ),
  .cap4cntie             (cap4cntie            ),
  .cap4en                (cap4en               ),
  .cap4eventa            (cap4eventa           ),
  .cap4match             (cap4match            ),
  .cap4mode              (cap4mode             ),
  .cap4timic             (cap4timic            ),
  .cap4timie             (cap4timie            ),
  .cap5cntic             (cap5cntic            ),
  .cap5cntie             (cap5cntie            ),
  .cap5en                (cap5en               ),
  .cap5eventa            (cap5eventa           ),
  .cap5match             (cap5match            ),
  .cap5mode              (cap5mode             ),
  .cap5timic             (cap5timic            ),
  .cap5timie             (cap5timie            ),
  .capis                 (capis                ),
  .capris                (capris               ),
  .cnt0val               (cnt0val              ),
  .cnt1val               (cnt1val              ),
  .cnt2val               (cnt2val              ),
  .cnt3val               (cnt3val              ),
  .cnt4val               (cnt4val              ),
  .cnt5val               (cnt5val              ),
  .cntdiv                (cntdiv               ),
  .cntdiven              (cntdiven             ),
  .compa_val_0           (compa_val_0          ),
  .compa_val_1           (compa_val_1          ),
  .compa_val_2           (compa_val_2          ),
  .compa_val_3           (compa_val_3          ),
  .compa_val_4           (compa_val_4          ),
  .compa_val_5           (compa_val_5          ),
  .compb_val_0           (compb_val_0          ),
  .compb_val_1           (compb_val_1          ),
  .compb_val_2           (compb_val_2          ),
  .compb_val_3           (compb_val_3          ),
  .compb_val_4           (compb_val_4          ),
  .compb_val_5           (compb_val_5          ),
  .db0en                 (db0en                ),
  .db1en                 (db1en                ),
  .db2en                 (db2en                ),
  .db3en                 (db3en                ),
  .db4en                 (db4en                ),
  .db5en                 (db5en                ),
  .delay0                (delay0               ),
  .delay1                (delay1               ),
  .delay2                (delay2               ),
  .delay3                (delay3               ),
  .delay4                (delay4               ),
  .delay5                (delay5               ),
  .etb_pwm_trig_tim0_off (etb_pwm_trig_tim0_off),
  .etb_pwm_trig_tim0_on  (etb_pwm_trig_tim0_on ),
  .etb_pwm_trig_tim1_off (etb_pwm_trig_tim1_off),
  .etb_pwm_trig_tim1_on  (etb_pwm_trig_tim1_on ),
  .etb_pwm_trig_tim2_off (etb_pwm_trig_tim2_off),
  .etb_pwm_trig_tim2_on  (etb_pwm_trig_tim2_on ),
  .etb_pwm_trig_tim3_off (etb_pwm_trig_tim3_off),
  .etb_pwm_trig_tim3_on  (etb_pwm_trig_tim3_on ),
  .etb_pwm_trig_tim4_off (etb_pwm_trig_tim4_off),
  .etb_pwm_trig_tim4_on  (etb_pwm_trig_tim4_on ),
  .etb_pwm_trig_tim5_off (etb_pwm_trig_tim5_off),
  .etb_pwm_trig_tim5_on  (etb_pwm_trig_tim5_on ),
  .int0encmpad           (int0encmpad          ),
  .int0encmpau           (int0encmpau          ),
  .int0encmpbd           (int0encmpbd          ),
  .int0encmpbu           (int0encmpbu          ),
  .int0encntload         (int0encntload        ),
  .int0encntzero         (int0encntzero        ),
  .int1encmpad           (int1encmpad          ),
  .int1encmpau           (int1encmpau          ),
  .int1encmpbd           (int1encmpbd          ),
  .int1encmpbu           (int1encmpbu          ),
  .int1encntload         (int1encntload        ),
  .int1encntzero         (int1encntzero        ),
  .int2encmpad           (int2encmpad          ),
  .int2encmpau           (int2encmpau          ),
  .int2encmpbd           (int2encmpbd          ),
  .int2encmpbu           (int2encmpbu          ),
  .int2encntload         (int2encntload        ),
  .int2encntzero         (int2encntzero        ),
  .int3encmpad           (int3encmpad          ),
  .int3encmpau           (int3encmpau          ),
  .int3encmpbd           (int3encmpbd          ),
  .int3encmpbu           (int3encmpbu          ),
  .int3encntload         (int3encntload        ),
  .int3encntzero         (int3encntzero        ),
  .int4encmpad           (int4encmpad          ),
  .int4encmpau           (int4encmpau          ),
  .int4encmpbd           (int4encmpbd          ),
  .int4encmpbu           (int4encmpbu          ),
  .int4encntload         (int4encntload        ),
  .int4encntzero         (int4encntzero        ),
  .int5encmpad           (int5encmpad          ),
  .int5encmpau           (int5encmpau          ),
  .int5encmpbd           (int5encmpbd          ),
  .int5encmpbu           (int5encmpbu          ),
  .int5encntload         (int5encntload        ),
  .int5encntzero         (int5encntzero        ),
  .intenfault            (intenfault           ),
  .intic0cmpad           (intic0cmpad          ),
  .intic0cmpau           (intic0cmpau          ),
  .intic0cmpbd           (intic0cmpbd          ),
  .intic0cmpbu           (intic0cmpbu          ),
  .intic0cntload         (intic0cntload        ),
  .intic0cntzero         (intic0cntzero        ),
  .intic1cmpad           (intic1cmpad          ),
  .intic1cmpau           (intic1cmpau          ),
  .intic1cmpbd           (intic1cmpbd          ),
  .intic1cmpbu           (intic1cmpbu          ),
  .intic1cntload         (intic1cntload        ),
  .intic1cntzero         (intic1cntzero        ),
  .intic2cmpad           (intic2cmpad          ),
  .intic2cmpau           (intic2cmpau          ),
  .intic2cmpbd           (intic2cmpbd          ),
  .intic2cmpbu           (intic2cmpbu          ),
  .intic2cntload         (intic2cntload        ),
  .intic2cntzero         (intic2cntzero        ),
  .intic3cmpad           (intic3cmpad          ),
  .intic3cmpau           (intic3cmpau          ),
  .intic3cmpbd           (intic3cmpbd          ),
  .intic3cmpbu           (intic3cmpbu          ),
  .intic3cntload         (intic3cntload        ),
  .intic3cntzero         (intic3cntzero        ),
  .intic4cmpad           (intic4cmpad          ),
  .intic4cmpau           (intic4cmpau          ),
  .intic4cmpbd           (intic4cmpbd          ),
  .intic4cmpbu           (intic4cmpbu          ),
  .intic4cntload         (intic4cntload        ),
  .intic4cntzero         (intic4cntzero        ),
  .intic5cmpad           (intic5cmpad          ),
  .intic5cmpau           (intic5cmpau          ),
  .intic5cmpbd           (intic5cmpbd          ),
  .intic5cmpbu           (intic5cmpbu          ),
  .intic5cntload         (intic5cntload        ),
  .intic5cntzero         (intic5cntzero        ),
  .inticfault            (inticfault           ),
  .paddr                 (paddr                ),
  .pclk                  (pclk                 ),
  .penable               (penable              ),
  .prdata                (prdata               ),
  .presetn               (presetn              ),
  .psel                  (psel                 ),
  .pwdata                (pwdata               ),
  .pwm01count            (pwm01count           ),
  .pwm01count_h          (pwm01count_h         ),
  .pwm0en                (pwm0en               ),
  .pwm0inv               (pwm0inv              ),
  .pwm0load              (pwm0load             ),
  .pwm0mode              (pwm0mode             ),
  .pwm0trig_val          (pwm0trig_val         ),
  .pwm10en               (pwm10en              ),
  .pwm10inv              (pwm10inv             ),
  .pwm11en               (pwm11en              ),
  .pwm11inv              (pwm11inv             ),
  .pwm1en                (pwm1en               ),
  .pwm1inv               (pwm1inv              ),
  .pwm1load              (pwm1load             ),
  .pwm1mode              (pwm1mode             ),
  .pwm1trig_val          (pwm1trig_val         ),
  .pwm23count            (pwm23count           ),
  .pwm23count_h          (pwm23count_h         ),
  .pwm2en                (pwm2en               ),
  .pwm2inv               (pwm2inv              ),
  .pwm2load              (pwm2load             ),
  .pwm2mode              (pwm2mode             ),
  .pwm2trig_val          (pwm2trig_val         ),
  .pwm3en                (pwm3en               ),
  .pwm3inv               (pwm3inv              ),
  .pwm3load              (pwm3load             ),
  .pwm3mode              (pwm3mode             ),
  .pwm3trig_val          (pwm3trig_val         ),
  .pwm45count            (pwm45count           ),
  .pwm45count_h          (pwm45count_h         ),
  .pwm4en                (pwm4en               ),
  .pwm4inv               (pwm4inv              ),
  .pwm4load              (pwm4load             ),
  .pwm4mode              (pwm4mode             ),
  .pwm4trig_val          (pwm4trig_val         ),
  .pwm5en                (pwm5en               ),
  .pwm5inv               (pwm5inv              ),
  .pwm5load              (pwm5load             ),
  .pwm5mode              (pwm5mode             ),
  .pwm5trig_val          (pwm5trig_val         ),
  .pwm6en                (pwm6en               ),
  .pwm6inv               (pwm6inv              ),
  .pwm7en                (pwm7en               ),
  .pwm7inv               (pwm7inv              ),
  .pwm8en                (pwm8en               ),
  .pwm8inv               (pwm8inv              ),
  .pwm9en                (pwm9en               ),
  .pwm9inv               (pwm9inv              ),
  .pwmis1                (pwmis1               ),
  .pwmis2                (pwmis2               ),
  .pwmris1               (pwmris1              ),
  .pwmris2               (pwmris2              ),
  .pwrite                (pwrite               ),
  .sync0mode             (sync0mode            ),
  .sync1mode             (sync1mode            ),
  .sync2mode             (sync2mode            ),
  .sync3mode             (sync3mode            ),
  .sync4mode             (sync4mode            ),
  .sync5mode             (sync5mode            ),
  .tim01count            (tim01count           ),
  .tim01count_h          (tim01count_h         ),
  .tim0en                (tim0en               ),
  .tim0ic                (tim0ic               ),
  .tim0ie                (tim0ie               ),
  .tim0load              (tim0load             ),
  .tim1en                (tim1en               ),
  .tim1ic                (tim1ic               ),
  .tim1ie                (tim1ie               ),
  .tim1load              (tim1load             ),
  .tim23count            (tim23count           ),
  .tim23count_h          (tim23count_h         ),
  .tim2en                (tim2en               ),
  .tim2ic                (tim2ic               ),
  .tim2ie                (tim2ie               ),
  .tim2load              (tim2load             ),
  .tim3en                (tim3en               ),
  .tim3ic                (tim3ic               ),
  .tim3ie                (tim3ie               ),
  .tim3load              (tim3load             ),
  .tim45count            (tim45count           ),
  .tim45count_h          (tim45count_h         ),
  .tim4en                (tim4en               ),
  .tim4ic                (tim4ic               ),
  .tim4ie                (tim4ie               ),
  .tim4load              (tim4load             ),
  .tim5en                (tim5en               ),
  .tim5ic                (tim5ic               ),
  .tim5ie                (tim5ie               ),
  .tim5load              (tim5load             ),
  .timis                 (timis                ),
  .timris                (timris               ),
  .tr0end                (tr0end               ),
  .tr0enu                (tr0enu               ),
  .tr1end                (tr1end               ),
  .tr1enu                (tr1enu               ),
  .tr2end                (tr2end               ),
  .tr2enu                (tr2enu               ),
  .tr3end                (tr3end               ),
  .tr3enu                (tr3enu               ),
  .tr4end                (tr4end               ),
  .tr4enu                (tr4enu               ),
  .tr5end                (tr5end               ),
  .tr5enu                (tr5enu               ),
  .triginv               (triginv              )
);
assign pwm0oe_n  = ~pwm0oe;
assign pwm1oe_n  = ~pwm1oe;
assign pwm2oe_n  = ~pwm2oe;
assign pwm3oe_n  = ~pwm3oe;
assign pwm4oe_n  = ~pwm4oe;
assign pwm5oe_n  = ~pwm5oe;
assign pwm6oe_n  = ~pwm6oe;
assign pwm7oe_n  = ~pwm7oe;
assign pwm8oe_n  = ~pwm8oe;
assign pwm9oe_n  = ~pwm9oe;
assign pwm10oe_n = ~pwm10oe;
assign pwm11oe_n = ~pwm11oe;
endmodule
module pwm_apbif(
  cap01t,
  cap01t_h,
  cap0cntic,
  cap0cntie,
  cap0en,
  cap0eventa,
  cap0match,
  cap0mode,
  cap0timic,
  cap0timie,
  cap1cntic,
  cap1cntie,
  cap1en,
  cap1eventa,
  cap1match,
  cap1mode,
  cap1timic,
  cap1timie,
  cap23t,
  cap23t_h,
  cap2cntic,
  cap2cntie,
  cap2en,
  cap2eventa,
  cap2match,
  cap2mode,
  cap2timic,
  cap2timie,
  cap3cntic,
  cap3cntie,
  cap3en,
  cap3eventa,
  cap3match,
  cap3mode,
  cap3timic,
  cap3timie,
  cap45t,
  cap45t_h,
  cap4cntic,
  cap4cntie,
  cap4en,
  cap4eventa,
  cap4match,
  cap4mode,
  cap4timic,
  cap4timie,
  cap5cntic,
  cap5cntie,
  cap5en,
  cap5eventa,
  cap5match,
  cap5mode,
  cap5timic,
  cap5timie,
  capis,
  capris,
  cnt0val,
  cnt1val,
  cnt2val,
  cnt3val,
  cnt4val,
  cnt5val,
  cntdiv,
  cntdiven,
  compa_val_0,
  compa_val_1,
  compa_val_2,
  compa_val_3,
  compa_val_4,
  compa_val_5,
  compb_val_0,
  compb_val_1,
  compb_val_2,
  compb_val_3,
  compb_val_4,
  compb_val_5,
  db0en,
  db1en,
  db2en,
  db3en,
  db4en,
  db5en,
  delay0,
  delay1,
  delay2,
  delay3,
  delay4,
  delay5,
  etb_pwm_trig_tim0_off,
  etb_pwm_trig_tim0_on,
  etb_pwm_trig_tim1_off,
  etb_pwm_trig_tim1_on,
  etb_pwm_trig_tim2_off,
  etb_pwm_trig_tim2_on,
  etb_pwm_trig_tim3_off,
  etb_pwm_trig_tim3_on,
  etb_pwm_trig_tim4_off,
  etb_pwm_trig_tim4_on,
  etb_pwm_trig_tim5_off,
  etb_pwm_trig_tim5_on,
  int0encmpad,
  int0encmpau,
  int0encmpbd,
  int0encmpbu,
  int0encntload,
  int0encntzero,
  int1encmpad,
  int1encmpau,
  int1encmpbd,
  int1encmpbu,
  int1encntload,
  int1encntzero,
  int2encmpad,
  int2encmpau,
  int2encmpbd,
  int2encmpbu,
  int2encntload,
  int2encntzero,
  int3encmpad,
  int3encmpau,
  int3encmpbd,
  int3encmpbu,
  int3encntload,
  int3encntzero,
  int4encmpad,
  int4encmpau,
  int4encmpbd,
  int4encmpbu,
  int4encntload,
  int4encntzero,
  int5encmpad,
  int5encmpau,
  int5encmpbd,
  int5encmpbu,
  int5encntload,
  int5encntzero,
  intenfault,
  intic0cmpad,
  intic0cmpau,
  intic0cmpbd,
  intic0cmpbu,
  intic0cntload,
  intic0cntzero,
  intic1cmpad,
  intic1cmpau,
  intic1cmpbd,
  intic1cmpbu,
  intic1cntload,
  intic1cntzero,
  intic2cmpad,
  intic2cmpau,
  intic2cmpbd,
  intic2cmpbu,
  intic2cntload,
  intic2cntzero,
  intic3cmpad,
  intic3cmpau,
  intic3cmpbd,
  intic3cmpbu,
  intic3cntload,
  intic3cntzero,
  intic4cmpad,
  intic4cmpau,
  intic4cmpbd,
  intic4cmpbu,
  intic4cntload,
  intic4cntzero,
  intic5cmpad,
  intic5cmpau,
  intic5cmpbd,
  intic5cmpbu,
  intic5cntload,
  intic5cntzero,
  inticfault,
  paddr,
  pclk,
  penable,
  prdata,
  presetn,
  psel,
  pwdata,
  pwm01count,
  pwm01count_h,
  pwm0en,
  pwm0inv,
  pwm0load,
  pwm0mode,
  pwm0trig_val,
  pwm10en,
  pwm10inv,
  pwm11en,
  pwm11inv,
  pwm1en,
  pwm1inv,
  pwm1load,
  pwm1mode,
  pwm1trig_val,
  pwm23count,
  pwm23count_h,
  pwm2en,
  pwm2inv,
  pwm2load,
  pwm2mode,
  pwm2trig_val,
  pwm3en,
  pwm3inv,
  pwm3load,
  pwm3mode,
  pwm3trig_val,
  pwm45count,
  pwm45count_h,
  pwm4en,
  pwm4inv,
  pwm4load,
  pwm4mode,
  pwm4trig_val,
  pwm5en,
  pwm5inv,
  pwm5load,
  pwm5mode,
  pwm5trig_val,
  pwm6en,
  pwm6inv,
  pwm7en,
  pwm7inv,
  pwm8en,
  pwm8inv,
  pwm9en,
  pwm9inv,
  pwmis1,
  pwmis2,
  pwmris1,
  pwmris2,
  pwrite,
  sync0mode,
  sync1mode,
  sync2mode,
  sync3mode,
  sync4mode,
  sync5mode,
  tim01count,
  tim01count_h,
  tim0en,
  tim0ic,
  tim0ie,
  tim0load,
  tim1en,
  tim1ic,
  tim1ie,
  tim1load,
  tim23count,
  tim23count_h,
  tim2en,
  tim2ic,
  tim2ie,
  tim2load,
  tim3en,
  tim3ic,
  tim3ie,
  tim3load,
  tim45count,
  tim45count_h,
  tim4en,
  tim4ic,
  tim4ie,
  tim4load,
  tim5en,
  tim5ic,
  tim5ie,
  tim5load,
  timis,
  timris,
  tr0end,
  tr0enu,
  tr1end,
  tr1enu,
  tr2end,
  tr2enu,
  tr3end,
  tr3enu,
  tr4end,
  tr4enu,
  tr5end,
  tr5enu,
  triginv
);
input   [31:0]  cap01t;               
input   [31:0]  cap01t_h;             
input   [31:0]  cap23t;               
input   [31:0]  cap23t_h;             
input   [31:0]  cap45t;               
input   [31:0]  cap45t_h;             
input   [31:0]  capis;                
input   [31:0]  capris;               
input   [31:0]  cnt0val;              
input   [31:0]  cnt1val;              
input   [31:0]  cnt2val;              
input   [31:0]  cnt3val;              
input   [31:0]  cnt4val;              
input   [31:0]  cnt5val;              
input           etb_pwm_trig_tim0_off; 
input           etb_pwm_trig_tim0_on; 
input           etb_pwm_trig_tim1_off; 
input           etb_pwm_trig_tim1_on; 
input           etb_pwm_trig_tim2_off; 
input           etb_pwm_trig_tim2_on; 
input           etb_pwm_trig_tim3_off; 
input           etb_pwm_trig_tim3_on; 
input           etb_pwm_trig_tim4_off; 
input           etb_pwm_trig_tim4_on; 
input           etb_pwm_trig_tim5_off; 
input           etb_pwm_trig_tim5_on; 
input   [31:0]  paddr;                
input           pclk;                 
input           penable;              
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input   [31:0]  pwm01count;           
input   [31:0]  pwm01count_h;         
input   [31:0]  pwm23count;           
input   [31:0]  pwm23count_h;         
input   [31:0]  pwm45count;           
input   [31:0]  pwm45count_h;         
input   [31:0]  pwmis1;               
input   [31:0]  pwmis2;               
input   [31:0]  pwmris1;              
input   [31:0]  pwmris2;              
input           pwrite;               
input   [31:0]  tim01count;           
input   [31:0]  tim01count_h;         
input   [31:0]  tim23count;           
input   [31:0]  tim23count_h;         
input   [31:0]  tim45count;           
input   [31:0]  tim45count_h;         
input   [31:0]  timis;                
input   [31:0]  timris;               
output          cap0cntic;            
output          cap0cntie;            
output          cap0en;               
output  [1 :0]  cap0eventa;           
output  [31:0]  cap0match;            
output          cap0mode;             
output          cap0timic;            
output          cap0timie;            
output          cap1cntic;            
output          cap1cntie;            
output          cap1en;               
output  [1 :0]  cap1eventa;           
output  [31:0]  cap1match;            
output          cap1mode;             
output          cap1timic;            
output          cap1timie;            
output          cap2cntic;            
output          cap2cntie;            
output          cap2en;               
output  [1 :0]  cap2eventa;           
output  [31:0]  cap2match;            
output          cap2mode;             
output          cap2timic;            
output          cap2timie;            
output          cap3cntic;            
output          cap3cntie;            
output          cap3en;               
output  [1 :0]  cap3eventa;           
output  [31:0]  cap3match;            
output          cap3mode;             
output          cap3timic;            
output          cap3timie;            
output          cap4cntic;            
output          cap4cntie;            
output          cap4en;               
output  [1 :0]  cap4eventa;           
output  [31:0]  cap4match;            
output          cap4mode;             
output          cap4timic;            
output          cap4timie;            
output          cap5cntic;            
output          cap5cntie;            
output          cap5en;               
output  [1 :0]  cap5eventa;           
output  [31:0]  cap5match;            
output          cap5mode;             
output          cap5timic;            
output          cap5timie;            
output  [2 :0]  cntdiv;               
output          cntdiven;             
output  [31:0]  compa_val_0;          
output  [31:0]  compa_val_1;          
output  [31:0]  compa_val_2;          
output  [31:0]  compa_val_3;          
output  [31:0]  compa_val_4;          
output  [31:0]  compa_val_5;          
output  [31:0]  compb_val_0;          
output  [31:0]  compb_val_1;          
output  [31:0]  compb_val_2;          
output  [31:0]  compb_val_3;          
output  [31:0]  compb_val_4;          
output  [31:0]  compb_val_5;          
output          db0en;                
output          db1en;                
output          db2en;                
output          db3en;                
output          db4en;                
output          db5en;                
output  [11:0]  delay0;               
output  [11:0]  delay1;               
output  [11:0]  delay2;               
output  [11:0]  delay3;               
output  [11:0]  delay4;               
output  [11:0]  delay5;               
output          int0encmpad;          
output          int0encmpau;          
output          int0encmpbd;          
output          int0encmpbu;          
output          int0encntload;        
output          int0encntzero;        
output          int1encmpad;          
output          int1encmpau;          
output          int1encmpbd;          
output          int1encmpbu;          
output          int1encntload;        
output          int1encntzero;        
output          int2encmpad;          
output          int2encmpau;          
output          int2encmpbd;          
output          int2encmpbu;          
output          int2encntload;        
output          int2encntzero;        
output          int3encmpad;          
output          int3encmpau;          
output          int3encmpbd;          
output          int3encmpbu;          
output          int3encntload;        
output          int3encntzero;        
output          int4encmpad;          
output          int4encmpau;          
output          int4encmpbd;          
output          int4encmpbu;          
output          int4encntload;        
output          int4encntzero;        
output          int5encmpad;          
output          int5encmpau;          
output          int5encmpbd;          
output          int5encmpbu;          
output          int5encntload;        
output          int5encntzero;        
output          intenfault;           
output          intic0cmpad;          
output          intic0cmpau;          
output          intic0cmpbd;          
output          intic0cmpbu;          
output          intic0cntload;        
output          intic0cntzero;        
output          intic1cmpad;          
output          intic1cmpau;          
output          intic1cmpbd;          
output          intic1cmpbu;          
output          intic1cntload;        
output          intic1cntzero;        
output          intic2cmpad;          
output          intic2cmpau;          
output          intic2cmpbd;          
output          intic2cmpbu;          
output          intic2cntload;        
output          intic2cntzero;        
output          intic3cmpad;          
output          intic3cmpau;          
output          intic3cmpbd;          
output          intic3cmpbu;          
output          intic3cntload;        
output          intic3cntzero;        
output          intic4cmpad;          
output          intic4cmpau;          
output          intic4cmpbd;          
output          intic4cmpbu;          
output          intic4cntload;        
output          intic4cntzero;        
output          intic5cmpad;          
output          intic5cmpau;          
output          intic5cmpbd;          
output          intic5cmpbu;          
output          intic5cntload;        
output          intic5cntzero;        
output          inticfault;           
output  [31:0]  prdata;               
output          pwm0en;               
output          pwm0inv;              
output  [31:0]  pwm0load;             
output          pwm0mode;             
output  [31:0]  pwm0trig_val;         
output          pwm10en;              
output          pwm10inv;             
output          pwm11en;              
output          pwm11inv;             
output          pwm1en;               
output          pwm1inv;              
output  [31:0]  pwm1load;             
output          pwm1mode;             
output  [31:0]  pwm1trig_val;         
output          pwm2en;               
output          pwm2inv;              
output  [31:0]  pwm2load;             
output          pwm2mode;             
output  [31:0]  pwm2trig_val;         
output          pwm3en;               
output          pwm3inv;              
output  [31:0]  pwm3load;             
output          pwm3mode;             
output  [31:0]  pwm3trig_val;         
output          pwm4en;               
output          pwm4inv;              
output  [31:0]  pwm4load;             
output          pwm4mode;             
output  [31:0]  pwm4trig_val;         
output          pwm5en;               
output          pwm5inv;              
output  [31:0]  pwm5load;             
output          pwm5mode;             
output  [31:0]  pwm5trig_val;         
output          pwm6en;               
output          pwm6inv;              
output          pwm7en;               
output          pwm7inv;              
output          pwm8en;               
output          pwm8inv;              
output          pwm9en;               
output          pwm9inv;              
output  [1 :0]  sync0mode;            
output  [1 :0]  sync1mode;            
output  [1 :0]  sync2mode;            
output  [1 :0]  sync3mode;            
output  [1 :0]  sync4mode;            
output  [1 :0]  sync5mode;            
output          tim0en;               
output          tim0ic;               
output          tim0ie;               
output  [31:0]  tim0load;             
output          tim1en;               
output          tim1ic;               
output          tim1ie;               
output  [31:0]  tim1load;             
output          tim2en;               
output          tim2ic;               
output          tim2ie;               
output  [31:0]  tim2load;             
output          tim3en;               
output          tim3ic;               
output          tim3ie;               
output  [31:0]  tim3load;             
output          tim4en;               
output          tim4ic;               
output          tim4ie;               
output  [31:0]  tim4load;             
output          tim5en;               
output          tim5ic;               
output          tim5ie;               
output  [31:0]  tim5load;             
output          tr0end;               
output          tr0enu;               
output          tr1end;               
output          tr1enu;               
output          tr2end;               
output          tr2enu;               
output          tr3end;               
output          tr3enu;               
output          tr4end;               
output          tr4enu;               
output          tr5end;               
output          tr5enu;               
output          triginv;              
reg             etb_pwmcfg18;         
reg             etb_pwmcfg19;         
reg             etb_pwmcfg20;         
reg             etb_pwmcfg21;         
reg             etb_pwmcfg22;         
reg             etb_pwmcfg23;         
reg     [31:0]  int_cap01match;       
reg     [31:0]  int_cap01match_h;     
reg     [31:0]  int_cap23match;       
reg     [31:0]  int_cap23match_h;     
reg     [31:0]  int_cap45match;       
reg     [31:0]  int_cap45match_h;     
reg     [17:0]  int_capctl;           
reg     [11:0]  int_capic;            
reg     [11:0]  int_capinten;         
reg     [25:0]  int_pwm01db;          
reg     [31:0]  int_pwm01load;        
reg     [31:0]  int_pwm01load_h;      
reg     [31:0]  int_pwm01trig;        
reg     [31:0]  int_pwm01trig_h;      
reg     [31:0]  int_pwm0cmp;          
reg     [31:0]  int_pwm0cmp_h;        
reg     [31:0]  int_pwm1cmp;          
reg     [31:0]  int_pwm1cmp_h;        
reg     [25:0]  int_pwm23db;          
reg     [31:0]  int_pwm23load;        
reg     [31:0]  int_pwm23load_h;      
reg     [31:0]  int_pwm23trig;        
reg     [31:0]  int_pwm23trig_h;      
reg     [31:0]  int_pwm2cmp;          
reg     [31:0]  int_pwm2cmp_h;        
reg     [31:0]  int_pwm3cmp;          
reg     [31:0]  int_pwm3cmp_h;        
reg     [25:0]  int_pwm45db;          
reg     [31:0]  int_pwm45load;        
reg     [31:0]  int_pwm45load_h;      
reg     [31:0]  int_pwm45trig;        
reg     [31:0]  int_pwm45trig_h;      
reg     [31:0]  int_pwm4cmp;          
reg     [31:0]  int_pwm4cmp_h;        
reg     [31:0]  int_pwm5cmp;          
reg     [31:0]  int_pwm5cmp_h;        
reg     [27:0]  int_pwmcfg;           
reg     [17:0]  int_pwmctl;           
reg     [29:0]  int_pwmic1;           
reg     [21:0]  int_pwmic2;           
reg     [29:0]  int_pwminten1;        
reg     [21:0]  int_pwminten2;        
reg     [24:0]  int_pwminverttrig;    
reg     [31:0]  int_tim01load;        
reg     [31:0]  int_tim01load_h;      
reg     [31:0]  int_tim23load;        
reg     [31:0]  int_tim23load_h;      
reg     [31:0]  int_tim45load;        
reg     [31:0]  int_tim45load_h;      
reg     [5 :0]  int_timic;            
reg     [5 :0]  int_timinten;         
reg     [31:0]  iprdata;              
wire    [31:0]  cap01match;           
wire    [31:0]  cap01match_h;         
wire            cap01match_wen;       
wire    [31:0]  cap01t;               
wire    [31:0]  cap01t_h;             
wire            cap0cntic;            
wire            cap0cntie;            
wire            cap0en;               
wire    [1 :0]  cap0eventa;           
wire    [31:0]  cap0match;            
wire            cap0mode;             
wire            cap0timic;            
wire            cap0timie;            
wire            cap1cntic;            
wire            cap1cntie;            
wire            cap1en;               
wire    [1 :0]  cap1eventa;           
wire    [31:0]  cap1match;            
wire            cap1mode;             
wire            cap1timic;            
wire            cap1timie;            
wire    [31:0]  cap23match;           
wire    [31:0]  cap23match_h;         
wire            cap23match_wen;       
wire    [31:0]  cap23t;               
wire    [31:0]  cap23t_h;             
wire            cap2cntic;            
wire            cap2cntie;            
wire            cap2en;               
wire    [1 :0]  cap2eventa;           
wire    [31:0]  cap2match;            
wire            cap2mode;             
wire            cap2timic;            
wire            cap2timie;            
wire            cap3cntic;            
wire            cap3cntie;            
wire            cap3en;               
wire    [1 :0]  cap3eventa;           
wire    [31:0]  cap3match;            
wire            cap3mode;             
wire            cap3timic;            
wire            cap3timie;            
wire    [31:0]  cap45match;           
wire    [31:0]  cap45match_h;         
wire            cap45match_wen;       
wire    [31:0]  cap45t;               
wire    [31:0]  cap45t_h;             
wire            cap4cntic;            
wire            cap4cntie;            
wire            cap4en;               
wire    [1 :0]  cap4eventa;           
wire    [31:0]  cap4match;            
wire            cap4mode;             
wire            cap4timic;            
wire            cap4timie;            
wire            cap5cntic;            
wire            cap5cntie;            
wire            cap5en;               
wire    [1 :0]  cap5eventa;           
wire    [31:0]  cap5match;            
wire            cap5mode;             
wire            cap5timic;            
wire            cap5timie;            
wire    [17:0]  capctl;               
wire            capctl_wen;           
wire    [11:0]  capic;                
wire            capic_wen;            
wire    [11:0]  capinten;             
wire            capinten_wen;         
wire    [31:0]  capis;                
wire    [31:0]  capris;               
wire    [31:0]  cnt0val;              
wire    [31:0]  cnt1val;              
wire    [31:0]  cnt2val;              
wire    [31:0]  cnt3val;              
wire    [31:0]  cnt4val;              
wire    [31:0]  cnt5val;              
wire    [2 :0]  cntdiv;               
wire            cntdiven;             
wire    [31:0]  compa_val_0;          
wire    [31:0]  compa_val_1;          
wire    [31:0]  compa_val_2;          
wire    [31:0]  compa_val_3;          
wire    [31:0]  compa_val_4;          
wire    [31:0]  compa_val_5;          
wire    [31:0]  compb_val_0;          
wire    [31:0]  compb_val_1;          
wire    [31:0]  compb_val_2;          
wire    [31:0]  compb_val_3;          
wire    [31:0]  compb_val_4;          
wire    [31:0]  compb_val_5;          
wire            db0en;                
wire            db1en;                
wire            db2en;                
wire            db3en;                
wire            db4en;                
wire            db5en;                
wire    [11:0]  delay0;               
wire    [11:0]  delay1;               
wire    [11:0]  delay2;               
wire    [11:0]  delay3;               
wire    [11:0]  delay4;               
wire    [11:0]  delay5;               
wire            etb_pwm_trig_tim0_off; 
wire            etb_pwm_trig_tim0_on; 
wire            etb_pwm_trig_tim1_off; 
wire            etb_pwm_trig_tim1_on; 
wire            etb_pwm_trig_tim2_off; 
wire            etb_pwm_trig_tim2_on; 
wire            etb_pwm_trig_tim3_off; 
wire            etb_pwm_trig_tim3_on; 
wire            etb_pwm_trig_tim4_off; 
wire            etb_pwm_trig_tim4_on; 
wire            etb_pwm_trig_tim5_off; 
wire            etb_pwm_trig_tim5_on; 
wire            int0encmpad;          
wire            int0encmpau;          
wire            int0encmpbd;          
wire            int0encmpbu;          
wire            int0encntload;        
wire            int0encntzero;        
wire            int1encmpad;          
wire            int1encmpau;          
wire            int1encmpbd;          
wire            int1encmpbu;          
wire            int1encntload;        
wire            int1encntzero;        
wire            int2encmpad;          
wire            int2encmpau;          
wire            int2encmpbd;          
wire            int2encmpbu;          
wire            int2encntload;        
wire            int2encntzero;        
wire            int3encmpad;          
wire            int3encmpau;          
wire            int3encmpbd;          
wire            int3encmpbu;          
wire            int3encntload;        
wire            int3encntzero;        
wire            int4encmpad;          
wire            int4encmpau;          
wire            int4encmpbd;          
wire            int4encmpbu;          
wire            int4encntload;        
wire            int4encntzero;        
wire            int5encmpad;          
wire            int5encmpau;          
wire            int5encmpbd;          
wire            int5encmpbu;          
wire            int5encntload;        
wire            int5encntzero;        
wire            intenfault;           
wire            intic0cmpad;          
wire            intic0cmpau;          
wire            intic0cmpbd;          
wire            intic0cmpbu;          
wire            intic0cntload;        
wire            intic0cntzero;        
wire            intic1cmpad;          
wire            intic1cmpau;          
wire            intic1cmpbd;          
wire            intic1cmpbu;          
wire            intic1cntload;        
wire            intic1cntzero;        
wire            intic2cmpad;          
wire            intic2cmpau;          
wire            intic2cmpbd;          
wire            intic2cmpbu;          
wire            intic2cntload;        
wire            intic2cntzero;        
wire            intic3cmpad;          
wire            intic3cmpau;          
wire            intic3cmpbd;          
wire            intic3cmpbu;          
wire            intic3cntload;        
wire            intic3cntzero;        
wire            intic4cmpad;          
wire            intic4cmpau;          
wire            intic4cmpbd;          
wire            intic4cmpbu;          
wire            intic4cntload;        
wire            intic4cntzero;        
wire            intic5cmpad;          
wire            intic5cmpau;          
wire            intic5cmpbd;          
wire            intic5cmpbu;          
wire            intic5cntload;        
wire            intic5cntzero;        
wire            inticfault;           
wire    [31:0]  paddr;                
wire            pclk;                 
wire            penable;              
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire    [31:0]  pwm01count;           
wire    [31:0]  pwm01count_h;         
wire    [25:0]  pwm01db;              
wire            pwm01db_wen;          
wire    [31:0]  pwm01load;            
wire    [31:0]  pwm01load_h;          
wire            pwm01load_wen;        
wire    [31:0]  pwm01trig;            
wire    [31:0]  pwm01trig_h;          
wire            pwm01trig_wen;        
wire    [31:0]  pwm0cmp;              
wire    [31:0]  pwm0cmp_h;            
wire            pwm0cmp_wen;          
wire            pwm0en;               
wire            pwm0inv;              
wire    [31:0]  pwm0load;             
wire            pwm0mode;             
wire    [31:0]  pwm0trig_val;         
wire            pwm10en;              
wire            pwm10inv;             
wire            pwm11en;              
wire            pwm11inv;             
wire    [31:0]  pwm1cmp;              
wire    [31:0]  pwm1cmp_h;            
wire            pwm1cmp_wen;          
wire            pwm1en;               
wire            pwm1inv;              
wire    [31:0]  pwm1load;             
wire            pwm1mode;             
wire    [31:0]  pwm1trig_val;         
wire    [31:0]  pwm23count;           
wire    [31:0]  pwm23count_h;         
wire    [25:0]  pwm23db;              
wire            pwm23db_wen;          
wire    [31:0]  pwm23load;            
wire    [31:0]  pwm23load_h;          
wire            pwm23load_wen;        
wire    [31:0]  pwm23trig;            
wire    [31:0]  pwm23trig_h;          
wire            pwm23trig_wen;        
wire    [31:0]  pwm2cmp;              
wire    [31:0]  pwm2cmp_h;            
wire            pwm2cmp_wen;          
wire            pwm2en;               
wire            pwm2inv;              
wire    [31:0]  pwm2load;             
wire            pwm2mode;             
wire    [31:0]  pwm2trig_val;         
wire    [31:0]  pwm3cmp;              
wire    [31:0]  pwm3cmp_h;            
wire            pwm3cmp_wen;          
wire            pwm3en;               
wire            pwm3inv;              
wire    [31:0]  pwm3load;             
wire            pwm3mode;             
wire    [31:0]  pwm3trig_val;         
wire    [31:0]  pwm45count;           
wire    [31:0]  pwm45count_h;         
wire    [25:0]  pwm45db;              
wire            pwm45db_wen;          
wire    [31:0]  pwm45load;            
wire    [31:0]  pwm45load_h;          
wire            pwm45load_wen;        
wire    [31:0]  pwm45trig;            
wire    [31:0]  pwm45trig_h;          
wire            pwm45trig_wen;        
wire    [31:0]  pwm4cmp;              
wire    [31:0]  pwm4cmp_h;            
wire            pwm4cmp_wen;          
wire            pwm4en;               
wire            pwm4inv;              
wire    [31:0]  pwm4load;             
wire            pwm4mode;             
wire    [31:0]  pwm4trig_val;         
wire    [31:0]  pwm5cmp;              
wire    [31:0]  pwm5cmp_h;            
wire            pwm5cmp_wen;          
wire            pwm5en;               
wire            pwm5inv;              
wire    [31:0]  pwm5load;             
wire            pwm5mode;             
wire    [31:0]  pwm5trig_val;         
wire            pwm6en;               
wire            pwm6inv;              
wire            pwm7en;               
wire            pwm7inv;              
wire            pwm8en;               
wire            pwm8inv;              
wire            pwm9en;               
wire            pwm9inv;              
wire    [27:0]  pwmcfg;               
wire            pwmcfg_wen;           
wire    [17:0]  pwmctl;               
wire            pwmctl_wen;           
wire            pwmic1_wen;           
wire            pwmic2_wen;           
wire            pwminten1_wen;        
wire            pwminten2_wen;        
wire    [24:0]  pwminverttrig;        
wire            pwminverttrig_wen;    
wire    [31:0]  pwmis1;               
wire    [31:0]  pwmis2;               
wire    [31:0]  pwmris1;              
wire    [31:0]  pwmris2;              
wire            pwrite;               
wire    [1 :0]  sync0mode;            
wire    [1 :0]  sync1mode;            
wire    [1 :0]  sync2mode;            
wire    [1 :0]  sync3mode;            
wire    [1 :0]  sync4mode;            
wire    [1 :0]  sync5mode;            
wire    [31:0]  tim01count;           
wire    [31:0]  tim01count_h;         
wire    [31:0]  tim01load;            
wire    [31:0]  tim01load_h;          
wire            tim01load_wen;        
wire            tim0en;               
wire            tim0ic;               
wire            tim0ie;               
wire    [31:0]  tim0load;             
wire            tim1en;               
wire            tim1ic;               
wire            tim1ie;               
wire    [31:0]  tim1load;             
wire    [31:0]  tim23count;           
wire    [31:0]  tim23count_h;         
wire    [31:0]  tim23load;            
wire    [31:0]  tim23load_h;          
wire            tim23load_wen;        
wire            tim2en;               
wire            tim2ic;               
wire            tim2ie;               
wire    [31:0]  tim2load;             
wire            tim3en;               
wire            tim3ic;               
wire            tim3ie;               
wire    [31:0]  tim3load;             
wire    [31:0]  tim45count;           
wire    [31:0]  tim45count_h;         
wire    [31:0]  tim45load;            
wire    [31:0]  tim45load_h;          
wire            tim45load_wen;        
wire            tim4en;               
wire            tim4ic;               
wire            tim4ie;               
wire    [31:0]  tim4load;             
wire            tim5en;               
wire            tim5ic;               
wire            tim5ie;               
wire    [31:0]  tim5load;             
wire    [5 :0]  timic;                
wire            timic_wen;            
wire    [5 :0]  timinten;             
wire            timinten_wen;         
wire    [31:0]  timis;                
wire    [31:0]  timris;               
wire            tr0end;               
wire            tr0enu;               
wire            tr1end;               
wire            tr1enu;               
wire            tr2end;               
wire            tr2enu;               
wire            tr3end;               
wire            tr3enu;               
wire            tr4end;               
wire            tr4enu;               
wire            tr5end;               
wire            tr5enu;               
wire            triginv;              
wire            write_reg_sel;        
assign write_reg_sel  		= psel & penable & pwrite & (paddr[11:9] == 3'b000);
assign pwmcfg_wen 		= write_reg_sel & (paddr[8:2] == `pwmcfg_OFFSET);
assign pwminverttrig_wen 	= write_reg_sel & (paddr[8:2] == `pwminverttrig_OFFSET); 
assign pwm01trig_wen 		= write_reg_sel & (paddr[8:2] == `pwm01trig_OFFSET); 
assign pwm23trig_wen 		= write_reg_sel & (paddr[8:2] == `pwm23trig_OFFSET); 
assign pwm45trig_wen	 	= write_reg_sel & (paddr[8:2] == `pwm45trig_OFFSET); 
assign pwminten1_wen 		= write_reg_sel & (paddr[8:2] == `pwminten1_OFFSET); 
assign pwminten2_wen 		= write_reg_sel & (paddr[8:2] == `pwminten2_OFFSET); 
assign pwmic1_wen 		= write_reg_sel & (paddr[8:2] == `pwmic1_OFFSET); 
assign pwmic2_wen 		= write_reg_sel & (paddr[8:2] == `pwmic2_OFFSET); 
assign pwmctl_wen 		= write_reg_sel & (paddr[8:2] == `pwmctl_OFFSET); 
assign pwm01load_wen 		= write_reg_sel & (paddr[8:2] == `pwm01load_OFFSET); 
assign pwm23load_wen 		= write_reg_sel & (paddr[8:2] == `pwm23load_OFFSET); 
assign pwm45load_wen 		= write_reg_sel & (paddr[8:2] == `pwm45load_OFFSET); 
assign pwm0cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm0cmp_OFFSET); 
assign pwm1cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm1cmp_OFFSET); 
assign pwm2cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm2cmp_OFFSET); 
assign pwm3cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm3cmp_OFFSET); 
assign pwm4cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm4cmp_OFFSET); 
assign pwm5cmp_wen 		= write_reg_sel & (paddr[8:2] == `pwm5cmp_OFFSET); 
assign pwm01db_wen 		= write_reg_sel & (paddr[8:2] == `pwm01db_OFFSET); 
assign pwm23db_wen 		= write_reg_sel & (paddr[8:2] == `pwm23db_OFFSET); 
assign pwm45db_wen 		= write_reg_sel & (paddr[8:2] == `pwm45db_OFFSET); 
assign capctl_wen 		= write_reg_sel & (paddr[8:2] == `capctl_OFFSET); 
assign capinten_wen 		= write_reg_sel & (paddr[8:2] == `capinten_OFFSET); 
assign capic_wen 		= write_reg_sel & (paddr[8:2] == `capic_OFFSET); 
assign cap01match_wen 		= write_reg_sel & (paddr[8:2] == `cap01match_OFFSET); 
assign cap23match_wen 		= write_reg_sel & (paddr[8:2] == `cap23match_OFFSET); 
assign cap45match_wen 		= write_reg_sel & (paddr[8:2] == `cap45match_OFFSET); 
assign timinten_wen 		= write_reg_sel & (paddr[8:2] == `timinten_OFFSET); 
assign timic_wen 		= write_reg_sel & (paddr[8:2] == `timic_OFFSET); 
assign tim01load_wen 		= write_reg_sel & (paddr[8:2] == `tim01load_OFFSET); 
assign tim23load_wen 		= write_reg_sel & (paddr[8:2] == `tim23load_OFFSET); 
assign tim45load_wen 		= write_reg_sel & (paddr[8:2] == `tim45load_OFFSET); 
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmcfg[27:0] <= {28{1'b0}};
  else if(pwmcfg_wen)
    int_pwmcfg[27:0] <= pwdata[27:0];
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg18 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg18 <= pwdata[18];
    else if(etb_pwm_trig_tim0_on)
        etb_pwmcfg18 <= 1'b1;
    else if(etb_pwm_trig_tim0_off)
        etb_pwmcfg18 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg19 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg19 <= pwdata[19];
    else if(etb_pwm_trig_tim1_on)
        etb_pwmcfg19 <= 1'b1;
    else if(etb_pwm_trig_tim1_off)
        etb_pwmcfg19 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg20 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg20 <= pwdata[20];
    else if(etb_pwm_trig_tim2_on)
        etb_pwmcfg20 <= 1'b1;
    else if(etb_pwm_trig_tim2_off)
        etb_pwmcfg20 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg21 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg21 <= pwdata[21];
    else if(etb_pwm_trig_tim3_on)
        etb_pwmcfg21 <= 1'b1;
    else if(etb_pwm_trig_tim3_off)
        etb_pwmcfg21 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg22 <= 1'b0;
   else if(pwmcfg_wen)
        etb_pwmcfg22 <= pwdata[22];
    else if(etb_pwm_trig_tim4_on)
        etb_pwmcfg22 <= 1'b1;
    else if(etb_pwm_trig_tim4_off)
        etb_pwmcfg22 <= 1'b0;
end
always@(posedge pclk or negedge presetn)
begin
    if(!presetn)
        etb_pwmcfg23 <= 1'b0;
    else if(pwmcfg_wen)
        etb_pwmcfg23 <= pwdata[23];
    else if(etb_pwm_trig_tim5_on)
        etb_pwmcfg23 <= 1'b1;
    else if(etb_pwm_trig_tim5_off)
        etb_pwmcfg23 <= 1'b0;
end
assign pwmcfg[27:0] = int_pwmcfg[27:0] | {4'b0000,etb_pwmcfg23,etb_pwmcfg22,etb_pwmcfg21,etb_pwmcfg20,etb_pwmcfg19,etb_pwmcfg18,18'b00_0000_0000_0000_0000};
assign pwm0en = pwmcfg[0];
assign pwm1en = pwmcfg[1];
assign pwm2en = pwmcfg[2];
assign pwm3en = pwmcfg[3];
assign pwm4en = pwmcfg[4];
assign pwm5en = pwmcfg[5];
assign pwm6en = pwmcfg[6];
assign pwm7en = pwmcfg[7];
assign pwm8en = pwmcfg[8]; 
assign pwm9en = pwmcfg[9]; 
assign pwm10en = pwmcfg[10]; 
assign pwm11en = pwmcfg[11]; 
assign cap0en = pwmcfg[12]; 
assign cap1en = pwmcfg[13]; 
assign cap2en = pwmcfg[14]; 
assign cap3en = pwmcfg[15]; 
assign cap4en = pwmcfg[16]; 
assign cap5en = pwmcfg[17]; 
assign tim0en = pwmcfg[18];
assign tim1en = pwmcfg[19];
assign tim2en = pwmcfg[20];
assign tim3en = pwmcfg[21];
assign tim4en = pwmcfg[22];
assign tim5en = pwmcfg[23];
assign cntdiv[2:0] = pwmcfg[26:24];
assign cntdiven = pwmcfg[27];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminverttrig[24:0] <= {25{1'b0}};
  else
    if(pwminverttrig_wen)
      int_pwminverttrig[24:0] <= pwdata[24:0];
end
assign pwminverttrig[24:0] = int_pwminverttrig[24:0];
assign pwm0inv = pwminverttrig[0];
assign pwm1inv = pwminverttrig[1];
assign pwm2inv = pwminverttrig[2];
assign pwm3inv = pwminverttrig[3];
assign pwm4inv = pwminverttrig[4];
assign pwm5inv = pwminverttrig[5];
assign pwm6inv = pwminverttrig[6];
assign pwm7inv = pwminverttrig[7];
assign pwm8inv = pwminverttrig[8];
assign pwm9inv = pwminverttrig[9];
assign pwm10inv = pwminverttrig[10];
assign pwm11inv = pwminverttrig[11];
assign triginv = pwminverttrig[12];
assign tr0enu = pwminverttrig[13];
assign tr0end = pwminverttrig[14];
assign tr1enu = pwminverttrig[15];
assign tr1end = pwminverttrig[16];
assign tr2enu = pwminverttrig[17];
assign tr2end = pwminverttrig[18];
assign tr3enu = pwminverttrig[19];
assign tr3end = pwminverttrig[20];
assign tr4enu = pwminverttrig[21];
assign tr4end = pwminverttrig[22];
assign tr5enu = pwminverttrig[23];
assign tr5end = pwminverttrig[24];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01trig[31:0] <= {32{1'b0}};
  else
    if(pwm01trig_wen)
      int_pwm01trig[31:0] <= pwdata[31:0];
end
assign pwm01trig[31:0] = int_pwm01trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23trig[31:0] <= {32{1'b0}};
  else
    if(pwm23trig_wen)
      int_pwm23trig[31:0] <= pwdata[31:0];
end
assign pwm23trig[31:0] = int_pwm23trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45trig[31:0] <= {32{1'b0}};
  else
    if(pwm45trig_wen)
      int_pwm45trig[31:0] <= pwdata[31:0];
end
assign pwm45trig[31:0] = int_pwm45trig[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h35))
      int_pwm01trig_h[31:0] <= pwdata[31:0];
end
assign pwm01trig_h[31:0] = int_pwm01trig_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h36))
      int_pwm23trig_h[31:0] <= pwdata[31:0];
end
assign pwm23trig_h[31:0] = int_pwm23trig_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45trig_h[31:0] <= {32{1'b0}};
  else if(write_reg_sel & (paddr[8:2] == 7'h37))
      int_pwm45trig_h[31:0] <= pwdata[31:0];
end
assign pwm45trig_h[31:0] = int_pwm45trig_h[31:0];
assign pwm0trig_val[31:0] = {pwm01trig_h[15:0],pwm01trig[15:0]};
assign pwm1trig_val[31:0] = {pwm01trig_h[31:16],pwm01trig[31:16]};
assign pwm2trig_val[31:0] = {pwm23trig_h[15:0],pwm23trig[15:0]};
assign pwm3trig_val[31:0] = {pwm23trig_h[31:16],pwm23trig[31:16]};
assign pwm4trig_val[31:0] = {pwm45trig_h[15:0],pwm45trig[15:0]};
assign pwm5trig_val[31:0] = {pwm45trig_h[31:16],pwm45trig[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[0:0] <= {1{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[0:0] <= pwdata[0:0];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[13:8] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[13:8] <= pwdata[13:8];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[21:16] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[21:16] <= pwdata[21:16];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten1[29:24] <= {6{1'b0}};
  else
    if(pwminten1_wen)
      int_pwminten1[29:24] <= pwdata[29:24];
end
assign intenfault = 	int_pwminten1[0];
assign int0encntzero = 	int_pwminten1[8];
assign int0encntload = 	int_pwminten1[9];
assign int0encmpau = 	int_pwminten1[10];
assign int0encmpbu = 	int_pwminten1[11];
assign int0encmpad =	int_pwminten1[12];
assign int0encmpbd = 	int_pwminten1[13];
assign int1encntzero = 	int_pwminten1[16];
assign int1encntload = 	int_pwminten1[17];
assign int1encmpau = 	int_pwminten1[18];
assign int1encmpbu = 	int_pwminten1[19];
assign int1encmpad = 	int_pwminten1[20];
assign int1encmpbd = 	int_pwminten1[21];
assign int2encntzero = 	int_pwminten1[24];
assign int2encntload = 	int_pwminten1[25];
assign int2encmpau = 	int_pwminten1[26];
assign int2encmpbu = 	int_pwminten1[27];
assign int2encmpad = 	int_pwminten1[28];
assign int2encmpbd = 	int_pwminten1[29];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[5:0] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[5:0] <= pwdata[5:0];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[13:8] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[13:8] <= pwdata[13:8];
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwminten2[21:16] <= {6{1'b0}};
  else
    if(pwminten2_wen)
      int_pwminten2[21:16] <= pwdata[21:16];
end
assign int3encntzero = 	int_pwminten2[0];
assign int3encntload = 	int_pwminten2[1];
assign int3encmpau = 	int_pwminten2[2];
assign int3encmpbu = 	int_pwminten2[3];
assign int3encmpad = 	int_pwminten2[4];
assign int3encmpbd = 	int_pwminten2[5];
assign int4encntzero = 	int_pwminten2[8];
assign int4encntload = 	int_pwminten2[9];
assign int4encmpau = 	int_pwminten2[10];
assign int4encmpbu = 	int_pwminten2[11];
assign int4encmpad = 	int_pwminten2[12];
assign int4encmpbd = 	int_pwminten2[13];
assign int5encntzero = 	int_pwminten2[16];
assign int5encntload = 	int_pwminten2[17];
assign int5encmpau = 	int_pwminten2[18];
assign int5encmpbu = 	int_pwminten2[19];
assign int5encmpad = 	int_pwminten2[20];
assign int5encmpbd = 	int_pwminten2[21];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[0:0] <= {1{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[0:0] <= pwdata[0:0];
  else
      int_pwmic1[0:0] <= {1{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[13:8] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[13:8] <= pwdata[13:8];
  else
      int_pwmic1[13:8] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[21:16] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[21:16] <= pwdata[21:16];
  else
      int_pwmic1[21:16] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic1[29:24] <= {6{1'b0}};
  else if(pwmic1_wen)
      int_pwmic1[29:24] <= pwdata[29:24];
  else
      int_pwmic1[29:24] <= {6{1'b0}};
end
assign inticfault = 	int_pwmic1[0];
assign intic0cntzero = 	int_pwmic1[8];
assign intic0cntload = 	int_pwmic1[9];
assign intic0cmpau = 	int_pwmic1[10];
assign intic0cmpbu = 	int_pwmic1[11];
assign intic0cmpad = 	int_pwmic1[12];
assign intic0cmpbd = 	int_pwmic1[13];
assign intic1cntzero = 	int_pwmic1[16];
assign intic1cntload = 	int_pwmic1[17];
assign intic1cmpau = 	int_pwmic1[18];
assign intic1cmpbu = 	int_pwmic1[19];
assign intic1cmpad = 	int_pwmic1[20];
assign intic1cmpbd = 	int_pwmic1[21];
assign intic2cntzero = 	int_pwmic1[24];
assign intic2cntload = 	int_pwmic1[25];
assign intic2cmpau = 	int_pwmic1[26];
assign intic2cmpbu = 	int_pwmic1[27];
assign intic2cmpad = 	int_pwmic1[28];
assign intic2cmpbd = 	int_pwmic1[29];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[5:0] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[5:0] <= pwdata[5:0];
  else
      int_pwmic2[5:0] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[13:8] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[13:8] <= pwdata[13:8];
  else
      int_pwmic2[13:8] <= {6{1'b0}};
end
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmic2[21:16] <= {6{1'b0}};
  else if(pwmic2_wen)
      int_pwmic2[21:16] <= pwdata[21:16];
  else
      int_pwmic2[21:16] <= {6{1'b0}};
end
assign intic3cntzero = 	int_pwmic2[0];
assign intic3cntload =	int_pwmic2[1];
assign intic3cmpau = 	int_pwmic2[2];
assign intic3cmpbu = 	int_pwmic2[3];
assign intic3cmpad = 	int_pwmic2[4];
assign intic3cmpbd = 	int_pwmic2[5];
assign intic4cntzero = 	int_pwmic2[8];
assign intic4cntload = 	int_pwmic2[9];
assign intic4cmpau = 	int_pwmic2[10];
assign intic4cmpbu = 	int_pwmic2[11];
assign intic4cmpad = 	int_pwmic2[12];
assign intic4cmpbd = 	int_pwmic2[13];
assign intic5cntzero = 	int_pwmic2[16];
assign intic5cntload = 	int_pwmic2[17];
assign intic5cmpau = 	int_pwmic2[18];
assign intic5cmpbu = 	int_pwmic2[19];
assign intic5cmpad = 	int_pwmic2[20];
assign intic5cmpbd = 	int_pwmic2[21];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwmctl[17:0] <= {18{1'b0}};
  else
    if(pwmctl_wen)
      int_pwmctl[17:0] <= pwdata[17:0];
end
assign pwmctl[17:0] = int_pwmctl[17:0];
assign pwm0mode = pwmctl[0];
assign pwm1mode = pwmctl[1];
assign pwm2mode = pwmctl[2];
assign pwm3mode = pwmctl[3];
assign pwm4mode = pwmctl[4];
assign pwm5mode = pwmctl[5];
assign sync0mode[1:0] = pwmctl[7:6];
assign sync1mode[1:0] = pwmctl[9:8];
assign sync2mode[1:0] = pwmctl[11:10];
assign sync3mode[1:0] = pwmctl[13:12];
assign sync4mode[1:0] = pwmctl[15:14];
assign sync5mode[1:0] = pwmctl[17:16];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01load[31:0] <= {32{1'b0}};
  else
    if(pwm01load_wen)
      int_pwm01load[31:0] <= pwdata[31:0];
end
assign pwm01load[31:0] = int_pwm01load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23load[31:0] <= {32{1'b0}};
  else
    if(pwm23load_wen)
      int_pwm23load[31:0] <= pwdata[31:0];
end
assign pwm23load[31:0] = int_pwm23load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45load[31:0] <= {32{1'b0}};
  else
    if(pwm45load_wen)
      int_pwm45load[31:0] <= pwdata[31:0];
end
assign pwm45load[31:0] = int_pwm45load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h41)
      int_pwm01load_h[31:0] <= pwdata[31:0];
end
assign pwm01load_h[31:0] = int_pwm01load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h42)
      int_pwm23load_h[31:0] <= pwdata[31:0];
end
assign pwm23load_h[31:0] = int_pwm23load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & paddr[8:2] == 7'h43)
      int_pwm45load_h[31:0] <= pwdata[31:0];
end
assign pwm45load_h[31:0] = int_pwm45load_h[31:0];
assign pwm0load[31:0] = {pwm01load_h[15:0],pwm01load[15:0]};
assign pwm1load[31:0] = {pwm01load_h[31:16],pwm01load[31:16]};
assign pwm2load[31:0] = {pwm23load_h[15:0],pwm23load[15:0]};
assign pwm3load[31:0] = {pwm23load_h[31:16],pwm23load[31:16]};
assign pwm4load[31:0] = {pwm45load_h[15:0],pwm45load[15:0]};
assign pwm5load[31:0] = {pwm45load_h[31:16],pwm45load[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm0cmp[31:0] <= {32{1'b0}};
  else
    if(pwm0cmp_wen)
      int_pwm0cmp[31:0] <= pwdata[31:0];
end
assign pwm0cmp[31:0] = int_pwm0cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm1cmp[31:0] <= {32{1'b0}};
  else
    if(pwm1cmp_wen)
      int_pwm1cmp[31:0] <= pwdata[31:0];
end
assign pwm1cmp[31:0] = int_pwm1cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm2cmp[31:0] <= {32{1'b0}};
  else
    if(pwm2cmp_wen)
      int_pwm2cmp[31:0] <= pwdata[31:0];
end
assign pwm2cmp[31:0] = int_pwm2cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm3cmp[31:0] <= {32{1'b0}};
  else
    if(pwm3cmp_wen)
      int_pwm3cmp[31:0] <= pwdata[31:0];
end
assign pwm3cmp[31:0] = int_pwm3cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm4cmp[31:0] <= {32{1'b0}};
  else
    if(pwm4cmp_wen)
      int_pwm4cmp[31:0] <= pwdata[31:0];
end
assign pwm4cmp[31:0] = int_pwm4cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm5cmp[31:0] <= {32{1'b0}};
  else
    if(pwm5cmp_wen)
      int_pwm5cmp[31:0] <= pwdata[31:0];
end
assign pwm5cmp[31:0] = int_pwm5cmp[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm0cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[7:2] == 6'h38))
      int_pwm0cmp_h[31:0] <= pwdata[31:0];
end
assign pwm0cmp_h[31:0] = int_pwm0cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm1cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[7:2] == 6'h39))
      int_pwm1cmp_h[31:0] <= pwdata[31:0];
end
assign pwm1cmp_h[31:0] = int_pwm1cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm2cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3a))
      int_pwm2cmp_h[31:0] <= pwdata[31:0];
end
assign pwm2cmp_h[31:0] = int_pwm2cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm3cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3b))
      int_pwm3cmp_h[31:0] <= pwdata[31:0];
end
assign pwm3cmp_h[31:0] = int_pwm3cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm4cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3c))
      int_pwm4cmp_h[31:0] <= pwdata[31:0];
end
assign pwm4cmp_h[31:0] = int_pwm4cmp_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm5cmp_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h3d))
      int_pwm5cmp_h[31:0] <= pwdata[31:0];
end
assign pwm5cmp_h[31:0] = int_pwm5cmp_h[31:0];
assign compa_val_0[31:0] = {pwm0cmp_h[15:0],pwm0cmp[15:0]};
assign compa_val_1[31:0] = {pwm1cmp_h[15:0],pwm1cmp[15:0]};
assign compa_val_2[31:0] = {pwm2cmp_h[15:0],pwm2cmp[15:0]};
assign compa_val_3[31:0] = {pwm3cmp_h[15:0],pwm3cmp[15:0]};
assign compa_val_4[31:0] = {pwm4cmp_h[15:0],pwm4cmp[15:0]};
assign compa_val_5[31:0] = {pwm5cmp_h[15:0],pwm5cmp[15:0]};
assign compb_val_0[31:0] = {pwm0cmp_h[31:16],pwm0cmp[31:16]};
assign compb_val_1[31:0] = {pwm1cmp_h[31:16],pwm1cmp[31:16]};
assign compb_val_2[31:0] = {pwm2cmp_h[31:16],pwm2cmp[31:16]};
assign compb_val_3[31:0] = {pwm3cmp_h[31:16],pwm3cmp[31:16]};
assign compb_val_4[31:0] = {pwm4cmp_h[31:16],pwm4cmp[31:16]};
assign compb_val_5[31:0] = {pwm5cmp_h[31:16],pwm5cmp[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm01db[25:0] <= {26{1'b0}};
  else
    if(pwm01db_wen)
      int_pwm01db[25:0] <= pwdata[25:0];
end
assign pwm01db[25:0] = int_pwm01db[25:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm23db[25:0] <= {26{1'b0}};
  else
    if(pwm23db_wen)
      int_pwm23db[25:0] <= pwdata[25:0];
end
assign pwm23db[25:0] = int_pwm23db[25:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_pwm45db[25:0] <= {26{1'b0}};
  else
    if(pwm45db_wen)
      int_pwm45db[25:0] <= pwdata[25:0];
end
assign pwm45db[25:0] = int_pwm45db[25:0];
assign db0en = pwm01db[24];
assign db1en = pwm01db[25];
assign db2en = pwm23db[24];
assign db3en = pwm23db[25];
assign db4en = pwm45db[24];
assign db5en = pwm45db[25];
assign delay0[11:0] = pwm01db[11:0];
assign delay1[11:0] = pwm01db[23:12];
assign delay2[11:0] = pwm23db[11:0];
assign delay3[11:0] = pwm23db[23:12];
assign delay4[11:0] = pwm45db[11:0];
assign delay5[11:0] = pwm45db[23:12];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capctl[17:0] <= {18{1'b0}};
  else
    if(capctl_wen)
      int_capctl[17:0] <= pwdata[17:0];
end
assign capctl[17:0] = int_capctl[17:0];
assign cap0mode = capctl[0];
assign cap1mode = capctl[1];
assign cap2mode = capctl[2];
assign cap3mode = capctl[3];
assign cap4mode = capctl[4];
assign cap5mode = capctl[5];
assign cap0eventa[1:0] = capctl[7:6];
assign cap1eventa[1:0] = capctl[9:8];
assign cap2eventa[1:0] = capctl[11:10];
assign cap3eventa[1:0] = capctl[13:12];
assign cap4eventa[1:0] = capctl[15:14];
assign cap5eventa[1:0] = capctl[17:16];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capinten[11:0] <= {12{1'b0}};
  else
    if(capinten_wen)
      int_capinten[11:0] <= pwdata[11:0];
end
assign capinten[11:0] = int_capinten[11:0];
assign cap0cntie = capinten[0];
assign cap1cntie = capinten[1];
assign cap2cntie = capinten[2];
assign cap3cntie = capinten[3];
assign cap4cntie = capinten[4];
assign cap5cntie = capinten[5];
assign cap0timie = capinten[6];
assign cap1timie = capinten[7];
assign cap2timie = capinten[8];
assign cap3timie = capinten[9];
assign cap4timie = capinten[10];
assign cap5timie = capinten[11];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_capic[11:0] <= {12{1'b0}};
  else if(capic_wen)
      int_capic[11:0] <= pwdata[11:0];
  else
      int_capic[11:0] <= {12{1'b0}};
end
assign capic[11:0] = int_capic[11:0];
assign cap0cntic = capic[0];
assign cap1cntic = capic[1];
assign cap2cntic = capic[2];
assign cap3cntic = capic[3];
assign cap4cntic = capic[4];
assign cap5cntic = capic[5];
assign cap0timic = capic[6];
assign cap1timic = capic[7];
assign cap2timic = capic[8];
assign cap3timic = capic[9];
assign cap4timic = capic[10];
assign cap5timic = capic[11];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap01match[31:0] <= {32{1'b0}};
  else
    if(cap01match_wen)
      int_cap01match[31:0] <= pwdata[31:0];
end
assign cap01match[31:0] = int_cap01match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap23match[31:0] <= {32{1'b0}};
  else
    if(cap23match_wen)
      int_cap23match[31:0] <= pwdata[31:0];
end
assign cap23match[31:0] = int_cap23match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap45match[31:0] <= {32{1'b0}};
  else
    if(cap45match_wen)
      int_cap45match[31:0] <= pwdata[31:0];
end
assign cap45match[31:0] = int_cap45match[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap01match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h44))
      int_cap01match_h[31:0] <= pwdata[31:0];
end
assign cap01match_h[31:0] = int_cap01match_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap23match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h45))
      int_cap23match_h[31:0] <= pwdata[31:0];
end
assign cap23match_h[31:0] = int_cap23match_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_cap45match_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h46))
      int_cap45match_h[31:0] <= pwdata[31:0];
end
assign cap45match_h[31:0] = int_cap45match_h[31:0];
assign cap0match[31:0] = {cap01match_h[15:0],cap01match[15:0]};
assign cap1match[31:0] = {cap01match_h[31:16],cap01match[31:16]};
assign cap2match[31:0] = {cap23match_h[15:0],cap23match[15:0]};
assign cap3match[31:0] = {cap23match_h[31:16],cap23match[31:16]};
assign cap4match[31:0] = {cap45match_h[15:0],cap45match[15:0]};
assign cap5match[31:0] = {cap45match_h[31:16],cap45match[31:16]};
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_timinten[5:0] <= {6{1'b0}};
  else
    if(timinten_wen)
      int_timinten[5:0] <= pwdata[5:0];
end
assign timinten[5:0] = int_timinten[5:0];
assign tim0ie = timinten[0];
assign tim1ie = timinten[1];
assign tim2ie = timinten[2];
assign tim3ie = timinten[3];
assign tim4ie = timinten[4];
assign tim5ie = timinten[5];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_timic[5:0] <= {6{1'b0}};
  else if(timic_wen)
      int_timic[5:0] <= pwdata[5:0];
  else
      int_timic[5:0] <= {6{1'b0}};
end
assign timic[5:0] = int_timic[5:0];
assign tim0ic = timic[0];
assign tim1ic = timic[1];
assign tim2ic = timic[2];
assign tim3ic = timic[3];
assign tim4ic = timic[4];
assign tim5ic = timic[5];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim01load[31:0] <= {32{1'b0}};
  else
    if(tim01load_wen)
      int_tim01load[31:0] <= pwdata[31:0];
end
assign tim01load[31:0] = int_tim01load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim23load[31:0] <= {32{1'b0}};
  else
    if(tim23load_wen)
      int_tim23load[31:0] <= pwdata[31:0];
end
assign tim23load[31:0] = int_tim23load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim45load[31:0] <= {32{1'b0}};
  else
    if(tim45load_wen)
      int_tim45load[31:0] <= pwdata[31:0];
end
assign tim45load[31:0] = int_tim45load[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim01load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 6'h3e))
      int_tim01load_h[31:0] <= pwdata[31:0];
end
assign tim01load_h[31:0] = int_tim01load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim23load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 6'h3f))
      int_tim23load_h[31:0] <= pwdata[31:0];
end
assign tim23load_h[31:0] = int_tim23load_h[31:0];
always@(posedge pclk or negedge presetn)
begin
  if(!presetn)
    int_tim45load_h[31:0] <= {32{1'b0}};
  else
    if(write_reg_sel & (paddr[8:2] == 7'h40))
      int_tim45load_h[31:0] <= pwdata[31:0];
end
assign tim45load_h[31:0] = int_tim45load_h[31:0];
assign tim0load[31:0] = {tim01load_h[15:0],tim01load[15:0]};
assign tim1load[31:0] = {tim01load_h[31:16],tim01load[31:16]};
assign tim2load[31:0] = {tim23load_h[15:0],tim23load[15:0]};
assign tim3load[31:0] = {tim23load_h[31:16],tim23load[31:16]};
assign tim4load[31:0] = {tim45load_h[15:0],tim45load[15:0]};
assign tim5load[31:0] = {tim45load_h[31:16],tim45load[31:16]};
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
    iprdata[31:0] <= {32{1'b0}};
  else
    if((pwrite == 1'b0) && (psel == 1'b1) && (penable == 1'b0) && (paddr[11:9] == 3'b000))
      case(paddr[8:2])
        `pwmcfg_OFFSET         : iprdata <= {4'b0,pwmcfg[27:0]};
        `pwminverttrig_OFFSET  : iprdata <= {7'b0,pwminverttrig[24:0]}; 
        `pwminten1_OFFSET      : iprdata <= {2'b0,int_pwminten1[29:24],2'b0,int_pwminten1[21:16],2'b0,int_pwminten1[13:8],7'b0,int_pwminten1[0]}; 
        `pwminten2_OFFSET      : iprdata <= {10'b0,int_pwminten2[21:16],2'b0,int_pwminten2[13:8],2'b0,int_pwminten2[5:0]}; 
        `pwmris1_OFFSET        : iprdata <= pwmris1[31:0]; 
        `pwmris2_OFFSET        : iprdata <= pwmris2[31:0]; 
        `pwmic1_OFFSET         : iprdata <= {2'b0,int_pwmic1[29:24],2'b0,int_pwmic1[21:16],2'b0,int_pwmic1[13:8],7'b0,int_pwmic1[0]}; 
        `pwmic2_OFFSET         : iprdata <= {10'b0,int_pwmic2[21:16],2'b0,int_pwmic2[13:8],2'b0,int_pwmic2[5:0]}; 
        `pwmis1_OFFSET         : iprdata <= pwmis1[31:0];
        `pwmis2_OFFSET         : iprdata <= pwmis2[31:0];
        `pwmctl_OFFSET         : iprdata <= {14'b0,pwmctl[17:0]};
        `pwm01load_OFFSET      : iprdata <= pwm01load;
        `pwm23load_OFFSET      : iprdata <= pwm23load;
        `pwm45load_OFFSET      : iprdata <= pwm45load;
        `pwm01count_OFFSET     : iprdata <= pwm01count[31:0];
        `pwm23count_OFFSET     : iprdata <= pwm23count[31:0];
        `pwm45count_OFFSET     : iprdata <= pwm45count[31:0];
        `pwm0cmp_OFFSET        : iprdata <= pwm0cmp;
        `pwm1cmp_OFFSET        : iprdata <= pwm1cmp; 
        `pwm2cmp_OFFSET        : iprdata <= pwm2cmp; 
        `pwm3cmp_OFFSET        : iprdata <= pwm3cmp; 
        `pwm4cmp_OFFSET        : iprdata <= pwm4cmp; 
        `pwm5cmp_OFFSET        : iprdata <= pwm5cmp; 
        `pwm01db_OFFSET        : iprdata <= {6'b0,pwm01db[25:0]}; 
        `pwm23db_OFFSET        : iprdata <= {6'b0,pwm23db[25:0]};
        `pwm45db_OFFSET        : iprdata <= {6'b0,pwm45db[25:0]};
        `capctl_OFFSET         : iprdata <= {14'b0,capctl[17:0]};
        `capinten_OFFSET       : iprdata <= {20'b0,capinten[11:0]};
        `capris_OFFSET         : iprdata <= capris[31:0];
        `capic_OFFSET          : iprdata <= {20'b0,capic[11:0]};
        `capis_OFFSET          : iprdata <= capis[31:0];
        `cap01t_OFFSET         : iprdata <= cap01t[31:0];
        `cap23t_OFFSET         : iprdata <= cap23t[31:0];
        `cap45t_OFFSET         : iprdata <= cap45t[31:0];
        `cap01match_OFFSET     : iprdata <= cap01match;
        `cap23match_OFFSET     : iprdata <= cap23match;
        `cap45match_OFFSET     : iprdata <= cap45match;
        `timinten_OFFSET       : iprdata <= {26'b0,timinten[5:0]};
        `timris_OFFSET         : iprdata <= timris[31:0];
        `timic_OFFSET          : iprdata <= {26'b0,timic[5:0]};
        `timis_OFFSET          : iprdata <= timis[31:0];
        `tim01load_OFFSET      : iprdata <= tim01load;
        `tim23load_OFFSET      : iprdata <= tim23load;
        `tim45load_OFFSET      : iprdata <= tim45load;
	`pwm01trig_OFFSET      : iprdata <= pwm01trig;
	`pwm23trig_OFFSET      : iprdata <= pwm23trig;
        `pwm45trig_OFFSET      : iprdata <= pwm45trig;
	`tim01count_OFFSET     : iprdata <= tim01count[31:0];
	`tim23count_OFFSET     : iprdata <= tim23count[31:0];
	`tim45count_OFFSET     : iprdata <= tim45count[31:0];
	`cnt01val_OFFSET       : iprdata <= {cnt1val[15:0],cnt0val[15:0]};
	`cnt23val_OFFSET       : iprdata <= {cnt3val[15:0],cnt2val[15:0]};
	`cnt45val_OFFSET       : iprdata <= {cnt5val[15:0],cnt4val[15:0]};
        7'h35                  : iprdata <= pwm01trig_h;
 	7'h36                  : iprdata <= pwm23trig_h;
        7'h37                  : iprdata <= pwm45trig_h;
	7'h38                  : iprdata <= pwm0cmp_h;
	7'h39                  : iprdata <= pwm1cmp_h;
	7'h3a                  : iprdata <= pwm2cmp_h;
 	7'h3b                  : iprdata <= pwm3cmp_h;
        7'h3c                  : iprdata <= pwm4cmp_h;
	7'h3d                  : iprdata <= pwm5cmp_h;
	7'h3e                  : iprdata <= tim01load_h;
	7'h3f                  : iprdata <= tim23load_h;
 	7'h40                  : iprdata <= tim45load_h;
        7'h41                  : iprdata <= pwm01load_h;
	7'h42                  : iprdata <= pwm23load_h;
	7'h43                  : iprdata <= pwm45load_h;
	7'h44                  : iprdata <= cap01match_h;
	7'h45                  : iprdata <= cap23match_h;
	7'h46                  : iprdata <= cap45match_h;
        7'h47		       : iprdata <= pwm01count_h[31:0];
	7'h48		       : iprdata <= pwm23count_h[31:0];
	7'h49		       : iprdata <= pwm45count_h[31:0];
        7'h4a		       : iprdata <= cap01t_h[31:0];
	7'h4b		       : iprdata <= cap23t_h[31:0];
	7'h4c		       : iprdata <= cap45t_h[31:0];
 	7'h4d		       : iprdata <= tim01count_h[31:0];
	7'h4e		       : iprdata <= tim23count_h[31:0];
	7'h4f		       : iprdata <= tim45count_h[31:0];
	7'h50		       : iprdata <= {cnt1val[31:16],cnt0val[31:16]};
	7'h51		       : iprdata <= {cnt3val[31:16],cnt2val[31:16]};
	7'h52		       : iprdata <= {cnt5val[31:16],cnt4val[31:16]};
        default                : iprdata <= {32{1'b0}};
      endcase
    else
      iprdata <= {32{1'b0}};
end
assign prdata[31:0] = iprdata;
endmodule
module pwm_ctrl(
  cap01t,
  cap01t_h,
  cap0cntic,
  cap0cntie,
  cap0en,
  cap0eventa,
  cap0match,
  cap0mode,
  cap0timic,
  cap0timie,
  cap1cntic,
  cap1cntie,
  cap1en,
  cap1eventa,
  cap1match,
  cap1mode,
  cap1timic,
  cap1timie,
  cap23t,
  cap23t_h,
  cap2cntic,
  cap2cntie,
  cap2en,
  cap2eventa,
  cap2match,
  cap2mode,
  cap2timic,
  cap2timie,
  cap3cntic,
  cap3cntie,
  cap3en,
  cap3eventa,
  cap3match,
  cap3mode,
  cap3timic,
  cap3timie,
  cap45t,
  cap45t_h,
  cap4cntic,
  cap4cntie,
  cap4en,
  cap4eventa,
  cap4match,
  cap4mode,
  cap4timic,
  cap4timie,
  cap5cntic,
  cap5cntie,
  cap5en,
  cap5eventa,
  cap5match,
  cap5mode,
  cap5timic,
  cap5timie,
  capis,
  capris,
  cnt0val,
  cnt1val,
  cnt2val,
  cnt3val,
  cnt4val,
  cnt5val,
  cntdiv,
  cntdiven,
  compa_val_0,
  compa_val_1,
  compa_val_2,
  compa_val_3,
  compa_val_4,
  compa_val_5,
  compb_val_0,
  compb_val_1,
  compb_val_2,
  compb_val_3,
  compb_val_4,
  compb_val_5,
  db0en,
  db1en,
  db2en,
  db3en,
  db4en,
  db5en,
  delay0,
  delay1,
  delay2,
  delay3,
  delay4,
  delay5,
  fault,
  i_capture_0,
  i_capture_10,
  i_capture_2,
  i_capture_4,
  i_capture_6,
  i_capture_8,
  int0encmpad,
  int0encmpau,
  int0encmpbd,
  int0encmpbu,
  int0encntload,
  int0encntzero,
  int1encmpad,
  int1encmpau,
  int1encmpbd,
  int1encmpbu,
  int1encntload,
  int1encntzero,
  int2encmpad,
  int2encmpau,
  int2encmpbd,
  int2encmpbu,
  int2encntload,
  int2encntzero,
  int3encmpad,
  int3encmpau,
  int3encmpbd,
  int3encmpbu,
  int3encntload,
  int3encntzero,
  int4encmpad,
  int4encmpau,
  int4encmpbd,
  int4encmpbu,
  int4encntload,
  int4encntzero,
  int5encmpad,
  int5encmpau,
  int5encmpbd,
  int5encmpbu,
  int5encntload,
  int5encntzero,
  intenfault,
  intic0cmpad,
  intic0cmpau,
  intic0cmpbd,
  intic0cmpbu,
  intic0cntload,
  intic0cntzero,
  intic1cmpad,
  intic1cmpau,
  intic1cmpbd,
  intic1cmpbu,
  intic1cntload,
  intic1cntzero,
  intic2cmpad,
  intic2cmpau,
  intic2cmpbd,
  intic2cmpbu,
  intic2cntload,
  intic2cntzero,
  intic3cmpad,
  intic3cmpau,
  intic3cmpbd,
  intic3cmpbu,
  intic3cntload,
  intic3cntzero,
  intic4cmpad,
  intic4cmpau,
  intic4cmpbd,
  intic4cmpbu,
  intic4cntload,
  intic4cntzero,
  intic5cmpad,
  intic5cmpau,
  intic5cmpbd,
  intic5cmpbu,
  intic5cntload,
  intic5cntzero,
  inticfault,
  pclk,
  presetn,
  pwm01count,
  pwm01count_h,
  pwm0en,
  pwm0inv,
  pwm0load,
  pwm0mode,
  pwm0trig_val,
  pwm10en,
  pwm10inv,
  pwm11en,
  pwm11inv,
  pwm1en,
  pwm1inv,
  pwm1load,
  pwm1mode,
  pwm1trig_val,
  pwm23count,
  pwm23count_h,
  pwm2en,
  pwm2inv,
  pwm2load,
  pwm2mode,
  pwm2trig_val,
  pwm3en,
  pwm3inv,
  pwm3load,
  pwm3mode,
  pwm3trig_val,
  pwm45count,
  pwm45count_h,
  pwm4en,
  pwm4inv,
  pwm4load,
  pwm4mode,
  pwm4trig_val,
  pwm5en,
  pwm5inv,
  pwm5load,
  pwm5mode,
  pwm5trig_val,
  pwm6en,
  pwm6inv,
  pwm7en,
  pwm7inv,
  pwm8en,
  pwm8inv,
  pwm9en,
  pwm9inv,
  pwm_0_oe,
  pwm_0_out,
  pwm_10_oe,
  pwm_10_out,
  pwm_11_oe,
  pwm_11_out,
  pwm_1_oe,
  pwm_1_out,
  pwm_2_oe,
  pwm_2_out,
  pwm_3_oe,
  pwm_3_out,
  pwm_4_oe,
  pwm_4_out,
  pwm_5_oe,
  pwm_5_out,
  pwm_6_oe,
  pwm_6_out,
  pwm_7_oe,
  pwm_7_out,
  pwm_8_oe,
  pwm_8_out,
  pwm_9_oe,
  pwm_9_out,
  pwm_idle,
  pwm_tim0_etb_trig,
  pwm_tim1_etb_trig,
  pwm_tim2_etb_trig,
  pwm_tim3_etb_trig,
  pwm_tim4_etb_trig,
  pwm_tim5_etb_trig,
  pwm_xx_trig,
  pwmint,
  pwmis1,
  pwmis2,
  pwmris1,
  pwmris2,
  sync0mode,
  sync1mode,
  sync2mode,
  sync3mode,
  sync4mode,
  sync5mode,
  test_mode,
  tim01count,
  tim01count_h,
  tim0en,
  tim0ic,
  tim0ie,
  tim0load,
  tim1en,
  tim1ic,
  tim1ie,
  tim1load,
  tim23count,
  tim23count_h,
  tim2en,
  tim2ic,
  tim2ie,
  tim2load,
  tim3en,
  tim3ic,
  tim3ie,
  tim3load,
  tim45count,
  tim45count_h,
  tim4en,
  tim4ic,
  tim4ie,
  tim4load,
  tim5en,
  tim5ic,
  tim5ie,
  tim5load,
  timis,
  timris,
  tr0end,
  tr0enu,
  tr1end,
  tr1enu,
  tr2end,
  tr2enu,
  tr3end,
  tr3enu,
  tr4end,
  tr4enu,
  tr5end,
  tr5enu,
  triginv
);
input           cap0cntic;          
input           cap0cntie;          
input           cap0en;             
input   [1 :0]  cap0eventa;         
input   [31:0]  cap0match;          
input           cap0mode;           
input           cap0timic;          
input           cap0timie;          
input           cap1cntic;          
input           cap1cntie;          
input           cap1en;             
input   [1 :0]  cap1eventa;         
input   [31:0]  cap1match;          
input           cap1mode;           
input           cap1timic;          
input           cap1timie;          
input           cap2cntic;          
input           cap2cntie;          
input           cap2en;             
input   [1 :0]  cap2eventa;         
input   [31:0]  cap2match;          
input           cap2mode;           
input           cap2timic;          
input           cap2timie;          
input           cap3cntic;          
input           cap3cntie;          
input           cap3en;             
input   [1 :0]  cap3eventa;         
input   [31:0]  cap3match;          
input           cap3mode;           
input           cap3timic;          
input           cap3timie;          
input           cap4cntic;          
input           cap4cntie;          
input           cap4en;             
input   [1 :0]  cap4eventa;         
input   [31:0]  cap4match;          
input           cap4mode;           
input           cap4timic;          
input           cap4timie;          
input           cap5cntic;          
input           cap5cntie;          
input           cap5en;             
input   [1 :0]  cap5eventa;         
input   [31:0]  cap5match;          
input           cap5mode;           
input           cap5timic;          
input           cap5timie;          
input   [2 :0]  cntdiv;             
input           cntdiven;           
input   [31:0]  compa_val_0;        
input   [31:0]  compa_val_1;        
input   [31:0]  compa_val_2;        
input   [31:0]  compa_val_3;        
input   [31:0]  compa_val_4;        
input   [31:0]  compa_val_5;        
input   [31:0]  compb_val_0;        
input   [31:0]  compb_val_1;        
input   [31:0]  compb_val_2;        
input   [31:0]  compb_val_3;        
input   [31:0]  compb_val_4;        
input   [31:0]  compb_val_5;        
input           db0en;              
input           db1en;              
input           db2en;              
input           db3en;              
input           db4en;              
input           db5en;              
input   [11:0]  delay0;             
input   [11:0]  delay1;             
input   [11:0]  delay2;             
input   [11:0]  delay3;             
input   [11:0]  delay4;             
input   [11:0]  delay5;             
input           fault;              
input           i_capture_0;        
input           i_capture_10;       
input           i_capture_2;        
input           i_capture_4;        
input           i_capture_6;        
input           i_capture_8;        
input           int0encmpad;        
input           int0encmpau;        
input           int0encmpbd;        
input           int0encmpbu;        
input           int0encntload;      
input           int0encntzero;      
input           int1encmpad;        
input           int1encmpau;        
input           int1encmpbd;        
input           int1encmpbu;        
input           int1encntload;      
input           int1encntzero;      
input           int2encmpad;        
input           int2encmpau;        
input           int2encmpbd;        
input           int2encmpbu;        
input           int2encntload;      
input           int2encntzero;      
input           int3encmpad;        
input           int3encmpau;        
input           int3encmpbd;        
input           int3encmpbu;        
input           int3encntload;      
input           int3encntzero;      
input           int4encmpad;        
input           int4encmpau;        
input           int4encmpbd;        
input           int4encmpbu;        
input           int4encntload;      
input           int4encntzero;      
input           int5encmpad;        
input           int5encmpau;        
input           int5encmpbd;        
input           int5encmpbu;        
input           int5encntload;      
input           int5encntzero;      
input           intenfault;         
input           intic0cmpad;        
input           intic0cmpau;        
input           intic0cmpbd;        
input           intic0cmpbu;        
input           intic0cntload;      
input           intic0cntzero;      
input           intic1cmpad;        
input           intic1cmpau;        
input           intic1cmpbd;        
input           intic1cmpbu;        
input           intic1cntload;      
input           intic1cntzero;      
input           intic2cmpad;        
input           intic2cmpau;        
input           intic2cmpbd;        
input           intic2cmpbu;        
input           intic2cntload;      
input           intic2cntzero;      
input           intic3cmpad;        
input           intic3cmpau;        
input           intic3cmpbd;        
input           intic3cmpbu;        
input           intic3cntload;      
input           intic3cntzero;      
input           intic4cmpad;        
input           intic4cmpau;        
input           intic4cmpbd;        
input           intic4cmpbu;        
input           intic4cntload;      
input           intic4cntzero;      
input           intic5cmpad;        
input           intic5cmpau;        
input           intic5cmpbd;        
input           intic5cmpbu;        
input           intic5cntload;      
input           intic5cntzero;      
input           inticfault;         
input           pclk;               
input           presetn;            
input           pwm0en;             
input           pwm0inv;            
input   [31:0]  pwm0load;           
input           pwm0mode;           
input   [31:0]  pwm0trig_val;       
input           pwm10en;            
input           pwm10inv;           
input           pwm11en;            
input           pwm11inv;           
input           pwm1en;             
input           pwm1inv;            
input   [31:0]  pwm1load;           
input           pwm1mode;           
input   [31:0]  pwm1trig_val;       
input           pwm2en;             
input           pwm2inv;            
input   [31:0]  pwm2load;           
input           pwm2mode;           
input   [31:0]  pwm2trig_val;       
input           pwm3en;             
input           pwm3inv;            
input   [31:0]  pwm3load;           
input           pwm3mode;           
input   [31:0]  pwm3trig_val;       
input           pwm4en;             
input           pwm4inv;            
input   [31:0]  pwm4load;           
input           pwm4mode;           
input   [31:0]  pwm4trig_val;       
input           pwm5en;             
input           pwm5inv;            
input   [31:0]  pwm5load;           
input           pwm5mode;           
input   [31:0]  pwm5trig_val;       
input           pwm6en;             
input           pwm6inv;            
input           pwm7en;             
input           pwm7inv;            
input           pwm8en;             
input           pwm8inv;            
input           pwm9en;             
input           pwm9inv;            
input   [1 :0]  sync0mode;          
input   [1 :0]  sync1mode;          
input   [1 :0]  sync2mode;          
input   [1 :0]  sync3mode;          
input   [1 :0]  sync4mode;          
input   [1 :0]  sync5mode;          
input           test_mode;          
input           tim0en;             
input           tim0ic;             
input           tim0ie;             
input   [31:0]  tim0load;           
input           tim1en;             
input           tim1ic;             
input           tim1ie;             
input   [31:0]  tim1load;           
input           tim2en;             
input           tim2ic;             
input           tim2ie;             
input   [31:0]  tim2load;           
input           tim3en;             
input           tim3ic;             
input           tim3ie;             
input   [31:0]  tim3load;           
input           tim4en;             
input           tim4ic;             
input           tim4ie;             
input   [31:0]  tim4load;           
input           tim5en;             
input           tim5ic;             
input           tim5ie;             
input   [31:0]  tim5load;           
input           tr0end;             
input           tr0enu;             
input           tr1end;             
input           tr1enu;             
input           tr2end;             
input           tr2enu;             
input           tr3end;             
input           tr3enu;             
input           tr4end;             
input           tr4enu;             
input           tr5end;             
input           tr5enu;             
input           triginv;            
output  [31:0]  cap01t;             
output  [31:0]  cap01t_h;           
output  [31:0]  cap23t;             
output  [31:0]  cap23t_h;           
output  [31:0]  cap45t;             
output  [31:0]  cap45t_h;           
output  [31:0]  capis;              
output  [31:0]  capris;             
output  [31:0]  cnt0val;            
output  [31:0]  cnt1val;            
output  [31:0]  cnt2val;            
output  [31:0]  cnt3val;            
output  [31:0]  cnt4val;            
output  [31:0]  cnt5val;            
output  [31:0]  pwm01count;         
output  [31:0]  pwm01count_h;       
output  [31:0]  pwm23count;         
output  [31:0]  pwm23count_h;       
output  [31:0]  pwm45count;         
output  [31:0]  pwm45count_h;       
output          pwm_0_oe;           
output          pwm_0_out;          
output          pwm_10_oe;          
output          pwm_10_out;         
output          pwm_11_oe;          
output          pwm_11_out;         
output          pwm_1_oe;           
output          pwm_1_out;          
output          pwm_2_oe;           
output          pwm_2_out;          
output          pwm_3_oe;           
output          pwm_3_out;          
output          pwm_4_oe;           
output          pwm_4_out;          
output          pwm_5_oe;           
output          pwm_5_out;          
output          pwm_6_oe;           
output          pwm_6_out;          
output          pwm_7_oe;           
output          pwm_7_out;          
output          pwm_8_oe;           
output          pwm_8_out;          
output          pwm_9_oe;           
output          pwm_9_out;          
output          pwm_idle;           
output          pwm_tim0_etb_trig;  
output          pwm_tim1_etb_trig;  
output          pwm_tim2_etb_trig;  
output          pwm_tim3_etb_trig;  
output          pwm_tim4_etb_trig;  
output          pwm_tim5_etb_trig;  
output          pwm_xx_trig;        
output          pwmint;             
output  [31:0]  pwmis1;             
output  [31:0]  pwmis2;             
output  [31:0]  pwmris1;            
output  [31:0]  pwmris2;            
output  [31:0]  tim01count;         
output  [31:0]  tim01count_h;       
output  [31:0]  tim23count;         
output  [31:0]  tim23count_h;       
output  [31:0]  tim45count;         
output  [31:0]  tim45count_h;       
output  [31:0]  timis;              
output  [31:0]  timris;             
reg             cap0en_d;           
reg             cap1en_d;           
reg             cap2en_d;           
reg             cap3en_d;           
reg             cap4en_d;           
reg             cap5en_d;           
reg     [6 :0]  clkcnt;             
reg             clkdiv_en;          
reg     [6 :0]  clkspec;            
reg             int_fault;          
reg             pwm0en_d;           
reg             pwm10en_d;          
reg             pwm11en_d;          
reg             pwm1en_d;           
reg             pwm2en_d;           
reg             pwm3en_d;           
reg             pwm4en_d;           
reg             pwm5en_d;           
reg             pwm6en_d;           
reg             pwm7en_d;           
reg             pwm8en_d;           
reg             pwm9en_d;           
reg             tim0en_d;           
reg             tim1en_d;           
reg             tim2en_d;           
reg             tim3en_d;           
reg             tim4en_d;           
reg             tim5en_d;           
wire    [31:0]  cap01t;             
wire    [31:0]  cap01t_h;           
wire            cap0cntic;          
wire            cap0cntie;          
wire            cap0en;             
wire    [1 :0]  cap0eventa;         
wire    [31:0]  cap0match;          
wire            cap0mode;           
wire            cap0timic;          
wire            cap0timie;          
wire            cap1cntic;          
wire            cap1cntie;          
wire            cap1en;             
wire    [1 :0]  cap1eventa;         
wire    [31:0]  cap1match;          
wire            cap1mode;           
wire            cap1timic;          
wire            cap1timie;          
wire    [31:0]  cap23t;             
wire    [31:0]  cap23t_h;           
wire            cap2cntic;          
wire            cap2cntie;          
wire            cap2en;             
wire    [1 :0]  cap2eventa;         
wire    [31:0]  cap2match;          
wire            cap2mode;           
wire            cap2timic;          
wire            cap2timie;          
wire            cap3cntic;          
wire            cap3cntie;          
wire            cap3en;             
wire    [1 :0]  cap3eventa;         
wire    [31:0]  cap3match;          
wire            cap3mode;           
wire            cap3timic;          
wire            cap3timie;          
wire    [31:0]  cap45t;             
wire    [31:0]  cap45t_h;           
wire            cap4cntic;          
wire            cap4cntie;          
wire            cap4en;             
wire    [1 :0]  cap4eventa;         
wire    [31:0]  cap4match;          
wire            cap4mode;           
wire            cap4timic;          
wire            cap4timie;          
wire            cap5cntic;          
wire            cap5cntie;          
wire            cap5en;             
wire    [1 :0]  cap5eventa;         
wire    [31:0]  cap5match;          
wire            cap5mode;           
wire            cap5timic;          
wire            cap5timie;          
wire    [31:0]  cap_cnt_0;          
wire    [31:0]  cap_cnt_1;          
wire    [31:0]  cap_cnt_2;          
wire    [31:0]  cap_cnt_3;          
wire    [31:0]  cap_cnt_4;          
wire    [31:0]  cap_cnt_5;          
wire    [31:0]  capis;              
wire    [31:0]  capris;             
wire            clk_sel;            
wire            clkdiv;             
wire            clkdiv_temux;       
wire            clksrc;             
wire            clksrc_tmp;         
wire    [31:0]  cnt0val;            
wire    [31:0]  cnt1val;            
wire    [31:0]  cnt2val;            
wire    [31:0]  cnt3val;            
wire    [31:0]  cnt4val;            
wire    [31:0]  cnt5val;            
wire    [2 :0]  cntdiv;             
wire            cntdiven;           
wire    [31:0]  compa_val_0;        
wire    [31:0]  compa_val_1;        
wire    [31:0]  compa_val_2;        
wire    [31:0]  compa_val_3;        
wire    [31:0]  compa_val_4;        
wire    [31:0]  compa_val_5;        
wire    [31:0]  compb_val_0;        
wire    [31:0]  compb_val_1;        
wire    [31:0]  compb_val_2;        
wire    [31:0]  compb_val_3;        
wire    [31:0]  compb_val_4;        
wire    [31:0]  compb_val_5;        
wire            ctrl_clk;           
wire            db0en;              
wire            db1en;              
wire            db2en;              
wire            db3en;              
wire            db4en;              
wire            db5en;              
wire    [11:0]  delay0;             
wire    [11:0]  delay1;             
wire    [11:0]  delay2;             
wire    [11:0]  delay3;             
wire    [11:0]  delay4;             
wire    [11:0]  delay5;             
wire            fault;              
wire            i_capture_0;        
wire            i_capture_10;       
wire            i_capture_2;        
wire            i_capture_4;        
wire            i_capture_6;        
wire            i_capture_8;        
wire            int0encmpad;        
wire            int0encmpau;        
wire            int0encmpbd;        
wire            int0encmpbu;        
wire            int0encntload;      
wire            int0encntzero;      
wire            int1encmpad;        
wire            int1encmpau;        
wire            int1encmpbd;        
wire            int1encmpbu;        
wire            int1encntload;      
wire            int1encntzero;      
wire            int2encmpad;        
wire            int2encmpau;        
wire            int2encmpbd;        
wire            int2encmpbu;        
wire            int2encntload;      
wire            int2encntzero;      
wire            int3encmpad;        
wire            int3encmpau;        
wire            int3encmpbd;        
wire            int3encmpbu;        
wire            int3encntload;      
wire            int3encntzero;      
wire            int4encmpad;        
wire            int4encmpau;        
wire            int4encmpbd;        
wire            int4encmpbu;        
wire            int4encntload;      
wire            int4encntzero;      
wire            int5encmpad;        
wire            int5encmpau;        
wire            int5encmpbd;        
wire            int5encmpbu;        
wire            int5encntload;      
wire            int5encntzero;      
wire            int_cap0_cnt_add;   
wire            int_cap0_cnt_match; 
wire            int_cap1_cnt_add;   
wire            int_cap1_cnt_match; 
wire            int_cap2_cnt_add;   
wire            int_cap2_cnt_match; 
wire            int_cap3_cnt_add;   
wire            int_cap3_cnt_match; 
wire            int_cap4_cnt_add;   
wire            int_cap4_cnt_match; 
wire            int_cap5_cnt_add;   
wire            int_cap5_cnt_match; 
wire            int_pwm0_cnt_load;  
wire            int_pwm0_cnt_zero;  
wire            int_pwm0_compa_down; 
wire            int_pwm0_compa_up;  
wire            int_pwm0_compb_down; 
wire            int_pwm0_compb_up;  
wire            int_pwm1_cnt_load;  
wire            int_pwm1_cnt_zero;  
wire            int_pwm1_compa_down; 
wire            int_pwm1_compa_up;  
wire            int_pwm1_compb_down; 
wire            int_pwm1_compb_up;  
wire            int_pwm2_cnt_load;  
wire            int_pwm2_cnt_zero;  
wire            int_pwm2_compa_down; 
wire            int_pwm2_compa_up;  
wire            int_pwm2_compb_down; 
wire            int_pwm2_compb_up;  
wire            int_pwm3_cnt_load;  
wire            int_pwm3_cnt_zero;  
wire            int_pwm3_compa_down; 
wire            int_pwm3_compa_up;  
wire            int_pwm3_compb_down; 
wire            int_pwm3_compb_up;  
wire            int_pwm4_cnt_load;  
wire            int_pwm4_cnt_zero;  
wire            int_pwm4_compa_down; 
wire            int_pwm4_compa_up;  
wire            int_pwm4_compb_down; 
wire            int_pwm4_compb_up;  
wire            int_pwm5_cnt_load;  
wire            int_pwm5_cnt_zero;  
wire            int_pwm5_compa_down; 
wire            int_pwm5_compa_up;  
wire            int_pwm5_compb_down; 
wire            int_pwm5_compb_up;  
wire            int_tim0_cnt_match; 
wire            int_tim1_cnt_match; 
wire            int_tim2_cnt_match; 
wire            int_tim3_cnt_match; 
wire            int_tim4_cnt_match; 
wire            int_tim5_cnt_match; 
wire            intenfault;         
wire            intic0cmpad;        
wire            intic0cmpau;        
wire            intic0cmpbd;        
wire            intic0cmpbu;        
wire            intic0cntload;      
wire            intic0cntzero;      
wire            intic1cmpad;        
wire            intic1cmpau;        
wire            intic1cmpbd;        
wire            intic1cmpbu;        
wire            intic1cntload;      
wire            intic1cntzero;      
wire            intic2cmpad;        
wire            intic2cmpau;        
wire            intic2cmpbd;        
wire            intic2cmpbu;        
wire            intic2cntload;      
wire            intic2cntzero;      
wire            intic3cmpad;        
wire            intic3cmpau;        
wire            intic3cmpbd;        
wire            intic3cmpbu;        
wire            intic3cntload;      
wire            intic3cntzero;      
wire            intic4cmpad;        
wire            intic4cmpau;        
wire            intic4cmpbd;        
wire            intic4cmpbu;        
wire            intic4cntload;      
wire            intic4cntzero;      
wire            intic5cmpad;        
wire            intic5cmpau;        
wire            intic5cmpbd;        
wire            intic5cmpbu;        
wire            intic5cntload;      
wire            intic5cntzero;      
wire            inticfault;         
wire            pclk;               
wire            presetn;            
wire    [31:0]  pwm01count;         
wire    [31:0]  pwm01count_h;       
wire            pwm0_int;           
wire            pwm0en;             
wire            pwm0inv;            
wire    [31:0]  pwm0load;           
wire            pwm0mode;           
wire    [31:0]  pwm0trig_val;       
wire            pwm10en;            
wire            pwm10inv;           
wire            pwm11en;            
wire            pwm11inv;           
wire            pwm1_int;           
wire            pwm1en;             
wire            pwm1inv;            
wire    [31:0]  pwm1load;           
wire            pwm1mode;           
wire    [31:0]  pwm1trig_val;       
wire    [31:0]  pwm23count;         
wire    [31:0]  pwm23count_h;       
wire            pwm2_int;           
wire            pwm2en;             
wire            pwm2inv;            
wire    [31:0]  pwm2load;           
wire            pwm2mode;           
wire    [31:0]  pwm2trig_val;       
wire            pwm3_int;           
wire            pwm3en;             
wire            pwm3inv;            
wire    [31:0]  pwm3load;           
wire            pwm3mode;           
wire    [31:0]  pwm3trig_val;       
wire    [31:0]  pwm45count;         
wire    [31:0]  pwm45count_h;       
wire            pwm4_int;           
wire            pwm4en;             
wire            pwm4inv;            
wire    [31:0]  pwm4load;           
wire            pwm4mode;           
wire    [31:0]  pwm4trig_val;       
wire            pwm5_int;           
wire            pwm5en;             
wire            pwm5inv;            
wire    [31:0]  pwm5load;           
wire            pwm5mode;           
wire    [31:0]  pwm5trig_val;       
wire            pwm6en;             
wire            pwm6inv;            
wire            pwm7en;             
wire            pwm7inv;            
wire            pwm8en;             
wire            pwm8inv;            
wire            pwm9en;             
wire            pwm9inv;            
wire            pwm_0_oe;           
wire            pwm_0_out;          
wire            pwm_10_oe;          
wire            pwm_10_out;         
wire            pwm_11_oe;          
wire            pwm_11_out;         
wire            pwm_1_oe;           
wire            pwm_1_out;          
wire            pwm_2_oe;           
wire            pwm_2_out;          
wire            pwm_3_oe;           
wire            pwm_3_out;          
wire            pwm_4_oe;           
wire            pwm_4_out;          
wire            pwm_5_oe;           
wire            pwm_5_out;          
wire            pwm_6_oe;           
wire            pwm_6_out;          
wire            pwm_7_oe;           
wire            pwm_7_out;          
wire            pwm_8_oe;           
wire            pwm_8_out;          
wire            pwm_9_oe;           
wire            pwm_9_out;          
wire    [31:0]  pwm_cnt_0;          
wire    [31:0]  pwm_cnt_1;          
wire    [31:0]  pwm_cnt_2;          
wire    [31:0]  pwm_cnt_3;          
wire    [31:0]  pwm_cnt_4;          
wire    [31:0]  pwm_cnt_5;          
wire            pwm_idle;           
wire            pwm_tim0_etb_trig;  
wire            pwm_tim1_etb_trig;  
wire            pwm_tim2_etb_trig;  
wire            pwm_tim3_etb_trig;  
wire            pwm_tim4_etb_trig;  
wire            pwm_tim5_etb_trig;  
wire            pwm_xx_trig;        
wire            pwm_xx_trig_pre;    
wire            pwmint;             
wire    [31:0]  pwmis1;             
wire    [31:0]  pwmis2;             
wire    [31:0]  pwmris1;            
wire    [31:0]  pwmris2;            
wire    [1 :0]  sync0mode;          
wire    [1 :0]  sync1mode;          
wire    [1 :0]  sync2mode;          
wire    [1 :0]  sync3mode;          
wire    [1 :0]  sync4mode;          
wire    [1 :0]  sync5mode;          
wire            test_mode;          
wire    [31:0]  tim01count;         
wire    [31:0]  tim01count_h;       
wire            tim0en;             
wire            tim0ic;             
wire            tim0ie;             
wire    [31:0]  tim0load;           
wire            tim1en;             
wire            tim1ic;             
wire            tim1ie;             
wire    [31:0]  tim1load;           
wire    [31:0]  tim23count;         
wire    [31:0]  tim23count_h;       
wire            tim2en;             
wire            tim2ic;             
wire            tim2ie;             
wire    [31:0]  tim2load;           
wire            tim3en;             
wire            tim3ic;             
wire            tim3ie;             
wire    [31:0]  tim3load;           
wire    [31:0]  tim45count;         
wire    [31:0]  tim45count_h;       
wire            tim4en;             
wire            tim4ic;             
wire            tim4ie;             
wire    [31:0]  tim4load;           
wire            tim5en;             
wire            tim5ic;             
wire            tim5ie;             
wire    [31:0]  tim5load;           
wire    [31:0]  timis;              
wire    [31:0]  timris;             
wire            tr0end;             
wire            tr0enu;             
wire            tr1end;             
wire            tr1enu;             
wire            tr2end;             
wire            tr2enu;             
wire            tr3end;             
wire            tr3enu;             
wire            tr4end;             
wire            tr4enu;             
wire            tr5end;             
wire            tr5enu;             
wire            trigger0;           
wire            trigger1;           
wire            trigger2;           
wire            trigger3;           
wire            trigger4;           
wire            trigger5;           
wire            triginv;            
always @( cntdiv[2:0])
begin
  case(cntdiv[2:0])
    3'b000 : clkspec[6:0] = 7'h1;
    3'b001 : clkspec[6:0] = 7'h3;
    3'b010 : clkspec[6:0] = 7'h7;
    3'b011 : clkspec[6:0] = 7'hf;
    3'b100 : clkspec[6:0] = 7'h1f;
    3'b101 : clkspec[6:0] = 7'h3f;
    3'b110 : clkspec[6:0] = 7'h7f;
    3'b111 : clkspec[6:0] = 7'h7f;
    default: clkspec[6:0] = 7'h1;	
  endcase
end
always @(posedge pclk or negedge presetn)
begin
  if(!presetn)
  begin
    clkcnt[6:0] <= 7'h0;
    clkdiv_en <= 1'b0;
  end
  else
    if(clkcnt[6:0] == clkspec[6:0])
    begin
      clkcnt[6:0] <= 7'h0;
      clkdiv_en <= 1'b1;
    end
    else
    begin
      clkcnt[6:0] <= clkcnt[6:0] + 7'h1;
      clkdiv_en <= 1'b0;
    end
end
gated_clk_cell  x_cpu_gated_clk (
  .clk_in               (pclk                ),
  .clk_out              (clkdiv              ),
  .external_en          (clkdiv_en           ),
  .global_en            (1'b0                ),
  .local_en             (1'b0                ),
  .module_en            (1'b0                ),
  .pad_yy_gate_clk_en_b (1'b0                ),
  .pad_yy_test_mode     (test_mode           )
);
assign clkdiv_temux = clkdiv;
assign clk_sel = cntdiven & ~test_mode;
clk_mux2 x_pwm_clkmux
(
.clk_sel(clk_sel),
.clk_a(pclk),
.clk_b(clkdiv_temux),
.clk_out(clksrc_tmp)
);
assign clksrc = clksrc_tmp;
assign ctrl_clk = clksrc;
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm0en_d <= 0;
    else
        pwm0en_d <= pwm0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm1en_d <= 0;
    else
        pwm1en_d <= pwm1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm2en_d <= 0;
    else
        pwm2en_d <= pwm2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm3en_d <= 0;
    else
        pwm3en_d <= pwm3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm4en_d <= 0;
    else
        pwm4en_d <= pwm4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm5en_d <= 0;
    else
        pwm5en_d <= pwm5en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm6en_d <= 0;
    else
        pwm6en_d <= pwm6en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm7en_d <= 0;
    else
        pwm7en_d <= pwm7en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm8en_d <= 0;
    else
        pwm8en_d <= pwm8en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm9en_d <= 0;
    else
        pwm9en_d <= pwm9en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm10en_d <= 0;
    else
        pwm10en_d <= pwm10en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	pwm11en_d <= 0;
    else
        pwm11en_d <= pwm11en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap0en_d <= 0;
    else
        cap0en_d <= cap0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap1en_d <= 0;
    else
        cap1en_d <= cap1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap2en_d <= 0;
    else
        cap2en_d <= cap2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap3en_d <= 0;
    else
        cap3en_d <= cap3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap4en_d <= 0;
    else
        cap4en_d <= cap4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	cap5en_d <= 0;
    else
        cap5en_d <= cap5en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim0en_d <= 0;
    else
        tim0en_d <= tim0en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim1en_d <= 0;
    else
        tim1en_d <= tim1en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim2en_d <= 0;
    else
        tim2en_d <= tim2en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim3en_d <= 0;
    else
        tim3en_d <= tim3en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim4en_d <= 0;
    else
        tim4en_d <= tim4en;
end
always@(posedge ctrl_clk or negedge presetn)begin
    if(!presetn)
	tim5en_d <= 0;
    else
        tim5en_d <= tim5en;
end
pwm_gen  pwm_0_inst (
  .cap_cnt                (cap_cnt_0             ),
  .cap_en                 (cap0en_d              ),
  .cap_load_value         (cap0match             ),
  .cap_mode               (cap0mode              ),
  .cap_select             (cap0eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_0           ),
  .compb_val              (compb_val_0           ),
  .deadband_delay_cnt     (delay0                ),
  .deadband_en            (db0en                 ),
  .i_capture              (i_capture_0           ),
  .int_cap_cnt_add        (int_cap0_cnt_add      ),
  .int_cap_cnt_match      (int_cap0_cnt_match    ),
  .int_clr_cap_cnt_add    (cap0timic             ),
  .int_clr_cap_cnt_match  (cap0cntic             ),
  .int_clr_pwm_cnt_load   (intic0cntload         ),
  .int_clr_pwm_cnt_zero   (intic0cntzero         ),
  .int_clr_pwm_compa_down (intic0cmpad           ),
  .int_clr_pwm_compa_up   (intic0cmpau           ),
  .int_clr_pwm_compb_down (intic0cmpbd           ),
  .int_clr_pwm_compb_up   (intic0cmpbu           ),
  .int_clr_tim_cnt_match  (tim0ic                ),
  .int_en_cap_cnt_add     (cap0timie             ),
  .int_en_cap_cnt_match   (cap0cntie             ),
  .int_en_pwm_cnt_load    (int0encntload         ),
  .int_en_pwm_cnt_zero    (int0encntzero         ),
  .int_en_pwm_compa_down  (int0encmpad           ),
  .int_en_pwm_compa_up    (int0encmpau           ),
  .int_en_pwm_compb_down  (int0encmpbd           ),
  .int_en_pwm_compb_up    (int0encmpbu           ),
  .int_en_tim_cnt_match   (tim0ie                ),
  .int_pwm_cnt_load       (int_pwm0_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm0_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm0_compa_down   ),
  .int_pwm_compa_up       (int_pwm0_compa_up     ),
  .int_pwm_compb_down     (int_pwm0_compb_down   ),
  .int_pwm_compb_up       (int_pwm0_compb_up     ),
  .int_tim_cnt_match      (int_tim0_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm0en_d              ),
  .pwm0_inv               (pwm0inv               ),
  .pwm1_en                (pwm1en_d              ),
  .pwm1_inv               (pwm1inv               ),
  .pwm_0_oe               (pwm_0_oe              ),
  .pwm_0_out              (pwm_0_out             ),
  .pwm_1_oe               (pwm_1_oe              ),
  .pwm_1_out              (pwm_1_out             ),
  .pwm_cnt                (pwm_cnt_0             ),
  .pwm_load_value         (pwm0load              ),
  .pwm_mode               (pwm0mode              ),
  .pwm_tim_etb_trig       (pwm_tim0_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync0mode             ),
  .tim_en                 (tim0en_d              ),
  .tim_load_value         (tim0load              ),
  .trend                  (tr0end                ),
  .trenu                  (tr0enu                ),
  .trig_val               (pwm0trig_val          ),
  .trigger                (trigger0              )
);
pwm_gen  pwm_1_inst (
  .cap_cnt                (cap_cnt_1             ),
  .cap_en                 (cap1en_d              ),
  .cap_load_value         (cap1match             ),
  .cap_mode               (cap1mode              ),
  .cap_select             (cap1eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_1           ),
  .compb_val              (compb_val_1           ),
  .deadband_delay_cnt     (delay1                ),
  .deadband_en            (db1en                 ),
  .i_capture              (i_capture_2           ),
  .int_cap_cnt_add        (int_cap1_cnt_add      ),
  .int_cap_cnt_match      (int_cap1_cnt_match    ),
  .int_clr_cap_cnt_add    (cap1timic             ),
  .int_clr_cap_cnt_match  (cap1cntic             ),
  .int_clr_pwm_cnt_load   (intic1cntload         ),
  .int_clr_pwm_cnt_zero   (intic1cntzero         ),
  .int_clr_pwm_compa_down (intic1cmpad           ),
  .int_clr_pwm_compa_up   (intic1cmpau           ),
  .int_clr_pwm_compb_down (intic1cmpbd           ),
  .int_clr_pwm_compb_up   (intic1cmpbu           ),
  .int_clr_tim_cnt_match  (tim1ic                ),
  .int_en_cap_cnt_add     (cap1timie             ),
  .int_en_cap_cnt_match   (cap1cntie             ),
  .int_en_pwm_cnt_load    (int1encntload         ),
  .int_en_pwm_cnt_zero    (int1encntzero         ),
  .int_en_pwm_compa_down  (int1encmpad           ),
  .int_en_pwm_compa_up    (int1encmpau           ),
  .int_en_pwm_compb_down  (int1encmpbd           ),
  .int_en_pwm_compb_up    (int1encmpbu           ),
  .int_en_tim_cnt_match   (tim1ie                ),
  .int_pwm_cnt_load       (int_pwm1_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm1_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm1_compa_down   ),
  .int_pwm_compa_up       (int_pwm1_compa_up     ),
  .int_pwm_compb_down     (int_pwm1_compb_down   ),
  .int_pwm_compb_up       (int_pwm1_compb_up     ),
  .int_tim_cnt_match      (int_tim1_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm2en_d              ),
  .pwm0_inv               (pwm2inv               ),
  .pwm1_en                (pwm3en_d              ),
  .pwm1_inv               (pwm3inv               ),
  .pwm_0_oe               (pwm_2_oe              ),
  .pwm_0_out              (pwm_2_out             ),
  .pwm_1_oe               (pwm_3_oe              ),
  .pwm_1_out              (pwm_3_out             ),
  .pwm_cnt                (pwm_cnt_1             ),
  .pwm_load_value         (pwm1load              ),
  .pwm_mode               (pwm1mode              ),
  .pwm_tim_etb_trig       (pwm_tim1_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync1mode             ),
  .tim_en                 (tim1en_d              ),
  .tim_load_value         (tim1load              ),
  .trend                  (tr1end                ),
  .trenu                  (tr1enu                ),
  .trig_val               (pwm1trig_val          ),
  .trigger                (trigger1              )
);
pwm_gen  pwm_2_inst (
  .cap_cnt                (cap_cnt_2             ),
  .cap_en                 (cap2en_d              ),
  .cap_load_value         (cap2match             ),
  .cap_mode               (cap2mode              ),
  .cap_select             (cap2eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_2           ),
  .compb_val              (compb_val_2           ),
  .deadband_delay_cnt     (delay2                ),
  .deadband_en            (db2en                 ),
  .i_capture              (i_capture_4           ),
  .int_cap_cnt_add        (int_cap2_cnt_add      ),
  .int_cap_cnt_match      (int_cap2_cnt_match    ),
  .int_clr_cap_cnt_add    (cap2timic             ),
  .int_clr_cap_cnt_match  (cap2cntic             ),
  .int_clr_pwm_cnt_load   (intic2cntload         ),
  .int_clr_pwm_cnt_zero   (intic2cntzero         ),
  .int_clr_pwm_compa_down (intic2cmpad           ),
  .int_clr_pwm_compa_up   (intic2cmpau           ),
  .int_clr_pwm_compb_down (intic2cmpbd           ),
  .int_clr_pwm_compb_up   (intic2cmpbu           ),
  .int_clr_tim_cnt_match  (tim2ic                ),
  .int_en_cap_cnt_add     (cap2timie             ),
  .int_en_cap_cnt_match   (cap2cntie             ),
  .int_en_pwm_cnt_load    (int2encntload         ),
  .int_en_pwm_cnt_zero    (int2encntzero         ),
  .int_en_pwm_compa_down  (int2encmpad           ),
  .int_en_pwm_compa_up    (int2encmpau           ),
  .int_en_pwm_compb_down  (int2encmpbd           ),
  .int_en_pwm_compb_up    (int2encmpbu           ),
  .int_en_tim_cnt_match   (tim2ie                ),
  .int_pwm_cnt_load       (int_pwm2_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm2_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm2_compa_down   ),
  .int_pwm_compa_up       (int_pwm2_compa_up     ),
  .int_pwm_compb_down     (int_pwm2_compb_down   ),
  .int_pwm_compb_up       (int_pwm2_compb_up     ),
  .int_tim_cnt_match      (int_tim2_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm4en_d              ),
  .pwm0_inv               (pwm4inv               ),
  .pwm1_en                (pwm5en_d              ),
  .pwm1_inv               (pwm5inv               ),
  .pwm_0_oe               (pwm_4_oe              ),
  .pwm_0_out              (pwm_4_out             ),
  .pwm_1_oe               (pwm_5_oe              ),
  .pwm_1_out              (pwm_5_out             ),
  .pwm_cnt                (pwm_cnt_2             ),
  .pwm_load_value         (pwm2load              ),
  .pwm_mode               (pwm2mode              ),
  .pwm_tim_etb_trig       (pwm_tim2_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync2mode             ),
  .tim_en                 (tim2en_d              ),
  .tim_load_value         (tim2load              ),
  .trend                  (tr2end                ),
  .trenu                  (tr2enu                ),
  .trig_val               (pwm2trig_val          ),
  .trigger                (trigger2              )
);
pwm_gen  pwm_3_inst (
  .cap_cnt                (cap_cnt_3             ),
  .cap_en                 (cap3en_d              ),
  .cap_load_value         (cap3match             ),
  .cap_mode               (cap3mode              ),
  .cap_select             (cap3eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_3           ),
  .compb_val              (compb_val_3           ),
  .deadband_delay_cnt     (delay3                ),
  .deadband_en            (db3en                 ),
  .i_capture              (i_capture_6           ),
  .int_cap_cnt_add        (int_cap3_cnt_add      ),
  .int_cap_cnt_match      (int_cap3_cnt_match    ),
  .int_clr_cap_cnt_add    (cap3timic             ),
  .int_clr_cap_cnt_match  (cap3cntic             ),
  .int_clr_pwm_cnt_load   (intic3cntload         ),
  .int_clr_pwm_cnt_zero   (intic3cntzero         ),
  .int_clr_pwm_compa_down (intic3cmpad           ),
  .int_clr_pwm_compa_up   (intic3cmpau           ),
  .int_clr_pwm_compb_down (intic3cmpbd           ),
  .int_clr_pwm_compb_up   (intic3cmpbu           ),
  .int_clr_tim_cnt_match  (tim3ic                ),
  .int_en_cap_cnt_add     (cap3timie             ),
  .int_en_cap_cnt_match   (cap3cntie             ),
  .int_en_pwm_cnt_load    (int3encntload         ),
  .int_en_pwm_cnt_zero    (int3encntzero         ),
  .int_en_pwm_compa_down  (int3encmpad           ),
  .int_en_pwm_compa_up    (int3encmpau           ),
  .int_en_pwm_compb_down  (int3encmpbd           ),
  .int_en_pwm_compb_up    (int3encmpbu           ),
  .int_en_tim_cnt_match   (tim3ie                ),
  .int_pwm_cnt_load       (int_pwm3_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm3_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm3_compa_down   ),
  .int_pwm_compa_up       (int_pwm3_compa_up     ),
  .int_pwm_compb_down     (int_pwm3_compb_down   ),
  .int_pwm_compb_up       (int_pwm3_compb_up     ),
  .int_tim_cnt_match      (int_tim3_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm6en_d              ),
  .pwm0_inv               (pwm6inv               ),
  .pwm1_en                (pwm7en_d              ),
  .pwm1_inv               (pwm7inv               ),
  .pwm_0_oe               (pwm_6_oe              ),
  .pwm_0_out              (pwm_6_out             ),
  .pwm_1_oe               (pwm_7_oe              ),
  .pwm_1_out              (pwm_7_out             ),
  .pwm_cnt                (pwm_cnt_3             ),
  .pwm_load_value         (pwm3load              ),
  .pwm_mode               (pwm3mode              ),
  .pwm_tim_etb_trig       (pwm_tim3_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync3mode             ),
  .tim_en                 (tim3en_d              ),
  .tim_load_value         (tim3load              ),
  .trend                  (tr3end                ),
  .trenu                  (tr3enu                ),
  .trig_val               (pwm3trig_val          ),
  .trigger                (trigger3              )
);
pwm_gen  pwm_4_inst (
  .cap_cnt                (cap_cnt_4             ),
  .cap_en                 (cap4en_d              ),
  .cap_load_value         (cap4match             ),
  .cap_mode               (cap4mode              ),
  .cap_select             (cap4eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_4           ),
  .compb_val              (compb_val_4           ),
  .deadband_delay_cnt     (delay4                ),
  .deadband_en            (db4en                 ),
  .i_capture              (i_capture_8           ),
  .int_cap_cnt_add        (int_cap4_cnt_add      ),
  .int_cap_cnt_match      (int_cap4_cnt_match    ),
  .int_clr_cap_cnt_add    (cap4timic             ),
  .int_clr_cap_cnt_match  (cap4cntic             ),
  .int_clr_pwm_cnt_load   (intic4cntload         ),
  .int_clr_pwm_cnt_zero   (intic4cntzero         ),
  .int_clr_pwm_compa_down (intic4cmpad           ),
  .int_clr_pwm_compa_up   (intic4cmpau           ),
  .int_clr_pwm_compb_down (intic4cmpbd           ),
  .int_clr_pwm_compb_up   (intic4cmpbu           ),
  .int_clr_tim_cnt_match  (tim4ic                ),
  .int_en_cap_cnt_add     (cap4timie             ),
  .int_en_cap_cnt_match   (cap4cntie             ),
  .int_en_pwm_cnt_load    (int4encntload         ),
  .int_en_pwm_cnt_zero    (int4encntzero         ),
  .int_en_pwm_compa_down  (int4encmpad           ),
  .int_en_pwm_compa_up    (int4encmpau           ),
  .int_en_pwm_compb_down  (int4encmpbd           ),
  .int_en_pwm_compb_up    (int4encmpbu           ),
  .int_en_tim_cnt_match   (tim4ie                ),
  .int_pwm_cnt_load       (int_pwm4_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm4_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm4_compa_down   ),
  .int_pwm_compa_up       (int_pwm4_compa_up     ),
  .int_pwm_compb_down     (int_pwm4_compb_down   ),
  .int_pwm_compb_up       (int_pwm4_compb_up     ),
  .int_tim_cnt_match      (int_tim4_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm8en_d              ),
  .pwm0_inv               (pwm8inv               ),
  .pwm1_en                (pwm9en_d              ),
  .pwm1_inv               (pwm9inv               ),
  .pwm_0_oe               (pwm_8_oe              ),
  .pwm_0_out              (pwm_8_out             ),
  .pwm_1_oe               (pwm_9_oe              ),
  .pwm_1_out              (pwm_9_out             ),
  .pwm_cnt                (pwm_cnt_4             ),
  .pwm_load_value         (pwm4load              ),
  .pwm_mode               (pwm4mode              ),
  .pwm_tim_etb_trig       (pwm_tim4_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync4mode             ),
  .tim_en                 (tim4en_d              ),
  .tim_load_value         (tim4load              ),
  .trend                  (tr4end                ),
  .trenu                  (tr4enu                ),
  .trig_val               (pwm4trig_val          ),
  .trigger                (trigger4              )
);
pwm_gen  pwm_5_inst (
  .cap_cnt                (cap_cnt_5             ),
  .cap_en                 (cap5en_d              ),
  .cap_load_value         (cap5match             ),
  .cap_mode               (cap5mode              ),
  .cap_select             (cap5eventa            ),
  .clk                    (ctrl_clk              ),
  .compa_val              (compa_val_5           ),
  .compb_val              (compb_val_5           ),
  .deadband_delay_cnt     (delay5                ),
  .deadband_en            (db5en                 ),
  .i_capture              (i_capture_10          ),
  .int_cap_cnt_add        (int_cap5_cnt_add      ),
  .int_cap_cnt_match      (int_cap5_cnt_match    ),
  .int_clr_cap_cnt_add    (cap5timic             ),
  .int_clr_cap_cnt_match  (cap5cntic             ),
  .int_clr_pwm_cnt_load   (intic5cntload         ),
  .int_clr_pwm_cnt_zero   (intic5cntzero         ),
  .int_clr_pwm_compa_down (intic5cmpad           ),
  .int_clr_pwm_compa_up   (intic5cmpau           ),
  .int_clr_pwm_compb_down (intic5cmpbd           ),
  .int_clr_pwm_compb_up   (intic5cmpbu           ),
  .int_clr_tim_cnt_match  (tim5ic                ),
  .int_en_cap_cnt_add     (cap5timie             ),
  .int_en_cap_cnt_match   (cap5cntie             ),
  .int_en_pwm_cnt_load    (int5encntload         ),
  .int_en_pwm_cnt_zero    (int5encntzero         ),
  .int_en_pwm_compa_down  (int5encmpad           ),
  .int_en_pwm_compa_up    (int5encmpau           ),
  .int_en_pwm_compb_down  (int5encmpbd           ),
  .int_en_pwm_compb_up    (int5encmpbu           ),
  .int_en_tim_cnt_match   (tim5ie                ),
  .int_pwm_cnt_load       (int_pwm5_cnt_load     ),
  .int_pwm_cnt_zero       (int_pwm5_cnt_zero     ),
  .int_pwm_compa_down     (int_pwm5_compa_down   ),
  .int_pwm_compa_up       (int_pwm5_compa_up     ),
  .int_pwm_compb_down     (int_pwm5_compb_down   ),
  .int_pwm_compb_up       (int_pwm5_compb_up     ),
  .int_tim_cnt_match      (int_tim5_cnt_match    ),
  .pclk                   (pclk                  ),
  .pwm0_en                (pwm10en_d             ),
  .pwm0_inv               (pwm10inv              ),
  .pwm1_en                (pwm11en_d             ),
  .pwm1_inv               (pwm11inv              ),
  .pwm_0_oe               (pwm_10_oe             ),
  .pwm_0_out              (pwm_10_out            ),
  .pwm_1_oe               (pwm_11_oe             ),
  .pwm_1_out              (pwm_11_out            ),
  .pwm_cnt                (pwm_cnt_5             ),
  .pwm_load_value         (pwm5load              ),
  .pwm_mode               (pwm5mode              ),
  .pwm_tim_etb_trig       (pwm_tim5_etb_trig     ),
  .rstn                   (presetn               ),
  .sync_mode              (sync5mode             ),
  .tim_en                 (tim5en_d              ),
  .tim_load_value         (tim5load              ),
  .trend                  (tr5end                ),
  .trenu                  (tr5enu                ),
  .trig_val               (pwm5trig_val          ),
  .trigger                (trigger5              )
);
always@(posedge pclk or negedge presetn)begin
    if(!presetn)
        int_fault <= 0;
    else if(inticfault)
        int_fault <= 0;
    else if(fault & intenfault)
        int_fault <= 1;
end
assign pwm0_int = int_pwm0_compb_down | int_pwm0_compa_down | int_pwm0_compb_up | int_pwm0_compa_up | int_pwm0_cnt_load | int_pwm0_cnt_zero | int_cap0_cnt_add | int_cap0_cnt_match | int_tim0_cnt_match;
assign pwm1_int = int_pwm1_compb_down | int_pwm1_compa_down | int_pwm1_compb_up | int_pwm1_compa_up | int_pwm1_cnt_load | int_pwm1_cnt_zero | int_cap1_cnt_add | int_cap1_cnt_match | int_tim1_cnt_match;
assign pwm2_int = int_pwm2_compb_down | int_pwm2_compa_down | int_pwm2_compb_up | int_pwm2_compa_up | int_pwm2_cnt_load | int_pwm2_cnt_zero | int_cap2_cnt_add | int_cap2_cnt_match | int_tim2_cnt_match;
assign pwm3_int = int_pwm3_compb_down | int_pwm3_compa_down | int_pwm3_compb_up | int_pwm3_compa_up | int_pwm3_cnt_load | int_pwm3_cnt_zero | int_cap3_cnt_add | int_cap3_cnt_match | int_tim3_cnt_match;
assign pwm4_int = int_pwm4_compb_down | int_pwm4_compa_down | int_pwm4_compb_up | int_pwm4_compa_up | int_pwm4_cnt_load | int_pwm4_cnt_zero | int_cap4_cnt_add | int_cap4_cnt_match | int_tim4_cnt_match;
assign pwm5_int = int_pwm5_compb_down | int_pwm5_compa_down | int_pwm5_compb_up | int_pwm5_compa_up | int_pwm5_cnt_load | int_pwm5_cnt_zero | int_cap5_cnt_add | int_cap5_cnt_match | int_tim5_cnt_match;
assign pwmint= pwm0_int | pwm1_int | pwm2_int | pwm3_int | pwm4_int | pwm5_int | int_fault;
assign cap01t[31:0] = {cap_cnt_1[15:0],cap_cnt_0[15:0]};
assign cap23t[31:0] = {cap_cnt_3[15:0],cap_cnt_2[15:0]};
assign cap45t[31:0] = {cap_cnt_5[15:0],cap_cnt_4[15:0]};
assign cap01t_h[31:0] = {cap_cnt_1[31:16],cap_cnt_0[31:16]};
assign cap23t_h[31:0] = {cap_cnt_3[31:16],cap_cnt_2[31:16]};
assign cap45t_h[31:0] = {cap_cnt_5[31:16],cap_cnt_4[31:16]};
assign capis[31:0] = {20'b0,int_cap5_cnt_add,int_cap4_cnt_add,int_cap3_cnt_add,int_cap2_cnt_add,int_cap1_cnt_add,int_cap0_cnt_add,
		      int_cap5_cnt_match,int_cap4_cnt_match,int_cap3_cnt_match,int_cap2_cnt_match,int_cap1_cnt_match,int_cap0_cnt_match};
assign capris[31:0] = capis[31:0];
assign cnt0val[31:0] = pwm_cnt_0[31:0];
assign cnt1val[31:0] = pwm_cnt_1[31:0];
assign cnt2val[31:0] = pwm_cnt_2[31:0];
assign cnt3val[31:0] = pwm_cnt_3[31:0];
assign cnt4val[31:0] = pwm_cnt_4[31:0];
assign cnt5val[31:0] = pwm_cnt_5[31:0];
assign pwm01count[31:0] = {pwm_cnt_1[15:0],pwm_cnt_0[15:0]};
assign pwm23count[31:0] = {pwm_cnt_3[15:0],pwm_cnt_2[15:0]};
assign pwm45count[31:0] = {pwm_cnt_5[15:0],pwm_cnt_4[15:0]};
assign pwm01count_h[31:0] = {pwm_cnt_1[31:16],pwm_cnt_0[31:16]};
assign pwm23count_h[31:0] = {pwm_cnt_3[31:16],pwm_cnt_2[31:16]};
assign pwm45count_h[31:0] = {pwm_cnt_5[31:16],pwm_cnt_4[31:16]};
assign pwmris1[31:0] = {2'b0,int_pwm2_compb_down,int_pwm2_compa_down,int_pwm2_compb_up,int_pwm2_compa_up,int_pwm2_cnt_load,int_pwm2_cnt_zero,
		  2'b0,int_pwm1_compb_down,int_pwm1_compa_down,int_pwm1_compb_up,int_pwm1_compa_up,int_pwm1_cnt_load,int_pwm1_cnt_zero,
		  2'b0,int_pwm0_compb_down,int_pwm0_compa_down,int_pwm0_compb_up,int_pwm0_compa_up,int_pwm0_cnt_load,int_pwm0_cnt_zero,7'b0,int_fault};
assign pwmris2[31:0] = {10'b0,int_pwm5_compb_down,int_pwm5_compa_down,int_pwm5_compb_up,int_pwm5_compa_up,int_pwm5_cnt_load,int_pwm5_cnt_zero,
		   2'b0,int_pwm4_compb_down,int_pwm4_compa_down,int_pwm4_compb_up,int_pwm4_compa_up,int_pwm4_cnt_load,int_pwm4_cnt_zero,
		   2'b0,int_pwm3_compb_down,int_pwm3_compa_down,int_pwm3_compb_up,int_pwm3_compa_up,int_pwm3_cnt_load,int_pwm3_cnt_zero};
assign pwmis1[31:0] = pwmris1[31:0];
assign pwmis2[31:0] = pwmris2[31:0];
assign tim01count[31:0] = {pwm_cnt_1[15:0],pwm_cnt_0[15:0]};
assign tim23count[31:0] = {pwm_cnt_3[15:0],pwm_cnt_2[15:0]};
assign tim45count[31:0] = {pwm_cnt_5[15:0],pwm_cnt_4[15:0]};
assign tim01count_h[31:0] = {pwm_cnt_1[31:16],pwm_cnt_0[31:16]};
assign tim23count_h[31:0] = {pwm_cnt_3[31:16],pwm_cnt_2[31:16]};
assign tim45count_h[31:0] = {pwm_cnt_5[31:16],pwm_cnt_4[31:16]};
assign timis[31:0] = {26'b0,int_tim5_cnt_match,int_tim4_cnt_match,int_tim3_cnt_match,int_tim2_cnt_match,int_tim1_cnt_match,int_tim0_cnt_match};
assign timris[31:0] = timis[31:0];
assign pwm_xx_trig_pre = trigger0 | trigger1 | trigger2 | trigger3 | trigger4 | trigger5;
assign pwm_xx_trig = triginv ? ~pwm_xx_trig_pre : pwm_xx_trig_pre;
assign pwm_idle = ~(pwm0en_d | pwm1en_d | pwm2en_d | pwm3en_d | pwm4en_d | pwm5en_d | pwm6en_d | pwm7en_d | pwm8en_d | pwm9en_d | pwm10en_d | pwm11en_d | cap0en_d | cap1en_d | cap2en_d | cap3en_d | cap4en_d | cap5en_d | tim0en_d | tim1en_d | tim2en_d | tim3en_d | tim4en_d | tim5en_d);
endmodule
module pwm_gen(
  cap_cnt,
  cap_en,
  cap_load_value,
  cap_mode,
  cap_select,
  clk,
  compa_val,
  compb_val,
  deadband_delay_cnt,
  deadband_en,
  i_capture,
  int_cap_cnt_add,
  int_cap_cnt_match,
  int_clr_cap_cnt_add,
  int_clr_cap_cnt_match,
  int_clr_pwm_cnt_load,
  int_clr_pwm_cnt_zero,
  int_clr_pwm_compa_down,
  int_clr_pwm_compa_up,
  int_clr_pwm_compb_down,
  int_clr_pwm_compb_up,
  int_clr_tim_cnt_match,
  int_en_cap_cnt_add,
  int_en_cap_cnt_match,
  int_en_pwm_cnt_load,
  int_en_pwm_cnt_zero,
  int_en_pwm_compa_down,
  int_en_pwm_compa_up,
  int_en_pwm_compb_down,
  int_en_pwm_compb_up,
  int_en_tim_cnt_match,
  int_pwm_cnt_load,
  int_pwm_cnt_zero,
  int_pwm_compa_down,
  int_pwm_compa_up,
  int_pwm_compb_down,
  int_pwm_compb_up,
  int_tim_cnt_match,
  pclk,
  pwm0_en,
  pwm0_inv,
  pwm1_en,
  pwm1_inv,
  pwm_0_oe,
  pwm_0_out,
  pwm_1_oe,
  pwm_1_out,
  pwm_cnt,
  pwm_load_value,
  pwm_mode,
  pwm_tim_etb_trig,
  rstn,
  sync_mode,
  tim_en,
  tim_load_value,
  trend,
  trenu,
  trig_val,
  trigger
);
input           cap_en;                    
input   [31:0]  cap_load_value;            
input           cap_mode;                  
input   [1 :0]  cap_select;                
input           clk;                       
input   [31:0]  compa_val;                 
input   [31:0]  compb_val;                 
input   [11:0]  deadband_delay_cnt;        
input           deadband_en;               
input           i_capture;                 
input           int_clr_cap_cnt_add;       
input           int_clr_cap_cnt_match;     
input           int_clr_pwm_cnt_load;      
input           int_clr_pwm_cnt_zero;      
input           int_clr_pwm_compa_down;    
input           int_clr_pwm_compa_up;      
input           int_clr_pwm_compb_down;    
input           int_clr_pwm_compb_up;      
input           int_clr_tim_cnt_match;     
input           int_en_cap_cnt_add;        
input           int_en_cap_cnt_match;      
input           int_en_pwm_cnt_load;       
input           int_en_pwm_cnt_zero;       
input           int_en_pwm_compa_down;     
input           int_en_pwm_compa_up;       
input           int_en_pwm_compb_down;     
input           int_en_pwm_compb_up;       
input           int_en_tim_cnt_match;      
input           pclk;                      
input           pwm0_en;                   
input           pwm0_inv;                  
input           pwm1_en;                   
input           pwm1_inv;                  
input   [31:0]  pwm_load_value;            
input           pwm_mode;                  
input           rstn;                      
input   [1 :0]  sync_mode;                 
input           tim_en;                    
input   [31:0]  tim_load_value;            
input           trend;                     
input           trenu;                     
input   [31:0]  trig_val;                  
output  [31:0]  cap_cnt;                   
output          int_cap_cnt_add;           
output          int_cap_cnt_match;         
output          int_pwm_cnt_load;          
output          int_pwm_cnt_zero;          
output          int_pwm_compa_down;        
output          int_pwm_compa_up;          
output          int_pwm_compb_down;        
output          int_pwm_compb_up;          
output          int_tim_cnt_match;         
output          pwm_0_oe;                  
output          pwm_0_out;                 
output          pwm_1_oe;                  
output          pwm_1_out;                 
output  [31:0]  pwm_cnt;                   
output          pwm_tim_etb_trig;          
output          trigger;                   
reg     [31:0]  cap_cnt;                   
reg             cap_cnt_add_flag_d;        
reg             cap_cnt_match_flag_d;      
reg             cap_edge;                  
reg     [31:0]  compa;                     
reg             compa_down_flag_d;         
reg             compa_up_flag_d;           
reg     [31:0]  compb;                     
reg             compb_down_flag_d;         
reg             compb_up_flag_d;           
reg     [11:0]  deadband_cnt_0;            
reg     [11:0]  deadband_cnt_1;            
reg             i_capture_d;               
reg             i_capture_d2;              
reg             i_capture_d3;              
reg             inc_flag;                  
reg             int_cap_cnt_add;           
reg             int_cap_cnt_match;         
reg             int_pwm_cnt_load;          
reg             int_pwm_cnt_zero;          
reg             int_pwm_compa_down;        
reg             int_pwm_compa_up;          
reg             int_pwm_compb_down;        
reg             int_pwm_compb_up;          
reg             int_tim_cnt_match;         
reg     [31:0]  load_cnt;                  
reg             pwm_0_d;                   
reg             pwm_0_db;                  
reg             pwm_1_d;                   
reg             pwm_1_db;                  
reg     [31:0]  pwm_cnt;                   
reg             pwm_cnt_load_d;            
reg             pwm_cnt_zero_d;            
reg             tim_cnt_match_flag_d;      
reg             trigger_down_d;            
reg             trigger_up_d;              
reg     [31:0]  trigval;                   
reg             updatereg;                 
wire            cap_cnt_add_flag;          
wire            cap_cnt_add_flag_divedge;  
wire            cap_cnt_match_flag;        
wire            cap_cnt_match_flag_divedge; 
wire            cap_en;                    
wire    [31:0]  cap_load_value;            
wire            cap_mode;                  
wire    [1 :0]  cap_select;                
wire            clk;                       
wire            compa_down_flag;           
wire            compa_down_flag_divedge;   
wire            compa_up_flag;             
wire            compa_up_flag_divedge;     
wire    [31:0]  compa_val;                 
wire            compb_down_flag;           
wire            compb_down_flag_divedge;   
wire            compb_up_flag;             
wire            compb_up_flag_divedge;     
wire    [31:0]  compb_val;                 
wire    [11:0]  deadband_delay_cnt;        
wire            deadband_en;               
wire            end_flag;                  
wire            flag;                      
wire            i_capture;                 
wire            i_capture_fall_edge;       
wire            i_capture_rise_edge;       
wire            int_clr_cap_cnt_add;       
wire            int_clr_cap_cnt_match;     
wire            int_clr_pwm_cnt_load;      
wire            int_clr_pwm_cnt_zero;      
wire            int_clr_pwm_compa_down;    
wire            int_clr_pwm_compa_up;      
wire            int_clr_pwm_compb_down;    
wire            int_clr_pwm_compb_up;      
wire            int_clr_tim_cnt_match;     
wire            int_en_cap_cnt_add;        
wire            int_en_cap_cnt_match;      
wire            int_en_pwm_cnt_load;       
wire            int_en_pwm_cnt_zero;       
wire            int_en_pwm_compa_down;     
wire            int_en_pwm_compa_up;       
wire            int_en_pwm_compb_down;     
wire            int_en_pwm_compb_up;       
wire            int_en_tim_cnt_match;      
wire            load_flag;                 
wire            pclk;                      
wire            pwm0_en;                   
wire            pwm0_inv;                  
wire            pwm1_en;                   
wire            pwm1_inv;                  
wire            pwm_0;                     
wire            pwm_0_oe;                  
wire            pwm_0_out;                 
wire            pwm_0_out_pre;             
wire            pwm_1;                     
wire            pwm_1_oe;                  
wire            pwm_1_out;                 
wire            pwm_1_out_pre;             
wire            pwm_cnt_load;              
wire            pwm_cnt_load_divedge;      
wire            pwm_cnt_zero;              
wire            pwm_cnt_zero_divedge;      
wire            pwm_en;                    
wire    [31:0]  pwm_load_value;            
wire            pwm_mode;                  
wire            pwm_tim_etb_trig;          
wire            rstn;                      
wire    [1 :0]  sync_mode;                 
wire            tim_cnt_match_flag;        
wire            tim_cnt_match_flag_divedge; 
wire            tim_en;                    
wire    [31:0]  tim_load_value;            
wire            trend;                     
wire            trenu;                     
wire    [31:0]  trig_val;                  
wire            trigger;                   
wire            trigger_down;              
wire            trigger_up;                
wire            zero_flag;                 
assign    pwm_en = pwm1_en | pwm0_en;
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_cnt[31:0] <= 0;
    else if(pwm_en)begin
        if(!pwm_mode)begin
	   if(pwm_cnt[31:0] == load_cnt[31:0])
              pwm_cnt[31:0] <= 0;
           else
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
         end
         else begin
           if(load_cnt[31:0] == 0)
              pwm_cnt[31:0] <= 0;
           else if(inc_flag)
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
           else 
              pwm_cnt[31:0] <= pwm_cnt[31:0] - 1; 
         end
     end
     else if(cap_en)begin
         if(cap_mode)begin
             if(pwm_cnt[31:0] == cap_load_value[31:0] && cap_edge)
                 pwm_cnt[31:0] <= 0;
             else if(cap_edge)
                 pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
         end
         else 
              pwm_cnt[31:0] <= pwm_cnt[31:0] + 1;
     end
     else if(tim_en)begin
          if((pwm_cnt[31:0] == tim_load_value[31:0]))
            pwm_cnt[31:0] <= 0;
          else
            pwm_cnt[31:0] <= pwm_cnt[31:0] + 1; 
     end
     else
         pwm_cnt[31:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        cap_cnt[31:0] <= 0;
    else if(cap_edge)
        cap_cnt[31:0] <= pwm_cnt[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
        i_capture_d  <= 0;
        i_capture_d2 <= 0;
        i_capture_d3 <= 0;
    end
    else begin
        i_capture_d  <= i_capture;
        i_capture_d2 <= i_capture_d;
        i_capture_d3 <= i_capture_d2;
    end
end
assign i_capture_rise_edge = i_capture_d2 & ~i_capture_d3;
assign i_capture_fall_edge = ~i_capture_d2 & i_capture_d3;
always@(*)begin
case(cap_select[1:0])
2'b00: cap_edge = i_capture_rise_edge;
2'b01: cap_edge = i_capture_fall_edge;
2'b11: cap_edge = i_capture_rise_edge | i_capture_fall_edge;
default: cap_edge = 0;
endcase
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        inc_flag <= 1;
    else if(~pwm_en)
        inc_flag <= 1;
    else if(pwm_mode && (pwm_cnt[31:0] == load_cnt[31:0] - 1))
        inc_flag <= 0;
    else if(pwm_mode && ~inc_flag && (pwm_cnt[31:0] == 1))
        inc_flag <= 1;
end
always@(*)begin
case(sync_mode[1:0])
2'b00: updatereg = zero_flag;
2'b01: updatereg = load_flag;
2'b10: updatereg = zero_flag | load_flag;
2'b11: updatereg = end_flag;
default: updatereg = 0;
endcase
end
assign flag = (pwm_en | tim_en)? 1'b1 : (cap_en)? cap_edge : 1'b0;
assign zero_flag = flag && (pwm_cnt[31:0] == 0);
assign load_flag = flag && (pwm_cnt[31:0] == load_cnt[31:0]);
assign end_flag = (pwm_en && pwm_mode)? (~inc_flag && pwm_cnt[31:0] == 32'd1) : load_flag;
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      load_cnt[31:0] <= 32'hffffffff;
    else if(updatereg | ~pwm_en)
      load_cnt[31:0] <= pwm_load_value[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      compa[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      compa[31:0]  <= compa_val[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      compb[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      compb[31:0]  <= compb_val[31:0];
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
      trigval[31:0]  <= 0;
    else if(updatereg | ~pwm_en)
      trigval[31:0]  <= trig_val[31:0];
end
assign pwm_0 = pwm0_en && ((inc_flag && (pwm_cnt[31:0] >= compa[31:0])) | (~inc_flag && (pwm_cnt[31:0] > compa[31:0])));
assign pwm_1 = pwm1_en && ((inc_flag && (pwm_cnt[31:0] >= compb[31:0])) | (~inc_flag && (pwm_cnt[31:0] > compb[31:0])));
always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
       pwm_0_d <= 0;
       pwm_1_d <= 0;
    end
    else begin
       pwm_0_d <= pwm_0;
       pwm_1_d <= pwm_1;
    end
end        
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        deadband_cnt_0[11:0] <= 0;
    else if(~pwm_en)
        deadband_cnt_0[11:0] <= 0;
    else if(pwm_0 && deadband_cnt_0[11:0] == deadband_delay_cnt[11:0])
        deadband_cnt_0[11:0] <= 0;
    else if(pwm_0)
        deadband_cnt_0[11:0] <= deadband_cnt_0[11:0] + 1;
    else 
        deadband_cnt_0[11:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_0_db <= 0;
    else if(~pwm_en)
        pwm_0_db <= 0;
    else if(~pwm_0 & pwm_0_d)
        pwm_0_db <= 0;
    else if(pwm_0 && deadband_cnt_0[11:0] == deadband_delay_cnt[11:0])
        pwm_0_db <= 1;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_en)
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_0 && deadband_cnt_1[11:0] == deadband_delay_cnt[11:0])
        deadband_cnt_1[11:0] <= 0;
    else if(~pwm_0)
        deadband_cnt_1[11:0] <= deadband_cnt_1[11:0] + 1;
    else 
        deadband_cnt_1[11:0] <= 0;
end
always@(posedge clk or negedge rstn)begin
    if(!rstn)
        pwm_1_db <= 1;
    else if(~pwm_en)
        pwm_1_db <= 1;
   else if(pwm_0 & ~pwm_0_d)
        pwm_1_db <= 0;
    else if(~pwm_0 && deadband_cnt_1[11:0] == deadband_delay_cnt[11:0])
        pwm_1_db <= 1;
end
assign pwm_0_out_pre = deadband_en ? pwm_0_db : pwm_0_d;
assign pwm_1_out_pre = deadband_en ? pwm_1_db : pwm_1_d;
assign pwm_0_out = pwm0_inv ? ~pwm_0_out_pre : pwm_0_out_pre;
assign pwm_1_out = pwm1_inv ? ~pwm_1_out_pre : pwm_1_out_pre;
assign pwm_0_oe  = pwm0_en;
assign pwm_1_oe  = pwm1_en;
assign pwm_cnt_zero 	= pwm_en && zero_flag;
assign pwm_cnt_load 	= pwm_en && load_flag;
assign compa_up_flag   	= pwm_en && (pwm_cnt[31:0] == compa[31:0]) && inc_flag;
assign compa_down_flag 	= pwm_en && (pwm_cnt[31:0] == compa[31:0]) && ~inc_flag;
assign compb_up_flag   	= pwm_en && (pwm_cnt[31:0] == compb[31:0]) && inc_flag;
assign compb_down_flag 	= pwm_en && (pwm_cnt[31:0] == compb[31:0]) && ~inc_flag;
assign cap_cnt_match_flag = cap_en && cap_edge && (pwm_cnt[31:0] == cap_load_value[31:0]);
assign cap_cnt_add_flag = cap_en && cap_edge;
assign tim_cnt_match_flag = tim_en && (pwm_cnt[31:0] == tim_load_value[31:0]);
always@(posedge pclk or negedge rstn)begin
    if(!rstn)begin
       pwm_cnt_zero_d       <= 0;
       pwm_cnt_load_d       <= 0;
       compa_up_flag_d      <= 0;
       compa_down_flag_d    <= 0;
       compb_up_flag_d      <= 0;
       compb_down_flag_d    <= 0;
       cap_cnt_match_flag_d <= 0;
       cap_cnt_add_flag_d   <= 0;
       tim_cnt_match_flag_d <= 0;
    end
    else begin
       pwm_cnt_zero_d       <= pwm_cnt_zero       ;
       pwm_cnt_load_d       <= pwm_cnt_load       ;
       compa_up_flag_d      <= compa_up_flag      ;
       compa_down_flag_d    <= compa_down_flag    ;
       compb_up_flag_d      <= compb_up_flag      ;
       compb_down_flag_d    <= compb_down_flag    ;
       cap_cnt_match_flag_d <= cap_cnt_match_flag ;
       cap_cnt_add_flag_d   <= cap_cnt_add_flag   ;
       tim_cnt_match_flag_d <= tim_cnt_match_flag ;
     end
end
assign pwm_cnt_zero_divedge       = ~pwm_cnt_zero       & pwm_cnt_zero_d;
assign pwm_cnt_load_divedge       = ~pwm_cnt_load       & pwm_cnt_load_d;
assign compa_up_flag_divedge      = ~compa_up_flag      & compa_up_flag_d;
assign compa_down_flag_divedge    = ~compa_down_flag    & compa_down_flag_d;
assign compb_up_flag_divedge      = ~compb_up_flag      & compb_up_flag_d;
assign compb_down_flag_divedge    = ~compb_down_flag    & compb_down_flag_d;
assign cap_cnt_match_flag_divedge = cap_cnt_match_flag & ~cap_cnt_match_flag_d;
assign cap_cnt_add_flag_divedge   = ~cap_cnt_add_flag   & cap_cnt_add_flag_d;
assign tim_cnt_match_flag_divedge = ~tim_cnt_match_flag & tim_cnt_match_flag_d;
assign pwm_tim_etb_trig = tim_cnt_match_flag_divedge;
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_cnt_zero  <= 0;
    else if(int_clr_pwm_cnt_zero)
	int_pwm_cnt_zero  <= 0;
    else if(pwm_cnt_zero_divedge && int_en_pwm_cnt_zero)
	int_pwm_cnt_zero  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_cnt_load  <= 0;
    else if(int_clr_pwm_cnt_load)
	int_pwm_cnt_load  <= 0;
    else if(pwm_cnt_load_divedge && int_en_pwm_cnt_load)
	int_pwm_cnt_load  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compa_up  <= 0;
    else if(int_clr_pwm_compa_up)
	int_pwm_compa_up  <= 0;
    else if(compa_up_flag_divedge && int_en_pwm_compa_up)
	int_pwm_compa_up  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compa_down  <= 0;
    else if(int_clr_pwm_compa_down)
	int_pwm_compa_down  <= 0;
    else if(compa_down_flag_divedge && int_en_pwm_compa_down)
	int_pwm_compa_down  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compb_up  <= 0;
    else if(int_clr_pwm_compb_up)
	int_pwm_compb_up  <= 0;
    else if(compb_up_flag_divedge && int_en_pwm_compb_up)
	int_pwm_compb_up  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_pwm_compb_down  <= 0;
    else if(int_clr_pwm_compb_down)
	int_pwm_compb_down  <= 0;
    else if(compb_down_flag_divedge && int_en_pwm_compb_down)
	int_pwm_compb_down  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_cap_cnt_match  <= 0;
    else if(int_clr_cap_cnt_match)
	int_cap_cnt_match  <= 0;
    else if(cap_cnt_match_flag_divedge && int_en_cap_cnt_match)
	int_cap_cnt_match  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_cap_cnt_add  <= 0;
    else if(int_clr_cap_cnt_add)
	int_cap_cnt_add  <= 0;
    else if(cap_cnt_add_flag_divedge && int_en_cap_cnt_add)
	int_cap_cnt_add  <= 1;
end
always@(posedge pclk or negedge rstn)begin
    if(!rstn)
	int_tim_cnt_match  <= 0;
    else if(int_clr_tim_cnt_match)
	int_tim_cnt_match  <= 0;
    else if(tim_cnt_match_flag_divedge && int_en_tim_cnt_match)
	int_tim_cnt_match  <= 1;
end
assign trigger_up = inc_flag && (pwm_cnt[31:0] == trigval[31:0]) && flag;
assign trigger_down = ~inc_flag && (pwm_cnt[31:0] == trigval[31:0]) && flag;
always@(posedge pclk or negedge rstn)begin
    if(!rstn)begin
        trigger_up_d   <= 0;
        trigger_down_d <= 0;
    end
    else begin
	trigger_up_d   <= trigger_up;
        trigger_down_d <= trigger_down;
    end
end
assign trigger = (~trigger_up & trigger_up_d & trenu) | (~trigger_down & trigger_down_d && trend);
endmodule
module pwm_sec_top(
  etb_pwm_trig_tim0_off,
  etb_pwm_trig_tim0_on,
  etb_pwm_trig_tim1_off,
  etb_pwm_trig_tim1_on,
  etb_pwm_trig_tim2_off,
  etb_pwm_trig_tim2_on,
  etb_pwm_trig_tim3_off,
  etb_pwm_trig_tim3_on,
  etb_pwm_trig_tim4_off,
  etb_pwm_trig_tim4_on,
  etb_pwm_trig_tim5_off,
  etb_pwm_trig_tim5_on,
  fault,
  i_capedge0,
  i_capedge10,
  i_capedge2,
  i_capedge4,
  i_capedge6,
  i_capedge8,
  o_pwm0,
  o_pwm1,
  o_pwm10,
  o_pwm11,
  o_pwm2,
  o_pwm3,
  o_pwm4,
  o_pwm5,
  o_pwm6,
  o_pwm7,
  o_pwm8,
  o_pwm9,
  paddr,
  pclk,
  penable,
  pprot,
  prdata,
  presetn,
  psel,
  pwdata,
  pwm0oe_n,
  pwm10oe_n,
  pwm11oe_n,
  pwm1oe_n,
  pwm2oe_n,
  pwm3oe_n,
  pwm4oe_n,
  pwm5oe_n,
  pwm6oe_n,
  pwm7oe_n,
  pwm8oe_n,
  pwm9oe_n,
  pwm_idle,
  pwm_tim0_etb_trig,
  pwm_tim1_etb_trig,
  pwm_tim2_etb_trig,
  pwm_tim3_etb_trig,
  pwm_tim4_etb_trig,
  pwm_tim5_etb_trig,
  pwm_xx_trig,
  pwmint,
  pwrite,
  test_mode,
  tipc_pwm_trust
);
input           etb_pwm_trig_tim0_off; 
input           etb_pwm_trig_tim0_on; 
input           etb_pwm_trig_tim1_off; 
input           etb_pwm_trig_tim1_on; 
input           etb_pwm_trig_tim2_off; 
input           etb_pwm_trig_tim2_on; 
input           etb_pwm_trig_tim3_off; 
input           etb_pwm_trig_tim3_on; 
input           etb_pwm_trig_tim4_off; 
input           etb_pwm_trig_tim4_on; 
input           etb_pwm_trig_tim5_off; 
input           etb_pwm_trig_tim5_on; 
input           fault;                
input           i_capedge0;           
input           i_capedge10;          
input           i_capedge2;           
input           i_capedge4;           
input           i_capedge6;           
input           i_capedge8;           
input   [31:0]  paddr;                
input           pclk;                 
input           penable;              
input   [2 :0]  pprot;                
input           presetn;              
input           psel;                 
input   [31:0]  pwdata;               
input           pwrite;               
input           test_mode;            
input           tipc_pwm_trust;       
output          o_pwm0;               
output          o_pwm1;               
output          o_pwm10;              
output          o_pwm11;              
output          o_pwm2;               
output          o_pwm3;               
output          o_pwm4;               
output          o_pwm5;               
output          o_pwm6;               
output          o_pwm7;               
output          o_pwm8;               
output          o_pwm9;               
output  [31:0]  prdata;               
output          pwm0oe_n;             
output          pwm10oe_n;            
output          pwm11oe_n;            
output          pwm1oe_n;             
output          pwm2oe_n;             
output          pwm3oe_n;             
output          pwm4oe_n;             
output          pwm5oe_n;             
output          pwm6oe_n;             
output          pwm7oe_n;             
output          pwm8oe_n;             
output          pwm9oe_n;             
output          pwm_idle;             
output          pwm_tim0_etb_trig;    
output          pwm_tim1_etb_trig;    
output          pwm_tim2_etb_trig;    
output          pwm_tim3_etb_trig;    
output          pwm_tim4_etb_trig;    
output          pwm_tim5_etb_trig;    
output          pwm_xx_trig;          
output          pwmint;               
wire            etb_pwm_trig_tim0_off; 
wire            etb_pwm_trig_tim0_on; 
wire            etb_pwm_trig_tim1_off; 
wire            etb_pwm_trig_tim1_on; 
wire            etb_pwm_trig_tim2_off; 
wire            etb_pwm_trig_tim2_on; 
wire            etb_pwm_trig_tim3_off; 
wire            etb_pwm_trig_tim3_on; 
wire            etb_pwm_trig_tim4_off; 
wire            etb_pwm_trig_tim4_on; 
wire            etb_pwm_trig_tim5_off; 
wire            etb_pwm_trig_tim5_on; 
wire            fault;                
wire            i_capedge0;           
wire            i_capedge10;          
wire            i_capedge2;           
wire            i_capedge4;           
wire            i_capedge6;           
wire            i_capedge8;           
wire    [31:0]  i_prdata;             
wire            i_psel;               
wire            i_pwrite;             
wire            o_pwm0;               
wire            o_pwm1;               
wire            o_pwm10;              
wire            o_pwm11;              
wire            o_pwm2;               
wire            o_pwm3;               
wire            o_pwm4;               
wire            o_pwm5;               
wire            o_pwm6;               
wire            o_pwm7;               
wire            o_pwm8;               
wire            o_pwm9;               
wire    [31:0]  paddr;                
wire            pclk;                 
wire            penable;              
wire    [2 :0]  pprot;                
wire    [31:0]  prdata;               
wire            presetn;              
wire            psel;                 
wire    [31:0]  pwdata;               
wire            pwm0oe_n;             
wire            pwm10oe_n;            
wire            pwm11oe_n;            
wire            pwm1oe_n;             
wire            pwm2oe_n;             
wire            pwm3oe_n;             
wire            pwm4oe_n;             
wire            pwm5oe_n;             
wire            pwm6oe_n;             
wire            pwm7oe_n;             
wire            pwm8oe_n;             
wire            pwm9oe_n;             
wire            pwm_idle;             
wire            pwm_tim0_etb_trig;    
wire            pwm_tim1_etb_trig;    
wire            pwm_tim2_etb_trig;    
wire            pwm_tim3_etb_trig;    
wire            pwm_tim4_etb_trig;    
wire            pwm_tim5_etb_trig;    
wire            pwm_xx_trig;          
wire            pwmint;               
wire            pwrite;               
wire            test_mode;            
wire            tipc_pwm_trust;       
pwm  x_pwm (
  .etb_pwm_trig_tim0_off (etb_pwm_trig_tim0_off),
  .etb_pwm_trig_tim0_on  (etb_pwm_trig_tim0_on ),
  .etb_pwm_trig_tim1_off (etb_pwm_trig_tim1_off),
  .etb_pwm_trig_tim1_on  (etb_pwm_trig_tim1_on ),
  .etb_pwm_trig_tim2_off (etb_pwm_trig_tim2_off),
  .etb_pwm_trig_tim2_on  (etb_pwm_trig_tim2_on ),
  .etb_pwm_trig_tim3_off (etb_pwm_trig_tim3_off),
  .etb_pwm_trig_tim3_on  (etb_pwm_trig_tim3_on ),
  .etb_pwm_trig_tim4_off (etb_pwm_trig_tim4_off),
  .etb_pwm_trig_tim4_on  (etb_pwm_trig_tim4_on ),
  .etb_pwm_trig_tim5_off (etb_pwm_trig_tim5_off),
  .etb_pwm_trig_tim5_on  (etb_pwm_trig_tim5_on ),
  .fault                 (fault                ),
  .i_capedge0            (i_capedge0           ),
  .i_capedge10           (i_capedge10          ),
  .i_capedge2            (i_capedge2           ),
  .i_capedge4            (i_capedge4           ),
  .i_capedge6            (i_capedge6           ),
  .i_capedge8            (i_capedge8           ),
  .o_pwm0                (o_pwm0               ),
  .o_pwm1                (o_pwm1               ),
  .o_pwm10               (o_pwm10              ),
  .o_pwm11               (o_pwm11              ),
  .o_pwm2                (o_pwm2               ),
  .o_pwm3                (o_pwm3               ),
  .o_pwm4                (o_pwm4               ),
  .o_pwm5                (o_pwm5               ),
  .o_pwm6                (o_pwm6               ),
  .o_pwm7                (o_pwm7               ),
  .o_pwm8                (o_pwm8               ),
  .o_pwm9                (o_pwm9               ),
  .paddr                 (paddr                ),
  .pclk                  (pclk                 ),
  .penable               (penable              ),
  .prdata                (i_prdata             ),
  .presetn               (presetn              ),
  .psel                  (i_psel               ),
  .pwdata                (pwdata               ),
  .pwm0oe_n              (pwm0oe_n             ),
  .pwm10oe_n             (pwm10oe_n            ),
  .pwm11oe_n             (pwm11oe_n            ),
  .pwm1oe_n              (pwm1oe_n             ),
  .pwm2oe_n              (pwm2oe_n             ),
  .pwm3oe_n              (pwm3oe_n             ),
  .pwm4oe_n              (pwm4oe_n             ),
  .pwm5oe_n              (pwm5oe_n             ),
  .pwm6oe_n              (pwm6oe_n             ),
  .pwm7oe_n              (pwm7oe_n             ),
  .pwm8oe_n              (pwm8oe_n             ),
  .pwm9oe_n              (pwm9oe_n             ),
  .pwm_idle              (pwm_idle             ),
  .pwm_tim0_etb_trig     (pwm_tim0_etb_trig    ),
  .pwm_tim1_etb_trig     (pwm_tim1_etb_trig    ),
  .pwm_tim2_etb_trig     (pwm_tim2_etb_trig    ),
  .pwm_tim3_etb_trig     (pwm_tim3_etb_trig    ),
  .pwm_tim4_etb_trig     (pwm_tim4_etb_trig    ),
  .pwm_tim5_etb_trig     (pwm_tim5_etb_trig    ),
  .pwm_xx_trig           (pwm_xx_trig          ),
  .pwmint                (pwmint               ),
  .pwrite                (i_pwrite             ),
  .test_mode             (test_mode            )
);
assign prdata[31:0] = i_prdata[31:0];
assign i_pwrite =  pwrite ;
assign i_psel =  psel ;
endmodule
