set read_file [open "read_file.txt" r];
set write_file [open "writ_file.txt" w];
set read_data [read $read_file];
puts $write_file $read_data;

