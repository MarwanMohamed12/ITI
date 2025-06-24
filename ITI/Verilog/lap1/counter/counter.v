module counter#(parameter n=4)(
input mode,clk,reset,
output reg [n-1:0]q
);

always@(posedge clk,posedge reset)
begin
if(reset)
q<=0;
//for 1 is up and 0 is down
else if(mode)
q<=q+1;
else
q<=q-1;
end

endmodule
