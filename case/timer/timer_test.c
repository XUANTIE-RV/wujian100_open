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
int int_tim_flag=0;
int int_tim_eoi=0;
  printf("\nHello Friend!\n");
//disable Timer1

    *(volatile uint32_t *) 0x50000008  = 0x2;
//Timer1 counter
    *(volatile uint32_t *) 0x50000000  = 0x400;
//enable Timer1
    *(volatile uint32_t *) 0x50000008  = 0x3;
    int_tim_flag= *(volatile uint32_t *) 0x50000010;
//wait timer interrupt state 
    while (  int_tim_flag != 0x1){
	    int_tim_flag= *(volatile uint32_t *) 0x50000010;
	}

//clear timer interrut state
   int_tim_eoi = *(volatile uint32_t *) 0x5000000c;

  printf("\ntimer test successfully\n");
sim_end();
} 



