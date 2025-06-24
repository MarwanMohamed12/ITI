

//////////////////////////////////////////////////  
//------------------Branch_Com------------------// 
module Branch_Com (data_A ,data_B ,Beq );
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input [WIDTH-1:0] data_A ;
input [WIDTH-1:0] data_B ;


//----------Output_Declaration----------//

output    Beq ;



//----------Operations----------//

assign Beq = (data_A == data_B) ? 1'b1 : 1'b0 ;


endmodule