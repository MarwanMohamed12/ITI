//declare the Verilog module - The inputs and output port names.
module johnson(
    clk,
    Reset,
    Count_out
    );

    //what are the input ports and their sizes.
    input clk;
    input Reset;
    //what are the output ports and their sizes.
    output [3:0] Count_out;
    //Internal variables
    reg [3:0] Count_temp;

    //Whenever the clk changes from 0 to 1(positive edge) or 
    //a change in Reset, execute the always block.
    always @(posedge(clk) or posedge(Reset))
    begin
        if(Reset == 1'b1)  //when Reset is high 
             Count_temp = 4'b0000;  //The Count value is reset to "0000".
        
	else //When the clk is high
             //Left shift the Count value and at the same time
             //negate the least significant bit.
             Count_temp = {Count_temp[2:0],~Count_temp[3]}; 
	
    end
    
    //The Count value is assigned to final output port.
    assign Count_out = Count_temp;
    
endmodule
