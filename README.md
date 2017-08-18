# MP2624

The MP2624 is a 4.5A, highly integrated, switching-mode battery charger IC for singlecell Li-ion or Li-polymer batteries. It is an I2C Controlled 4.5A Single Cell USB / Adaptor Charger with Narrow VDC Power Path Management and USB OTG.

**To use this library, add the following statement to the top of your device code:**

```squirrel
#require "MP2624.device.lib.nut:1.0.0"
```

## Class Usage

### Constructor: MP2624(*ic2*)

The construcor takes one required parameter, a preconfigured i2c hardware object. You will need to set the clock speed for i2c before passing it into the constructor. The i2c interface on the MP2624 supports both standard mode (up to 100k bits), and fast mode (up to 400k bits).

## Class Methods

### reset()

The *reset()* method will return the chip to default settings.

### getSystStatusReg()

The *getSystStatusReg()* method returns a table with the current system status values. See the tables below for each of the possible values for the following keys: [V_BUS](#v_bus-possible-values), [CHARGE](#charge-possible-values), [PPM](#ppm-possible-values), [PWR_GOOD](#pwr_good-possible-values), [THERM](#therm-possible-values), [V_SYS](#v_sys-possible-values).

#### *V_BUS* Possible Values:
| System Status Constant               | Value | Description           |
| ------------------------------------ | ----- | --------------------- |
| MP2624_STATUS_V_BUS_UNKNOWN          | 0x00  | Unknown, including no input or DPDM detection incomplete |
| MP2624_STATUS_V_BUS_ADAPTOR_PORT     | 0x01  | Adaptor Port detected |
| MP2624_STATUS_V_BUS_USB_HOST         | 0x02  | USB Host detected     |
| MP2624_STATUS_V_BUS_OTG_INPUT        | 0x03  | OTG detected          |

#### *CHARGE* Possible Values:
| System Status Constant               | Value | Description             |
| ------------------------------------ | ----- | ----------------------- |
| MP2624_STATUS_CHG_NOT_CHARGING       | 0x00  | Not charging            |
| MP2624_STATUS_CHG_TRICKLE            | 0x01  | Trickle charge          |
| MP2624_STATUS_CHG_CONST_CURR         | 0x02  | Constant-current charge |
| MP2624_STATUS_CHG_DONE               | 0x03  | Chage done              |

#### *PPM* Possible Values:
| System Status Constant               | Value | Description                     |
| ------------------------------------ | ----- | ------------------------------- |
| MP2624_STATUS_PPM_NONE               | 0x00  | No power path management occurs |
| MP2624_STATUS_PPM_VIN_IIN            | 0x01  | Power path management is either VINPPM or IINPPM |

#### *PWR_GOOD* Possible Values:
| System Status Constant               | Value | Description   |
| ------------------------------------ | ----- | ------------- |
| MP2624_STATUS_PG_NO_GOOD_PWR         | 0x00  | No power good |
| MP2624_STATUS_PG_PWR_GOOD            | 0x01  | Power good    |

#### *THERM* Possible Values:
| System Status Constant               | Value | Description        |
| ------------------------------------ | ----- | ------------------ |
| MP2624_STATUS_THERM_NORM             | 0x00  | Normal             |
| MP2624_STATUS_THERM_TH_REGULATION    | 0x01  | Thermal regulation |

#### *V_SYS* Possible Values:
| System Status Constant           | Value | Description               |
| -------------------------------- | ----- | ------------------------- |
| MP2624_STATUS_VSYSMIN_IN_REG     | 0x00  | In VSYSMIN regulation     |
| MP2624_STATUS_VSYSMIN_NOT_IN_REG | 0x01  | Not in VSYSMIN regulation |


### getFaultReg()

The *getFaultReg()* method returns a table with the current fault status. See the tables below for each of the possible values for the following keys: [WATCHDOG](#watchdog-possible-values), [OTG](#otg-possible-values), [CHARGE](#charge-possible-values), [BATTERY](#battery-possible-values), [NTC](#ntc-possible-values).

#### *WATCHDOG* Possible Values:
| System Status Constant               | Value | Description               |
| ------------------------------------ | ----- | ------------------------- |
| MP2624_FAULT_WATCHGDOG_NORM          | 0x00  | Normal                    |
| MP2624_FAULT_WATCHGDOG_TMR_EXP       | 0x01  | Watchdog timer expiration |

#### *OTG* Possible Values:
| System Status Constant               | Value | Description |
| ------------------------------------ | ----- | ----------- |
| MP2624_FAULT_OTG_NORM                | 0x00  | Normal      |
| MP2624_FAULT_OTG_VBUS__BATT          | 0x01  | VBUS overloaded, VBUS OVP, or battery under voltage |

#### *CHARGE* Possible Values:
| System Status Constant               | Value | Description              |
| ------------------------------------ | ----- | ------------------------ |
| MP2624_FAULT_CHG_NORM                | 0x00  | Normal                   |
| MP2624_FAULT_CHG_INPUT               | 0x01  | Input falut (bad source) |
| MP2624_FAULT_CHG_THERM_SD            | 0x00  | Thermal shutdown         |
| MP2624_FAULT_CHG_SAFTY_TMR_EXP       | 0x01  | Safety timer expiration  |

#### *BATTERY* Possible Values:
| System Status Constant               | Value | Description |
| ------------------------------------ | ----- | ----------- |
| MP2624_FAULT_BATT_NORM               | 0x00  | Normal      |
| MP2624_FAULT_BATT_BATT_OVP           | 0x01  | Battery OVP |

#### *NTC* Possible Values:
| System Status Constant               | Value | Description |
| ------------------------------------ | ----- | ----------- |
| MP2624_FAULT_NTC_NORM                | 0x00  | Normal      |
| MP2624_FAULT_NTC_COLD                | 0x01  | NTC cold    |
| MP2624_FAULT_NTC_COOL                | 0x00  | NTC cool    |
| MP2624_FAULT_NTC_WARM                | 0x01  | NTC warm    |
| MP2624_FAULT_NTC_HOT                 | 0x02  | NTC hot     |

### setInputVoltageRegulation(*inputVoltage*)

The *setInputVoltageRegulation()* method takes one required parameter, a float *inputVoltage*, the desired input voltage in volts. Supported values range from 3.88V to 5.08V in 80mV increments. All vaules will be rounded down to the closest supported value. The method returns the actual *inputVoltage* set. The default value is 4.36V. 

### setInputCurrentLimit(*currInLimConst*)

The *setInputCurrentLimit()* method takes one required parameter, an input current limit constant. The default for DCP/CDP is 1.8A and for SDP is either 100mA or 500mA.

| Input Current Limit Constants | 
| ----------------------------- |
| MP2624_CURR_IN_LIMIT_100mA    |
| MP2624_CURR_IN_LIMIT_150mA    |
| MP2624_CURR_IN_LIMIT_500mA    |
| MP2624_CURR_IN_LIMIT_900mA    |
| MP2624_CURR_IN_LIMIT_1200mA   |
| MP2624_CURR_IN_LIMIT_1800mA   |
| MP2624_CURR_IN_LIMIT_2000mA   |
| MP2624_CURR_IN_LIMIT_3000mA   |

### setChargerConfig(*modeConst*)

The *setChargerConfig()* method takes one required parameter, an charger configuration mode constant. The default mode is charge battery, *MP2624_CHARGE_MODE_BATTERY*.

| Charger Configuration Mode Constants | 
| ------------------------------------ |
| MP2624_CHARGE_MODE_DISABLE           |
| MP2624_CHARGE_MODE_BATTERY           |
| MP2624_CHARGE_MODE_OTG               |

### setMinSysVoltage(*minSysVoltage*)

The *setMinSysVoltage()* method takes one required parameter, a float *minSysVoltage*, the desired minimum system voltage in volts. Supported values range from 3.0V to 3.07V in 0.1V increments. All vaules will be rounded down to the closest supported value. The method returns the actual *minSysVoltage* set. The default value is 3.6V.

### setMaxSysVoltage(*maxVoltConst*)

The *setMaxSysVoltage()* method selects system regulation voltage higher than full battery voltage. It takes one required parameter, an maximum system voltage constant. The default is 100mV, *MP2624_SYS_MAX_100mV*.

| Maximum System Voltage Constants | 
| -------------------------------- |
| MP2624_SYS_MAX_50mV              |
| MP2624_SYS_MAX_100mV             |

### setChargeCurrent(*chargeCurrent*)

The *setChargeCurrent()* method takes one required parameter, an integer *chargeCurrent*, the desired charge current in milliamps. Supported values range from 512mA to 4544mA in 64mA increments. All vaules will be rounded down to the closest supported value. The method returns the actual *chargeCurrent* set. The default value is 1024mA.

### setUsbOtgCurrLim(*usbCurrLimConst*)

The *setUsbOtgCurrLim()* method takes one required parameter, an USB OTG current limit constant. The default mode is 1.3A, *MP2624_OLIM_1300mA*.

| USB OTG Current Limit Constants | 
| ------------------------------- |
| MP2624_OLIM_500mA               |
| MP2624_OLIM_1300mA              |
| MP2624_OLIM_2000mA              |

### setPreChargeCurrent(*chargeCurrent*)

The *setPreChargeCurrent()* method takes one required parameter, an integer *chargeCurrent*, the desired pre charge current in milliamps. Supported values range from 64mA to 1024mA in 64mA increments. All vaules will be rounded down to the closest supported value. The method returns the actual *chargeCurrent* set. The default value is 256mA.

### setTerminationCurrent(*termCurr*)

The *setTerminationCurrent()* method takes one required parameter, an integer *termCurr*, the desired termination current in milliamps. Supported values range from 64mA to 1024mA in 64mA increments. All vaules will be rounded down to the closest supported value. The method returns the actual *termCurr* set. The default value is 256mA.

### setChargeFullVoltage(*battFullVoltage*)

The *setChargeFullVoltage()* method takes one required parameter, a float *battFullVoltage*, the desired charge full voltage in volts. Supported values range from 3.48V to 4.425V in 15mV increments. All vaules will be rounded down to the closest supported value. The method returns the actual *battFullVoltage* set. The default value is 4.2V.

### setPreChargeThreshold(*preChargeThresh*)

The *setPreChargeThreshold()* method takes one required parameter, an pre-charge threshold constant. The default mode is 3.0V, *MP2624_BATT_PRE_THRESH_3_0V*.

| Pre-Charge Threshold Constants | 
| ------------------------------ |
| MP2624_BATT_PRE_THRESH_2_8V    |
| MP2624_BATT_PRE_THRESH_3_0V    |

### setBatteryRechargeThreshold(*reChargeThresh*)

The *setBatteryRechargeThreshold()* method takes one required parameter, an battery recharge threshold constant. The default mode is 100mV, *MP2624_BATT_RECRG_THRESH_100mV*.

| Battery Recharge Threshold Constants | 
| ------------------------------------ |
| MP2624_BATT_RECRG_THRESH_200mV       |
| MP2624_BATT_RECRG_THRESH_100mV       |

### setTerminationIndicatorThresh(*termIndConst*)

The *setTerminationIndicatorThresh()* method takes one required parameter, termination indicator threshold constant. The default mode is match, *MP2624_TERM_STAT_THRESH_MATCH*. Selecting *MP2624_TERM_STAT_THRESH_BEFORE* will indicate before the actual termination on START.

| Termination Indicator Threshold Constants | 
| ----------------------------------------- |
| MP2624_TERM_STAT_THRESH_MATCH             |
| MP2624_TERM_STAT_THRESH_BEFORE            |

### setWatchdogTimerLimit(*timerConst*)

The *setWatchdogTimerLimit()* method takes one required parameter, a watchdog timer limit constant. The default is 40 seconds, *MP2624_WATCHDOG_TMR_40s*.

| Watchdog Timer Limit Constants | 
| ------------------------------ |
| MP2624_WATCHDOG_TMR_DISABLE    |
| MP2624_WATCHDOG_TMR_40s        |
| MP2624_WATCHDOG_TMR_80s        |
| MP2624_WATCHDOG_TMR_160s       |

### setConstCurrChargeTimer(*constCurrChrgTimerConst*)

The *setConstCurrChargeTimer()* method takes one required parameter, a constant-current charge timer constant. The default is 5 hours, *MP2624_CONST_CHRG_TMR_5H*. **Note:** that during PPM this time will double.

| Constant-Current Charge Timer Constants | 
| --------------------------------------- |
| MP2624_CONST_CHRG_TMR_5H                |
| MP2624_CONST_CHRG_TMR_8H                |
| MP2624_CONST_CHRG_TMR_12H               |
| MP2624_CONST_CHRG_TMR_20H               |

### setBattCompResistance(*resistance*)

The *setBattCompResistance()* method takes one required parameter, an integer *resistance*, the desired resistance in milli-ohms. Supported values range from 0mΩ to 70mΩ in 10mΩ increments. All vaules will be rounded down to the closest supported value. The method returns the actual *resistance* set. The default value is 0mΩ.

### setBattCompVoltClamp(*compVClamp*)

The *setBattCompVoltClamp()* method takes one required parameter, an integer *compVClamp*, the desired battery compensation voltage clamp above the full battery voltage. Supported values are in millivolts and range from 0mV to 112mV in 16mV increments. All vaules will be rounded down to the closest supported value. The method returns the actual *compVClamp* set. The default value is 0mV.

### setThermRegulationThresh(*thermThreshConst*)

The *setThermRegulationThresh()* method takes one required parameter, a thermal regulation threshold constant. The default is 120°C, *MP2624_THERM_REG_THRESH_120_DEG_C*. 

| Thermal Regulation Threshold Constants | 
| -------------------------------------- |
| MP2624_THERM_REG_THRESH_60_DEG_C       |
| MP2624_THERM_REG_THRESH_80_DEG_C       |
| MP2624_THERM_REG_THRESH_100_DEG_C      |
| MP2624_THERM_REG_THRESH_120_DEG_C      |

### enableChrgTermination(*enable*)

The *enableChrgTermination()* method is used to enable or disable the termination setting. This method takes one required boolean parameter. By default the termination setting is enabled.

### enableUSBDetection(*enable*)

The *enableUSBDetection()* method is used to disable or enable(force) DP/DM detection mode. This method takes one required boolean parameter. By default DP/DM detection mode is disabled.

### enableSafetyTimer(*enable*)

The *enableSafetyTimer()* method is used to enable or disable the safety timer. This method takes one required boolean parameter. By default the safety timer is enabled.

### enableExtSafetyTmr(*enable*)

The *enableExtSafetyTmr()* method is used to enable or disable the 2X extended safety timer. This method takes one required boolean parameter. By default the 2x safety timer is enabled.

### enableBatFet(*enable*)

The *enableBatFet()* method is used to enable or disable the battery fet. This method takes one required boolean parameter. By default battery fet is disabled.

### enableNTC(*enable*)

The *enableNTC()* method is used to enable or disable NTC. This method takes one required boolean parameter. By default NTC is enabled.

### enableBattUVLO(*enable*)

The *enableBattUVLO()* method is used to enable or disable battery under voltage lock out. This method takes one required boolean parameter. By default battery under voltage lock out is disabled.

### enableCrgFaultInt(*enable*)

The *enableCrgFaultInt()* method is used to enable or disable the charge fault interrupt. This method takes one required boolean parameter. By default the interrupt is enabled.

### enableBattFaultInt(*enable*)

The *enableBattFaultInt()* method is used to enable or disable the battery fault interrupt. This method takes one required boolean parameter. By default the interrupt is enabled.

### enableHighImpedence(*enable*)

The *enableHighImpedence()* method is used to enable or disable the high impedence pin. This method takes one required boolean parameter. By default the pin is disabled.

### resetWatchdogTimer()

Use the *resetWatchdogTimer()* method to prevent the watchdog timer from expiring and keep the device in host mode.

## License

The MP2624 library is licensed under [MIT License](./LICENSE).
