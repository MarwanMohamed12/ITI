module fsm2_tb();

reg reset,go,clk=0;
wire op;


fsm2_style2 module1(.reset(reset),.clk(clk),.go(go),.op(op));

always #5 clk=~clk;

initial begin
reset=1;
#10;
reset=0;
go=1;
#10;
go=0;
#10;
go=1;
#10;
go=1;
#10;
go=0;
#10;
go=1;
#10;
go=0;
#10;
go=1;
#10;
$stop;

end 

endmodule 
