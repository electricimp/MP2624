// MIT License
//
// Copyright 2018 Electric Imp
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
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
// OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.


// These tests check the i2c registers are being updated as expected, it is not 
// advisable to have a battery connected when running these tests.
class AutomatedRegisterCheckTests extends ImpTestCase {

    charger = null;

    // Setup is written for an imp001 
    // with MP2624 connected to i2c89
    function setUp() {
        local i2c = hardware.i2c89;
        i2c.configure(CLOCK_SPEED_100_KHZ);

        charger = MP2624(i2c);
        charger.reset();
    }

    // Helper function that checks the register 
    function checkReg(reg, expected) {
        info( format( "0x%02X", charger._getReg(reg) ) );
        assert.equal(expected, charger._getReg(reg));
    }

    function test_reg0() {
        // Default: 0011 0000
        // Make sure the registers are set to defaults
        checkReg(0x00, 0x30);

        // Update registers to non-default settings
        // Default: 4.36V
        charger.setInputVoltageRegulation(3.88); 
        // Default: 100mA
        charger.setInputCurrentLimit(MP2624_CURR_IN_LIMIT_150mA); 
        // Default: false
        charger.enableHighImpedence(true);

        // Check that the registers have been set to the expected value
        // Expected: 1000 0001
        checkReg(0x00, 0x81);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x00, 0x30);
    }

    function test_reg1() {
        // Default: 0001 1011
        // Make sure the registers are set to defaults
        checkReg(0x01, 0x1B);

        // Default: MP2624_CHARGE_MODE_BATTERY
        charger.setChargerConfig(MP2624_CHARGE_MODE_DISABLE);
        // Default: 3.6V
        charger.setMinSysVoltage(3.0);
        // Default: MP2624_SYS_MAX_100mV (1)
        charger.setMaxSysVoltage(MP2624_SYS_MAX_50mV);

        // Expected: 0000 0000
        checkReg(0x01, 0x00);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x01, 0x1B);
    }

    function test_reg2() {
        // Default: 0010 0001
        // Make sure the registers are set to defaults
        checkReg(0x02, 0x21);

        // Update registers to non-default settings
        // Default: 1024mA
        charger.setChargeCurrent(512); 
        // Default: MP2624_OLIM_1300mA
        charger.setUsbOtgCurrLim(MP2624_OLIM_500mA); 

        // Check that the registers have been set to the expected value
        // Expected: 0000 0000
        checkReg(0x02, 0x00);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x02, 0x21);
    }

    function test_reg3() {
        // Default: 0011 0011
        // Make sure the registers are set to defaults
        checkReg(0x03, 0x33);

        // Update registers to non-default settings
        // Default: 256mA
        charger.setPreChargeCurrent(64); 
        // Default: 256mA
        charger.setTerminationCurrent(64); 

        // Check that the registers have been set to the expected value
        // Expected: 0000 0000
        checkReg(0x03, 0x00);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x03, 0x33);
    }

    function test_reg4() {
        // Default: 1100 0011
        // Make sure the registers are set to defaults
        checkReg(0x04, 0xC3);

        // Update registers to non-default settings
        // Default: 4.2V
        charger.setFullVoltageCharge(3.48); 
        // Default: MP2624_BATT_PRE_THRESH_3_0V
        charger.setPreChargeThreshold(MP2624_BATT_PRE_THRESH_2_8V); 
        // Default: MP2624_BATT_RECRG_THRESH_100mV
        charger.setBatteryRechargeThreshold(MP2624_BATT_RECRG_THRESH_200mV);

        // Check that the registers have been set to the expected value
        // Expected: 0000 0000
        checkReg(0x04, 0x00);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x04, 0xC3);
    }


    function test_reg5() {
        // Default: 1001 1000
        // Make sure the registers are set to defaults
        checkReg(0x05, 0x98);

        // Update registers to non-default settings
        // Default: MP2624_TERM_STAT_THRESH_MATCH (0)
        charger.setTerminationIndicatorThresh(MP2624_TERM_STAT_THRESH_BEFORE);
        // Default: MP2624_WATCHDOG_TMR_ENABLE (1)
        charger.setWatchdogTimerLimit(MP2624_WATCHDOG_TMR_DISABLE);
        // Default: MP2624_CONST_CHRG_TMR_5H (00)
        charger.setConstCurrChargeTimer(MP2624_CONST_CHRG_TMR_20H);
        // Default: true (1)
        charger.enableSafetyTimer(false);
        // Default: true (1)
        charger.enableChrgTermination(false);

        // Check that the registers have been set to the expected value
        // Expected: 0100 0110
        checkReg(0x05, 0x45);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x05, 0x98);
    }

    function test_reg6() {
        // Default: 0000 0011
        // Make sure the registers are set to defaults
        checkReg(0x06, 0x03);

        // Update registers to non-default settings
        // Default: 0mOhms (000)
        charger.setBattCompResistance(30);
        // Default: 0mV (000)
        charger.setBattCompVoltClamp(16);
        // Default: MP2624_THERM_REG_THRESH_120_DEG_C (11)
        charger.setThermRegulationThresh(MP2624_THERM_REG_THRESH_60_DEG_C);

        // Check that the registers have been set to the expected value
        // Expected: 0110 0100
        checkReg(0x06, 0x64);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x06, 0x03);
    }


    function test_reg7() {
        // Default: 0101 1011, 010? 1011
        // Make sure the registers are set to defaults
        checkReg(0x07, 0x5B);

        // Update registers to non-default settings
        // Default: false (0)
        charger.enableUSBDetection(true);
        // Default: true (1)
        charger.enableExtSafetyTmr(false);
        // Default: false (0)
        charger.enableBatFet(true);
        // Default: true (1)
        charger.enableNTC(false);
        // Default: false (0)
        charger.enableBattUVLO(true);
        // Default: true (1)
        charger.enableCrgFaultInt(false);
        // Default: true (1)
        charger.enableBattFaultInt(false);

        // Check that the registers have been set to the expected value
        // Expected: 1011 0100
        checkReg(0x07, 0xB4);

        // Restore registers to defaults, confirm
        charger.reset();
        checkReg(0x07, 0x5B);
    }

    function tearDown() {
        charger.reset();
        info("MP2624 automated check register tests done.");
    }
}