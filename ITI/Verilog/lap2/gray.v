module gray(
input [2:0]b,
input clk,reset,
output [2:0]g
);

d_ff d2(.d(b[2]),.clk(clk),.reset(reset),.q(g[2]));
d_ff d1(.d(b[2]^b[1]),.clk(clk),.reset(reset),.q(g[1]));
d_ff d0(.d(b[0]^b[1]),.clk(clk),.reset(reset),.q(g[0]));







endmodule
