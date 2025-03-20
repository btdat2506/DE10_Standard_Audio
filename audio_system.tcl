# qsys scripting (.tcl) file for audio_system
package require -exact qsys 16.0

create_system {audio_system}

set_project_property DEVICE_FAMILY {Cyclone V}
set_project_property DEVICE {5CSXFC6D6F31C6}
set_project_property HIDE_FROM_IP_CATALOG {false}

# Instances and instance parameters
# (disabled instances are intentionally culled)
add_instance audio altera_up_avalon_audio 18.0
set_instance_parameter_value audio {audio_in} {1}
set_instance_parameter_value audio {audio_out} {1}
set_instance_parameter_value audio {avalon_bus_type} {Memory Mapped}
set_instance_parameter_value audio {dw} {16}

add_instance audio_config altera_up_avalon_audio_and_video_config 18.0
set_instance_parameter_value audio_config {audio_in} {Line In to ADC}
set_instance_parameter_value audio_config {bit_length} {16}
set_instance_parameter_value audio_config {board} {DE10-Standard}
set_instance_parameter_value audio_config {d5m_resolution} {2592 x 1944}
set_instance_parameter_value audio_config {dac_enable} {1}
set_instance_parameter_value audio_config {data_format} {Left Justified}
set_instance_parameter_value audio_config {device} {On-Board Peripherals}
set_instance_parameter_value audio_config {eai} {1}
set_instance_parameter_value audio_config {exposure} {0}
set_instance_parameter_value audio_config {line_in_bypass} {0}
set_instance_parameter_value audio_config {mic_attenuation} {-6dB}
set_instance_parameter_value audio_config {mic_bypass} {0}
set_instance_parameter_value audio_config {sampling_rate} {48 kHz}
set_instance_parameter_value audio_config {video_format} {NTSC}

add_instance audio_pll_0 altera_up_avalon_audio_pll 18.0
set_instance_parameter_value audio_pll_0 {audio_clk_freq} {12.288}
set_instance_parameter_value audio_pll_0 {gui_refclk} {50.0}

add_instance audio_rom altera_avalon_onchip_memory2 23.1
set_instance_parameter_value audio_rom {allowInSystemMemoryContentEditor} {0}
set_instance_parameter_value audio_rom {blockType} {AUTO}
set_instance_parameter_value audio_rom {copyInitFile} {0}
set_instance_parameter_value audio_rom {dataWidth} {16}
set_instance_parameter_value audio_rom {dataWidth2} {32}
set_instance_parameter_value audio_rom {dualPort} {0}
set_instance_parameter_value audio_rom {ecc_enabled} {0}
set_instance_parameter_value audio_rom {enPRInitMode} {0}
set_instance_parameter_value audio_rom {enableDiffWidth} {0}
set_instance_parameter_value audio_rom {initMemContent} {1}
set_instance_parameter_value audio_rom {initializationFileName} {audio_data.mif}
set_instance_parameter_value audio_rom {instanceID} {NONE}
set_instance_parameter_value audio_rom {memorySize} {240254.0}
set_instance_parameter_value audio_rom {readDuringWriteMode} {DONT_CARE}
set_instance_parameter_value audio_rom {resetrequest_enabled} {1}
set_instance_parameter_value audio_rom {simAllowMRAMContentsFile} {0}
set_instance_parameter_value audio_rom {simMemInitOnlyFilename} {0}
set_instance_parameter_value audio_rom {singleClockOperation} {0}
set_instance_parameter_value audio_rom {slave1Latency} {1}
set_instance_parameter_value audio_rom {slave2Latency} {1}
set_instance_parameter_value audio_rom {useNonDefaultInitFile} {1}
set_instance_parameter_value audio_rom {useShallowMemBlocks} {0}
set_instance_parameter_value audio_rom {writable} {0}

add_instance clk_0 clock_source 23.1
set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}

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
set_instance_parameter_value key_pio {width} {32}

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
set_instance_parameter_value led_pio {width} {32}

add_instance nios2_gen2_0 altera_nios2_gen2 23.1
set_instance_parameter_value nios2_gen2_0 {bht_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {breakOffset} {32}
set_instance_parameter_value nios2_gen2_0 {breakSlave} {None}
set_instance_parameter_value nios2_gen2_0 {cdx_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {cpuArchRev} {1}
set_instance_parameter_value nios2_gen2_0 {cpuID} {0}
set_instance_parameter_value nios2_gen2_0 {cpuReset} {0}
set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {data_master_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {data_master_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {dcache_bursts} {false}
set_instance_parameter_value nios2_gen2_0 {dcache_numTCDM} {0}
set_instance_parameter_value nios2_gen2_0 {dcache_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {dcache_size} {2048}
set_instance_parameter_value nios2_gen2_0 {dcache_tagramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {dcache_victim_buf_impl} {ram}
set_instance_parameter_value nios2_gen2_0 {debug_OCIOnchipTrace} {_128}
set_instance_parameter_value nios2_gen2_0 {debug_assignJtagInstanceID} {0}
set_instance_parameter_value nios2_gen2_0 {debug_datatrigger} {0}
set_instance_parameter_value nios2_gen2_0 {debug_debugReqSignals} {0}
set_instance_parameter_value nios2_gen2_0 {debug_enabled} {1}
set_instance_parameter_value nios2_gen2_0 {debug_hwbreakpoint} {0}
set_instance_parameter_value nios2_gen2_0 {debug_jtagInstanceID} {0}
set_instance_parameter_value nios2_gen2_0 {debug_traceStorage} {onchip_trace}
set_instance_parameter_value nios2_gen2_0 {debug_traceType} {none}
set_instance_parameter_value nios2_gen2_0 {debug_triggerArming} {1}
set_instance_parameter_value nios2_gen2_0 {dividerType} {no_div}
set_instance_parameter_value nios2_gen2_0 {exceptionOffset} {32}
set_instance_parameter_value nios2_gen2_0 {exceptionSlave} {onchip_memory2_0.s1}
set_instance_parameter_value nios2_gen2_0 {fa_cache_line} {2}
set_instance_parameter_value nios2_gen2_0 {fa_cache_linesize} {0}
set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {icache_burstType} {None}
set_instance_parameter_value nios2_gen2_0 {icache_numTCIM} {0}
set_instance_parameter_value nios2_gen2_0 {icache_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {icache_size} {4096}
set_instance_parameter_value nios2_gen2_0 {icache_tagramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {impl} {Tiny}
set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {io_regionbase} {0}
set_instance_parameter_value nios2_gen2_0 {io_regionsize} {0}
set_instance_parameter_value nios2_gen2_0 {master_addr_map} {0}
set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcOffset} {0}
set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcSlave} {None}
set_instance_parameter_value nios2_gen2_0 {mmu_autoAssignTlbPtrSz} {1}
set_instance_parameter_value nios2_gen2_0 {mmu_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {mmu_processIDNumBits} {8}
set_instance_parameter_value nios2_gen2_0 {mmu_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {mmu_tlbNumWays} {16}
set_instance_parameter_value nios2_gen2_0 {mmu_tlbPtrSz} {7}
set_instance_parameter_value nios2_gen2_0 {mmu_udtlbNumEntries} {6}
set_instance_parameter_value nios2_gen2_0 {mmu_uitlbNumEntries} {4}
set_instance_parameter_value nios2_gen2_0 {mpu_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {mpu_minDataRegionSize} {12}
set_instance_parameter_value nios2_gen2_0 {mpu_minInstRegionSize} {12}
set_instance_parameter_value nios2_gen2_0 {mpu_numOfDataRegion} {8}
set_instance_parameter_value nios2_gen2_0 {mpu_numOfInstRegion} {8}
set_instance_parameter_value nios2_gen2_0 {mpu_useLimit} {0}
set_instance_parameter_value nios2_gen2_0 {mpx_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {mul_32_impl} {2}
set_instance_parameter_value nios2_gen2_0 {mul_64_impl} {0}
set_instance_parameter_value nios2_gen2_0 {mul_shift_choice} {0}
set_instance_parameter_value nios2_gen2_0 {ocimem_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {ocimem_ramInit} {0}
set_instance_parameter_value nios2_gen2_0 {regfile_ramBlockType} {Automatic}
set_instance_parameter_value nios2_gen2_0 {register_file_por} {0}
set_instance_parameter_value nios2_gen2_0 {resetOffset} {0}
set_instance_parameter_value nios2_gen2_0 {resetSlave} {onchip_memory2_0.s1}
set_instance_parameter_value nios2_gen2_0 {resetrequest_enabled} {1}
set_instance_parameter_value nios2_gen2_0 {setting_HBreakTest} {0}
set_instance_parameter_value nios2_gen2_0 {setting_HDLSimCachesCleared} {1}
set_instance_parameter_value nios2_gen2_0 {setting_activateMonitors} {1}
set_instance_parameter_value nios2_gen2_0 {setting_activateTestEndChecker} {0}
set_instance_parameter_value nios2_gen2_0 {setting_activateTrace} {0}
set_instance_parameter_value nios2_gen2_0 {setting_allow_break_inst} {0}
set_instance_parameter_value nios2_gen2_0 {setting_alwaysEncrypt} {1}
set_instance_parameter_value nios2_gen2_0 {setting_asic_add_scan_mode_input} {0}
set_instance_parameter_value nios2_gen2_0 {setting_asic_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {setting_asic_synopsys_translate_on_off} {0}
set_instance_parameter_value nios2_gen2_0 {setting_asic_third_party_synthesis} {0}
set_instance_parameter_value nios2_gen2_0 {setting_avalonDebugPortPresent} {0}
set_instance_parameter_value nios2_gen2_0 {setting_bhtPtrSz} {8}
set_instance_parameter_value nios2_gen2_0 {setting_bigEndian} {0}
set_instance_parameter_value nios2_gen2_0 {setting_branchpredictiontype} {Dynamic}
set_instance_parameter_value nios2_gen2_0 {setting_breakslaveoveride} {0}
set_instance_parameter_value nios2_gen2_0 {setting_clearXBitsLDNonBypass} {1}
set_instance_parameter_value nios2_gen2_0 {setting_dc_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_disable_tmr_inj} {0}
set_instance_parameter_value nios2_gen2_0 {setting_disableocitrace} {0}
set_instance_parameter_value nios2_gen2_0 {setting_dtcm_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_ecc_present} {0}
set_instance_parameter_value nios2_gen2_0 {setting_ecc_sim_test_ports} {0}
set_instance_parameter_value nios2_gen2_0 {setting_exportHostDebugPort} {0}
set_instance_parameter_value nios2_gen2_0 {setting_exportPCB} {0}
set_instance_parameter_value nios2_gen2_0 {setting_export_large_RAMs} {0}
set_instance_parameter_value nios2_gen2_0 {setting_exportdebuginfo} {0}
set_instance_parameter_value nios2_gen2_0 {setting_exportvectors} {0}
set_instance_parameter_value nios2_gen2_0 {setting_fast_register_read} {0}
set_instance_parameter_value nios2_gen2_0 {setting_ic_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_interruptControllerType} {Internal}
set_instance_parameter_value nios2_gen2_0 {setting_itcm_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_mmu_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_oci_export_jtag_signals} {0}
set_instance_parameter_value nios2_gen2_0 {setting_oci_version} {1}
set_instance_parameter_value nios2_gen2_0 {setting_preciseIllegalMemAccessException} {0}
set_instance_parameter_value nios2_gen2_0 {setting_removeRAMinit} {0}
set_instance_parameter_value nios2_gen2_0 {setting_rf_ecc_present} {1}
set_instance_parameter_value nios2_gen2_0 {setting_shadowRegisterSets} {0}
set_instance_parameter_value nios2_gen2_0 {setting_showInternalSettings} {0}
set_instance_parameter_value nios2_gen2_0 {setting_showUnpublishedSettings} {0}
set_instance_parameter_value nios2_gen2_0 {setting_support31bitdcachebypass} {1}
set_instance_parameter_value nios2_gen2_0 {setting_tmr_output_disable} {0}
set_instance_parameter_value nios2_gen2_0 {setting_usedesignware} {0}
set_instance_parameter_value nios2_gen2_0 {shift_rot_impl} {1}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_base} {0}
set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_size} {0.0}
set_instance_parameter_value nios2_gen2_0 {tmr_enabled} {0}
set_instance_parameter_value nios2_gen2_0 {tracefilename} {}
set_instance_parameter_value nios2_gen2_0 {userDefinedSettings} {}

add_instance onchip_memory2_0 altera_avalon_onchip_memory2 23.1
set_instance_parameter_value onchip_memory2_0 {allowInSystemMemoryContentEditor} {0}
set_instance_parameter_value onchip_memory2_0 {blockType} {AUTO}
set_instance_parameter_value onchip_memory2_0 {copyInitFile} {0}
set_instance_parameter_value onchip_memory2_0 {dataWidth} {32}
set_instance_parameter_value onchip_memory2_0 {dataWidth2} {32}
set_instance_parameter_value onchip_memory2_0 {dualPort} {0}
set_instance_parameter_value onchip_memory2_0 {ecc_enabled} {0}
set_instance_parameter_value onchip_memory2_0 {enPRInitMode} {0}
set_instance_parameter_value onchip_memory2_0 {enableDiffWidth} {0}
set_instance_parameter_value onchip_memory2_0 {initMemContent} {1}
set_instance_parameter_value onchip_memory2_0 {initializationFileName} {onchip_mem.hex}
set_instance_parameter_value onchip_memory2_0 {instanceID} {NONE}
set_instance_parameter_value onchip_memory2_0 {memorySize} {32767.0}
set_instance_parameter_value onchip_memory2_0 {readDuringWriteMode} {DONT_CARE}
set_instance_parameter_value onchip_memory2_0 {resetrequest_enabled} {1}
set_instance_parameter_value onchip_memory2_0 {simAllowMRAMContentsFile} {0}
set_instance_parameter_value onchip_memory2_0 {simMemInitOnlyFilename} {0}
set_instance_parameter_value onchip_memory2_0 {singleClockOperation} {0}
set_instance_parameter_value onchip_memory2_0 {slave1Latency} {1}
set_instance_parameter_value onchip_memory2_0 {slave2Latency} {1}
set_instance_parameter_value onchip_memory2_0 {useNonDefaultInitFile} {0}
set_instance_parameter_value onchip_memory2_0 {useShallowMemBlocks} {0}
set_instance_parameter_value onchip_memory2_0 {writable} {1}

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
set_instance_parameter_value switch_pio {width} {32}

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

# exported interfaces
add_interface audio_config_i2c conduit end
set_interface_property audio_config_i2c EXPORT_OF audio_config.external_interface
add_interface audio_interface conduit end
set_interface_property audio_interface EXPORT_OF audio.external_interface
add_interface clk clock sink
set_interface_property clk EXPORT_OF clk_0.clk_in
add_interface key_external conduit end
set_interface_property key_external EXPORT_OF key_pio.external_connection
add_interface led_external conduit end
set_interface_property led_external EXPORT_OF led_pio.external_connection
add_interface reset reset sink
set_interface_property reset EXPORT_OF clk_0.clk_in_reset
add_interface switch_external conduit end
set_interface_property switch_external EXPORT_OF switch_pio.external_connection

# connections and connection parameters
add_connection audio_pll_0.audio_clk audio.clk

add_connection audio_pll_0.reset_source audio.reset

add_connection clk_0.clk audio_config.clk

add_connection clk_0.clk audio_pll_0.ref_clk

add_connection clk_0.clk audio_rom.clk1

add_connection clk_0.clk jtag_uart_0.clk

add_connection clk_0.clk key_pio.clk

add_connection clk_0.clk led_pio.clk

add_connection clk_0.clk nios2_gen2_0.clk

add_connection clk_0.clk onchip_memory2_0.clk1

add_connection clk_0.clk switch_pio.clk

add_connection clk_0.clk timer_0.clk

add_connection clk_0.clk_reset audio_config.reset

add_connection clk_0.clk_reset audio_pll_0.ref_reset

add_connection clk_0.clk_reset audio_rom.reset1

add_connection clk_0.clk_reset jtag_uart_0.reset

add_connection clk_0.clk_reset key_pio.reset

add_connection clk_0.clk_reset led_pio.reset

add_connection clk_0.clk_reset nios2_gen2_0.reset

add_connection clk_0.clk_reset onchip_memory2_0.reset1

add_connection clk_0.clk_reset switch_pio.reset

add_connection clk_0.clk_reset timer_0.reset

add_connection nios2_gen2_0.data_master audio.avalon_audio_slave
set_connection_parameter_value nios2_gen2_0.data_master/audio.avalon_audio_slave arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/audio.avalon_audio_slave baseAddress {0x00101060}
set_connection_parameter_value nios2_gen2_0.data_master/audio.avalon_audio_slave defaultConnection {0}

add_connection nios2_gen2_0.data_master audio_config.avalon_av_config_slave
set_connection_parameter_value nios2_gen2_0.data_master/audio_config.avalon_av_config_slave arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/audio_config.avalon_av_config_slave baseAddress {0x00101050}
set_connection_parameter_value nios2_gen2_0.data_master/audio_config.avalon_av_config_slave defaultConnection {0}

add_connection nios2_gen2_0.data_master audio_rom.s1
set_connection_parameter_value nios2_gen2_0.data_master/audio_rom.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/audio_rom.s1 baseAddress {0x0000}
set_connection_parameter_value nios2_gen2_0.data_master/audio_rom.s1 defaultConnection {0}

add_connection nios2_gen2_0.data_master jtag_uart_0.avalon_jtag_slave
set_connection_parameter_value nios2_gen2_0.data_master/jtag_uart_0.avalon_jtag_slave arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/jtag_uart_0.avalon_jtag_slave baseAddress {0x00101070}
set_connection_parameter_value nios2_gen2_0.data_master/jtag_uart_0.avalon_jtag_slave defaultConnection {0}

add_connection nios2_gen2_0.data_master key_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/key_pio.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/key_pio.s1 baseAddress {0x00101020}
set_connection_parameter_value nios2_gen2_0.data_master/key_pio.s1 defaultConnection {0}

add_connection nios2_gen2_0.data_master led_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/led_pio.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/led_pio.s1 baseAddress {0x00101040}
set_connection_parameter_value nios2_gen2_0.data_master/led_pio.s1 defaultConnection {0}

add_connection nios2_gen2_0.data_master nios2_gen2_0.debug_mem_slave
set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00100800}
set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

add_connection nios2_gen2_0.data_master onchip_memory2_0.s1
set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 baseAddress {0x000c0000}
set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 defaultConnection {0}

add_connection nios2_gen2_0.data_master switch_pio.s1
set_connection_parameter_value nios2_gen2_0.data_master/switch_pio.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/switch_pio.s1 baseAddress {0x00101030}
set_connection_parameter_value nios2_gen2_0.data_master/switch_pio.s1 defaultConnection {0}

add_connection nios2_gen2_0.data_master timer_0.s1
set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 baseAddress {0x00101000}
set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 defaultConnection {0}

add_connection nios2_gen2_0.debug_reset_request audio_config.reset

add_connection nios2_gen2_0.debug_reset_request audio_rom.reset1

add_connection nios2_gen2_0.debug_reset_request jtag_uart_0.reset

add_connection nios2_gen2_0.debug_reset_request key_pio.reset

add_connection nios2_gen2_0.debug_reset_request led_pio.reset

add_connection nios2_gen2_0.debug_reset_request nios2_gen2_0.reset

add_connection nios2_gen2_0.debug_reset_request onchip_memory2_0.reset1

add_connection nios2_gen2_0.debug_reset_request switch_pio.reset

add_connection nios2_gen2_0.debug_reset_request timer_0.reset

add_connection nios2_gen2_0.instruction_master nios2_gen2_0.debug_mem_slave
set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00100800}
set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

add_connection nios2_gen2_0.instruction_master onchip_memory2_0.s1
set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 arbitrationPriority {1}
set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 baseAddress {0x000c0000}
set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 defaultConnection {0}

add_connection nios2_gen2_0.irq audio.interrupt
set_connection_parameter_value nios2_gen2_0.irq/audio.interrupt irqNumber {2}

add_connection nios2_gen2_0.irq jtag_uart_0.irq
set_connection_parameter_value nios2_gen2_0.irq/jtag_uart_0.irq irqNumber {0}

add_connection nios2_gen2_0.irq timer_0.irq
set_connection_parameter_value nios2_gen2_0.irq/timer_0.irq irqNumber {1}

# interconnect requirements
set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}

save_system {audio_system.qsys}
