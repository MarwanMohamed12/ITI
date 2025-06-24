module CDC_Module (clkA,clkB,rstA,rstB,Data_in1,Data_out1);

//--------------- Design Inputs ---------------
input wire clkA,clkB;
input wire rstA,rstB;
input wire Data_in1;

//--------------- Design Outputs ---------------
output reg Data_out1;

//--------------- Internal Reg ---------------
reg Internal_Reg,Internal_Reg2,Internal_Reg3;



//--------------- Design Implementation ---------------

always@(posedge clkA or posedge rstA) begin
if(rstA) begin

//---- Reset Condition ----
Internal_Reg <=0;
end
else begin

//---- Non-reset Condition ----
Internal_Reg <=Data_in1;
end

end

always@(posedge clkB or posedge rstB ) 
begin
if(rstB) begin
//---- Reset Condition ----
Internal_Reg2<=0;
end
else begin
//---- Non-reset Condition ----
Internal_Reg2 <=Internal_Reg;
end
end 


always@(posedge clkB or posedge rstB ) 
begin
if(rstB) begin
//---- Reset Condition ----
Data_out1 <=0;
end
else begin
//---- Non-reset Condition ----
Data_out1 <=Internal_Reg2;
end

end

endmodule