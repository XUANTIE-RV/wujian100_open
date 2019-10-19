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
int flag_data =0;
int read_data =0;

//isram
   flag_data = 0x01010101;
    *(volatile uint32_t *)  0x0000a000 = flag_data;
   read_data = *(volatile uint32_t *) 0x0000a000;

	if(read_data != flag_data){
	sim_fail();
	}
//dsram0
   flag_data = 0x02020202;
    *(volatile uint32_t *)  0x20000000 = flag_data;
   read_data = *(volatile uint32_t *) 0x20000000;

	if(read_data != flag_data){
	sim_fail();
	}
//dsram1
   flag_data = 0x03030303;
    *(volatile uint32_t *)  0x20010000 = flag_data;
   read_data = *(volatile uint32_t *) 0x20010000;

	if(read_data != flag_data){
	sim_fail();
	}
//dsram2
   flag_data = 0x04040404;
    *(volatile uint32_t *)  0x20020000 = flag_data;
   read_data = *(volatile uint32_t *) 0x20020000;

	if(read_data != flag_data){
	sim_fail();
	}
//dmac
   flag_data = 0x05050505;
    *(volatile uint32_t *)  0x40000000 = flag_data;
   read_data = *(volatile uint32_t *) 0x40000000;

	if(read_data != flag_data){
	sim_fail();
	}


//tim0
   flag_data = 0x06060606;
    *(volatile uint32_t *) 0x50000000  = flag_data;
   read_data = *(volatile uint32_t *) 0x50000000;

	if(read_data != flag_data){
	sim_fail();
	}

//tim2
   flag_data = 0x07070707;
    *(volatile uint32_t *)  0x50000400 = flag_data;
   read_data = *(volatile uint32_t *) 0x50000400;

	if(read_data != flag_data){
	sim_fail();
	}

//tim4
   flag_data = 0x08080808;
    *(volatile uint32_t *)  0x50000800 = flag_data;
   read_data = *(volatile uint32_t *) 0x50000800;

	if(read_data != flag_data){
	sim_fail();
	}

//tim6
   flag_data = 0x09090909;
    *(volatile uint32_t *) 0x50000c00  = flag_data;
   read_data = *(volatile uint32_t *) 0x50000c00;

	if(read_data != flag_data){
	sim_fail();
	}

//usi0
   flag_data = 0x0a0a0a;
    *(volatile uint32_t *) 0x50028010  = flag_data;
   read_data = *(volatile uint32_t *) 0x50028010;

	if(read_data != flag_data){
	sim_fail();
	}
//usi2
   flag_data = 0x050505;
    *(volatile uint32_t *) 0x50029010  = flag_data;
   read_data = *(volatile uint32_t *) 0x50029010;

	if(read_data != flag_data){
	sim_fail();
	}


//wdt
   flag_data = 0xff;
    *(volatile uint32_t *) 0x50008004  = flag_data;
   read_data = *(volatile uint32_t *) 0x50008004;

	if(read_data != flag_data){
	sim_fail();
	}



//pwm
   flag_data = 0xff00ff;
    *(volatile uint32_t *) 0x5001c004  = flag_data;
   read_data = *(volatile uint32_t *) 0x5001c004;

	if(read_data != flag_data){
	sim_fail();
	}



//tim1
   flag_data = 0x0b0b0b0b;
    *(volatile uint32_t *) 0x60000000  = flag_data;
   read_data = *(volatile uint32_t *) 0x60000000;

	if(read_data != flag_data){
	sim_fail();
	}

//tim3
   flag_data = 0x0c0c0c0c;
    *(volatile uint32_t *) 0x60000400  = flag_data;
   read_data = *(volatile uint32_t *) 0x60000400;

	if(read_data != flag_data){
	sim_fail();
	}

//tim5
   flag_data = 0x0d0d0d0d;
    *(volatile uint32_t *) 0x60000800  = flag_data;
   read_data = *(volatile uint32_t *) 0x60000800;

	if(read_data != flag_data){
	sim_fail();
	}

//tim7
   flag_data = 0x0e0e0e0e;
    *(volatile uint32_t *) 0x60000c00  = flag_data;
   read_data = *(volatile uint32_t *) 0x60000c00;

	if(read_data != flag_data){
	sim_fail();
	}

//rtc
   flag_data = 0x12345678;
    *(volatile uint32_t *) 0x60004004  = flag_data;
   read_data = *(volatile uint32_t *) 0x60004004;

	if(read_data != flag_data){
	sim_fail();
	}


//usi1
   flag_data = 0x0f0f0f;
    *(volatile uint32_t *) 0x60028010  = flag_data;
   read_data = *(volatile uint32_t *) 0x60028010;

	if(read_data != flag_data){
	sim_fail();
	}

//gpio
   flag_data = 0x12345678;
    *(volatile uint32_t *) 0x60018000  = flag_data;
   read_data = *(volatile uint32_t *) 0x60018000;

	if(read_data != flag_data){
	sim_fail();
	}


printf("All IP write/read test Pass!\n");

//MAIN BUS DUMMY
   flag_data = 0x1;
   read_data = *(volatile uint32_t *) 0x10000000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x2;
   read_data = *(volatile uint32_t *) 0x30000000;

	if(read_data != flag_data){
	sim_fail();
	}



   flag_data = 0x3;
   read_data = *(volatile uint32_t *) 0x40010000;

	if(read_data != flag_data){
	sim_fail();
	}



   flag_data = 0x4;
   read_data = *(volatile uint32_t *) 0x40020000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x5;
   read_data = *(volatile uint32_t *) 0x40100000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x6;
   read_data = *(volatile uint32_t *) 0x80000000;

	if(read_data != flag_data){
	sim_fail();
	}

//LS BUS DUMMY
   flag_data = 0x11;
   read_data = *(volatile uint32_t *) 0x40200000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x12;
   read_data = *(volatile uint32_t *) 0x40300000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x13;
   read_data = *(volatile uint32_t *) 0x70000000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x14;
   read_data = *(volatile uint32_t *) 0x78000000;

	if(read_data != flag_data){
	sim_fail();
	}


//APB0 BUS DUMMY
   flag_data = 0x22;
   read_data = *(volatile uint32_t *) 0x50004000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x23;
   read_data = *(volatile uint32_t *) 0x5000c000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x24;
   read_data = *(volatile uint32_t *) 0x50010000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x25;
   read_data = *(volatile uint32_t *) 0x50014000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x26;
   read_data = *(volatile uint32_t *) 0x50018000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x28;
   read_data = *(volatile uint32_t *) 0x50020000;

	if(read_data != flag_data){
	sim_fail();
	}

   flag_data = 0x29;
   read_data = *(volatile uint32_t *) 0x50024000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x2a;
   read_data = *(volatile uint32_t *) 0x50030000;

	if(read_data != flag_data){
	sim_fail();
	}

//APB1 DUMMY
   flag_data = 0x32;
   read_data = *(volatile uint32_t *) 0x60008000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x33;
   read_data = *(volatile uint32_t *) 0x6000c000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x34;
   read_data = *(volatile uint32_t *) 0x60010000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x35;
   read_data = *(volatile uint32_t *) 0x60014000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x36;
   read_data = *(volatile uint32_t *) 0x6001c000;

	if(read_data != flag_data){
	sim_fail();
	}


   flag_data = 0x37;
   read_data = *(volatile uint32_t *) 0x60020000;

	if(read_data != flag_data){
	sim_fail();
	}



   flag_data = 0x38;
   read_data = *(volatile uint32_t *) 0x60024000;

	if(read_data != flag_data){
	sim_fail();
	}



   flag_data = 0x39;
   read_data = *(volatile uint32_t *) 0x6002c000;

	if(read_data != flag_data){
	sim_fail();
	}
  printf("\n Dummy IP read test Pass!\n");
 sim_end();

}
