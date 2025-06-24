LIBRARY IEEE;
LIBRARY WORK;
LIBRARY std;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
USE IEEE.std_logic_arith.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_signed.all;

ENTITY adder_sub_struct IS
PORT(a,b:IN bit_vector(3 downto 0);
	mode:IN bit;
	c_out:OUT bit;
	sum :OUT bit_vector(3 downto 0));
END ENTITY adder_sub_struct;

ARCHITECTURE adder_sub_struct OF adder_sub_struct IS

COMPONENT add_sub_1bit IS
PORT(a,b,mode:IN bit;
	c_out,sum:OUT bit);
END COMPONENT add_sub_1bit;
FOR ALL: add_sub_1bit USE ENTITY WORK.add_sub_1bit (add_sub_1bit);
SIGNAL carry :bit_vector(3 downto 0);
SIGNAL x :bit_vector(3 downto 0);
BEGIN
x(0)<=b(0) XOR mode;
x(1)<=b(1) XOR mode;
x(2)<=b(2) XOR mode;
x(3)<=b(3) XOR mode;

bit3:add_sub_1bit
PORT MAP(a(0),x(0) ,mode,carry(0),sum(0));
bit2:add_sub_1bit
PORT MAP(a(1),x(1) ,carry(0),carry(1),sum(1));
bit1:add_sub_1bit
PORT MAP(a(2),x(2) ,carry(1),carry(2),sum(2));
bit0:add_sub_1bit
PORT MAP(a(3),x(3) ,carry(2),carry(3),sum(3));
c_out<=carry(3);


END ARCHITECTURE adder_sub_struct;
