# -------------------------- Setup_file -------------------------- # 

# ----------- Search_path
set search_path "/mnt/ext/synopsys/pdks/32nm/install/edu/SAED32_EDK/lib/stdcell_rvt/SAED32_EDK/lib/stdcell_rvt/db_nldm"


# ----------- Link and Target library 
#set_app_var link_library "* NangateOpenCellLibrary_ss0p95vn40c.db"
#set_app_var target_library "NangateOpenCellLibrary_ss0p95vn40c.db"

set_app_var link_library "* saed14rvt_tt0p6v125c.db" 

set_app_var target_library "saed14rvt_tt0p6v125c.db"
start_gui
#List_Valid = { saed14rvt_tt0p6v125c ,  saed14rvt_ss0p72vm40c , } 
# ---------- Work_dir
sh rm -rf work
sh mkdir -p work


# ---------- Assign Top module in Variable design 
set design johnson



# -------------------- Read_file -----------------#
analyze -library work -format verilog ../RTL/${design}.v
elaborate $design -lib work

# --------------- Define_Current_Top_Design --------------- #  
current_design  $design

# --------------- linking  --------------- # 
link

# --------------- Checking  --------------- # 
check_design

# ------- Constarints_file ---------- #
source ../Cons/cons.tcl  


# -------------- Compiling ----------------- #   
compile -map_effort medium ; #Mappig and oPtimization 
# --------------- Outputs ----------------- #
# -------- Launch_GUI 
#start_gui
# ---------- Gate Level Netlist {.v , .ddc } (direct design compiler) 
write -hierarchy -format verilog -output ../output/${design}.v 
write -f ddc -hierarchy -output ../output/${design}.ddc   

# ---------- SDC(Synopsys Design Constraints) File
write_sdc  ../output/${design}.sdc 
 
# ---------- SDF(Standard Delay Format) File
write_sdf Johnson.sdf

# ----------- Reports ----------- #  
report_area > ../report/synth_area.rpt
report_cell > ../report/synth_cells.rpt
report_qor  > ../report/synth_qor.rpt
report_resources > ../report/synth_resources.rpt
report_timing -max_paths 10 > ../report/synth_timing.rpt 



exit
