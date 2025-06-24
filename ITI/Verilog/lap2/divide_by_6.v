module divide_by_6(
input clk,reset,
output reg q
);
integer counter;
always@(clk)
begin

if(reset)
begin
q<=1'b0;
counter<=0;
end
else if(counter==5)
begin
counter<=0;
q<=~q;
end
else
counter=counter+1;

end


endmodule
