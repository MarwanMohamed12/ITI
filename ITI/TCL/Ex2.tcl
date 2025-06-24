proc add_sub_mul_div { a { b 0 }} {
puts "a+b=[expr $a+$b]"
puts "a-b=[expr $a-$b]"
puts "a*b=[expr $a*$b]"
return [expr $a/$b] }

puts [add_sub_mul_div 5 6]  #passing a list is wrong expression