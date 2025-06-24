# ------------------------ Setup_File ------------------------ #
#This step previous floorplan step 

# ----------- Search path ----------- # 

set_app_var search_path /home/user41/Elgammal/Summer/synthesis/LIB/Lib

# ----------- Techfile_path ----------- # 

set TECH_FILE $search_path/process/astro/tech/astroTechFile.tf 

# -----------  Created_NDM_library ----------- # 

set reference_library /home/user41/Elgammal/Johnson_V2/ndm/saed90nm_max_lth.ndm

# -----------  Created .dlib ----------- # 
create_lib -technology $TECH_FILE -ref_libs $reference_library johnson.dlib


# -----------  Read_netlist ----------- #
read_verilog -top johnson /home/user41/Elgammal/Johnson_V2/outputs/johnson.v

# -----------  Linking ----------- #
link_block

# -----------  Load_TLU+  ----------- #
set Tech $search_path/process/star_rcxt

read_parasitic_tech -layermap $Tech/tech2itf.map -tlup $Tech/tluplus/saed90nm_1p9m_1t_Cmax.tluplus  -name maxTLU

read_parasitic_tech -layermap $Tech/tech2itf.map -tlup $Tech/tluplus/saed90nm_1p9m_1t_Cmin.tluplus  -name minTLU


# ----------- Read_SDC ----------- #
read_sdc /home/user41/Elgammal/Johnson_V2/outputs/johnson.sdc

get_site_defs

# ----------- Attributes ----------- #

#The symmetry requirements for cell placement
set_attribute [get_site_defs unit] symmetry y

#Define Directions of Layers to be perpendicular
set_attribute [get_layers {M1 M3 M5 M7 M9} ] routing_direction horizontal

set_attribute [get_layers {M2 M4 M6 M8}] routing_direction vertical

#Define Track Offest between edge of std_cell and centre metal layer 
set_attribute [get_layers {Ml}] track_offset 0.03
 
set_attribute [get_layers {M2}] track_offset 0.04 

set_ignored_layers -max_routing_layer M8

report_ignored_layers ../report/ignored _layers.rpt


start_gui 






