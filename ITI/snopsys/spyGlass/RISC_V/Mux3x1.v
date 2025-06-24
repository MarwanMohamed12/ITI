
//////////////////////////////////////////////////  
//------------------Mux3x1------------------// 
module Mux3x1 (data_0 ,data_1 ,data_2 ,sel ,data_out );
 
//----------Define_parameter----------//

parameter WIDTH=32  ;
//----------Input_Declaration----------//

input [WIDTH-1:0] data_0 ;
input [WIDTH-1:0] data_1 ;
input [WIDTH-1:0] data_2 ;
input [1:0] sel ;


//----------Output_Declaration----------//

output reg [WIDTH-1:0] data_out ;





//----------Operations----------//

always@(*)
begin
		case(sel)
		2'b00:data_out<=data_0;
		2'b01:data_out<=data_1;
		2'b10:data_out<=data_2;
		default:data_out<=32'hx; 
		endcase  	
end
endmodule