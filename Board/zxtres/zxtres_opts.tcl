set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE55F23C8
set_global_assignment -name TOP_LEVEL_ENTITY zxtres_top
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 17.1.0
set_global_assignment -name LAST_QUARTUS_VERSION "17.1.0 Lite Edition"
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 484
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6
set_global_assignment -name NUM_PARALLEL_PROCESSORS ALL

set_global_assignment -name ENABLE_OCT_DONE OFF
set_global_assignment -name EXTERNAL_FLASH_FALLBACK_ADDRESS 00000000
set_global_assignment -name STRATIXV_CONFIGURATION_SCHEME "PASSIVE SERIAL"
set_global_assignment -name USE_CONFIGURATION_DEVICE OFF
set_global_assignment -name INTERNAL_FLASH_UPDATE_MODE "SINGLE IMAGE WITH ERAM"
set_global_assignment -name CRC_ERROR_OPEN_DRAIN OFF
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -rise
set_global_assignment -name OUTPUT_IO_TIMING_NEAR_END_VMEAS "HALF VCCIO" -fall
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -rise
set_global_assignment -name OUTPUT_IO_TIMING_FAR_END_VMEAS "HALF SIGNAL SWING" -fall


if {[info exists optimizeforspeed] && ($optimizeforspeed==1)} {
	set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE SPEED
} else {
	set_global_assignment -name OPTIMIZATION_MODE BALANCED
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE BALANCED
}

set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top

set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

