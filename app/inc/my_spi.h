#ifndef __MY_SPI_H__
#define __MY_SPI_H__

#include "wm_hal.h"
#include "wm_dma.h"

HAL_StatusTypeDef SPI_Transmit_Char(SPI_HandleTypeDef *hspi, uint8_t Data);
HAL_StatusTypeDef HAL_SPI_Transmit_my(SPI_HandleTypeDef *hspi, const uint8_t *pData, uint32_t Size, int32_t x);

#endif
