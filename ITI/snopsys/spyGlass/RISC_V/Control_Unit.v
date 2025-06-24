//////////////////////////////////////////////////  
//------------------Control_Unit------------------// 
module Control_Unit (inst_mem ,beq ,Pc_sel ,Imm_sel ,Reg_we ,A_sel ,B_sel ,Alu_sel ,Mem_we ,Wb_Sel );
 
//----------Define_parameter----------//

parameter WIDTH=32  ;
//----------Input_Declaration----------//

input [WIDTH-1:0] inst_mem ;
input  beq ;


//----------Output_Declaration----------//


output wire  [1:0]   Imm_sel,Alu_sel ;
output wire    Pc_sel ;
output wire    Reg_we ;
output wire    A_sel ;
output wire    B_sel ;
output wire   Mem_we ;
output wire  [1:0] Wb_Sel ;


//----------Internal_wires----------//

wire [6:0] op_Type;
wire [9:0] R_Type;
wire [2:0] I_Type,S_Type,B_Type,Lw_type,JALR_Type;




//----------Internal_Reg----------//

reg [10:0] out_control ;


assign  op_Type 	=	inst_mem[6:0] ;
assign  R_Type 		=	{inst_mem[31:25],inst_mem[14:12]};
assign  I_Type 		=	inst_mem[14:12];
assign  S_Type 		=	inst_mem[14:12];
assign  B_Type 		=	inst_mem[14:12];
assign  Lw_type		=	inst_mem[14:12];
assign 	JALR_Type	=	inst_mem[14:12];

//----------Operations----------//

always@(*)
begin
case(op_Type)
//R_type
7'b0110011:
	begin 
		case(R_Type)
		10'b0000000000:out_control=11'b0xx10000001; //ADD
		10'b0100000000:out_control=11'b0xx10001001; //SUB
		10'b0000000111:out_control=11'b0xx10010001; //AND
		10'b0000000110:out_control=11'b0xx10011001; //OR
		endcase
	end
//I_type
7'b0010011 :
	begin 
		case(I_Type)
		3'b000:out_control=11'b00010100001; //ADDI
		3'b111:out_control=11'b00010110001; //ANDI
		3'b110:out_control=11'b00010111001; //ORI
		endcase
	end

//S_type
7'b0100011 :
	begin
		case(S_Type)
		 3'b010: out_control=11'b001001001xx; //SW 
		default: out_control=11'bxx;	
		endcase	
	end
//B_type
7'b1100011 :
	begin 
		if(B_Type==000 & beq ==1)
		out_control=11'b110011000xx; //Equal 
		else if(B_Type==000 & beq ==0)
		out_control=11'b010011000xx; //NOT Equal 
		else if(B_Type==001 & beq ==0)
		out_control=11'b110011000xx; //notEqual for NBE 
		else if(B_Type==001 & beq ==1)
		out_control=11'b010011000xx; //Equal for NBE
		else 
		out_control=11'b0; //Equal for NBE
	end

//Lw_type
7'b0000011 : begin 
				case(Lw_type)
				3'b010: out_control=11'b000_1010_0000; //SW 
				default: out_control=11'bxx;	
				endcase		
				end 	

//Jalr_type
7'b1100111 : begin 
			 	case(JALR_Type)
				3'b000: out_control=11'b10010100010; //SW 
				default: out_control=11'bxx;	
				endcase
			 end 	
	
//Jal_type 11
7'b1101111 : out_control=11'b11111100010;

endcase
end

assign {Pc_sel,Imm_sel,Reg_we,A_sel,B_sel,Alu_sel,Mem_we,Wb_Sel} = out_control;


endmodule