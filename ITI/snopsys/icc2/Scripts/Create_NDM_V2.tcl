# --------------- NDM Script_Created by icc2_lm_shell  --------------- # 

# ---------------- Create_Workspace ---------------- #
create_workspace -flow exploration -technology /home/user41/Elgammal/Summer/synthesis/LIB/Lib/process/astro/tech/astroTechFile.tf ndmtest

# ---------------- Change_Options ---------------- #
set_app_options -list {lib.workspace.keep_all_physical_cells {true}}
set_app_options -list {design.enable_lib_cell_editing {mutable}}
set_app_options -list {lib.workspace.save_design_views {true}}
set_app_options -list {lib.workspace.save_layout_views {true}}

# ---------------- read file.db ---------------- # 
read_db { /home/user41/Elgammal/Summer/synthesis/LIB/Lib/synopsys/models/saed90nm_max_lth.db }

# ---------------- read file.lef ---------------- # 
read_lef /home/user41/Elgammal/Summer/synthesis/LIB/Lib/lef/saed90nmEditted.lef

# ---------------- create group ---------------- #
group_libs

# ---------------- create the ndm ---------------- #
process_workspaces  -directory /home/user41/Elgammal/Johnson_V2/ndm






