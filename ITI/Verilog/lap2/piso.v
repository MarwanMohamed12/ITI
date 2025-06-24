module piso(
input [3:0]data_in,
input selctor,rst,clk,
output  serial_out
);
//internal_register
reg [3:0]data_come;
always@(posedge clk)
begin
if(rst)
data_come<=0;
//sel=1  --->load
else if(selctor)
data_come<=data_in;
else
data_come<=data_come>>1;
end
assign serial_out=data_come;
endmodule
