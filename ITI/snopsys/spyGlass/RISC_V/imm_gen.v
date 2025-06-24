
//////////////////////////////////////////////////  
//------------------imm_gen------------------// 
module imm_gen (inst ,immsel ,imm_out);
 
//----------Define_parameter----------//

parameter WIDTH= 32 ;
//----------Input_Declaration----------//

input [31:7] inst ;
input [1:0] immsel ;


//----------Output_Declaration----------//

output reg   [WIDTH-1:0] imm_out ;






//----------Operations----------//

always@(*)
begin
	case(immsel)
	2'b00:imm_out 	= {{21{inst[31]}},inst[30:25],inst[24:21],inst[20]};	//I-type :addi,subi,andi,ori,jalr,lw
	2'b01:imm_out 	= {{21{inst[31]}},inst[30:25],inst[11:8],inst[7]} ;	//S-type:sw
	2'b10:imm_out 	= {{20{inst[31]}},inst[7],inst[30:25],inst[11:8],1'b0};	//B-type:beq,bne
	2'b11:imm_out 	= {{12{inst[31]}},inst[19:12],inst[20],inst[30:25],inst[24:21],0};	//J-type:jal
	default:imm_out = 32'hx; 
	endcase
end
endmodule