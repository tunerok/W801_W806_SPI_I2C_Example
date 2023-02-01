/******************************************************************************
** 
 * \file        main.c
 * \author      IOsetting | iosetting@outlook.com
 * \date        
 * \brief       Demo code of PWM in independent mode
 * \note        This will drive 3 on-board LEDs to show fade effect
 * \version     v0.1
 * \ingroup     demo
 * \remarks     test-board: HLK-W806-KIT-V1.0
 *              PWM Frequency = 40MHz / Prescaler / (Period + 1)；
                Duty Cycle(Edge Aligned)   = (Pulse + 1) / (Period + 1)
                Duty Cycle(Center Aligned) = (2 * Pulse + 1) / (2 * (Period + 1))
 *
******************************************************************************/

#include "main.h"
#define DEVICE_BASE_ADDR    0x40000000
#define HR_CLK_BASE_ADDR        (DEVICE_BASE_ADDR + 0xE00)

I2C_HandleTypeDef hi2c1;
SPI_HandleTypeDef hspi1;

GPIO_InitTypeDef igpio;

//AHT10
uint8_t AHT10_RX_Data[6];
uint32_t AHT10_ADC_Raw;
float AHT10_Temperature;
float AHT10_Humidity;
uint8_t AHT10_TmpHum_Cmd = 0xAC;
uint8_t AHT10_Init_Cmd = 0xE1;
uint8_t AHT10_Reset_Cmd = 0xBA;
uint8_t AHT10_Adress = 0x38 << 1;


void Error_Handler(void);


static void GPIO_Init(GPIO_InitTypeDef *gpio){
	HAL_StatusTypeDef ret = HAL_OK;
	gpio->Mode = GPIO_MODE_OUTPUT;
	gpio->Pin =  ST_DC_PIN | ST_RST_PIN;//no initialization needed for peripheral pins SPI_NSS | SPI_SCL | SPI_MOSI | LED_GPIO |
	gpio->Pull = GPIO_PULLUP;
	HAL_GPIO_Init(GPIOB, gpio);
}

static HAL_StatusTypeDef SPI_Init(SPI_HandleTypeDef *hspi){
	SPI_InitTypeDef spi;
	HAL_StatusTypeDef ret = HAL_OK;
	//__HAL_AFIO_REMAP_SPI_CS(GPIOB, GPIO_PIN_4); hardware NSS disabeled
	__HAL_AFIO_REMAP_SPI_CLK(GPIOB, SPI_SCL);
	//__HAL_AFIO_REMAP_SPI_MISO(GPIOB, SPI_MISO);
	__HAL_AFIO_REMAP_SPI_MOSI(GPIOB, SPI_MOSI);

	
	hspi->Init.Mode = SPI_MODE_MASTER;
	hspi->Init.CLKPolarity = SPI_POLARITY_HIGH;
	hspi->Init.CLKPhase = SPI_PHASE_1EDGE;
	hspi->Init.NSS = SPI_NSS_SOFT;
	hspi->Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
	hspi->Init.FirstByte = SPI_LITTLEENDIAN;
	
	hspi->Instance = SPI;
	
	ret = HAL_SPI_Init(hspi);
	return ret;

}

static HAL_StatusTypeDef I2C_Init(I2C_HandleTypeDef *hi2c){
	HAL_StatusTypeDef ret = HAL_OK;
	__HAL_AFIO_REMAP_I2C_SCL(GPIOB, I2C_SCL);
	__HAL_AFIO_REMAP_I2C_SDA(GPIOB, I2C_SDA);
	hi2c->Frequency = 100000;
	hi2c->Instance = I2C;
	ret = HAL_I2C_Init(hi2c);
	return ret;
}


int main(void)
{
	//init sys clk
    SystemClock_Config(CPU_CLK_160M);
	
	//SPI and I2C clk enable
	uint32_t gates = *((uint32_t *)(HR_CLK_BASE_ADDR));
	*((uint32_t *)(HR_CLK_BASE_ADDR)) |= CLK_GATE_SPI_MASK|CLK_GATE_I2C_MASK;


    printf("enter main\r\n");

	//Init peripherals
	GPIO_Init(&igpio);
	SPI_Init(&hspi1);
	I2C_Init(&hi2c1);
	
	//SPI Send data example
	//HAL_SPI_Transmit(&hspi1, data, 5, 10000);
	
	//Init display
	ST7789_Init();
	//Show test data
	ST7789_Test();
	
	//Send init cmd to AHT10
	HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_Init_Cmd, (uint8_t*)AHT10_TmpHum_Cmd, 0);
	HAL_Delay(200); 
	//Send Soft Reset cmd to AHT10
	HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_Reset_Cmd, (uint8_t*)AHT10_TmpHum_Cmd, 0);
	
	
	//Draw factorials
	fractal(0, 0, 1, 1);
	HAL_Delay(5000);
	fractal(0.43, 0.23, -0.1, -0.2);
	HAL_Delay(500);
	fractal(0.45, 0.25, -0.1, -0.3);
	HAL_Delay(500);
	
	//Draw image
	photoramka();
	
	
	while (1){
		uint8_t go_measure_data[2] = {0x33, 0};
		
		//Start temp and hum meas
		HAL_I2C_Write(&hi2c1, AHT10_Adress, AHT10_TmpHum_Cmd, (uint8_t*)go_measure_data, 2);
		HAL_Delay(200); 
		
		//Reading measured data
		HAL_I2C_Read(&hi2c1, AHT10_Adress, AHT10_TmpHum_Cmd, (uint8_t*)AHT10_RX_Data, 6);
		AHT10_ADC_Raw = (((uint32_t)AHT10_RX_Data[3] & 7) << 16) | ((uint32_t)AHT10_RX_Data[4] << 8) | AHT10_RX_Data[5];
		AHT10_Temperature = (float)(AHT10_ADC_Raw * 200.00 / (1048576.00)) - 50.00;
		AHT10_ADC_Raw = ((uint32_t)AHT10_RX_Data[1] << 12) | ((uint32_t)AHT10_RX_Data[2] << 4) | (AHT10_RX_Data[3] >> 4);
		AHT10_Humidity = (float)(AHT10_ADC_Raw*100.00/1048576.00);		
		HAL_Delay(500);
		
		//Show measured data
		char *tmp[160];
		sprintf(tmp, " Temp: %.2fC  ", AHT10_Temperature);
		ST7789_WriteString(10, 100, tmp, Font_16x26, MAGENTA, WHITE);
		sprintf(tmp, " Hum: %.2f%%  ", AHT10_Humidity);
		ST7789_WriteString(10, 125, tmp, Font_16x26, MAGENTA, WHITE);
	}
	
}


void Error_Handler(void)
{
    while (1)
    {
    }
}

void assert_failed(uint8_t *file, uint32_t line)
{
    printf("Wrong parameters value: file %s on line %d\r\n", file, line);
}