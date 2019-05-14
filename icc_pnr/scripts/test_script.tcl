# Set up P/G connections
derive_pg_connection -power_net VDD -power_pin
VDD -ground_net VSS \
-ground_pin VSS
# Check P/G connections
check_mv_design -power_nets
#floorplan
initialize_floorplan\
 -core_utilization 0.8\
 -core_aspect_ratio 1.0 \
 -start_first_row\
 -flip_first_row\
 -left_io2core 50\
 -bottom_io2core 50\
 -right_io2core 50\
 -top_io2core 50
# Create FP Placement
create_fp_placement -timing_driven \
-no_hierarchy_gravity
# Power Network
# Set Ring Constraints
set_fp_rail_constraints -set_ring -nets {VDD VSS} \
-horizontal_ring_layer {M5} -vertical_ring_layer {M4} \
-ring_width 1 -extend_strap boundary
# Synthesize Power Network
synthesize_fp_rail -nets {VDD VSS} -
synthesize_power_plan -analyze_power
-power_budget 1 -use_strap_ends_as_pads
# Commit PN
commit_fp_rail
# Hook up pins to macros and create standard
cell rails
preroute_instances
preroute_standard_cells -fill_empty_rows \
-remove_floating_pieces
# global routing
route_zrt_global
# Fix Timing and Design Rule errors
optimize_fp_timing -fix_design_rule
# Placement
# Placement
place_opt -area_recovery
# Incremental Logic Optimization
psynopt -area_recovery
# CTS
clock_opt -only_cts -no_clock_route
clock_opt -only_psyn -no_clock_route
# Set up clock tree
set_delay_calculation -clock_arnoldi
check_clock_tree
clock_opt -only_cts -no_clock_route
set_fix_hold [all_clocks]
set physopt_area_critical_range 0.2
extract_rc
clock_opt -only_psyn -area_recovery -
optimize_dft \
-no_clock_route
route_zrt_group -all_clock_nets -
reuse_existing_global_route true
# ROUTE
report_constraints -all
all_ideal_nets
all_high_fanout -nets -threshold 501
check_legality
verify_pg_nets
route_opt -initial_route_only
route_opt -skip_initial_route
derive_pg_connection -power_net VDD -
power_pin VDD -ground_net VSS -ground_pin
VSS
derive_pg_connection -power_net VDD -
ground_net VSS -tie
verify_zrt_route
verify_lvs
