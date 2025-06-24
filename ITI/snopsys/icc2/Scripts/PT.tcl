# PT script

pt_shell


#assign search path  
set_app_var search_path "/home/user41/Student_PDK/LIB"

#assign target & Link  library 
set_app_var target_library "saed90nm_max_lth.db"

set_app_var link_library "* $target_library"

# Netlist Reading from ICC2
read_verilog /home/user41/Elgammal/j3/Johnson_V2/outputs/johnson.v
#read_verilog /home/user41/Elgammal/j3/Johnson_V2/pnr/output/johnson_Routing_Netlist.v
link_design

# Reading parasitics & constrains
#read_parasitics  /home/user41/Elgammal/j3/Johnson_V2/pnr/output/johnson_Routing_Spef.spef.maxTLU_-40.spef
#read_sdc /home/user41/Elgammal/j3/Johnson_V2/pnr/output/johnson_Routing_SDC.sdc
read_sdc /home/user41/Elgammal/j3/Johnson_V2/outputs/johnson.sdc
update_timing

# Checks 

report_timing
report_analysis_coverage
report_global_timing
report_clocks

report_constraint -all_violators -significant_digits 4 > ../output/johnson.max_constr.rpt
report_timing -delay_type max -nworst 40 -significant_digits 4 > ../output/johnson.max_timing.rpt

write_sdf ../output/johnson.max.sdf
