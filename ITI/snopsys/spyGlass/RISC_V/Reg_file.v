

//////////////////////////////////////////////////  
//------------------Reg_file------------------// 
module Reg_file (clk,rd ,rs1 ,rs2 ,data_des ,reg_wen ,dataA ,dataB );
 
//----------Define_parameter----------//

parameter WIDTH=32  ;
//----------Input_Declaration----------//

input clk;
input [4:0] rd ;
input [4:0] rs1 ;
input [4:0] rs2 ;
input [WIDTH-1:0] data_des ;
input  reg_wen ;


//----------Output_Declaration----------//

output reg   [WIDTH-1:0] dataA ;
output reg   [WIDTH-1:0] dataB ;



//----------Internal_Reg----------//

reg [WIDTH-1 :0] MEM [WIDTH-1 :0];


//----------Operations----------//
always@(posedge clk )
	begin
		if(reg_wen==1)
		MEM[rd]<=data_des;
	end



always@(*)
begin 
	MEM[0] = 32'b0;
	dataA  = MEM[rs1];
	dataB  = MEM[rs2];
end 

endmodule