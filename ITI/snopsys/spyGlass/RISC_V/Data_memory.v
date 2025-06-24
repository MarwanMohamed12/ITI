
//////////////////////////////////////////////////  
//------------------Data_mem------------------// 
module Data_mem (clk,add ,data_in ,mem_wen ,data_out);
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input clk;
input [WIDTH-1:0] add ;
input [WIDTH-1:0] data_in ;
input  mem_wen ;


//----------Output_Declaration----------//

output reg   [WIDTH-1:0] data_out ;




//----------Internal_Reg----------//

reg [WIDTH-1:0] MEM [WIDTH-1:0] ;


//----------Operations----------//

always@(posedge clk )
begin
	if(mem_wen==1)
		MEM[add]<= data_in;	
end


always@(*)
begin 
	data_out=MEM[add]; 

end 

endmodule