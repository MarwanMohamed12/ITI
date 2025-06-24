set f_n [open "C:/Users/marrw/report.txt" r]

set f_w [open "C:/Users/marrw/write.txt" w]

set lines [split [read $f_n] \n]

foreach line $lines {  
  if  {[regexp {slack} $line c]} {
  puts $f_w $line
  } 
  if  {[regexp {setup} $line c]} {
  puts $f_w $line
  } 
}
close $f_w

