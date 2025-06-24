module counter_tb();
parameter n=8;
reg clk=0,reset,mode;
wire[n-1:0]q;
counter #(.n(n))CA (.clk(clk),.reset(reset),.mode(mode),.q(q));
always #10 clk=~clk;
initial begin
mode=1;//up
reset=1'b1;
#10;
reset=0;
#100;
mode=0;
#100;
mode=01;
#300;
$finish;
end 

endmodule
