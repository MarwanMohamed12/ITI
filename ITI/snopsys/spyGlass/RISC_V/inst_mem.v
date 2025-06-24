//////////////////////////////////////////////////  
//------------------inst_mem------------------// 
module inst_mem (addr ,inst_out );
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input [WIDTH-1:0] addr ;


//----------Output_Declaration----------//

output wire    [WIDTH-1:0] inst_out ;

reg [WIDTH-1:0] ROM [WIDTH-1:0] ;

//----------Operations----------//
initial 
//$readmemh("H:\TA_ITI\Verilog\lab3\code\instuction_set_architecture",ROM); 
begin 
 ROM[0]='h00000013;
 ROM[1]='h00500113;
 ROM[2]='h00C00193;
 ROM[3]='h00918393;
 ROM[4]='h0023E233;
 ROM[5]='h0041F2B3;
 ROM[6]='h004282B3;
 ROM[7]='h005104B3;
 ROM[8]='h00100193;
 ROM[9]='h007120A3;
 ROM[10]='h0092A023;
 ROM[11]='h00112783;
 ROM[12]='h0002AA03;	
end 



 


assign  inst_out = ROM[addr[31:2]];

endmodule
