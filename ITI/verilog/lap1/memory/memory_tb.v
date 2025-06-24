module memory_tb();

reg clk=0,rst,en_w,en_r;
reg [7:0]data_in;
reg [2:0]address;
wire full_flag,empty_flag;
wire [7:0]data_out;


memory memory1(.clk(clk),.rst(rst),.en_w(en_w),.en_r(en_r),.data_in(data_in),
.address(address),.full_flag(full_flag),.empty_flag(empty_flag),.data_out(data_out));

integer i=0;
always #5 clk=~clk;

initial begin
rst=1;
en_w=0;
en_r=0;
#30;
rst=0;
#10;
en_w=1;
for(i=0;i<8;i=i+1)
begin
address=i;
data_in=i;
#12;
end

for(i=0;i<8;i=i+1)
begin
address=i;
data_out=mem[address];
#12;
end

end

endmodule 