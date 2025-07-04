module decode(
input [2:0]s,
input en,
output reg [7:0]d
);
always@*
begin
case({en,s})
4'b0xxx:d=8'b00000000;
4'b1000:d=8'b00000001;
4'b1001:d=8'b00000010;
4'b1010:d=8'b00000100;
4'b1011:d=8'b00001000;
4'b1100:d=8'b00010000;
4'b1101:d=8'b00100000;
4'b1110:d=8'b01000000;
4'b1111:d=8'b10000000;
default:d=8'b00000000;
endcase
end 
endmodule
