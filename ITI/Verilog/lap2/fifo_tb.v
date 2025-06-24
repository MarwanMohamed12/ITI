module fifo_tb();

reg clk=0,rst,en_w,en_r;
reg [31:0]data_in;
wire full_flag,empty_flag;
wire [7:0]data_out;

fifo regsister(.clk(clk),.rst(rst),.en_w(en_w),.en_r(en_r),.data_in(data_in),.full_flag(full_flag)
,.empty_flag(empty_flag),.data_out(data_out));

always #5 clk=~clk;
integer i;
initial begin
rst=1'b1;
en_w=0;
en_r=0;
#30;
rst=0;
en_w=1;
for(i=0;i<8;i=i+1)
begin
data_in=i;
#10;
end
en_w=0;
en_r=1;
#100;
end


endmodule 
