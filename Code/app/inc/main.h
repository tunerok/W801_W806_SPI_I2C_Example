#ifndef __MAIN_H__
#define __MAIN_H__

#include <stdio.h>
#include "wm_hal.h"
#include "my_spi.h"
#include "ST7789\st7789.h"
#include "draw_math.h"

#define DUTY_MAX 100
#define DUTY_MIN 50


#define LED_GPIO GPIO_PIN_5

//SPI-LCD
#define SPI_SCL GPIO_PIN_24
//#define SPI_MISO GPIO_PIN_25
#define SPI_MOSI GPIO_PIN_26
//#define SPI_NSS GPIO_PIN_23
#define ST_DC_PIN GPIO_PIN_22
#define ST_RST_PIN GPIO_PIN_21

//I2C-AHT10
#define I2C_SCL GPIO_PIN_20
#define I2C_SDA GPIO_PIN_19

#define CLK_GATE_SPI_MASK 0x80
#define CLK_GATE_I2C_MASK 0x01

#endif