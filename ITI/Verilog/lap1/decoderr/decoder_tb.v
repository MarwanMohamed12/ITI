module decoder_tb();
reg [2:0]s;
reg en;
wire [7:0]d;

decode decoder(.en(en),.s(s),.d(d));

initial begin
en=0;

#10;
en=1;
#10;
s=3'b010;
#5;
s=3'b000;
#5;
s=3'b100;
$finish;
end

endmodule
