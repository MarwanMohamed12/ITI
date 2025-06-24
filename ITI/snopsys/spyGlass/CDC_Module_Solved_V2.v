module CDC_Module (clkA,clkB,rstA,rstB,Data_in1,Data_out1);

//--------------- Design Inputs ---------------
input wire clkA,clkB;
input wire rstA,rstB;
input wire  Data_in1;

//--------------- Design Outputs ---------------
output reg  Data_out1;

//--------------- Internal Reg ---------------
reg  Internal_Reg_P1;
reg  Internal_Reg_P2;

reg  Internal_Reg;
reg  Internal_Reg2;




//--------------- Design Implementation ---------------

//----------------Pulse_Extender---------
//----------------First_FF

	always@(posedge clkA or posedge rstA) begin
		if(rstA) begin

			//---- Reset Condition ----
			Internal_Reg_P1 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg_P1 <=Data_in1;
		end

	end
//----------------Second_FF

	always@(posedge clkA or posedge rstA) begin
		if(rstA) begin

			//---- Reset Condition ----
			Internal_Reg_P2 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg_P2 <=Internal_Reg_P1;
		end

	end

	always@(posedge clkA or posedge rstA) begin
		if(rstA) begin

			//---- Reset Condition ----
			Internal_Reg <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg <=Internal_Reg_P1  | Internal_Reg_P2 ;
		end

	end

//------------Second_Domain 

	always@(posedge clkB or posedge rstB) begin
		if(rstB) begin

			//---- Reset Condition ----
			Internal_Reg2 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg2 <=Internal_Reg;
		end

	end
	always@(posedge clkB or posedge rstB) begin
		if(rstB) begin

			//---- Reset Condition ----
			Data_out1 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Data_out1 <=Internal_Reg2;
		end

	end
endmodule