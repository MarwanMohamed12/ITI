ENTITY full_adder IS
PORT(a,b,mode:IN bit;
	c_out,sum:OUT bit);
END ENTITY full_adder;

ARCHITECTURE full_adder OF full_adder IS
BEGIN
p1:process(a,b,mode) IS
BEGIN
sum<= a XOR b XOR mode;
c_out<=(a AND b) OR (mode AND (a XOR b));
END PROCESS p1;

END ARCHITECTURE full_adder;
