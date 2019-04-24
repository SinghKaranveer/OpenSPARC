###########################################################################
### Placement
###########################################################################

set_buffer_opt_strategy -effort low

set_tlu_plus_files -max_tluplus /mnt/class_data/ecec574-w2019/PDKs/SAED32nm_new/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus -min_tluplus /mnt/class_data/ecec574-w2019/PDKs/SAED32nm_new/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus -tech2itf_map /mnt/class_data/ecec574-w2019/PDKs/SAED32nm_new/SAED32_EDK/tech/star_rcxt/saed32nm_tf_itf_tluplus.map

##Goto Layout Window , Placement ' Core Placement and Optimization .  A new window opens up as shown below . There are various options, you can click on what ever option you want and say ok. The tool will do the placement. Alternatively you can also run at the command at icc_shell . Below is example with congestion option.


place_opt -congestion

save_mw_cel -as fpu_place

### Reports 

report_placement_utilization > output/fpu_place_util.rpt
report_qor_snapshot > output/fpu_place_qor_snapshot.rpt
report_qor > output/fpu_place_qor.rpt

### Timing Report

report_timing -delay max -max_paths 20 > output/fpu_place.setup.rpt
report_timing -delay min -max_paths 20 > output/fpu_place.hold.rpt
report_clock_tree -summary > reports/fpu_place.clock.rpt
report_power > reports/fpu_place.power.rpt
