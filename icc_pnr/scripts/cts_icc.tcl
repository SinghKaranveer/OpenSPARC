###########################################################################
### Clock Tree Synthesis
###########################################################################

##In the Layout window, click on "Clock ", you will see various options, you can set any of the options to run CTS. If you click on Clock ' Core CTS and Optimization

##Save the Cell and report timing

clock_opt -clock_trees {ideal_clock1}
route_zrt_group -all_clock_nets

save_mw_cel -as s386_cts
report_placement_utilization > reports/s386_cts_util.rpt
report_qor_snapshot > reports/s386_cts_qor_snapshot.rpt
report_qor > reports/s386_cts_qor.rpt

