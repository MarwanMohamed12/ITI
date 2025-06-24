//////////////////////////////////////////////////  
//------------------CPU------------------// 
module CPU #(parameter WIDTH= 32) (clk,rst_n,pc_next,imm_gen,data_WB,inst_rd ,inst_rs1 ,inst_rs2 ,Reg_wen ,A_sel ,B_sel ,Alu_sel ,pc ,pc_plus4 ,beq ,out_alu ,data_b);
 
//----------Define_parameter----------//


//----------Input_Declaration----------//

input clk,rst_n;
input [WIDTH-1:0] pc_next ;
input [4:0] inst_rd ;
input [4:0] inst_rs1 ;
input [4:0] inst_rs2 ;
input  Reg_wen ;
input  A_sel ;
input  B_sel ;
input  [WIDTH-1:0] imm_gen,data_WB; 
input [1:0] Alu_sel ;


//----------Output_Declaration----------//

output   [WIDTH-1:0] pc ;
output   [WIDTH-1:0] pc_plus4 ;
output    beq ;
output   [WIDTH-1:0] out_alu ,data_b;


//----------Internal_wires----------//

wire [WIDTH-1:0] pc_wire;
wire [WIDTH-1:0] data_a;
wire [WIDTH-1:0]mux_a,mux_b;


//----------BLocks----------//

PC  #(WIDTH) U0 (
.clk(clk),
.rst_n(rst_n),
.pc_next(pc_next),
.pc(pc)
);

Adder  #(WIDTH) U1 (
.pc(pc),
.pc_plus_4(pc_plus4) 
);

Reg_file  #(WIDTH)U2 (
.clk(clk),
.rd(inst_rd),
.rs1(inst_rs1),
.rs2(inst_rs2),
.data_des(data_WB),
.reg_wen(Reg_wen),
.dataA(data_a),
.dataB(data_b)
);

Mux2x1  #(WIDTH) UA (
.data_0(data_a),
.data_1(pc),
.sel(A_sel),
.data_out(mux_a)
);

Mux2x1  #(WIDTH) UB (
.data_0(data_b),
.data_1(imm_gen),
.sel(B_sel),
.data_out(mux_b)
);

Alu  #(WIDTH) U3 (
.data1(mux_a),
.data2(mux_b),
.sel(Alu_sel),
.data_out(out_alu)
);

Branch_Com  #(WIDTH) U4 (
.data_A(data_a),
.data_B(data_b),
.Beq(beq));

endmodule