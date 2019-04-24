###### Pre-Layout PrimeTime Script ######

## Define the library location
set link_library [ list /mnt/class_data/ecec574-w2019/PDKs/SAED32nm/lib/stdcell_rvt/db_ccs/saed32rvt_ss0p95v125c.db /mnt/class_data/ecec574-w2019/PDKs/SAED32nm/lib/stdcell_rvt/db_ccs/saed32rvt_ss0p95v25c.db /mnt/class_data/ecec574-w2019/PDKs/SAED32nm/lib/stdcell_rvt/db_ccs/saed32rvt_ss0p95vn40c.db]

set target_library [ list /mnt/class_data/ecec574-w2019/PDKs/SAED32nm/lib/stdcell_rvt/db_ccs/saed32rvt_ss0p95v25c.db ]

set link_path "* /mnt/class_data/ecec574-w2019/PDKs/SAED32nm/lib/stdcell_rvt/db_ccs/saed32rvt_ss0p95v25c.db" 
## read the verilog files
read_verilog /home/ks3379@drexel.edu/ecec574/src_assignment/dc_synth/output/s9234.v 
#../dc_synth/output/s9234.v

set link_create_black_boxes false

link_design

read_ddc ../dc_synth/output/s9234.ddc
## Set top module name

current_design s9234

## Read in SDC from the synthesis
source ../dc_synth/const/s9234.sdc
report_design

report_reference

## Analysis reports

report_timing -from [all_inputs] -max_paths 100 -to [all_registers -data_pins] -slack_lesser_than 100  > reports/timing9234.rpt
report_timing -from [all_register -clock_pins] -max_paths 100 -to [all_registers -data_pins] -slack_lesser_than 100   >> reports/timing9234.rpt
report_timing -from [all_registers -clock_pins] -max_paths 100 -to [all_outputs] -slack_lesser_than 100 >> reports/timing9234.rpt
report_timing -from [all_inputs] -to [all_outputs] -max_paths 100 -slack_lesser_than 100 >> reports/timing9234.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type max -slack_lesser_than 100  >> reports/timing9234.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type min -slack_lesser_than 100  >> reports/timing9234.rpt

report_timing -transition_time -capacitance -nets -input_pins -from [all_registers -clock_pins] -to [all_registers -data_pins]  > reports/timing.tran.cap9234.rpt


## Save outputs
save_session output/s9234.session

exit
