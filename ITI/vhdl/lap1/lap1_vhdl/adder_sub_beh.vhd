LIBRARY IEEE;
LIBRARY WORK;
LIBRARY std;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_bit.ALL;
USE IEEE.std_logic_arith.all;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_signed.all;

ENTITY adder_sub_beh IS
PORT(a,b:IN std_logic_vector(3 downto 0);
 mode:IN std_logic;
 c_out:OUT std_logic;
 sum :OUT std_logic_vector(3 downto 0));
END ENTITY adder_sub_beh;

ARCHITECTURE adder_sub_beh OF adder_sub_beh IS
signal result:std_logic_vector(4 downto 0);
BEGIN
M1:PROCESS(a,b,mode,result) IS

BEGIN
if(mode='0') THEN
result<=(("0"& a) + ("0"&b));
sum<=result(3 downto 0); 
c_out<=result(4);
else
result<=(("0"& a) - ("0"&b));
sum<=result(3 downto 0); 
c_out<=result(4);
END IF;
END PROCESS M1;
END ARCHITECTURE adder_sub_beh;
