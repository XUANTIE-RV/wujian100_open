/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/


#ifndef __DEMO_CONFIG_H
#define __DEMO_CONFIG_H

/******************************
 * Data type.
 *****************************/
#ifndef U32
#define U32 unsigned int
#define U8 unsigned char
#endif

/************************************
 *  UART Terminal 
 * (8 data bitbs, ODD, 1 stop bits)
 ***********************************/

#define BAUDRATE			19200

/*******************************
 * Config System
 *******************************/
/*
 *  Run on SPARK ?
 *  0 -- run on board, 1 -- run on spark.
 */
#define CONFIG_SYS_SPARK	1

/* CPU frequence definition */
#define SYS_FREQ			100000000   /* MHz */
/* APB frequence definition */
#define APB_FREQ			100000000   /* MHz */ 

#define CLOCKS_PER_SEC    APB_FREQ


#endif /* __DEMO_CONFIG_H */
