################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2/extension/third_party_hw_drivers_extension/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.c 

OBJS += \
./third_party_hw_drivers_4.0.0/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.o 

C_DEPS += \
./third_party_hw_drivers_4.0.0/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.d 


# Each subdirectory must supply rules for building sources it contributes
third_party_hw_drivers_4.0.0/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.o: C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2/extension/third_party_hw_drivers_extension/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.c third_party_hw_drivers_4.0.0/driver/public/silabs/ir_array_mlx90640/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG_EFM=1' '-DEFR32MG24B310F1536IM48=1' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DHFXO_FREQ=39000000' '-DSL_BOARD_NAME="BRD2601B"' '-DSL_BOARD_REV="A01"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"D:\simplicityProjects\IRsensorDataProcessed\config" -I"D:\simplicityProjects\IRsensorDataProcessed\autogen" -I"D:\simplicityProjects\IRsensorDataProcessed" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//extension/third_party_hw_drivers_extension/driver/peripheral_drivers/mikroe/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//extension/third_party_hw_drivers_extension/driver/public/silabs/ir_array_mlx90640/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/Device/SiliconLabs/EFR32MG24/Include" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_assert" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//app/common/util/app_log" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//hardware/board/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/CMSIS/Core/Include" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//hardware/driver/configuration_over_swo/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/debug/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/device_init/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/dmadrv/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/emdrv/common/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/emlib/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/driver/i2cspm/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/iostream/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/peripheral/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/common/toolchain/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/system/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/sleeptimer/inc" -I"C:/Users/masud/SimplicityStudio/SDKs/gecko_sdk_2//platform/service/udelay/inc" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"third_party_hw_drivers_4.0.0/driver/public/silabs/ir_array_mlx90640/src/sparkfun_mlx90640.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


