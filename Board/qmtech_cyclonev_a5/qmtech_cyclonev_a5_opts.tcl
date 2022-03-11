set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CEFA5F23I7
set_global_assignment -name ORIGINAL_QUARTUS_VERSION 13
set_global_assignment -name LAST_QUARTUS_VERSION "18.1.0 Lite Edition"
set_global_assignment -name PROJECT_CREATION_TIME_DATE "MON MAY  5 11:54:18 2014"
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
set_global_assignment -name STRATIX_DEVICE_IO_STANDARD "3.3-V LVTTL"
set_global_assignment -name OPTIMIZE_HOLD_TIMING "ALL PATHS"
set_global_assignment -name OPTIMIZE_MULTI_CORNER_TIMING ON
set_global_assignment -name FITTER_EFFORT "STANDARD FIT"

if {[info exists optimizeforspeed] && ($optimizeforspeed==1)} {
	set_global_assignment -name OPTIMIZATION_MODE "AGGRESSIVE PERFORMANCE"
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE SPEED
} else {
	set_global_assignment -name OPTIMIZATION_MODE BALANCED
	set_global_assignment -name CYCLONEII_OPTIMIZATION_TECHNIQUE BALANCED
}

set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files

