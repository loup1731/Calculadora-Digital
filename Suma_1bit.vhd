LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Suma_1bit IS
PORT ( a      : IN  STD_LOGIC;
		 b      : IN  STD_LOGIC;
		 cin    : IN  STD_LOGIC;
       sum    : OUT STD_LOGIC;
		 cout   : OUT STD_LOGIC);
END ENTITY Suma_1bit;
---------------------------------------------------------------------------------------------------
ARCHITECTURE Suma_1bit OF Suma_1bit IS
---------------------------------------------------------------------------------------------------
BEGIN

sum  <= (NOT a AND NOT b AND cin) OR
        (NOT a AND b AND NOT cin) OR
        (a AND NOT b AND NOT cin) OR
        (a AND b AND cin);
cout <= (NOT a AND b AND cin) OR
        (a AND NOT b AND cin) OR
        (a AND b AND NOT cin) OR
        (a AND b AND cin);
		  
END Suma_1bit;