module clock_div_2(
input clk,reset,
output q1,q2,q3,q4
);

d_ff2 ff1(.d(!q1),.clk(clk),.q(q1),.reset(reset));
d_ff2 ff2(.d(!q2),.clk(!q1),.q(q2),.reset(reset));
d_ff2 ff3(.d(!q3),.clk(!q2),.q(q3),.reset(reset));
d_ff2 ff4(.d(!q4),.clk(!q3),.q(q4),.reset(reset));
endmodule

