LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all; 
---------------------------------------------------------------------------------------------------
ENTITY Restador_A2 IS
PORT( binario_a			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		binario_b			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
	   resultado_resta_A2: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	   cout_A2				: OUT	STD_LOGIC);
END ENTITY Restador_A2;
---------------------------------------------------------------------------------------------------
ARCHITECTURE STRUCTURE OF Restador_A2 IS
---------------------------------------------------------------------------------------------------
COMPONENT Resta_1bit
	port( a      : IN  STD_LOGIC;
         b      : IN  STD_LOGIC;
 	      cin    : IN  STD_LOGIC;
         res    : OUT STD_LOGIC ;
		   cout   : OUT STD_LOGIC);
END COMPONENT;
---------------------------------------------------------------------------------------------------
SIGNAL c0, c1, c2, c3 : STD_LOGIC;

BEGIN 
		c0 <= '0';
		res0: Resta_1bit PORT MAP (binario_b(0), binario_a(0), c0, resultado_resta_A2(0), c1);
		res1: Resta_1bit PORT MAP (binario_b(1), binario_a(1), c1, resultado_resta_A2(1), c2);
		res2: Resta_1bit PORT MAP (binario_b(2), binario_a(2), c2, resultado_resta_A2(2), c3);
		res3: Resta_1bit PORT MAP (binario_b(3), binario_a(3), c3, resultado_resta_A2(3), cout_A2);
END STRUCTURE;
