/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
.text
.ifdef e902
	.global	__start

__start:
  li  x1, 0
  li  x2, 0
  li  x3, 0
  li  x4, 0
  li  x5, 0
  li  x6, 0
  li  x7, 0
  li  x8, 0
  li  x9, 0
  li  x10,0
  li  x11,0
  li  x12,0
  li  x13,0
  li  x14,0
  li  x15,0

  la  x2, __kernel_stack
  la  x3,__kernel_stack
  addi x3,x3,-64
  addi x4,x0,16
	INIT_KERLE_STACK:
  addi x3,x3,4
  sw   x0, 0(x3)
  addi x4,x4,-1
  beqz x4,INIT_KERLE_STACK

  la  x3,__trap_handler
  csrw mtvec, x3  

__to_main:
	jal	main

  .global __fail
__fail:
__fail:
  li    x4, 0x20007c50
  li    x3, 0x1001
	sw	  x3, 0(x4)
   jal  __fail

	.global __exit
__exit:
   li    x4, 0x20007c50
   li    x3, 0x2002
	sw	  x3, 0(x4)
   jal  __exit


  .align 6  
#  .export __trap_handler
__trap_handler:
  j __synchronous_exception
  .align 2  
  j __asychronous_int
  .align 2  
  nop #reserved
  .align 2  
  j __asychronous_int
  .align 2  
  j __asychronous_int
  .align 2  
  j __asychronous_int
  .align 2  
  nop #reserved
  .align 2  
  j __asychronous_int
  .align 2  
  j __asychronous_int
  .align 2  
  j __asychronous_int
  .align 2  
  nop #reserved  
  .align 2  
  j __asychronous_int
  j __fail
 
__synchronous_exception:
  #push 
  csrw mscratch,x14
  sw   x15,-4(sp)
  sw   x13,-8(sp)
  csrr x14,mcause
  andi x15,x14,0xf #cause
  srli x14,x14,0x4
  andi x13,x14,0xff #vector
  beqz x13,__expt_next
  addi x13,x13,-32
__expt_next: 
  srli x14,x14,0x17    #int
  add  x14,x14,x15 
  add  x14,x14,x13 #{int,cause}+vector

  slli x14,x14,0x2 #offset
  la   x15,vector_table
  add  x15,x14,x15   #target pc
  lw   x14, 0(x15)  #get exception addr
  lw   x15, -4(sp) #recover x15
  lw   x13, -8(sp) #recover x16
  jr   x14  #x14 should not be used 

__asychronous_int:
  csrw mscratch,x14
  sw   x15,-4(sp)
  sw   x13,-8(sp)
  csrr x14,mcause
  andi x15,x14,0xf  #cause
  srli x14,x14,0x4
  andi x13,x14,0xff #vector
  beqz x13,__int_next
  addi x13,x13,-32
__int_next: 
  srli x14,x14,0x17     #int
  add  x14,x14,x15 
  add  x14,x14,x13 #{int,cause}+vector

  slli x14,x14,0x2 #offset
  la   x15,vector_table
  add  x15,x14,x15   #target pc
  lw   x14, 0(x15)  #get exception addr
  lw   x15, -4(sp) #recover x15
  lw   x13, -8(sp) #recover x16
  jr   x14  #x14 should not be used 


  .global vector_table
  .align  10
vector_table:	#totally 256 entries
	.rept   128
	.long   __dummy
	.endr

  .global __dummy
__dummy:  
  
  .data
  .long 0
.endif
