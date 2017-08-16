# MP2624

The MP2624 is a 4.5A, highly integrated, switching-mode battery charger IC for singlecell Li-ion or Li-polymer batteries. 

**To use this library, add the following statement to the top of your device code:**

```squirrel
#require "MP2624.device.lib.nut:1.0.0"
```


## Class Usage

### Constructor: MP2624(*ic2*)


## Class Methods

### enableHighImpedence()
### reset()
### resetWatchdogTimer()
### setInputVoltageRegulation()
### setInputCurrentLimit()
### setChargerConfig()
### setMinSysVoltage()
### setMaxSysVoltage()
### setChargeCurrent()
### setUsbOtgCurrLim()
### setPreChargeCurrent()
### setTerminationCurrent()
### setTerminationCurrent()
### setPreChargeThreshold()
### setBatteryRechargeThreshold()
### enableChrgTermination()
### setTerminationIndicatorThresh()
### setWatchdogTimerLimit()
### enableChrgTermination()
### setConstCurrChargeTimer()
### setBattCompResistance()
### setBattCompVoltClamp()
### setThermRegulationThresh()
### enableUSBDetection()
### enableExtSafetyTmr()
### enableBatFetDis()
### enableNTC()
### enableBattUVLO()
### enableCrgeFaultInt()
### enableBattFaultInt()
### getSystStatusReg()
### getFaultReg()