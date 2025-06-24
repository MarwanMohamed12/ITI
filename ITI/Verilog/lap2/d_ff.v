module d_ff(
input d,clk,reset,
output reg q
);
//syn
always@(posedge clk)
begin
if(reset)
q<=0;
else
q<=d;
end

endmodule 
