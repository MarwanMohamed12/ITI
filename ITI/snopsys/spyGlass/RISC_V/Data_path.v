

//////////////////////////////////////////////////  
//------------------Data_path------------------// 
module Data_path #( parameter WIDTH=32)(clk,rst_n,Imm_sel ,Alu_sel ,Pc_sel ,Reg_we ,A_sel ,B_sel ,Mem_we ,Wb_Sel ,inst ,BEQ ,Data_WB);
 
//----------Define_parameter----------//


//----------Input_Declaration----------//

input clk,rst_n;
input [1:0] Imm_sel ;
input [1:0] Alu_sel ;
input  Pc_sel ;
input  Reg_we ;
input  A_sel ;
input  B_sel ;
input  Mem_we ;
input [1:0] Wb_Sel ;


//----------Output_Declaration----------//

output	[WIDTH-1:0]	inst ;
output    BEQ ;
output	[WIDTH-1:0] Data_WB;  	 		

//----------Internal_wires----------//

wire [WIDTH-1:0] pc_next,pc_plus4;
wire [WIDTH-1:0] imm_gen;
wire [WIDTH-1:0] out_mem;
wire [WIDTH-1:0] addr;
wire [WIDTH-1:0] Alu_out,data_b;


//----------BLocks----------//


Mux2x1  #(WIDTH)U0(
.data_0(pc_plus4),
.data_1(Alu_out),
.sel(Pc_sel),
.data_out(pc_next)
);

CPU  #(WIDTH) U1(
.clk(clk),
.rst_n(rst_n),
.pc_next(pc_next),
.inst_rd(inst[11:7]),
.inst_rs1(inst[19:15]),
.inst_rs2(inst[24:20]),
.Reg_wen(Reg_we),
.A_sel(A_sel),
.B_sel(B_sel),
.data_b(data_b),
.Alu_sel(Alu_sel),
.imm_gen(imm_gen),
.data_WB(Data_WB),
.pc(addr),
.pc_plus4(pc_plus4),
.beq(BEQ),
.out_alu(Alu_out)
);
inst_mem  #(WIDTH)U2(
.addr(addr),
.inst_out(inst)
);
Data_mem  #(WIDTH)U3(
.clk(clk),
.add(Alu_out),
.data_in(data_b),
.mem_wen(Mem_we),
.data_out(out_mem)
);

imm_gen  #(WIDTH)U4(
.inst(inst[31:7]),
.immsel(Imm_sel),
.imm_out(imm_gen)
);
Mux3x1  #(WIDTH) U5(
.data_0(out_mem),
.data_1(Alu_out),
.data_2(pc_plus4),
.sel(Wb_Sel),
.data_out(Data_WB)
);
endmodule