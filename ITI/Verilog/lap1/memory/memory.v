module memory(
input clk,rst,en_w,en_r,
input [7:0]data_in,
input [2:0]address,
output reg full_flag,empty_flag,
output reg [7:0]data_out
);

reg [7:0] mem[0:7];
integer i,j;


integer counter=0;
always@(posedge clk or posedge rst)
begin
if(rst)
begin

for(i=0;i<8;i=i+1)
  begin
	mem[i]<='b0;
  end
	empty_flag=1;
end

else if(en_w)
begin
mem[address]<=data_in;
counter<=counter+1;
end

else if(en_r)
begin
data_out<=mem[address];
counter<=counter-1;
end
else
$display("at time %0t there is no read or write",$time);

if(counter==8)
full_flag=1;
else if(counter==0)
empty_flag=1;
else if (counter>0)
empty_flag=0;
else
$display("not empty not full");
end


endmodule
