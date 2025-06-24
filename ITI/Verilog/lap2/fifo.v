module fifo(
input clk,rst,en_w,en_r,
input [31:0]data_in,
output reg full_flag,empty_flag,
output reg [7:0]data_out
);

reg [31:0] mem[0:7];
integer i;

reg [2:0] write_pointer,read_pointer,count;

always@(posedge clk)
begin
if(rst)
begin
for(i=0;i<8;i=i+1)
  begin
	mem[i]<='b0;
  end
	empty_flag<=1;
	full_flag<=0;
	write_pointer<=0;
	read_pointer<=0;
	data_out<=0;
count<=0;
end

else if(en_w && !full_flag && count<8) //logically **********
begin
mem[write_pointer]<=data_in;
write_pointer<=write_pointer+1;
if(count==7)
begin
empty_flag<=0;
full_flag<=1;
end
else

begin
count=count+1;
empty_flag<=0;
full_flag<=0;
end

end

else if(en_r && !empty_flag && count>=0)
begin
data_out<=mem[read_pointer];
mem[read_pointer]<='b0;
read_pointer<=read_pointer+1;
if(count==3'b000)
	begin
	empty_flag<=1;
	full_flag<=0;
	end

else

	begin
	count=count-1;
	empty_flag<=0;
	full_flag<=0;
	end

end
end

endmodule

