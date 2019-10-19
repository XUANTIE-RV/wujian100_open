/*
Copyright (c) 2019 Alibaba Group Holding Limited

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
#include "stdio.h"
#include "vtimer.h"
#include "datatype.h"

#define USI0_BADDR  0x50028000
#define USI1_BADDR  0x60028000
#define REG32(addr) *((volatile unsigned int *)(addr))

#define USI_CTRL    0x00
#define MODE_SEL    0x04
#define TX_FIFO     0x08
#define RX_FIFO     0x08
#define FIFO_STA    0x0c
#define CLK_DIV0    0x10
#define UART_CTRL   0x18
#define UART_STA    0x1c

int main(void)
{
    int reg;
    int tx_empty;
    int rx_empty;
    int uart_busy;
    int cnt=0;

    //*******************************
    //          USI0 UART
    //*******************************
    //sellect uart
    REG32(USI0_BADDR+MODE_SEL) = 0x0;

    //baud rate : 9600
    //CLK_DIV0 = (20M/(16*9600))-1 = 129
    REG32(USI0_BADDR+CLK_DIV0) = 0x81;

    //data_bits=8
    //stop_bits=1
    //parity disable
    REG32(USI0_BADDR+UART_CTRL) = 0x3;

    //enable uart
    //enable tx fifo
    REG32(USI0_BADDR+USI_CTRL) = 0x7;

    //*******************************
    //          USI1 UART
    //*******************************
    //sellect uart
    REG32(USI1_BADDR+MODE_SEL) = 0x0;

    //baud rate : 9600
    //CLK_DIV0 = (20M/(16*9600))-1 = 129
    REG32(USI1_BADDR+CLK_DIV0) = 0x81;

    //data_bits=8
    //stop_bits=1
    //parity disable
    REG32(USI1_BADDR+UART_CTRL) = 0x3;

    //enable uart
    //enable rx fifo
    REG32(USI1_BADDR+USI_CTRL) = 0xb;

    //*******************************
    //      USI0 UART send data
    //*******************************
    //send data
    printf("===========================\n");
    printf("usi0 uart transmit start\n");
    printf("send_data[0] : 0x60\n");
    printf("send_data[1] : 0x61\n");
    printf("send_data[2] : 0x62\n");
    printf("send_data[3] : 0x63\n");
    REG32(USI0_BADDR+TX_FIFO) = 0x60;
    REG32(USI0_BADDR+TX_FIFO) = 0x61;
    REG32(USI0_BADDR+TX_FIFO) = 0x62;
    REG32(USI0_BADDR+TX_FIFO) = 0x63;

    //wait untill 
    //  tx_fifo empty and
    //  transmit is not busy
    do{
        reg = REG32(USI0_BADDR+FIFO_STA);
        tx_empty = reg & 0x1;

        reg = REG32(USI0_BADDR+UART_STA);
        uart_busy = reg & 0x1;
    } while(tx_empty==0 || uart_busy==1);
        
    printf("usi0 uart transmit complete\n");
    printf("===========================\n");

    //*******************************
    //     USI1 UART receive data
    //*******************************
    printf("===========================\n");
    printf("usi1 uart receive start\n");

    do{
        reg = REG32(USI1_BADDR+FIFO_STA);
        rx_empty = reg & 0x4;

        if(rx_empty==0){
            reg = REG32(USI1_BADDR+RX_FIFO);
            printf("receive_data[%i] : 0x%x\n",cnt,reg);
            cnt++;
        }
    } while(cnt<4);

    printf("usi1 uart receive complete\n");
    printf("==========================\n");

 sim_end();
}
