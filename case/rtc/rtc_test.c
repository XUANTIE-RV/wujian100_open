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
int int_rtc_flag=0;
int int_rtc_eoi=0;
  printf("\nHello Friend!\n");
      //set the rtc counter match register
    *(volatile uint32_t *) 0x60004004  = 0x200;
      //set the rtc counter load register
    *(volatile uint32_t *) 0x60004008  = 0x1e0;
      //set the rtc control register
    *(volatile uint32_t *) 0x6000400c  = 0xd;
    int_rtc_flag= *(volatile uint32_t *) 0x60004014;
//wait rtc interrupt state 
    while (  int_rtc_flag != 0x1){
	    int_rtc_flag= *(volatile uint32_t *) 0x60004014;
	}

//clear rtc interrut state
   int_rtc_eoi = *(volatile uint32_t *) 0x60004018;
    while (  int_rtc_flag != 0x0){
	    int_rtc_flag= *(volatile uint32_t *) 0x60004014;
	}


  printf("\nrtc test successfully\n");
sim_end();
} 



