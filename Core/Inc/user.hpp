
#ifndef USER_HPP_
#define USER_HPP_

#include "main.h"
#include "lsm6dsr.h"
#include "custom_bus.h"
#include "Steering.hpp"
#include "CAN.hpp"
#include "LED.hpp"
#include "MPU6050.hpp"
#include "FrontLightsController.hpp"

// Datamodules
SolarGators::DataModules::Steering LightsState;
SolarGators::DataModules::FrontLightsController FLights;
extern CAN_HandleTypeDef hcan;
SolarGators::Drivers::CANDriver CANController(&hcan, 0);
LSM6DSR_IO_t imu_bus =
    {
        .Init = BSP_I2C2_Init,
        .DeInit = BSP_I2C2_DeInit,
        .BusType = LSM6DSR_I2C_BUS,
        .Address = LSM6DSR_I2C_ADD_H,
        .WriteReg = BSP_I2C2_WriteReg,
        .ReadReg = BSP_I2C2_ReadReg,
        .GetTick = BSP_GetTick
    };
LSM6DSR_Object_t imu;

SolarGators::Drivers::fpoint_3d_t ACCEL;
extern SPI_HandleTypeDef hspi1;

// Throttle
// TODO
uint8_t THROTTLE_VAL;

// Leds
SolarGators::Drivers::LED lt_indicator    ("LT Indicator", LT_GPIO_Port, LT_GPIO_Pin);
SolarGators::Drivers::LED rt_indicator    ("RT Indicator", RT_GPIO_Port, RT_GPIO_Pin);
SolarGators::Drivers::LED hl_indicator    ("HL Indicator", LED2_EN_GPIO_Port, LED2_EN_Pin);

#endif
