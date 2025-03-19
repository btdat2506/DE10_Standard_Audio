# qsys scripting (.tcl) file for audio_system
package require -exact qsys 16.0

create_system {audio_system}

set_project_property DEVICE_FAMILY {Cyclone V}
set_project_property DEVICE {5CSXFC6D6F31C6}
set_project_property HIDE_FROM_IP_CATALOG {false}

# Clock source
add_instance clk_0 clock_source 23.1
set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}

# Nios II processor
add_instance nios2_gen2_0 altera_nios2_gen2 23.1
set_instance_parameter_value nios2_gen2_0 {setting_showUnpublishedSettings} {0}
set_instance_parameter_value nios2_gen2_0 {setting_showInternalSettings} {0}
set_instance_parameter_value nios2_gen2_0 {setting_preciseIllegalMemAccessException} {0}
set_instance_parameter_value nios2_gen2_0 {setting_exportvectors} {0}
set_instance_parameter_value nios2_gen2_0 {setting_shadowRegisterSets} {0}
set_instance_parameter_value nios2_gen2_0 {mpu_useLimit} {0}
set_instance_parameter_value nios2_gen2_0 {mpu_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {mmu_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {mmu_autoAssignTlbPtrSz} {1}
set_instance_parameter_value nios2_gen2_0 {cpuReset} {0}
set_instance_parameter_value nios2_gen2_0 {resetSlave} {onchip_memory2_0.s1}
set_instance_parameter_value nios2_gen2_0 {exceptionSlave} {onchip_memory2_0.s1}
set_instance_parameter_value nios2_gen2_0 {cpuArchRev} {1}
set_instance_parameter_value nios2_gen2_0 {resetOffset} {0}
set_instance_parameter_value nios2_gen2_0 {exceptionOffset} {32}
set_instance_parameter_value nios2_gen2_0 {breakOffset} {32}
set_instance_parameter_value nios2_gen2_0 {impl} {Tiny}
set_instance_parameter_value nios2_gen2_0 {debug_enabled} {1}
set_instance_parameter_value nios2_gen2_0 {debug_triggerArming} {1}
set_instance_parameter_value nios2_gen2_0 {resetrequest_enabled} {1}

# On-chip memory for program and data
add_instance onchip_memory2_0 altera_avalon_onchip_memory2 23.1
set_instance_parameter_value onchip_memory2_0 {allowInSystemMemoryContentEditor} {0}
set_instance_parameter_value onchip_memory2_0 {blockType} {AUTO}
set_instance_parameter_value onchip_memory2_0 {dataWidth} {32}
set_instance_parameter_value onchip_memory2_0 {dualPort} {0}
set_instance_parameter_value onchip_memory2_0 {initMemContent} {1}
set_instance_parameter_value onchip_memory2_0 {initializationFileName} {onchip_mem.hex}
set_instance_parameter_value onchip_memory2_0 {instanceID} {NONE}
set_instance_parameter_value onchip_memory2_0 {memorySize} {262144.0}
set_instance_parameter_value onchip_memory2_0 {readDuringWriteMode} {DONT_CARE}
set_instance_parameter_value onchip_memory2_0 {simAllowMRAMContentsFile} {0}
set_instance_parameter_value onchip_memory2_0 {simMemInitOnlyFilename} {0}
set_instance_parameter_value onchip_memory2_0 {singleClockOperation} {0}
set_instance_parameter_value onchip_memory2_0 {slave1Latency} {1}
set_instance_parameter_value onchip_memory2_0 {slave2Latency} {1}
set_instance_parameter_value onchip_memory2_0 {useNonDefaultInitFile} {0}
set_instance_parameter_value onchip_memory2_0 {useShallowMemBlocks} {0}
set_instance_parameter_value onchip_memory2_0 {writable} {1}
set_instance_parameter_value onchip_memory2_0 {ecc_enabled} {0}
set_instance_parameter_value onchip_memory2_0 {resetrequest_enabled} {1}

# Audio ROM for storing audio data
add_instance audio_rom altera_avalon_onchip_memory2 23.1
set_instance_parameter_value audio_rom {allowInSystemMemoryContentEditor} {0}
set_instance_parameter_value audio_rom {blockType} {AUTO}
set_instance_parameter_value audio_rom {dataWidth} {16}
set_instance_parameter_value audio_rom {dualPort} {0}
set_instance_parameter_value audio_rom {initMemContent} {1}
set_instance_parameter_value audio_rom {initializationFileName} {audio_data.mif}
set_instance_parameter_value audio_rom {instanceID} {NONE}
set_instance_parameter_value audio_rom {memorySize} {480512.0}
set_instance_parameter_value audio_rom {readDuringWriteMode} {DONT_CARE}
set_instance_parameter_value audio_rom {simAllowMRAMContentsFile} {0}
set_instance_parameter_value audio_rom {simMemInitOnlyFilename} {0}
set_instance_parameter_value audio_rom {singleClockOperation} {0}
set_instance_parameter_value audio_rom {slave1Latency} {1}
set_instance_parameter_value audio_rom {slave2Latency} {1}
set_instance_parameter_value audio_rom {useNonDefaultInitFile} {1}
set_instance_parameter_value audio_rom {useShallowMemBlocks} {0}
set_instance_parameter_value audio_rom {writable} {0}
set_instance_parameter_value audio_rom {ecc_enabled} {0}
set_instance_parameter_value audio_rom {resetrequest_enabled} {1}

# JTAG UART for debugging
add_instance jtag_uart_0 altera_avalon_jtag_uart 23.1
set_instance_parameter_value jtag_uart_0 {allowMultipleConnections} {0}
set_instance_parameter_value jtag_uart_0 {hubInstanceID} {0}
set_instance_parameter_value jtag_uart_0 {readBufferDepth} {64}
set_instance_parameter_value jtag_uart_0 {readIRQThreshold} {8}
set_instance_parameter_value jtag_uart_0 {simInputCharacterStream} {}
set_instance_parameter_value jtag_uart_0 {simInteractiveOptions} {NO_INTERACTIVE_WINDOWS}
set_instance_parameter_value jtag_uart_0 {useRegistersForReadBuffer} {0}
set_instance_parameter_value jtag_uart_0 {useRegistersForWriteBuffer} {0}
set_instance_parameter_value jtag_uart_0 {useRelativePathForSimFile} {0}
set_instance_parameter_value jtag_uart_0 {writeBufferDepth} {64}
set_instance_parameter_value jtag_uart_0 {writeIRQThreshold} {8}

# Timer for periodic operations
add_instance timer_0 altera_avalon_timer 23.1
set_instance_parameter_value timer_0 {alwaysRun} {0}
set_instance_parameter_value timer_0 {counterSize} {32}
set_instance_parameter_value timer_0 {fixedPeriod} {0}
set_instance_parameter_value timer_0 {period} {1}
set_instance_parameter_value timer_0 {periodUnits} {MSEC}
set_instance_parameter_value timer_0 {resetOutput} {0}
set_instance_parameter_value timer_0 {snapshot} {1}
set_instance_parameter_value timer_0 {timeoutPulseOutput} {0}
set_instance_parameter_value timer_0 {watchdogPulse} {2}

# LED PIO for status indication
add_instance led_pio altera_avalon_pio 23.1
set_instance_parameter_value led_pio {bitClearingEdgeCapReg} {0}
set_instance_parameter_value led_pio {bitModifyingOutReg} {0}
set_instance_parameter_value led_pio {captureEdge} {0}
set_instance_parameter_value led_pio {direction} {Output}
set_instance_parameter_value led_pio {edgeType} {RISING}
set_instance_parameter_value led_pio {generateIRQ} {0}
set_instance_parameter_value led_pio {irqType} {LEVEL}
set_instance_parameter_value led_pio {resetValue} {0.0}
set_instance_parameter_value led_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value led_pio {simDrivenValue} {0.0}
set_instance_parameter_value led_pio {width} {10}

# Switch PIO for user input
add_instance switch_pio altera_avalon_pio 23.1
set_instance_parameter_value switch_pio {bitClearingEdgeCapReg} {0}
set_instance_parameter_value switch_pio {bitModifyingOutReg} {0}
set_instance_parameter_value switch_pio {captureEdge} {0}
set_instance_parameter_value switch_pio {direction} {Input}
set_instance_parameter_value switch_pio {edgeType} {RISING}
set_instance_parameter_value switch_pio {generateIRQ} {0}
set_instance_parameter_value switch_pio {irqType} {LEVEL}
set_instance_parameter_value switch_pio {resetValue} {0.0}
set_instance_parameter_value switch_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value switch_pio {simDrivenValue} {0.0}
set_instance_parameter_value switch_pio {width} {10}

# Key PIO for button input
add_instance key_pio altera_avalon_pio 23.1
set_instance_parameter_value key_pio {bitClearingEdgeCapReg} {0}
set_instance_parameter_value key_pio {bitModifyingOutReg} {0}
set_instance_parameter_value key_pio {captureEdge} {0}
set_instance_parameter_value key_pio {direction} {Input}
set_instance_parameter_value key_pio {edgeType} {RISING}
set_instance_parameter_value key_pio {generateIRQ} {0}
set_instance_parameter_value key_pio {irqType} {LEVEL}
set_instance_parameter_value key_pio {resetValue} {0.0}
set_instance_parameter_value key_pio {simDoTestBenchWiring} {0}
set_instance_parameter_value key_pio {simDrivenValue} {0.0}
set_instance_parameter_value key_pio {width} {4}

# Audio PLL for generating proper audio clocks
add_instance audio_pll_0 altera_up_avalon_audio_pll 18.0
set_instance_parameter_value audio_pll_0 {audio_clk_freq} {12.288}
set_instance_parameter_value audio_pll_0 {gui_refclk} {50.0}

# Audio configuration interface for WM8731
add_instance audio_config altera_up_avalon_audio_and_video_config 18.0
set_instance_parameter_value audio_config {audio_in} {Line In to ADC}
set_instance_parameter_value audio_config {bit_length} {16}
set_instance_parameter_value audio_config {board} {DE1-SoC}
set_instance_parameter_value audio_config {dac_enable} {1}
set_instance_parameter_value audio_config {data_format} {Left Justified}
set_instance_parameter_value audio_config {device} {On-Board Peripherals}
set_instance_parameter_value audio_config {eai} {1}
set_instance_parameter_value audio_config {line_in_bypass} {0}
set_instance_parameter_value audio_config {mic_bypass} {0}
set_instance_parameter_value audio_config {sampling_rate} {48 kHz}

# Audio interface for WM8731
add_instance audio altera_up_avalon_audio 18.0
set_instance_parameter_value audio {audio_in} {1}
set_instance_parameter_value audio {audio_out} {1}
set_instance_parameter_value audio {avalon_bus_type} {Memory Mapped}
set_instance_parameter_value audio {dw} {16}

# Export interfaces
add_interface clk clock sink
set_interface_property clk EXPORT_OF clk_0.clk_in

add_interface reset reset sink
set_interface_property reset EXPORT_OF clk_0.clk_in_reset

add_interface audio_config_i2c conduit end
set_interface_property audio_config_i2c EXPORT_OF audio_config.external_interface

add_interface audio_interface conduit end
set_interface_property audio_interface EXPORT_OF audio.external_interface

add_interface led_external conduit end
set_interface_property led_external EXPORT_OF led_pio.external_connection

add_interface switch_external conduit end
set_interface_property switch_external EXPORT_OF switch_pio.external_connection

add_interface key_external conduit end
set_interface_property key_external EXPORT_OF key_pio.external_connection

# Connect components
# Clock connections
add_connection clk_0.clk nios2_gen2_0.clk
add_connection clk_0.clk onchip_memory2_0.clk1
add_connection clk_0.clk audio_rom.clk1
add_connection clk_0.clk jtag_uart_0.clk
add_connection clk_0.clk timer_0.clk
add_connection clk_0.clk led_pio.clk
add_connection clk_0.clk switch_pio.clk
add_connection clk_0.clk key_pio.clk
add_connection clk_0.clk audio_config.clk
add_connection clk_0.clk audio_pll_0.ref_clk

add_connection audio_pll_0.audio_clk audio.clk

# Reset connections
add_connection clk_0.clk_reset nios2_gen2_0.reset
add_connection clk_0.clk_reset onchip_memory2_0.reset1
add_connection clk_0.clk_reset audio_rom.reset1
add_connection clk_0.clk_reset jtag_uart_0.reset
add_connection clk_0.clk_reset timer_0.reset
add_connection clk_0.clk_reset led_pio.reset
add_connection clk_0.clk_reset switch_pio.reset
add_connection clk_0.clk_reset key_pio.reset
add_connection clk_0.clk_reset audio_config.reset
add_connection clk_0.clk_reset audio_pll_0.ref_reset

add_connection audio_pll_0.reset_source audio.reset

# Nios II data master connections
add_connection nios2_gen2_0.data_master onchip_memory2_0.s1
set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 baseAddress {0x00020000}

add_connection nios2_gen2_0.data_master audio_rom.s1
set_connection_parameter_value nios2_gen2_0.data_master/audio_rom.s1 baseAddress {0x00080000}

add_connection nios2_gen2_0.data_master nios2_gen2_0.debug_mem_slave
set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00040800}

add_connection nios2_gen2_0.data_master jtag_uart_0.avalon_jtag_slave
set_connection_parameter_value nios2_gen2_0.data_master/jtag_uart_0.avalon_jtag_slave baseAddress {0x00041020}

add_connection nios2_gen2_0.data_master timer_0.s1
set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 baseAddress {0x00041000}

add_connection nios2_gen2_0.data_master led_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/led_pio.s1 baseAddress {0x00041010}

add_connection nios2_gen2_0.data_master switch_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/switch_pio.s1 baseAddress {0x00041040}

add_connection nios2_gen2_0.data_master key_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/key_pio.s1 baseAddress {0x00041050}

add_connection nios2_gen2_0.data_master audio_config.avalon_av_config_slave
set_connection_parameter_value nios2_gen2_0.data_master/audio_config.avalon_av_config_slave baseAddress {0x00041060}

add_connection nios2_gen2_0.data_master audio.avalon_audio_slave
set_connection_parameter_value nios2_gen2_0.data_master/audio.avalon_audio_slave baseAddress {0x00041070}

# Nios II instruction master connections
add_connection nios2_gen2_0.instruction_master onchip_memory2_0.s1
set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 baseAddress {0x00020000}

add_connection nios2_gen2_0.instruction_master nios2_gen2_0.debug_mem_slave
set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00040800}

# IRQ connections
add_connection nios2_gen2_0.irq jtag_uart_0.irq
set_connection_parameter_value nios2_gen2_0.irq/jtag_uart_0.irq irqNumber {0}

add_connection nios2_gen2_0.irq timer_0.irq
set_connection_parameter_value nios2_gen2_0.irq/timer_0.irq irqNumber {1}

add_connection nios2_gen2_0.irq audio.interrupt
set_connection_parameter_value nios2_gen2_0.irq/audio.interrupt irqNumber {2}

# Reset requests
add_connection nios2_gen2_0.debug_reset_request onchip_memory2_0.reset1
add_connection nios2_gen2_0.debug_reset_request audio_rom.reset1
add_connection nios2_gen2_0.debug_reset_request jtag_uart_0.reset
add_connection nios2_gen2_0.debug_reset_request timer_0.reset
add_connection nios2_gen2_0.debug_reset_request led_pio.reset
add_connection nios2_gen2_0.debug_reset_request switch_pio.reset
add_connection nios2_gen2_0.debug_reset_request key_pio.reset
add_connection nios2_gen2_0.debug_reset_request audio_config.reset
add_connection nios2_gen2_0.debug_reset_request nios2_gen2_0.reset

# Interconnect requirements
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}

save_system {audio_system.qsys}