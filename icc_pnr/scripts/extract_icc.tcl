###########################################################################
### Extraction
###########################################################################

##Go to Layout Window, Route -> Extract RC, it opens up a new window as shown below, click ok. Alternatively, you can run this script on the ICC shell:

extract_rc  -coupling_cap  -routed_nets_only  -incremental

##write parasitic to a file for delay calculations tools (e.g PrimeTime).
write_parasitics -output ./output/fpu_extracted.spef -format SPEF

##Write Standard Delay Format (SDF) back-annotation file
write_sdf ./output/fpu_extracted.sdf

##Write out a script in Synopsys Design Constraints format
write_sdc ./output/fpu_extracted.sdc

##Write out a hierarchical Verilog file for the current design, extracted from layout
write_verilog ./output/fpu_extracted.v

##Save the cel and report timing
report_clock_tree -summary > reports/fpu_extracted.clock.rpt
report_power > reports/fpu_extracted.power.rpt
report_area > reports/fpu_extracted.area.rpt
report_cell > reports/fpu_extracted.cell.rpt

save_mw_cel -as fpu_extracted

