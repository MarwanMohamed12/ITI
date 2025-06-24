module alu_tb();
reg [2:0]a,b;
reg clk=0;
reg[3:0]opcode;
wire [5:0]result;
alu a1(.a(a),.b(b),.clk(clk),.opcode(opcode),.result(result));
always #10 clk=~clk;
initial begin
a=3'b101;
b=3'b011;
#10;
opcode=3;
#15;
opcode=2;
#15;
opcode=15;
#15;
$finish;
end 
endmodule
