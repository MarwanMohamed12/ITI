USE std.textio.ALL;
LIBRARY IEEE;
LIBRARY WORK;
LIBRARY std;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
USE IEEE.std_logic_arith.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_signed.all;

ENTITY add_sub_tb IS
END ENTITY add_sub_tb ;

ARCHITECTURE add_sub_tb OF add_sub_tb  IS

COMPONENT adder_sub_beh IS

PORT(a,b:IN std_logic_vector(3 downto 0);
 mode:IN std_logic;
 c_out:OUT std_logic;
 sum :OUT std_logic_vector(3 downto 0));
END COMPONENT;

FOR dut: adder_sub_beh USE ENTITY WORK.adder_sub_beh (adder_sub_beh);

SIGNAL a,b:std_logic_vector(3 downto 0);
SIGNAL mode:std_logic;
SIGNAL sum:std_logic_vector(3 downto 0);
SIGNAL c_out:std_logic;
BEGIN
dut: adder_sub_beh PORT MAP(a,b,mode,c_out,sum);
pr: PROCESS IS
FILE vectors_f: text OPEN read_mode IS "E:\test_vectors.txt";
FILE results_f: text OPEN write_mode IS "E:\test_results.txt";
VARIABLE ln_file: line;
VARIABLE mode_t: std_logic;
VARIABLE c_out_t: std_logic;
VARIABLE a_x,b_x: std_logic_vector(3 downto 0);
VARIABLE sum_t: std_logic_vector (3 downto 0);

VARIABLE out_file: line;

BEGIN
WHILE NOT endfile (vectors_f) LOOP
READLINE (vectors_f,ln_file); 
READ (ln_file, a_x);
READ (ln_file, b_x); 
READ (ln_file, mode_t); 
 
-- writing varible in a,b signal

a<=a_x;
b<=b_x;
mode<=mode_t;

--now we get result 
Wait for 10 ns;

c_out_t:=c_out;
sum_t:=sum;

write(out_file,string'(" in1= "));
write(out_file,a_x);
write(out_file,string'(" in2= "));
write(out_file,b_x);
write(out_file,string'(" time= "));
write(out_file,now);
write(out_file,string'(" out= "));
write(out_file,sum_t);
write(out_file,string'(" carry= "));
write(out_file,c_out_t);
write(out_file,string'(" mode= "));
write(out_file,mode_t);
writeline(results_f,out_file);

END LOOP;
WAIT;
END PROCESS ;
END ARCHITECTURE ;