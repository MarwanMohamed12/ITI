
//////////////////////////////////////////////////  
//------------------PC------------------// 
module PC (clk,rst_n,pc_next ,pc );
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input clk,rst_n;
input [WIDTH-1 : 0] pc_next ;


//----------Output_Declaration----------//

output reg   [WIDTH-1 : 0] pc ;
//----------Operations----------//
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		 begin
			pc<=32'h0 ; // 32'h1000; it is assume 
		 end
	else
		 begin
		 pc<=pc_next;
		 end
end
endmodule