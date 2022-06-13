################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Drivers/SolarGatorsBSP_STM/Drivers/src/AsciiLib.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/Button.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/CAN.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/ILI9341.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/LED.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/LTC2630.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/MPU6050.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/PitComms.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/Radio.cpp \
../Drivers/SolarGatorsBSP_STM/Drivers/src/UI.cpp 

OBJS += \
./Drivers/SolarGatorsBSP_STM/Drivers/src/AsciiLib.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/Button.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/CAN.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/ILI9341.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/LED.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/LTC2630.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/MPU6050.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/PitComms.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/Radio.o \
./Drivers/SolarGatorsBSP_STM/Drivers/src/UI.o 

CPP_DEPS += \
./Drivers/SolarGatorsBSP_STM/Drivers/src/AsciiLib.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/Button.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/CAN.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/ILI9341.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/LED.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/LTC2630.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/MPU6050.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/PitComms.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/Radio.d \
./Drivers/SolarGatorsBSP_STM/Drivers/src/UI.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/SolarGatorsBSP_STM/Drivers/src/%.o: ../Drivers/SolarGatorsBSP_STM/Drivers/src/%.cpp Drivers/SolarGatorsBSP_STM/Drivers/src/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m0 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F072xB -c -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0 -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../X-CUBE-MEMS1/Target -I../Drivers/BSP/Components/lsm6dsr -I"C:/Users/georg/STM32CubeIDE/SolarGators/LightsBoard/Drivers/SolarGatorsBSP_STM/Drivers/inc" -I"C:/Users/georg/STM32CubeIDE/SolarGators/LightsBoard/Drivers/SolarGatorsBSP_STM/DataModules/inc" -I"C:/Users/georg/STM32CubeIDE/SolarGators/LightsBoard/Drivers/SolarGatorsBSP_STM/etl/include" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-SolarGatorsBSP_STM-2f-Drivers-2f-src

clean-Drivers-2f-SolarGatorsBSP_STM-2f-Drivers-2f-src:
	-$(RM) ./Drivers/SolarGatorsBSP_STM/Drivers/src/AsciiLib.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/AsciiLib.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/Button.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/Button.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/CAN.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/CAN.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/ILI9341.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/ILI9341.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/LED.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/LED.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/LTC2630.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/LTC2630.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/MPU6050.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/MPU6050.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/PitComms.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/PitComms.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/Radio.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/Radio.o ./Drivers/SolarGatorsBSP_STM/Drivers/src/UI.d ./Drivers/SolarGatorsBSP_STM/Drivers/src/UI.o

.PHONY: clean-Drivers-2f-SolarGatorsBSP_STM-2f-Drivers-2f-src

