module fsm(
input reset,taken,clk,
output reg predict
);

localparam A=2'b00;
localparam B=2'b01;
localparam C=2'b10;
localparam D=2'b11;

reg [1:0] next_state,present_state;

always@(posedge clk)
begin
if(reset)
present_state<=0;
else
present_state<=next_state;
end

always@(*)
begin

case(present_state)
A:
  begin
	if(taken==1)
	 begin
	 next_state=A;
	 predict=1'b1;
	 end
 	else
	 begin
	 next_state=B;
	 predict=1'b1;
	 end
 end
B:
  begin
	if(taken==1)
	 begin
	 next_state=A;
	 predict=1'b1;
	 end
 	else
	 begin
	 next_state=C;
	 predict=1'b0;
	 end
 end
C:
    begin
	if(taken==1)
	 begin
	 next_state=D;
	 predict=1'b0;
	 end
 	else
	 begin
	 next_state=C;
	 predict=1'b0;
	 end
 end
D:
    begin
	if(taken==1)
	 begin
	 next_state=A;
	 predict=1'b1;
	 end
 	else
	 begin
	 next_state=C;
	 predict=1'b0;
	 end
    end
default:
begin 
next_state=present_state;
present_state=A;
end
endcase


end
endmodule
