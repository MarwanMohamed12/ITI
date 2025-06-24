# --------------------------- Floorplan --------------------------- #

# --------------------------- Open_Block --------------------------- #
#open_block /home/user41/Elgammal/Johnson_V2/outputs/johnson_getch.v/johnson_getch.v


# --------------------------- Parasitic Parameters --------------------------- #
set_parasitic_parameters -late_spec maxTLU   -early_spec minTLU

# ---------------------------Initialization_floorplan --------------------------- #
#side ratio : Aspect Ratio {Width Height} 
initialize_floorplan -core_utilization 0.6 -side_ratio {1 1}

# ---------------------------Place_Blockage --------------------------- #
set_app_options -name place.coarse.fix_hard_macros -value false
set_app_options -name plan.place.auto_create_blockages -value auto


# ---------------------------Implement_Floorplanning --------------------------- #
create_placement -floorplan

# --------------------------- Pins_constraint --------------------------- #
create_block_pin_constraint -allowed_layers {M3 M4 M5 M6}

set_app_options -name plan.pins.incremental -value false -block [current_block]

place_pins -self

check_pg_drc

# --------------------------- outputs --------------------------- #

save_block -as Foorplanning johnson.dlib:johnson.design

write_verilog   /home/user41/Elgammal/Johnson_V2/pnr/output/Floor_Plan/FloorPlanning_Netlist.v

# 9- close block

#close_blocks -force -purge power_plan
