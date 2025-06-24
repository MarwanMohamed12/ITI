
//////////////////////////////////////////////////  
//------------------Alu------------------// 
module Alu (data1 ,data2 ,sel ,data_out );
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//


input [WIDTH-1:0] data1 ;
input [WIDTH-1:0] data2 ;
input [1:0] sel ;


//----------Output_Declaration----------//

output reg   [WIDTH-1:0] data_out ;

//----------Operations----------//

always@(*)
begin
	case (sel)
	2'b00:data_out = data1 + data2;
	2'b01:data_out = data1 - data2;
	2'b10:data_out = data1 & data2;
	2'b11:data_out = data1 | data2;
	endcase
end
endmodule