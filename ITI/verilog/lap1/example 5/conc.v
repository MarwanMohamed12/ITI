module conc();
reg[3:0]seq1=4'b1011,seq2=4'b0011,seq3=4'b1010;
reg [7:0]result;
reg [1:0]result1;
always@*
begin

result1=seq1[3:2]&seq2[1:0];
result={{2{result1[1]}},{result1,seq3}};


end


endmodule