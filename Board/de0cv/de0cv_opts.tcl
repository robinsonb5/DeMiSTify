
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CEBA4F23C7
set_global_assignment -name TOP_LEVEL_ENTITY de0cv_top
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 17.1.0
set_global_assignment -name LAST_QUARTUS_VERSION "17.1.0 Lite Edition"
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA


set_global_assignment -name OPTIMIZATION_TECHNIQUE AREA
set_global_assignment -name SYNTH_TIMING_DRIVEN_SYNTHESIS ON
set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS"
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name FITTER_EFFORT "STANDARD FIT"
set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "ACTIVE SERIAL X1"
set_global_assignment -name USE_CONFIGURATION_DEVICE ON
set_global_assignment -name STRATIXII_CONFIGURATION_DEVICE EPCS64
set_global_assignment -name CRC_ERROR_OPEN_DRAIN ON
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall
set_global_assignment -name ACTIVE_SERIAL_CLOCK FREQ_100MHZ
set_global_assignment -name BOARD "DE0-CV Development Board"
set_global_assignment -name PROJECT_IP_REGENERATION_POLICY ALWAYS_REGENERATE_IP
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
#set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE AREA"
set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
set_global_assignment -name TIMING_ANALYZER_MULTICORNER_ANALYSIS ON
set_global_assignment -name SMART_RECOMPILE ON


set_global_assignment -name NUM_PARALLEL_PROCESSORS ALL
#set_global_assignment -name SEED 1
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name CYCLONEIII_CONFIGURATION_DEVICE AUTO


set_global_assignment -name GENERATE_RBF_FILE ON
set_global_assignment -name ON_CHIP_BITSTREAM_DECOMPRESSION OFF

if {[info exists optimizeforspeed] && ($optimizeforspeed==1)} {
	set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE SPEED
} else {
	set_global_assignment -name OPTIMIZATION_MODE BALANCED
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE BALANCED
}


set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

