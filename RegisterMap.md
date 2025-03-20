## WM8731/WM8731L Software Control Registers

Here's a summary of the software control registers based on the provided text.

### Table 3: Line Input Software Control

| REGISTER ADDRESS | BIT   | LABEL        | DEFAULT | DESCRIPTION                                                                                                                               |
| :----------------- | :---- | :----------- | :------ | :---------------------------------------------------------------------------------------------------------------------------------------- |
| 0000000            | 4:0   | LINVOL[4:0]  | 10111   | Left Channel Line Input Volume Control: 11111 = +12dB.. 1.5dB steps down to 00000 = -34.5dB                                               |
| 0000000            | 7     | LINMUTE      | 1       | Left Channel Line Input Mute to ADC: 1 = Enable Mute, 0 = Disable Mute                                                              |
| 0000000            | 8     | LRINBOTH     | 0       | Left to Right Channel Line Input Volume and Mute Data Load Control: 1 = Enable Simultaneous Load, 0 = Disable Simultaneous Load        |
| 0000001            | 4:0   | RINVOL[4:0]  | 10111   | Right Channel Line Input Volume Control: 11111 = +12dB.. 1.5dB steps down to 00000 = -34.5dB                                              |
| 0000001            | 7     | RINMUTE      | 1       | Right Channel Line Input Mute to ADC: 1 = Enable Mute, 0 = Disable Mute                                                              |
| 0000001            | 8     | RLINBOTH     | 0       | Right to Left Channel Line Input Volume and Mute Data Load Control: 1 = Enable Simultaneous Load, 0 = Disable Simultaneous Load        |

### Table 4: Microphone Input Software Control

| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0000100            | 0   | MICBOOST  | 0       | Microphone Input Level Boost: 1 = Enable Boost, 0 = Disable Boost          |
| 0000100            | 1   | MUTEMIC   | 1       | Line Input Mute to ADC: 1 = Enable Mute, 0 = Disable Mute        |

### Table 5: ADC Software Control
| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0000100            | 2   | INSEL     | 0       | Microphone/Line Input Select to ADC: 1 = Microphone Input Select to ADC, 0 = Line Input Select to ADC          |

### Table 6: ADC Software Control
| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0000101            | 0   | ADCHPD     | 0       | ADC High Pass Filter Enable (Digital): 1 = Disable High Pass Filter, 0 = Enable High Pass Filter           |
| 0000101            | 4   | HPOR     | 0       | Store dc offset when High Pass Filter disabled: 1 = store offset, 0 = clear offset        |

### Table 7: DAC Software Control
| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0000101            | 2:1   | DEEMP[1:0]     | 00       | De-emphasis Control (Digital): 11 = 48kHz, 10 = 44.1kHz, 01 = 32kHz, 00 = Disable           |
| 0000101            | 3   | DACMU     | 1       | DAC Soft Mute Control (Digital): 1 = Enable soft mute, 0 = Disable soft mute        |

### Table 8: Output Software Control

| REGISTER ADDRESS | BIT | LABEL    | DEFAULT | DESCRIPTION                                               |
| :----------------- | :-: | :------- | :------ | :-------------------------------------------------------- |
| 0000100            | 3   | BYPASS   | 1       | Bypass Switch: 1 = Enable Bypass, 0 = Disable Bypass      |
| 0000100            | 4   | DACSEL   | 0       | DAC Select: 1 = Select DAC, 0 = Don't select DAC          |
| 0000100            | 5   | SIDETONE | 0       | Side Tone Switch: 1 = Enable Side Tone, 0 = Disable Side Tone |

### Table 9: Headphone Output Software Control

| REGISTER ADDRESS | BIT   | LABEL      | DEFAULT | DESCRIPTION                                                                                                                                   |
| :----------------- | :---- | :--------- | :------ | :-------------------------------------------------------------------------------------------------------------------------------------------- |
| 0000010            | 6:0   | LHPVOL[6:0] | 1111001 | Left Channel Headphone Output Volume Control: 1111111 = +6dB.. 1dB steps down to 0110000 = -73dB, 0000000 to 0101111 = MUTE                  |
| 0000010            | 7     | LZCEN      | 0       | Left Channel Zero Cross detect Enable: 1 = Enable, 0 = Disable                                                                                 |
| 0000010            | 8     | LRHPBOTH   | 0       | Left to Right Channel Headphone Volume, Mute and Zero Cross Data Load Control: 1 = Enable Simultaneous Load, 0 = Disable Simultaneous Load   |
| 0000011            | 6:0   | RHPVOL[6:0] | 1111001 | Right Channel Headphone Output Volume Control: 1111111 = +6dB.. 1dB steps down to 0110000 = -73dB, 0000000 to 0101111 = MUTE                 |
| 0000011            | 7     | RZCEN      | 0       | Right Channel Zero Cross Detect Enable: 1 = Enable, 0 = Disable                                                                                |
| 0000011            | 8     | RLHPBOTH   | 0       | Right to Left Channel Headphone Volume, Mute and Zero Cross Data Load Control: 1 = Enable Simultaneous Load, 0 = Disable Simultaneous Load   |

### Table 10: Bypass Mode Software Control

| REGISTER ADDRESS | BIT | LABEL    | DEFAULT | DESCRIPTION                                               |
| :----------------- | :-: | :------- | :------ | :-------------------------------------------------------- |
| 0000100            | 3   | BYPASS   | 1       | Bypass Switch: 1 = Enable Bypass, 0 = Disable Bypass      |

### Table 11: Side Tone Mode Table

| REGISTER ADDRESS | BIT | LABEL        | DEFAULT | DESCRIPTION                       |
| :----------------- | :-: | :----------- | :------ | :-------------------------------- |
| 0000100            | 5   | SIDETONE     | 0       | Side Tone Switch: 1= Enable, 0 = Disable Side Tone       |
| 0000100            | 7:6 | SIDEATT[1:0] | 00       | Side Tone Attenuation 11 = -15dB, 10 = -12dB, 01 = -9dB, 00 = -6dB      |

### Table 12: Software Control of Reset

| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0001111           | 8:0   | RESET  | not reset       | Reset Register: Writing 00000000 to register resets device         |

### Table 13: Software Control of Core Clock

| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0001000            | 6   | CLKIDIV2     | 0       | Core Clock divider select: 1 = Core Clock is MCLK divided by 2, 0 = Core Clock is MCLK        |

### Table 14: Programming CLKOUT

| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                 |
| :----------------- | :-: | :-------- | :------ | :-------------------------------------------------------------------------- |
| 0001000            | 7   | CLKODIV2     | 0       | CLKOUT divider select: 1 = CLOCKOUT is Core Clock divided by 2, 0 = CLOCKOUT is Core Clock        |

### Table 15: Digital Audio Interface Control

| REGISTER ADDRESS | BIT   | LABEL         | DEFAULT | DESCRIPTION                                                                                                                  |
| :----------------- | :---- | :------------ | :------ | :--------------------------------------------------------------------------------------------------------------------------- |
| 0000111            | 1:0   | FORMAT[1:0]   | 10      | Audio Data Format Select: 11 = DSP Mode, 10 = I2S, 01 = MSB-First, Left Justified, 00 = MSB-First, Right Justified            |
| 0000111            | 3:2   | IWL[1:0]      | 10      | Input Audio Data Bit Length Select: 11 = 32 bits, 10 = 24 bits, 01 = 20 bits, 00 = 16 bits                                  |
| 0000111            | 4     | LRP           | 0       | DACLRC phase control (or A/B select in DSP): 1= Right, 0 = Right, (opposite phasing in I2S) or A/B DSP |
| 0000111            | 5     | LRSWAP        | 0       | DAC Left Right Clock Swap: 1 = Right Left, 0 = Right Clock                                   |
| 0000111            | 6     | MS            | 0       | Master Slave Mode Control: 1=Enable, 0=Enable Slave                                                                                       |
| 0000111            | 7     | BCLKINV        | 0       | Bit Clock Invert: 1 = Invert BCLK, 0 = Don't invert BCLK                                                                                   |

### Table 16: Programming Master/Slave Modes
| REGISTER ADDRESS | BIT | LABEL   | DEFAULT | DESCRIPTION                                              |
| :----------------- | :-: | :------ | :------ | :------------------------------------------------------- |
| 0000111            | 6   | MS      | 0       | Master Slave Mode Control: 1= Enable Master Mode, 0=Enable Slave Mode |

### Table 17: Sample Rate Control

| REGISTER ADDRESS | BIT   | LABEL     | DEFAULT | DESCRIPTION                                                                                           |
| :----------------- | :---- | :-------- | :------ | :---------------------------------------------------------------------------------------------------- |
| 0001000            | 0     | USB/NORMAL | 0       | Mode Select: 1 = USB mode (250/272fs), 0 = Normal mode (256/384fs)                                  |
| 0001000            | 1     | BOSR      | 0       | Base Over-Sampling Rate: (USB), 1 = 272fs: 0 = 250fs (Normal), 1 = 384fs:                           |
| 0001000            | 5:2   | SR[3:0]   | 0000       | ADC and DAC sample rate control; See USB Mode and Normal Mode Sample Rate sections for operation |

### Table 23: Activating DSP and Digital Audio Interface

| REGISTER ADDRESS | BIT   | LABEL  | DEFAULT | DESCRIPTION                        |
| :----------------- | :---- | :----- | :------ | :--------------------------------- |
| 0001001            | 0     | ACTIVE | 0       | Activate Interface: 1 = Active: 0 = Inactive |

### Table 24: Control Interface Mode Selection

| MODE | INTERFACE FORMAT |
| :--- | :---------------- |
| 0    | 2 wire            |
| 1    | 3 wire            |

### Table 26: Power Conservation Modes Software Control

| REGISTER ADDRESS | BIT | LABEL     | DEFAULT | DESCRIPTION                                                                                                                      |
| :----------------- | :-: | :-------- | :------ | :------------------------------------------------------------------------------------------------------------------------------- |
| 0000110            | 0   | LINEINPD  | 1       | Line Input Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                            |
| 0000110            | 1   | MICPD     | 1       | Microphone Input an Bias Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                                                                                                              |
| 0000110            | 2   | ADCPD     | 1       | ADC Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                                   |
| 0000110            | 3   | DACPD     | 1       | DAC Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                                  |
| 0000110            | 4   | OUTPD     | 1       | Line Output Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                             |
| 0000110            | 5   | OSCPD     | 0       | Oscillator Power Down: 1 = Enable Power Down, 0 = Disable Power Down                                                              |
| 0000110            | 6   | CLKOUTPD   | 0       | CLKOUT power down: 1 = Enable Power Down, 0 = Disable Power Down                                                          |
| 0000110            | 7   | POWEROFF | 1       | POWEROFF mode: 1 = POWEROFF, 0 = power on |

### Table 27: Standby Mode

| POWER OFF | CLKOUTPD | OSCPD | OUTPD | DACPD | ADCPD | MICPD | LINEINPD | DESCRIPTION |
| :-------- | :------- | :---- | :---- | :---- | :---- | :---- | :------- | :---------- |
| 0         | 0        | 0     | 1     | 1     | 1     | 1     | 1        | STANDBY, but with Crystal Oscillator OS and CLKOUT available |
| 0         | 1        | 0     | 1     | 1     | 1     | 1     | 1        | STANDBY, but with Crystal Oscillator OS available, CLKOUT not-available |
| 0         | 1        | 1     | 1     | 1     | 1     | 1     | 1        | STANDBY, Crystal oscillator and CLKOUT not-available. |

### Table 28: Poweroff Mode

| POWER OFF | CLKOUTPD | OSCPD | OUTPD | DACPD | ADCPD | MICPD | LINEINPD | DESCRIPTION |
| :-------- | :------- | :---- | :---- | :---- | :---- | :---- | :------- | :---------- |
| 1         | 0        | 0     | X     | X     | X     | X     | X        | POWEROFF, but with Crystal Oscillator OS and CLKOUT available |
| 1         | 1        | 0     | X     | X     | X     | X     | X        | POWEROFF, but with Crystal Oscillator OS available, CLKOUT not-available |
| 1         | 1        | 1     | X     | X     | X     | X     | X        | POWEROFF, Crystal oscillator and CLKOUT not-available |

### Table 29: Mapping of Program Registers

| REGISTER | B15 | B14 | B13 | B12 | B11 | B10 | B9 | B8 | B7 | B6 | B5 | B4 | B3 | B2 | B1 | B0 |
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| R0 (00h) | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | LRINBOTH | LINMUTE | 0 | 0 | 0 | 0 |  | LINVOL |
| R1 (02h) | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | RLINBOTH | RINMUTE | 0 | 0 |  | RINVOL |  |  |
| R2 (04h) | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | LRHPBOTH | LZCEN |  |  | LHPVOL |  |  |  |
| R3 (06h) | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | RLHPBOTH | RZCEN |  |  | RHPVOL |  |  |  |
| R4 (08h) | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | SIDEATT | SIDETONE | DACSEL | BYPASS | INSEL | MUTEMIC | MICBOOST |  |
| R5 (0Ah) | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 | 0 | HPOR | DACMU | DEEMPH | ADC HPD |  |  |
| R6 (0Ch) | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | PWOFF | CLKOUTPD | OSCPD | OUTPD | DACPD | ADCPD | MICPD | LINEINPD |
| R7 (0Eh) | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 0 | BCLKINV | MS | LRSWAP | LRP | IWL | FORMAT |  |  |
| R8 (10h) | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | CLKI DIV2 | CLKO DIV2 |  |  | SR |  | BOSR | USB/NORM |
| R9 (12h) | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | ACTIVE |
| R15(1Eh) | 0 | 0 | 0 | 1 | 1 | 1 | 1 | | | | | | | | | RESET |

B9 to B15 is ADDRESS, B0 to B8 is DATA. R15(1Eh) has B8-B0 (DATA) is RESET.


### Table 30: Register Map Description

| REGISTER ADDRESS | BIT   | LABEL         | DEFAULT | DESCRIPTION                                                                                                                  |
| :----------------- | :---- | :------------ | :------ | :--------------------------------------------------------------------------------------------------------------------------- |
| 0000000            | 4:0   | LINVOL[4:0]   | 10111   | Left Channel Line Input Volume Control:  11111 = +12dB ... 1.5dB steps down to 00000 = -34.5dB                                              |
| 0000000            | 7   | LINMUTE        | 1      | Left Channel Line Input Mute to ADC: 1 = Enable Mute; 0 = Disable Mute                                       |
| 0000000            | 8   | LRINBOTH      | 0      | Left to Right Channel Line Input Volume and Mute Data Load Control: 1 = Enable Simultaneous Load; 0 = Disable Simultaneous Load   |
| 0000001            | 4:0   | RINVOL[4:0]   | 10111   | Right Channel Line Input Volume Control: 11111 = +12dB ... 1.5dB steps down to 00000 = -34.5dB               |
| 0000001            | 7   | RINMUTE       | 1      | Right Channel Line Input Mute to ADC: 1 = Enable Mute; 0 = Disable Mute                               |
| 0000001            | 8   | RLINBOTH     | 0       | Right to Left Channel Line Input Volume and Mute Data Load Control: 1 = Enable Simultaneous Load; 0 = Disable Simultaneous Load   |
| 0000010            | 6:0   | LHPVOL[6:0]   | 1111001 | Left Channel Headphone Output Volume Control: 1111111 = +6dB ... 1dB steps down to 0110000 = -73dB; 0000000 to 0101111 = MUTE |
| 0000010            | 7   | LZCEN        | 0      | Left Channel Zero Cross detect Enable: 1 = Enable; 0 = Disable                                                   |
| 0000010            | 8   | LRHPBOTH      | 0      | Left to Right Channel Headphone Volume, Mute and Zero Cross Data Load Control: 1 = Enable Simultaneous Load; 0 = Disable Simultaneous Load   |
| 0000011            | 6:0   | RHPVOL[6:0]   | 1111001 | Right Channel Headphone Output Volume Control: 1111111 = +6dB ... 1dB steps down to 0110000 = -73dB; 0000000 to 0101111 = MUTE |
| 0000011            | 7   | RZCEN        | 0      | Right Channel Zero Cross detect Enable: 1 = Enable; 0 = Disable                  |
| 0000011            | 8   | RLHPBOTH     | 0       | Right to Left Channel Headphone Volume, Mute and Zero Cross Data Load Control: 1 = Enable Simultaneous Load; 0 = Disable Simultaneous Load   |
| 0000100            | 0   | MICBOOST     | 0       | Microphone Input Level Boost: 1 = Enable Boost; 0 = Disable Boost   |
| 0000100            | 1   | MUTEMIC      | 1      | Mic Input Mute to ADC: 1 = Enable Mute; 0 = Disable Mute   |
| 0000100            | 2   | INSEL        | 0      | Microphone/Line Input Select to ADC: 1 = Microphone Input Select to ADC; 0 = Line Input Select to ADC   |
| 0000100            | 3   | BYPASS       | 1      | Bypass Switch: 1 = Enable Bypass; 0 = Disable Bypass |
| 0000100            | 4   | DACSEL       | 0      | DAC Select: 1 = Select DAC; 0 = Don't select DAC |
| 0000100            | 5   | SIDETONE     | 0      | Side Tone Switch: 1 = Enable Side Tone; 0 = Disable Side Tone |
| 0000100            | 7:6 | SIDEATT[1:0] | 00       | Side Tone Attenuation: 11 = -15dB; 10 = -12dB; 01 = -9dB; 00 = -6dB |
| 0000101            | 0   | ADCHPD       | 0      | ADC High Pass Filter Enable: 1 = Disable High Pass Filter; 0 = Enable High Pass Filter  |
| 0000101            | 2:1 | DEEMP[1:0]   | 00       | De-emphasis Control: 11 = 48kHz; 10 = 44.1kHz; 01 = 32kHz; 00 = Disable  |
| 0000101            | 3   | DACMU        | 1      | DAC Soft Mute Control: 1 = Enable soft mute; 0 = Disable soft mute  |
| 0000101            | 4   | HPOR         | 0      | Store dc offset when High Pass Filter disabled: 1 = store offset, 0 = clear offset  |
| 0000110            | 0   | LINEINPD     | 1      | Line Input Power Down: 1 = Enable Power Down; 0 = Disable Power Down   |
| 0000110            | 1   | MICPD        | 1      | Microphone Input an Bias Power Down: 1 = Enable Power Down; 0 = Disable Power Down   |
| 0000110            | 2   | ADCPD        | 1      | ADC Power Down: 1 = Enable Power Down; 0 = Disable Power Down   |
| 0000110            | 3   | DACPD        | 1      | DAC Power Down: 1 = Enable Power Down; 0 = Disable Power Down  |
| 0000110            | 4   | OUTPD        | 1      | Outputs Power Down: 1 = Enable Power Down; 0 = Disable Power Down  |
| 0000110            | 5   | OSCPD        | 0      | Oscillator Power Down: 1 = Enable Power Down; 0 = Disable Power Down  |
| 0000110            | 6   | CLKOUTPD     | 0      | CLKOUT power down: 1 = Enable Power Down; 0 = Disable Power Down   |
| 0000110            | 7   | POWEROFF     | 1      | POWEROFF mode: 1 = Enable POWEROFF; 0 = Disable POWEROFF    |
| 0000111            | 1:0 | FORMAT[1:0] | 10     | Audio Data Format Select: 11 = DSP Mode, frame sync + 2 data packed words; 10 = I2S Format, MSB-First left-justified; 01 = MSB-First, left justified; 00 = MSB-First, right justified  |
| 0000111            | 3:2 | IWL[1:0]    | 10     | Input Audio Data Bit Length Select: 11 = 32 bits; 10 = 24 bits; 01 = 20 bits; 00 = 16 bits   |
| 0000111            | 4   | LRP         | 0      | DACLRC phase control (in left, right or I2S modes): 1 = Right Channel DAC data when DACLRC high; 0 = Right Channel DAC data when DACLRC low (opposite phasing in I2S mode) or DSP mode A/B select (in DSP mode only): 1 = MSB is available on 2nd BCLK rising edge after DACLRC rising edge; 0 = MSB is available on 1st BCLK rising edge after DACLRC rising edge |
| 0000111            | 5   | LRSWAP     | 0       | DAC Left Right Clock Swap: 1 = Right Channel DAC Data Left; 0 = Right Channel DAC Data Right    |
| 0000111            | 6   | MS          | 0       | Master Slave Mode Control: 1 = Enable Master Mode; 0 = Enable Slave Mode    |
| 0000111            | 7   | BCLKINV     | 0        | Bit Clock Invert: 1 = Invert BCLK; 0 = Don't invert BCLK |
| 0001000            | 0   | USB/NORMAL  | 0        | Mode Select: 1 = USB mode (250/272fs); 0 = Normal mode (256/384fs)   |
| 0001000            | 1   | BOSR        | 0        | Base Over-Sampling Rate: USB Mode: 1 = 272fs; 0 = 250fs, Normal Mode: 1 = 384fs; 0 = 256fs  |
| 0001000            | 5:2 | SR[3:0]      | 0000    | ADC and DAC sample rate control; See USB Mode and Normal Mode Sample Rate sections for operation  |
| 0001000            | 6 | CLKIDIV2   | 0    | Core Clock divider select; 1 = Core Clock is MCLK divided by 2, 0 = Core Clock is MCLK  |
| 0001000            | 7 | CLKODIV2  | 0     | CLKOUT divider select; 1 = CLOCKOUT is Core Clock divided by 2; 0 = CLOCKOUT is Core Clock  |
| 0001001            | 0   | ACTIVE     | 0        | Activate Interface: 1 = Active; 0 = Inactive   |
| 0001111            | 8:0 | RESET      | not reset | Reset Register: Writing 00000000 to register resets device |

*   "X" indicates don't care.