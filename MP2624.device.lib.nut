// MIT License
//
// Copyright (c) 2017 Electric Imp
//
// SPDX-License-Identifier: MIT
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


// MP2624 CONSTANTS
const MP2624_DEFUALT_I2C_ADDR        = 0x4B;
// REGISTER ADDRS
const MP2624_IN_SRC_CTRL_REG         = 0x00;
const MP2624_PWR_ON_CONFIG_REG       = 0x01;
const MP2624_CRG_CURR_CTRL_REG       = 0x02;
const MP2624_PRE_CRG_TERM_CURR       = 0x03;
const MP2624_CRG_VOLT_CTRL_REG       = 0x04;
const MP2624_CRG_TERM_TIMER_CTRL_REG = 0x05;
const MP2624_COPM_THERM_REG_CTRL_REG = 0x06;
const MP2624_MISC_OP_CTRL_REG        = 0x07;
const MP2624_SYS_STATUS_REG          = 0x08;
const MP2624_FAULT_REG               = 0x09;
const MP2624_VEN_PART_REV_STATUS_REG = 0x0A;

// Input Current Limit settings
const MP2624_CURR_IN_LIMIT_100mA  = 0x00;
const MP2624_CURR_IN_LIMIT_150mA  = 0x01;
const MP2624_CURR_IN_LIMIT_500mA  = 0x02;
const MP2624_CURR_IN_LIMIT_900mA  = 0x03;
const MP2624_CURR_IN_LIMIT_1200mA = 0x04;
const MP2624_CURR_IN_LIMIT_1800mA = 0x05;
const MP2624_CURR_IN_LIMIT_2000mA = 0x06;
const MP2624_CURR_IN_LIMIT_3000mA = 0x07;

// Charger Configuration settings
const MP2624_CHARGE_MODE_DISABLE = 0x00;
const MP2624_CHARGE_MODE_BATTERY = 0x01;
const MP2624_CHARGE_MODE_OTG     = 0x02;

// Minimum System Voltage settings
const MP2624_SYS_MAX_50mV  = 0x00;
const MP2624_SYS_MAX_100mV = 0x01;

// USB OTG Current Limit settings
const MP2624_OLIM_500mA  = 0x00;
const MP2624_OLIM_1300mA = 0x01;
const MP2624_OLIM_2000mA = 0x02;

// Pre-Charge Threshold settings
const MP2624_BATT_PRE_THRESH_2_8V = 0x00;
const MP2624_BATT_PRE_THRESH_3_0V = 0x01;

// Recharge Threshold settings
const MP2624_BATT_RECRG_THRESH_200mV = 0x00;
const MP2624_BATT_RECRG_THRESH_100mV = 0x01;

// Termination Indicator Threshold settings
const MP2624_TERM_STAT_THRESH_MATCH  = 0x00;
const MP2624_TERM_STAT_THRESH_BEFORE = 0x01;

// Watchdog Timer Limit settings
const MP2624_WATCHDOG_TMR_DISABLE = 0x00;
const MP2624_WATCHDOG_TMR_40s     = 0x01;
const MP2624_WATCHDOG_TMR_80s     = 0x02;
const MP2624_WATCHDOG_TMR_160s    = 0x03;

// Constant Current Charge Timer settings
const MP2624_CONST_CHRG_TMR_5H  = 0x00;
const MP2624_CONST_CHRG_TMR_8H  = 0x01;
const MP2624_CONST_CHRG_TMR_12H = 0x02;
const MP2624_CONST_CHRG_TMR_20H = 0x03;

// Thermal Regulation Threshold settings
const MP2624_THERM_REG_THRESH_60_DEG_C  = 0x00;
const MP2624_THERM_REG_THRESH_80_DEG_C  = 0x01;
const MP2624_THERM_REG_THRESH_100_DEG_C = 0x02;
const MP2624_THERM_REG_THRESH_120_DEG_C = 0x03;

// System Status Register Msgs
const MP2624_STATUS_V_BUS_UNKNOWN       = 0x00;
const MP2624_STATUS_V_BUS_ADAPTOR_PORT  = 0x01;
const MP2624_STATUS_V_BUS_USB_HOST      = 0x02;
const MP2624_STATUS_V_BUS_OTG_INPUT     = 0x03;
const MP2624_STATUS_CHG_NOT_CHARGING    = 0x00;
const MP2624_STATUS_CHG_TRICKLE         = 0x01;
const MP2624_STATUS_CHG_CONST_CURR      = 0x02;
const MP2624_STATUS_CHG_DONE            = 0x03;
const MP2624_STATUS_PPM_NONE            = 0x00;
const MP2624_STATUS_PPM_VIN_IIN         = 0x01;
const MP2624_STATUS_PG_NO_GOOD_PWR      = 0x00;
const MP2624_STATUS_PG_PWR_GOOD         = 0x01;
const MP2624_STATUS_THERM_NORM          = 0x00;
const MP2624_STATUS_THERM_TH_REGULATION = 0x01;
const MP2624_STATUS_VSYSMIN_IN_REG      = 0x00;
const MP2624_STATUS_VSYSMIN_NOT_IN_REG  = 0x01;

// Fault Register Msgs
const MP2624_FAULT_WATCHGDOG_NORM    = 0x00;
const MP2624_FAULT_WATCHGDOG_TMR_EXP = 0x01;
const MP2624_FAULT_OTG_NORM          = 0x00;
const MP2624_FAULT_OTG_VBUS__BATT    = 0x01;
const MP2624_FAULT_CHG_NORM          = 0x00;
const MP2624_FAULT_CHG_INPUT         = 0x01;
const MP2624_FAULT_CHG_THERM_SD      = 0x02;
const MP2624_FAULT_CHG_SAFTY_TMR_EXP = 0x03;
const MP2624_FAULT_BATT_NORM         = 0x00;
const MP2624_FAULT_BATT_BATT_OVP     = 0x01;
const MP2624_FAULT_NTC_NORM          = 0x00;
const MP2624_FAULT_NTC_COLD          = 0x01;
const MP2624_FAULT_NTC_COOL          = 0x02;
const MP2624_FAULT_NTC_WARM          = 0x03;
const MP2624_FAULT_NTC_HOT           = 0x04;


// The MP2624 is a 4.5A, highly integrated,
// switching-mode battery charger IC for singlecell
// Li-ion or Li-polymer batteries.
// It is an I2C Controlled 4.5A Single Cell USB / Adaptor Charger 
// with Narrow VDC Power Path Management and USB OTG

class MP2624 {

    static VERSION = "1.0.0";

    _i2c = null;
    _addr = null;

    constructor(i2c, addr = MP2624_DEFUALT_I2C_ADDR) {
        _i2c = i2c;
        _addr = addr;
    }

    // Enable/Disable High Imped - EN HIZ (**disabled)
    function enableHighImpedence(enable) {
        (enable) ? _setRegBit(MP2624_IN_SRC_CTRL_REG, 7, 1) : _setRegBit(MP2624_IN_SRC_CTRL_REG, 7, 0);
        return this;
    }

    function reset() {
        _setRegBit(MP2624_PWR_ON_CONFIG_REG, 7, 1);
        return this;
    }

    // Reset timer to keep device in host mode
    function resetWatchdogTimer() {
        _setRegBit(MP2624_PWR_ON_CONFIG_REG, 6, 1);
        return this;
    }

    // Set Input Voltage Regulation, Range = 3.88V-5.08V, 
    // Param input in volts
    // Return acutal input voltage set
    function setInputVoltageRegulation(inVoltage) {
        local inc = 80; 
        local min = 3880;
        local max = 5080;
        inVoltage = (inVoltage * 1000).tointeger();

        local val = _getSettingRegVal(inVoltage, min, max, inc);
        local regVal = _getReg(MP2624_IN_SRC_CTRL_REG) & 0x87;

        // Set reg bits 3-6 only
        _setReg(MP2624_IN_SRC_CTRL_REG, regVal | (val << 3));
        return ((val * inc) + min) / 1000.0;
    }

    // Set Input Current Limit (SDP or DCP/CDP)
    function setInputCurrentLimit(currInLimConst) {
        // Set reg bits 0-3 only
        local regVal = _getReg(MP2624_IN_SRC_CTRL_REG) & 0xF8;
        regVal = regVal | currInLimConst;
        _setReg(MP2624_IN_SRC_CTRL_REG, regVal);
        return this;
    }

    // Charger configuration, default charge battery (01)
    function setChargerConfig(modeConst) {
        // Set reg bits 4-5 only
        local regVal = _getReg(MP2624_PWR_ON_CONFIG_REG) & 0xCF;
        regVal = regVal | modeConst << 4;
        _setReg(MP2624_PWR_ON_CONFIG_REG, regVal);
        return this;
    }

    // Charger configuration, Range (3V-3.7V) default 3.6V
    // Param min system voltage (in volts)
    // return acutal min sys voltage set
    function setMinSysVoltage(minSysVoltage) {
        local inc = 1;
        local min = 30;
        local max = 37;
        minSysVoltage = (minSysVoltage * 10).tointeger();

        local val = _getSettingRegVal(minSysVoltage, min, max, inc);
        local regVal = _getReg(MP2624_PWR_ON_CONFIG_REG) & 0xF1;

        // Set reg bits 1-3 only
        _setReg(MP2624_PWR_ON_CONFIG_REG, regVal | (val << 1));
        return ((val * inc) + min) / 10.0;
    }

    // Set System Regulation Voltage Higher than Full Batt Voltage (0 50mV, 1 100mV)
    function setMaxSysVoltage(maxVConst) {
        _setRegBit(MP2624_PWR_ON_CONFIG_REG, 0, maxVConst);
        return this;
    }

    // Charger Current, Range (512-4544mA) default 1024mA
    // Param charge current (in mA)
    // return acutal charge current set   
    function setChargeCurrent(crgCurr) {
        local inc = 64;
        local min = 512;
        local max = 4544;

        local val = _getSettingRegVal(crgCurr, min, max, inc);
        local regVal = _getReg(MP2624_CRG_CURR_CTRL_REG) & 0x03;

        // Set reg bits 2-7 only
        _setReg(MP2624_CRG_CURR_CTRL_REG, regVal | (val << 2));
        return (val * inc) + min;
    }

    // Set USB OTG Current Limit (500mA, 1.3A-default, 2.0A)
    function setUsbOtgCurrLim(usbCurrLimConst) {
        // Set reg bits 0-1 only
        local regVal = _getReg(MP2624_CRG_CURR_CTRL_REG) & 0xFC;
        regVal = regVal | usbCurrLimConst;
        _setReg(MP2624_CRG_CURR_CTRL_REG, regVal);
        return this;
    }

    // Precharge Current, Range (64-1024mA) default 256mA
    // Param charge current (in mA)
    // return acutal pre charge current set   
    function setPreChargeCurrent(crgCurr) {
        local inc = 64;
        local min = 64;
        local max = 1024;

        local val = _getSettingRegVal(crgCurr, min, max, inc);
        local regVal = _getReg(MP2624_PRE_CRG_TERM_CURR) & 0x0F;

        // Set reg bits 4-7 only
        _setReg(MP2624_PRE_CRG_TERM_CURR, regVal | (val << 4));
        return (val * inc) + min;
    }

    // Termination Current, Range (64-1024mA) default 256mA
    // Param termination current (in mA)
    // return acutal termination current set   
    function setTerminationCurrent(termCurr) {
        local inc = 64;
        local min = 64;
        local max = 1024;

        local val = _getSettingRegVal(termCurr, min, max, inc);
        local regVal = _getReg(MP2624_PRE_CRG_TERM_CURR) & 0xF0;

        // Set reg bits 0-3 only
        _setReg(MP2624_PRE_CRG_TERM_CURR, regVal | val);
        return (val * inc) + min;
    }

    // Full Voltage Charge, Range (3.48-4.425V) default 4.2V
    // Param Battery Full (in V)
    // return Battery Full voltage set   
    function setFullVoltageCharge(battFull) {
        local inc = 15;
        local min = 3480;
        local max = 4425;
        battFull = (battFull * 1000).tointeger();

        local val = _getSettingRegVal(battFull, min, max, inc);
        local regVal = _getReg(MP2624_CRG_VOLT_CTRL_REG) & 0x03;

        // Set reg bits 2-7 only
        _setReg(MP2624_CRG_VOLT_CTRL_REG, regVal | (val << 2));
        return ((val * inc) + min) / 1000.0;
    }

    // Set Pre Charge Voltage Threshold (0 2.8V, 1 **3.0V)
    function setPreChargeThreshold(crgThresh) {
        _setRegBit(MP2624_CRG_VOLT_CTRL_REG, 1, crgThresh);
        return this;
    }

    // Set Battery Recharge Threshold (0 200mV, 1 **100mV)
    function setBatteryRechargeThreshold(crgThresh) {
        _setRegBit(MP2624_CRG_VOLT_CTRL_REG, 0, crgThresh);
        return this;
    }

    // Enable charge termination setting (bool - default true)
    function enableChrgTermination(enable) {
        (enable) ? _setRegBit(MP2624_CRG_TERM_TIMER_CTRL_REG, 7, 1) : _setRegBit(MP2624_CRG_TERM_TIMER_CTRL_REG, 7, 0);
        return this;
    }

    // Termination indicator Threshold (defualt - match)
    function setTerminationIndicatorThresh(termIndConst) {
        _setRegBit(MP2624_CRG_TERM_TIMER_CTRL_REG, 6, termIndConst);
        return this;
    }

    // Set I2C watchdog timer (40s default)
    function setWatchdogTimerLimit(timerConst) {
        // Set reg bits 4-5 only
        local regVal = _getReg(MP2624_CRG_TERM_TIMER_CTRL_REG) & 0xCF;
        regVal = regVal | timerConst << 4;
        _setReg(MP2624_CRG_TERM_TIMER_CTRL_REG, regVal);
        return this;
    }

    // Enable Safety Timer (bool - default true)
    function enableSafetyTimer(enable) {
        (enable) ? _setRegBit(MP2624_CRG_TERM_TIMER_CTRL_REG, 3, 1) : _setRegBit(MP2624_CRG_TERM_TIMER_CTRL_REG, 3, 0);
        return this;
    }

    // Set const-current charge timer (5h default)
    function setConstCurrChargeTimer(timerConst) {
        // Set reg bits 1-2 only
        local regVal = _getReg(MP2624_CRG_TERM_TIMER_CTRL_REG) & 0xF9;
        regVal = regVal | timerConst << 1;
        _setReg(MP2624_CRG_TERM_TIMER_CTRL_REG, regVal);
        return this;
    }

    // default 0 milli ohms
    function setBattCompResistance(resist) {
        local inc = 10;
        local min = 0;
        local max = 70;

        local val = _getSettingRegVal(resist, min, max, inc);
        local regVal = _getReg(MP2624_COPM_THERM_REG_CTRL_REG) & 0x1F;

        // Set reg bits 5-7 only
        _setReg(MP2624_COPM_THERM_REG_CTRL_REG, regVal | (val << 5));
        return (val * inc) + min;
    }

    // default 0mV
    function setBattCompVoltClamp(compV) {
        local inc = 16;
        local min = 0;
        local max = 112;

        local val = _getSettingRegVal(compV, min, max, inc);
        local regVal = _getReg(MP2624_COPM_THERM_REG_CTRL_REG) & 0xE3;

        // Set reg bits 2-4 only
        _setReg(MP2624_COPM_THERM_REG_CTRL_REG, regVal | (val << 2));
        return (val * inc) + min;
    }

    // default 120 degC
    function setThermRegulationThresh(thermThresh) {
        // Set reg bits 0-1 only
        local regVal = _getReg(MP2624_COPM_THERM_REG_CTRL_REG) & 0xFC;
        regVal = regVal | thermThresh;
        _setReg(MP2624_COPM_THERM_REG_CTRL_REG, regVal);
        return this;
    }

    // default disabled
    function enableUSBDetection(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 7, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 7, 0);
        return this;
    }

    // default enabled
    function enableExtSafetyTmr(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 6, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 6, 0);
        return this;
    }

    // check the logic in datasheet says batt FET disable, enabled by defualt
    function enableBatFet(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 5, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 5, 0);
        return this;
    }

    // default enabled
    function enableNTC(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 3, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 3, 0);
        return this;
    }

    // check the logic in datasheet says lockout_disable, enabled by defualt
    function enableBattUVLO(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 2, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 2, 0);
        return this;
    }

    // default enabled
    function enableCrgFaultInt(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 1, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 1, 0);
        return this;
    }

    // default enabled
    function enableBattFaultInt(enable) {
        (enable) ? _setRegBit(MP2624_MISC_OP_CTRL_REG, 0, 1) : _setRegBit(MP2624_MISC_OP_CTRL_REG, 0, 0);
        return this;
    }

    function getSysStatus() {
        local regVal = _getReg(MP2624_SYS_STATUS_REG);
        return { "V_BUS"    : (regVal & 0xC0) >> 6, 
                 "CHARGE"   : (regVal & 0x30) >> 4,
                 "PPM"      : (regVal & 0x08) >> 3,
                 "PWR_GOOD" : (regVal & 0x04) >> 2,
                 "THERM"    : (regVal & 0x02) >> 1,
                 "V_SYS"    : regVal & 0x01 };
    }

    function getFaults() {
        local regVal = _getReg(MP2624_FAULT_REG);
        return { "WATCHDOG" : (regVal & 0x80) >> 7,
                 "OTG"      : (regVal & 0x40) >> 6,
                 "CHARGE"   : (regVal & 0x30) >> 4,
                 "BATTERY"  : (regVal & 0x08) >> 3,
                 "NTC"      : regVal & 0x07};
    }

    // Private Functions

    function _getSettingRegVal(input, min, max, inc) {
        // Make sure input is in range
        if (input > max) input = max;
        if (input < min) input = min;

        // get register value
        return (input - min) / inc;
    }

    function _getReg(reg) {
        local result = _i2c.read(_addr, reg.tochar(), 1);
        if (result == null) throw "I2C read error: " + _i2c.readerror();
        return result[0];
    }

    function _setReg(reg, val) {
        local result = _i2c.write(_addr, format("%c%c", reg, (val & 0xFF)));
        if (result) throw "I2C write error: " + result;
        return result;
    }

    function _setRegBit(reg, bit, state) {
        local val = _getReg(reg);
        val = (state == 0) ? val & ~(0x01 << bit) : val | (0x01 << bit)
        return _setReg(reg, val);
    }

}
