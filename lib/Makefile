#Copyright (c) 2019 Alibaba Group Holding Limited
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# the compiler toolset setting

TOOL_EXTENSION	= ${TOOL_PATH}/bin/riscv64-unknown-elf-
CC    = ${TOOL_EXTENSION}gcc
AS    = ${TOOL_EXTENSION}as
LINK  = ${TOOL_EXTENSION}ld
OBJDUMP = ${TOOL_EXTENSION}objdump
OBJCOPY = ${TOOL_EXTENSION}objcopy
#CONVERT		=../tools/Srec2vmem
CONVERT		=../tools/Srec2vmem.py

SSRC = $(wildcard *.S)
sSRC = $(wildcard *.s)
CSRC = $(wildcard *.c)

OBJECTS = $(SSRC:%.S=%.o) $(sSRC:%.s=%.o) $(CSRC:%.c=%.o)


DEFSYM = $(shell echo ${CPU} | sed 's/\(e9[0-9]\{2\}\).*/\1/')
CPU_M = $(shell echo ${CPU} | sed '/m/p')

ifeq ($(findstring e902m, ${CPU_M}), e902m)
	CFLAGS = -march=rv32emc -mabi=ilp32e
	LDFLAGS = -march=rv32emc -mabi=ilp32e
else
	CFLAGS = -march=rv32ec -mabi=ilp32e
	LDFLAGS = -march=rv32ec -mabi=ilp32e
endif

CFLAGS +=-D${DEFSYM} -Wa,--defsym=${DEFSYM}=1
ifeq ($(findstring yes, ${SIZE}), yes)
  CFLAGS += -Os
else
  CFLAGS += -O3 -funroll-all-loops -fgcse-sm -finline-limit=500 -fno-schedule-insns -ffunction-sections -fdata-sections
endif

LINKFLAGS =  -Tlinker.lcf -nostartfiles


LINKLIBS += $(LDFLAGS) -lc -lgcc

OBJDUMPFLAGS = -S -Mnumeric

HEXFLAGS	= -O srec

%.o : %.c
	${CC} -c ${CFLAGS} -o $@ $<

%.o : %.s
	${CC} -c ${CFLAGS} -o $@ $<

%.o : %.S
	${CC} -c ${CFLAGS} -o $@ $<

${FILE}.elf : ${OBJECTS} linker.lcf
	${CC} ${LINKFLAGS} ${LINKLIBS} ${OBJECTS} -o $@ -lm 

${FILE}.obj : ${FILE}.elf
	${OBJDUMP} ${OBJDUMPFLAGS} $< > $@


${FILE}.hex : ${FILE}.elf
	${OBJCOPY} ${HEXFLAGS} $< $@ 


%.pat	: %.hex
	rm -f *.pat
	#${CONVERT} $< test.pat
	${CONVERT} -i $< -o test.pat


#--------------------------------------------------------------------
# target setting
.PHONY :all
all : ${FILE}.pat ${FILE}.hex ${FILE}.elf ${FILE}.obj

#---------------------------------------------------------------------
# clean some medium code and .pat
.PHONY :clean 
clean:
	rm -rf *.o *.pat *.elf *.obj *.hex

