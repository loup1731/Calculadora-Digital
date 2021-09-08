LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Resta_1bit_A2 IS
PORT( a      : IN  STD_LOGIC;
      b      : IN  STD_LOGIC;
 	   cin    : IN  STD_LOGIC;
      res    : OUT STD_LOGIC ;
		cout   : OUT STD_LOGIC);
END ENTITY Resta_1bit_A2;
---------------------------------------------------------------------------------------------------
ARCHITECTURE Resta_1_bit_A2 OF Resta_1bit_A2 IS
---------------------------------------------------------------------------------------------------
BEGIN

res <=  (NOT a AND NOT b AND cin) OR
        (NOT a AND b AND NOT cin) OR
        (a AND NOT b AND NOT cin) OR
        (a AND b AND cin);
cout <= (NOT a AND b AND cin) OR
        (a AND NOT b AND cin) OR
        (a AND b AND NOT cin) OR
        (a AND b AND cin);
		  
END Resta_1_bit_A2;