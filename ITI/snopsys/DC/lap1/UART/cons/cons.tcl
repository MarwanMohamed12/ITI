create_clock -name CLK -period 5 -waveform {0 2.5} [get_ports CLK]
set_clock_latency 1 -clock CLK
set_clock_uncertainty 0.35 [get_clocks]
set_clock_transition -rise 5 
set_clock_transition -fall 5

set_input_delay -max 2 -clock [get_clocks CLK] [remove_from_collection [all_inputs] [get_ports CLK]]
set_output_delay -max 2 -clock [get_clocks CLK] [all_outputs]

set_false_path -hold -from [remove_from_collection [all_inputs] [get_ports CLK]]
set_false_path -hold -to [all_outputs]

set_max_area 6



set_driving_cell -library 
