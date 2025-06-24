set file_r [open "C:/Users/marrw/Input_File.txt" r]
set file_w [open "C:/Users/marrw/lastw.txt" w]
set namee {}
set lines [split [read $file_r] \n]

foreach line $lines {
if {[string match {*Employee*} $line]==1} {
set i [string first "Name" $line]
puts $file_w "1-[string range $line $i [expr $i + 15]]"
set i [string first "University" $line]
puts $file_w "2-[string range $line $i [expr $i + 24]]"
set i [string first "Grade" $line]
puts $file_w "3-[string range $line $i [expr $i + 15]]"
set i [string first "Current_Salary" $line]
puts $file_w "4-[string range $line $i [expr $i + 18]]"
puts $file_w {############################################}
}

}

close $file_w