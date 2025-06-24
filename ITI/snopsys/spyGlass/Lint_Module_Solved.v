
module Lint_Module_Solved (clk,rst_n,check,Data_in1,Data_in2,Data_in3,
					Data_out1_V1,Data_out2_V1,Data_out3_V1,
					Data_out1_V2,Data_out2_V2,Data_out3_V2,
					Data_out1_V3,Data_out2_V3,Data_out3_V3
					);

//--------------- Design Inputs ---------------
input wire clk;
input wire rst_n; 
input wire check ;
input wire [1:0] Data_in1;
input wire [2:0] Data_in2;
input wire [3:0] Data_in3;

//--------------- Design Outputs ---------------
output reg  [1:0] Data_out1_V1;
output wire [2:0] Data_out2_V1;
output reg  [3:0] Data_out3_V1;
//---------V2 
output reg  [1:0] Data_out1_V2;
output wire [2:0] Data_out2_V2;
output reg  [3:0] Data_out3_V2;
//---------V3
output reg  [1:0] Data_out1_V3;
output wire [2:0] Data_out2_V3;
output reg  [3:0] Data_out3_V3;

//------------- Internal Wires -----------
wire [1:0] Inernal_wire1 ;
wire [2:0] Inernal_wire2 ;
wire [3:0] Inernal_wire3 ; 

//------------- Internal Reg -----------
reg [1:0] Inernal_reg1 ;
reg [2:0] Inernal_reg2 ;
reg [3:0] Inernal_reg3 ; 


always @ ( posedge clk or negedge rst_n )
begin 
	if (~rst_n) begin 
		Inernal_reg1 <= 0;
		Inernal_reg2 <= 0;
		Inernal_reg3 <= 0;
	end 
	else begin 
		Inernal_reg1 <= Data_in1;
		Inernal_reg2 <= Data_in2;
		Inernal_reg3 <= Data_in3;
	end 
end 
//--------------- Design Implementation ---------------



//--------------- Combinational Loops ------------------ //

always @(posedge clk or negedge rst_n )
begin 
	if (~rst_n) 	Data_out3_V1 <= 0;
	else 			Data_out3_V1 <= Data_in3 & Data_out3_V1 ; 
end 

//assign Data_out2_V1 = Data_out2 & Data_in2 ; 
assign Data_out2_V1 = Inernal_reg2 & Data_in2 ; 

//--------------- Inferred Latches -------------------- //
always @( posedge clk  or negedge rst_n )
begin 
	if (~rst_n) begin 
		Data_out1_V1 <=2'b00 ;
		end 
	else begin  			
		if (check)  Data_out1_V1 <= Data_in1 & Inernal_reg1;
		else Data_out1_V1 <= Data_in1 | Inernal_reg1;
		end 	
end

always @(*)
begin 
case(Data_in1) 
2'b00: Data_out3_V2 	= Data_in3 & Inernal_reg3 ;
2'b01: Data_out3_V2 	= Inernal_reg3 ;
default : Data_out3_V2 	= 3'b000;
endcase  
end 


//--------------- Multi-Driven Signals -------------------- //
always @ ( posedge clk or negedge rst_n )
begin 
	if (~rst_n)
			Data_out1_V2 <= 2'b00 ; 
	else 		
		Data_out1_V2 <= Data_in1 & Inernal_reg1; 
end 


assign Data_out2_V2 = Data_in2 & Inernal_reg2;



//--------------- Width Mismatches -------------------- //

assign Inernal_wire1 = Data_in2[1:0]  ;
assign Inernal_wire2 = Data_in3[2:0] ;
assign Inernal_wire3 [1:0]  = Data_in1 ;
assign Inernal_wire3 [3:2]  = Data_in1 ;
 
//--------------- Blocking -NonBlocking -------------------- //
always @ ( posedge clk  or negedge rst_n )
begin 
	if (~rst_n) begin 
		Data_out1_V3 <= 2'b00  ;
		Data_out3_V3 <= 4'b000 ;
	end
	else begin 
		Data_out1_V3 <= Data_in1 | Inernal_wire1 ;
		Data_out3_V3 <= Data_in3 | Inernal_wire3 ;
		end 
end 

//--------------- Set_but_Not_read -------------------- //
assign Data_out2_V3 = Data_in2 & Inernal_wire2;

endmodule