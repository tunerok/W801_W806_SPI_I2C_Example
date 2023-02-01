#include "wm_spi.h"

HAL_StatusTypeDef SPI_Transmit_Char(SPI_HandleTypeDef *hspi, uint8_t Data){
	__HAL_LOCK(hspi);
	__HAL_SPI_ENABLE_TX(hspi);
	__HAL_SPI_SET_CLK_NUM(hspi, 8);
	__HAL_SPI_SET_START(hspi);
	WRITE_REG(hspi->Instance->TXDATA, Data << 24);
	while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
	{}
	 __HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
	 __HAL_SPI_DISABLE_TX(hspi);
	 __HAL_UNLOCK(hspi);
}

HAL_StatusTypeDef HAL_SPI_Transmit_my(SPI_HandleTypeDef *hspi, const uint8_t *pData, uint32_t Size, int32_t x){
	int i = 0, idx = 0;
	uint32_t fifo_count = 0, data = 0;
//	while(i < Size){
//		SPI_Transmit_Char(hspi, pData[i]);
//		i++;
//	}
	
	__HAL_LOCK(hspi);
	__HAL_SPI_ENABLE_TX(hspi);
	__HAL_SPI_SET_CLK_NUM(hspi, Size*8);
	__HAL_SPI_SET_START(hspi);
	while(i < Size){
		for(idx = 0; i < Size; idx++){
			data |= (uint32_t)pData[i] << 24 - idx*8;
			i++;
			if (idx == 3){
				break;
			}
		}
		fifo_count = (32 - __HAL_SPI_GET_TXFIFO(hspi)) / 4;
		while(fifo_count > 0){
			WRITE_REG(hspi->Instance->TXDATA, data );
			idx = 0;
			data = 0;
			if (fifo_count > 0)
			{
				fifo_count--;
			}
			else{
				while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
				{}	
			}
		}
		
	}
	while (__HAL_SPI_GET_FLAG(hspi, SPI_INT_SRC_DONE) != SPI_INT_SRC_DONE)
	{}
	 __HAL_SPI_CLEAR_FLAG(hspi, SPI_INT_SRC_DONE);
	 __HAL_SPI_DISABLE_TX(hspi);
	 __HAL_UNLOCK(hspi);
}