module full_adder(
input a,b,cin,
output sum,carry_out
);
wire s_a,carry_t1,carry_t2;
half_adder HA1(.a(a),.b(b),.sum(s_a),.carry(carry_t1));
half_adder HA2(.a(s_a),.b(cin),.sum(sum),.carry(carry_t2));
assign carry_out=carry_t1|carry_t2;


endmodule
