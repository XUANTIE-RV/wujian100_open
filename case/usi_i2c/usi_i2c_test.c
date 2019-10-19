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
#define CLK_DIV1    0x14
#define I2C_MODE    0x20
#define I2C_ADDR    0x24
#define I2CM_CTRL   0x28
#define I2CS_CTRL   0x30
#define I2C_STA     0x3c

int main(void)
{
    int reg;
    int tx_empty;
    int rx_empty;
    int i2c_busy;
    int cnt=0;

    //*************************************
    //        Configure USI0 I2C
    //*************************************
    //sellect i2c
    REG32(USI0_BADDR+MODE_SEL) = 0x1;

    //F(sclk) : 100Khz
    //(CLK_DIV0+CLK_DIV1) = (20M/100K)-2 = 198
    REG32(USI0_BADDR+CLK_DIV0) = 0x63;
    REG32(USI0_BADDR+CLK_DIV1) = 0x63;

    //master mode
    REG32(USI0_BADDR+I2C_MODE) = 0x1;

    //slave address
    REG32(USI0_BADDR+I2C_ADDR) = 0x3c;

    //7bit-address
    //generate stop if tx fifo empty
    REG32(USI0_BADDR+I2CM_CTRL) = 0x2;

    //enable I2C
    //enable TX FIFO
    REG32(USI0_BADDR+USI_CTRL) = 0x7;
    
    //*************************************
    //        Configure USI1 I2C
    //*************************************
    //sellect i2c
    REG32(USI1_BADDR+MODE_SEL) = 0x1;

    //slave mode
    REG32(USI1_BADDR+I2C_MODE) = 0x0;

    //slave address
    REG32(USI1_BADDR+I2C_ADDR) = 0x3c;

    //enable I2C
    //enable RX FIFO
    REG32(USI1_BADDR+USI_CTRL) = 0xb;
    
    //*************************************
    //       USI0 I2C send data
    //*************************************
    printf("==========================\n");
    printf("usi0 i2c transmit start\n");
    printf("send_data[0] : 0xa5\n");
    printf("send_data[1] : 0xa6\n");
    printf("send_data[2] : 0xa7\n");
    printf("send_data[3] : 0xa8\n");
    REG32(USI0_BADDR+TX_FIFO) = 0xa5;
    REG32(USI0_BADDR+TX_FIFO) = 0xa6;
    REG32(USI0_BADDR+TX_FIFO) = 0xa7;
    REG32(USI0_BADDR+TX_FIFO) = 0xa8;

    //wait untill 
    //  tx_fifo empty and
    //  transmit is not busy
    do{
        reg = REG32(USI0_BADDR+FIFO_STA);
        tx_empty = reg & 0x1;

        reg = REG32(USI0_BADDR+I2C_STA);
        i2c_busy = reg & 0x1;
    } while(tx_empty==0 || i2c_busy==1);
        
    printf("usi0 i2c transmit complete\n");
    printf("==========================\n");

    //*************************************
    //      USI1 I2C receive data
    //*************************************
    printf("==========================\n");
    printf("usi1 i2c receive start\n");

    do{
        reg = REG32(USI1_BADDR+FIFO_STA);
        rx_empty = reg & 0x4;

        if(rx_empty==0){
            reg = REG32(USI1_BADDR+RX_FIFO);
            printf("receive_data[%i] : 0x%x\n",cnt,reg);
            cnt++;
        }
    } while(cnt<4);

    printf("usi1 i2c receive complete\n");
    printf("==========================\n");

 sim_end();
}
