module piso_tb();
reg [3:0]data_in;
reg selctor,rst,clk=1;
wire serial_out;

piso p1(.data_in(data_in),.selctor(selctor),.rst(rst)
,.clk(clk),.serial_out(serial_out));

always #10 clk=~clk;

initial begin
data_in=4'b1011;
rst=1;
#10;
rst=0;
#10;
selctor=1;
#10;
selctor=0;
#50;

end

endmodule
