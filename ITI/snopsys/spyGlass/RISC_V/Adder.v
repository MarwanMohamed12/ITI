

//////////////////////////////////////////////////  
//------------------Adder------------------// 
module Adder (pc ,pc_plus_4 );
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input [WIDTH-1:0] pc ;


//----------Output_Declaration----------//

output   [WIDTH-1:0] pc_plus_4 ;


//----------Operations----------//

assign pc_plus_4 = pc + 4; 

endmodule 
