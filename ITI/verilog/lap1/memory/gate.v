module gate(
input a,b,c,
output d,f
);

wire s1,s2,s3;
assign s1=b^c;
assign s2=!b & c;
assign d=a^s1;
assign s3=a & !s1;
assign f=s2&s3;


endmodule
