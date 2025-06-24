module gray_tb();

reg [2:0]b;
reg clk=0,reset;
wire [2:0]g;

gray module1(.b(b),.clk(clk),.reset(reset),.g(g));
always#5 clk=~clk;

initial begin
reset=1;
#25;
reset=0;
b=3'b000;
#10;
b=3'b001;
#10;
b=3'b010;
#10;
b=3'b011;
#10;
b=3'b100;
#10;
b=3'b101;
#10;
b=3'b110;
#10;
b=3'b111;
#10;
$stop;

end 

endmodule 
