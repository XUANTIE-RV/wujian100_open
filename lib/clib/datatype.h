/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#ifndef __DATATYPE_H__
#define __DATATYPE_H__

typedef	unsigned char           uint8_t;
typedef unsigned short          uint16_t;
//typedef __uint32_t              uint32_t;
//typedef __uint64_t              uint64_t;
typedef unsigned int            uintptr_t;
typedef	signed char             int8_t;
typedef signed short            int16_t;
//typedef __int32_t               int32_t;
//typedef __int64_t               int64_t;
typedef unsigned int            size_t;
typedef volatile unsigned char  reg8_t;
typedef volatile unsigned short reg16_t;
typedef volatile unsigned int   reg32_t;

#ifndef SUCCESS
#define SUCCESS  0
#endif

#endif

