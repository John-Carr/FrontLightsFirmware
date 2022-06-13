################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/Components/lsm6dsr/lsm6dsr.c \
../Drivers/BSP/Components/lsm6dsr/lsm6dsr_reg.c 

C_DEPS += \
./Drivers/BSP/Components/lsm6dsr/lsm6dsr.d \
./Drivers/BSP/Components/lsm6dsr/lsm6dsr_reg.d 

OBJS += \
./Drivers/BSP/Components/lsm6dsr/lsm6dsr.o \
./Drivers/BSP/Components/lsm6dsr/lsm6dsr_reg.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/lsm6dsr/%.o: ../Drivers/BSP/Components/lsm6dsr/%.c Drivers/BSP/Components/lsm6dsr/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F072xB -c -I../Core/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc -I../Drivers/STM32F0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F0xx/Include -I../Drivers/CMSIS/Include -I../USB_DEVICE/App -I../USB_DEVICE/Target -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM0 -I../Middlewares/ST/STM32_USB_Device_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Device_Library/Class/CDC/Inc -I../X-CUBE-MEMS1/Target -I../Drivers/BSP/Components/lsm6dsr -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components-2f-lsm6dsr

clean-Drivers-2f-BSP-2f-Components-2f-lsm6dsr:
	-$(RM) ./Drivers/BSP/Components/lsm6dsr/lsm6dsr.d ./Drivers/BSP/Components/lsm6dsr/lsm6dsr.o ./Drivers/BSP/Components/lsm6dsr/lsm6dsr_reg.d ./Drivers/BSP/Components/lsm6dsr/lsm6dsr_reg.o

.PHONY: clean-Drivers-2f-BSP-2f-Components-2f-lsm6dsr

