#include <stdint.h>
#include "drv_common.h"
#include "csi_config.h"

//USI device number
#define CONFIG_USI_USART_NUM CONFIG_USI_NUM
#define CONFIG_USI_SPI_NUM CONFIG_USI_NUM
#define CONFIG_USI_I2C_NUM CONFIG_USI_NUM

//USI_PGPIO information
typedef enum {
    ENUM_USI_DEV_USART,
    ENUM_USI_DEV_SPI,
    ENUM_USI_DEV_I2C,
} usi_dev_type_e;

//USI_SPI information
typedef struct {
    int32_t pin_sclk;
    int32_t pin_mosi;
    int32_t pin_miso;
    int32_t pin_ssel;
    int32_t usi_idx;
    uint16_t function;
} usi_spi_info_t;

//USI_I2C information
typedef struct {
    int32_t pin_sda;
    int32_t pin_scl;
    int32_t usi_idx;
    uint16_t function;
} usi_i2c_info_t;
