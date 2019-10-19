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



int gpio_data_in = 0x0;
  printf("\nHello Friend!\n");
//GPIO SW CTL
    *(volatile uint32_t *) 0x60018008  = 0x0;
//GPIO input mode
    *(volatile uint32_t *) 0x60018004  = 0x0;

      while (  gpio_data_in != 0x55555555){
	   gpio_data_in = *(volatile uint32_t *) 0x60018050;
	}
    printf("gpio input data 0x55555555 \n");

//GPIO output mode
    *(volatile uint32_t *) 0x60018004  = 0xffffffff;
//GPIO output data 
    *(volatile uint32_t *) 0x60018000  = 0x5a5a5a5a;


//GPIO input mode
    *(volatile uint32_t *) 0x60018004  = 0x0;
      while (  gpio_data_in != 0xaaaaaaaa){
	   gpio_data_in = (*(volatile uint32_t *) 0x60018050);
	}

   printf("gpio input data 0xaaaaaaaa \n");


//GPIO output mode
    *(volatile uint32_t *) 0x60018004  = 0xffffffff;
//GPIO output data 
    *(volatile uint32_t *) 0x60018000  = 0xa5a5a5a5;

//GPIO input mode
    *(volatile uint32_t *) 0x60018004  = 0x0;
      while (  gpio_data_in != 0x12345678){
	   gpio_data_in = (*(volatile uint32_t *) 0x60018050);
	}

    printf("gpio io test pass! \n");
sim_end();
}
