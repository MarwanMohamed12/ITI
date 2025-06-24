

////////////////////TEST_BENSH//////////////////// 
//////////////////////////////////////////////////  
//------------------RISC_V_TB------------------// 
module RISC_V_TB ();
 
//----------Input_Declaration----------//

reg clk,rst_n;
//----------Output_Declaration----------//

wire [31:0] Data_out ;
//----------CLock_generate----------//

always #5 clk=~clk;
//----------Design_UDER_TEST----------//

RISC_V DUT (
.clk(clk),
.rst_n(rst_n),
.Data_out(Data_out)
);
//----------Test_case----------//

initial begin
clk=1;
rst_n=0;
#5 	 rst_n=1;
#10	rst_n=1;	 

#2000;

	end
endmodule