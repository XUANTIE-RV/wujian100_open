#ifndef __W25Q64FV_H_
#define __W25Q64FV_H_
#ifdef __cplusplus
extern "C" {
#endif


#define W25Q64FV_PAGE_SIZE 0x80

#define W25Q64FV_ADDR_START   0x0
#define W25Q64FV_ADDR_END     0x10000
#define W25Q64FV_CLK_RATE     1000000        /* 1MHZ */

#define IS_FLASH_ADDR(addr) \
    ((addr >= W25Q64FV_ADDR_START) && (addr < W25Q64FV_ADDR_END))

#ifdef __cplusplus
}
#endif

#endif /* __W25Q64FV_H_ */

