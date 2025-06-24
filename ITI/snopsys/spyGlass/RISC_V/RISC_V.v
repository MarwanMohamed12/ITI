//////////////////////////////////////////////////  
//------------------RISC-V------------------// 
module RISC_V #(parameter WIDTH=32 ) (clk,rst_n,Data_out );
 
//----------Define_parameter----------//


//----------Input_Declaration----------//

input clk,rst_n;


//----------Output_Declaration----------//

output   [WIDTH-1:0] Data_out ;


//----------Internal_wires----------//

wire [1:0] Imm_sel ;
wire [1:0] Alu_sel ;
wire  Pc_sel ;
wire  Reg_we ;
wire  A_sel ;
wire  B_sel ;
wire  Mem_we ;
wire [1:0] Wb_Sel ;

wire	[WIDTH-1:0]	inst ;
wire    BEQ ;
//wire	[WIDTH-1:0] Data_WB;  	 		

//----------BLocks----------//

Data_path #(WIDTH) U0 (
.clk(clk),
.rst_n(rst_n),
.Imm_sel(Imm_sel) ,
.Alu_sel(Alu_sel) ,
.Pc_sel(Pc_sel) ,
.Reg_we(Reg_we) ,
.A_sel (A_sel),
.B_sel (B_sel) ,
.Mem_we(Mem_we) ,
.Wb_Sel(Wb_Sel),
.inst (inst),
.BEQ (BEQ),
.Data_WB(Data_out)
);
Control_Unit  #(WIDTH) Control_Unit_U0 (
.inst_mem(inst) ,
.beq(BEQ) ,
.Pc_sel(Pc_sel) ,
.Imm_sel(Imm_sel) ,
.Reg_we(Reg_we) ,
.A_sel(A_sel) ,
.B_sel(B_sel) ,
.Alu_sel(Alu_sel) ,
.Mem_we(Mem_we) ,
.Wb_Sel(Wb_Sel)
); 
endmodule