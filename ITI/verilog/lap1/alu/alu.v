module alu(
input [2:0]a,b,
input clk,
input[3:0]opcode,
output reg [5:0]result
);
always@(posedge clk)
begin
case(opcode)
4'b0000:result<=a+b;
4'b0001:result<=a*b;
4'b0011:result<=a&b;
4'b0100:result<=a|b;
4'b0101:result<=a^b;
4'b0110:result<=~(a&b);
4'b0111:result<=~(a|b);
4'b1000:result<=~(a^b);
4'b1001:result<=a<<1;
4'b1010:result<=a>>1;
4'b1011:result<={a,b};
default:$display("at time=%0t opcode is =%0d thats not valid code",$time,opcode);
endcase
end
endmodule

