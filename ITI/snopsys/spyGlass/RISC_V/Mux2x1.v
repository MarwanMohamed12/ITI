
//////////////////////////////////////////////////  
//------------------Mux2x1------------------// 
module Mux2x1 #(parameter WIDTH= 32 )(data_0 ,data_1 ,sel ,data_out);
 
//----------Define_parameter----------//

//----------Input_Declaration----------//

input [WIDTH-1:0] data_0 ;
input [WIDTH-1:0] data_1 ;
input  sel ;


//----------Output_Declaration----------//

output    [WIDTH-1:0] data_out ;




//----------Operations----------//

assign  data_out =  (sel==1) ?  data_1 :data_0 ; 

endmodule