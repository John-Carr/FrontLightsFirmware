/*
 * user.cpp
 *
 *  Created on: Jan 17, 2022
 *      Author: John Carr
 */

#include "user.hpp"

using namespace SolarGators;

extern "C" void CPP_UserSetup(void);

void UpdateSignals(void);
void SendCanMsgs();
void ReadIMU();
void ReadADC();

// OS Configs
osTimerId_t signal_timer_id;
osTimerAttr_t signal_timer_attr =
{
    .name = "Lights Timer"
};
/* Definitions for IMU Thread */
osTimerId_t imu_timer_id;
osTimerAttr_t imu_timer_attr =
{
    .name = "IMU"
};
/* Definitions for the ADC Thread */
osTimerId_t adc_timer_id;
osTimerAttr_t adc_timer_attr =
{
    .name = "ADCs"
};
/* Definitions for CAN Tx Thread */
osTimerId_t can_tx_timer_id;
osTimerAttr_t can_tx_timer_attr =
{
    .name = "CAN Tx"
};
void CPP_UserSetup(void)
{
  CANController.AddRxModule(&LightsState);
  // Start Thread that Handles Turn Signal LEDs
  signal_timer_id = osTimerNew((osThreadFunc_t)UpdateSignals, osTimerPeriodic, NULL, &signal_timer_attr);
  if (signal_timer_id == NULL)
  {
      Error_Handler();
  }
  osTimerStart(signal_timer_id, 500);
  // Start Thread that Handles Reads the IMU
  imu_timer_id = osTimerNew((osThreadFunc_t)ReadIMU, osTimerPeriodic, NULL, &imu_timer_attr);
  if (imu_timer_id == NULL)
  {
      Error_Handler();
  }

  if(LSM6DSR_RegisterBusIO(&imu, &imu_bus))
  {
    Error_Handler();
  }
  if(LSM6DSR_Init(&imu))
  {
    Error_Handler();
  }
  if(LSM6DSR_ACC_Enable(&imu))
  {
    Error_Handler();
  }
  osTimerStart(imu_timer_id, 500);
  // Start Thread that Handles Reads the IMU
  adc_timer_id = osTimerNew((osThreadFunc_t)ReadADC, osTimerPeriodic, NULL, &adc_timer_attr);
  if (adc_timer_id == NULL)
  {
      Error_Handler();
  }
  break_adc.Init();
  throttle_adc.Init();
  osTimerStart(adc_timer_id, 500);
  // Start Thread that sends CAN Data
  can_tx_timer_id = osTimerNew((osThreadFunc_t)SendCanMsgs, osTimerPeriodic, NULL, &can_tx_timer_attr);
  if (can_tx_timer_id == NULL)
  {
      Error_Handler();
  }
  CANController.Init();
//  osTimerStart(can_tx_timer_id, 100);
}

void SendCanMsgs()
{
  CANController.Send(&LightsState);
}

void UpdateSignals(void)
{
  osMutexAcquire(LightsState.mutex_id_, osWaitForever);
  if(LightsState.GetHazardsStatus())
  {
    if (lt_indicator.IsOn())
    {
      lt_indicator.TurnOff();
      rt_indicator.TurnOff();
    }
    else
    {
      lt_indicator.TurnOn();
      rt_indicator.TurnOn();
    }
  }
  else if(LightsState.GetRightTurnStatus())
    rt_indicator.Toggle();
  else if(LightsState.GetLeftTurnStatus())
    lt_indicator.Toggle();

  if(!LightsState.GetHazardsStatus() && !LightsState.GetRightTurnStatus())
    rt_indicator.TurnOff();

  if(!LightsState.GetHazardsStatus() && !LightsState.GetLeftTurnStatus())
    lt_indicator.TurnOff();
  osMutexRelease(LightsState.mutex_id_);
}

// This is quick and dirty we could potentially add an event to the data module to block this until its updated
void UpdateLights(void)
{
  while(1)
  {
    osMutexAcquire(LightsState.mutex_id_, osWaitForever);
    if (LightsState.GetHeadlightsStatus())
      hl_indicator.TurnOn();
    else
      hl_indicator.TurnOff();
    osMutexRelease(LightsState.mutex_id_);
    osDelay(50);
  }
}

void ReadIMU()
{
  LSM6DSR_Axes_t accel_info;
  LSM6DSR_ACC_GetAxes(&imu, &accel_info);
}

void ReadADC()
{
  BREAK_VAL = break_adc.GetVoltage();
  THROTTLE_VAL = throttle_adc.GetVoltage();
}

void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan)
{
  CANController.SetRxFlag();
  HAL_CAN_DeactivateNotification(hcan, CAN_IT_RX_FIFO0_MSG_PENDING);
}
