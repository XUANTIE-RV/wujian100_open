/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#ifndef _MINILIBC_STDIO_H_
#define _MINILIBC_STDIO_H__

#include <stdarg.h>

#define BUFSIZE 2048

struct __stdio_file {
	int fd;
	int flags;
	unsigned int bs;	/* read: bytes in buffer */
	unsigned int bm;	/* position in buffer */
//	unsigned int buflen;	/* length of buf */
//	char *buf;
	struct __stdio_file *next;	/* for fflush */
	unsigned char ungetbuf;
	char ungotten;
	unsigned int lock;
};

#define ERRORINDICATOR 1
#define EOFINDICATOR 2
#define BUFINPUT 4
#define BUFLINEWISE 8
#define NOBUF 16
#define STATICBUF 32
#define FDPIPE 64
#define CANREAD 128
#define CANWRITE 256

#include <stdio.h>

/* ..scanf */
struct arg_scanf {
	void *data;
	int (*getch)(void*);
	int (*putch)(int,void*);
};

int __v_scanf(struct arg_scanf* fn, const char *format, va_list arg_ptr);

struct arg_printf {
	void *data;
	int (*put)(void*,size_t,void*);
};

int __v_printf(struct arg_printf* fn, const char *format, va_list arg_ptr);
int __isinf(double d);
int __isnan(double d);
int __dtostr(double d,char *buf,unsigned int maxlen,unsigned int prec,unsigned int prec2);
int __lltostr(char *s, int size, unsigned long long i, int base, char UpCase);
int __ltostr(char *s, unsigned int size, unsigned long i, unsigned int base, int UpCase);


#endif /*  _MINILIBC_STDIO_H_ */
