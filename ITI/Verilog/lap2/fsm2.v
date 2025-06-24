module fsm2(
input reset,go,clk,
output reg op
);

localparam A=3'b000;
localparam B=3'b001;
localparam C=3'b010;
localparam D=3'b011;
localparam E=3'b100;
localparam F=3'b101;
localparam G=3'b110;
localparam H=3'b111;

reg [2:0] next_state,present_state;

always@(posedge clk)
begin
if(reset)
present_state<=0;
else
present_state<=next_state;
end

always@*
begin
case(present_state)
A:
  begin
	if(go)
	 begin
	 next_state=B;
	 op=1'b1;
	 end
 	else
	 begin
	 next_state=A;
	 op=1'b0;
	 end
 end
B:
  begin
	if(go)
	 begin
	 next_state=B;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=C;
	 op=1'b0;
	 end
 end
C:
    begin
	if(go)
	 begin
	 next_state=D;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=A;
	 op=1'b0;
	 end
 end
D:
    begin
	if(go)
	 begin
	 next_state=E;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=C;
	 op=1'b0;
	 end
    end

E:
    begin
	if(go)
	 begin
	 next_state=B;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=F;
	 op=1'b0;
	 end
    end
F:
    begin
	if(go)
	 begin
	 next_state=G;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=A;
	 op=1'b0;
	 end
    end
G:
    begin
	if(go)
	 begin
	 next_state=E;
	 op=1'b0;
	 end
 	else
	 begin
	 next_state=H;
	 op=1'b0;
	 end
    end
H:
    begin
	if(go)
	 begin
	 next_state=D;
	 op=1'b1;
	 end
 	else
	 begin
	 next_state=A;
	 op=1'b0;
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
