module sipo_tp();

reg serial_in;
reg rst,clk=0;
wire  [3:0]serial_out;

sipo s1(.serial_in(serial_in),.rst(rst),.clk(clk),.serial_out(serial_out));

always #5 clk=~clk;

initial begin
rst=1;
#10;
rst=0;
serial_in=1;
#10;
serial_in=0;
#10;
serial_in=1;
#10;
serial_in=1;
#5;
$stop;


end

endmodule 
