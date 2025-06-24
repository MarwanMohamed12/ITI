module fsm_tb();

reg reset,taken,clk=0;
wire predict;

fsm module1(.reset(reset),.clk(clk),.taken(taken),.predict(predict));

always#7 clk=~clk;

initial begin
reset=1;
#20;
reset=0;
taken=0;
#10;
taken=0;
#10;
taken=1;
#10;
taken=1;
#10;
taken=0;
#10;
taken=0;
#10;
taken=0;
#10;
$stop;

end 

endmodule 
