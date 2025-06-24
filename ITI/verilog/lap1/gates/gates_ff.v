module gates_ff(
input a,b,c,clk,
output reg d,f
);


reg s1,s2;
wire s3;

assign s3=!s1 &a;
always@(posedge clk)
begin
s1<=b^c;
s2<= !b & c;
d<=a^s1;
f<=s2|s3;
end

endmodule
