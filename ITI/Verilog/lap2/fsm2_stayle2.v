module fsm2_style2(
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
	 next_state=B;
 	else
	 next_state=A;
 end
B:
  begin
	if(go)
	 next_state=B;
 	else
	 next_state=C;
  end
C:
    begin
	 if(go)
	 next_state=D;
 	 else
	 next_state=A;
    end
D:
    begin
	if(go)
	 next_state=E;
 	else
	 next_state=C;
    end
E:
    begin
	if(go)
	 next_state=B;
 	else
	 next_state=F;
    end
F:
    begin
	if(go)
	 next_state=G;
 	else
	 next_state=A;
    end
G:
    begin
	if(go)
	 next_state=E;
 	else
	 next_state=H;
    end
H:
    begin
	if(go)
	 next_state=D;
 	else
	 next_state=A;
    end
default:
begin 
next_state=present_state;
present_state=A;
end
endcase
end

always@*
begin

case(present_state)
A:op=0;
B:op=0;
C:op=0;
D:op=0;
E:op=0;
F:op=0;
G:op=0;
H:op=1;
endcase

end

endmodule
