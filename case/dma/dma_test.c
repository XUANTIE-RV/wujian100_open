/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#include "stdio.h"
#include "vtimer.h"
#include "datatype.h"

int main (void)
{
int int_dma_flag=0;
int data_check=0;

//initial mem 
  *(volatile uint32_t *) 0x00005000 = 0x11111111;
  *(volatile uint32_t *) 0x00005004 = 0x22222222;
  *(volatile uint32_t *) 0x00005008 = 0x33333333;
  *(volatile uint32_t *) 0x0000500c = 0x44444444;
  *(volatile uint32_t *) 0x00005010 = 0x55555555;
  *(volatile uint32_t *) 0x00005014 = 0x66666666;
  *(volatile uint32_t *) 0x00005018 = 0x77777777;
  *(volatile uint32_t *) 0x0000501c = 0x88888888;

  *(volatile uint32_t *) 0x20025000 = 0x0;
  *(volatile uint32_t *) 0x20025004 = 0x0;
  *(volatile uint32_t *) 0x20025008 = 0x0;
  *(volatile uint32_t *) 0x2002500c = 0x0;
  *(volatile uint32_t *) 0x20025010 = 0x0;
  *(volatile uint32_t *) 0x20025014 = 0x0;
  *(volatile uint32_t *) 0x20025018 = 0x0;
  *(volatile uint32_t *) 0x2002501c = 0x0;


//set DMA ch0 Source addr ISRAM 0x8005000
    *(volatile uint32_t *) 0x40000000  = 0x00005000;
//set DMA ch0 dest addr DSRAM  0x20025000
    *(volatile uint32_t *) 0x40000004  = 0x20025000;
//set DMA ch0 src incr, dest incr, block size:36 byte
    *(volatile uint32_t *) 0x40000008  = 0x2300A;
//set DMA ch0 intr disable , block trigger , src little, dest little
    *(volatile uint32_t *) 0x4000000c  = 0x4;
// set DMA ch0 enable
    *(volatile uint32_t *) 0x40000020  = 0x1;

// set DMA global enable
    *(volatile uint32_t *) 0x4000033c  = 0x1;


// set DMA ch0 softer trigger
    *(volatile uint32_t *) 0x4000001c  = 0x1;
  
 

    int_dma_flag= *(volatile uint32_t *) 0x40000014;
//wait timer interrupt state 
    while (  int_dma_flag != 0xe){
	    int_dma_flag= *(volatile uint32_t *) 0x40000014;
	}




//clear timer interrut state
   data_check = *(volatile uint32_t *) 0x20025000;
   if(data_check != 0x11111111)
  {
  	sim_fail();
  }


   data_check = *(volatile uint32_t *) 0x20025004;
   if(data_check != 0x22222222)
  {
  	sim_fail();
  }

   data_check = *(volatile uint32_t *) 0x20025008;
   if(data_check != 0x33333333)
  {
  	sim_fail();
  }



   data_check = *(volatile uint32_t *) 0x2002500c;
   if(data_check != 0x44444444)
  {
  	sim_fail();
  }


   data_check = *(volatile uint32_t *) 0x20025010;
   if(data_check != 0x55555555)
  {
  	sim_fail();
  }


   data_check = *(volatile uint32_t *) 0x20025014;
   if(data_check != 0x66666666)
  {
  	sim_fail();
  }

   data_check = *(volatile uint32_t *) 0x20025018;
   if(data_check != 0x77777777)
  {
  	sim_fail();
  }


   data_check = *(volatile uint32_t *) 0x2002501c;
   if(data_check != 0x88888888)
  {
  	sim_fail();
  }


    printf("dma test successfully\n");
 sim_end();
}



