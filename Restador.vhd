LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all; 
---------------------------------------------------------------------------------------------------
ENTITY Restador IS
PORT( binario_a			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		binario_b			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
	   resultado_resta	: OUT	STD_LOGIC_VECTOR(3 DOWNTO 0);
	   cout					: OUT	STD_LOGIC);
END ENTITY Restador;
---------------------------------------------------------------------------------------------------
ARCHITECTURE STRUCTURE OF Restador IS
---------------------------------------------------------------------------------------------------
COMPONENT Resta_1bit
	port( a, b, cin		: IN  STD_LOGIC;
	      res, cout		: OUT STD_LOGIC );
END COMPONENT;
---------------------------------------------------------------------------------------------------
SIGNAL c0, c1, c2, c3 : STD_LOGIC;

BEGIN 
		c0 <= '0';
		res0: Resta_1bit PORT MAP (binario_a(0), binario_b(0), c0, resultado_resta(0), c1);
		res1: Resta_1bit PORT MAP (binario_a(1), binario_b(1), c1, resultado_resta(1), c2);
		res2: Resta_1bit PORT MAP (binario_a(2), binario_b(2), c2, resultado_resta(2), c3);
		res3: Resta_1bit PORT MAP (binario_a(3), binario_b(3), c3, resultado_resta(3), cout);
END STRUCTURE;
