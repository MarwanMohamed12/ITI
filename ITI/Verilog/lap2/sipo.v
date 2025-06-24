module sipo(
input serial_in,
input rst,clk,
output  [3:0]serial_out
);
//internal_register
d_ff d1(.d(serial_in),.clk(clk),.reset(rst),.q(serial_out[0]));
d_ff d2(.d(serial_out[0]),.clk(clk),.reset(rst),.q(serial_out[1]));
d_ff d3(.d(serial_out[1]),.clk(clk),.reset(rst),.q(serial_out[2]));
d_ff d4(.d(serial_out[2]),.clk(clk),.reset(rst),.q(serial_out[3]));

endmodule
