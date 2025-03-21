# Legal Notice: (C)2025 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	audio_system_nios2_gen2_0_cpu 	audio_system_nios2_gen2_0_cpu:*
set 	audio_system_nios2_gen2_0_cpu_oci 	audio_system_nios2_gen2_0_cpu_nios2_oci:the_audio_system_nios2_gen2_0_cpu_nios2_oci
set 	audio_system_nios2_gen2_0_cpu_oci_break 	audio_system_nios2_gen2_0_cpu_nios2_oci_break:the_audio_system_nios2_gen2_0_cpu_nios2_oci_break
set 	audio_system_nios2_gen2_0_cpu_ocimem 	audio_system_nios2_gen2_0_cpu_nios2_ocimem:the_audio_system_nios2_gen2_0_cpu_nios2_ocimem
set 	audio_system_nios2_gen2_0_cpu_oci_debug 	audio_system_nios2_gen2_0_cpu_nios2_oci_debug:the_audio_system_nios2_gen2_0_cpu_nios2_oci_debug
set 	audio_system_nios2_gen2_0_cpu_wrapper 	audio_system_nios2_gen2_0_cpu_debug_slave_wrapper:the_audio_system_nios2_gen2_0_cpu_debug_slave_wrapper
set 	audio_system_nios2_gen2_0_cpu_jtag_tck 	audio_system_nios2_gen2_0_cpu_debug_slave_tck:the_audio_system_nios2_gen2_0_cpu_debug_slave_tck
set 	audio_system_nios2_gen2_0_cpu_jtag_sysclk 	audio_system_nios2_gen2_0_cpu_debug_slave_sysclk:the_audio_system_nios2_gen2_0_cpu_debug_slave_sysclk
set 	audio_system_nios2_gen2_0_cpu_oci_path 	 [format "%s|%s" $audio_system_nios2_gen2_0_cpu $audio_system_nios2_gen2_0_cpu_oci]
set 	audio_system_nios2_gen2_0_cpu_oci_break_path 	 [format "%s|%s" $audio_system_nios2_gen2_0_cpu_oci_path $audio_system_nios2_gen2_0_cpu_oci_break]
set 	audio_system_nios2_gen2_0_cpu_ocimem_path 	 [format "%s|%s" $audio_system_nios2_gen2_0_cpu_oci_path $audio_system_nios2_gen2_0_cpu_ocimem]
set 	audio_system_nios2_gen2_0_cpu_oci_debug_path 	 [format "%s|%s" $audio_system_nios2_gen2_0_cpu_oci_path $audio_system_nios2_gen2_0_cpu_oci_debug]
set 	audio_system_nios2_gen2_0_cpu_jtag_tck_path 	 [format "%s|%s|%s" $audio_system_nios2_gen2_0_cpu_oci_path $audio_system_nios2_gen2_0_cpu_wrapper $audio_system_nios2_gen2_0_cpu_jtag_tck]
set 	audio_system_nios2_gen2_0_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $audio_system_nios2_gen2_0_cpu_oci_path $audio_system_nios2_gen2_0_cpu_wrapper $audio_system_nios2_gen2_0_cpu_jtag_sysclk]
set 	audio_system_nios2_gen2_0_cpu_jtag_sr 	 [format "%s|*sr" $audio_system_nios2_gen2_0_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$audio_system_nios2_gen2_0_cpu_oci_break_path|break_readreg*] -to [get_keepers *$audio_system_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from [get_keepers *$audio_system_nios2_gen2_0_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$audio_system_nios2_gen2_0_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$audio_system_nios2_gen2_0_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$audio_system_nios2_gen2_0_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$audio_system_nios2_gen2_0_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$audio_system_nios2_gen2_0_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$audio_system_nios2_gen2_0_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$audio_system_nios2_gen2_0_cpu_jtag_sr*]
set_false_path -from *$audio_system_nios2_gen2_0_cpu_jtag_sr*    -to *$audio_system_nios2_gen2_0_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$audio_system_nios2_gen2_0_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$audio_system_nios2_gen2_0_cpu_oci_debug_path|monitor_go
