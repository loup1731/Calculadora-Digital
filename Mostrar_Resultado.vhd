LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Mostrar_Resultado IS 
PORT ( a			 : IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		 b			 : IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
       unidades : IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
		 decenas	 : IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
		 ope_1	 : IN	STD_LOGIC;
		 ope_2	 : IN	STD_LOGIC;
		 sseg3    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 sseg4    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY Mostrar_Resultado;
---------------------------------------------------------------------------------------------------
ARCHITECTURE BEHAVIOUR OF Mostrar_Resultado IS 
signal negativo : STD_LOGIC; 
SIGNAL signo    : STD_LOGIC_VECTOR(3 DOWNTO 0); 
---------------------------------------------------------------------------------------------------
BEGIN 
negativo <= '1' WHEN ((ope_1 = '1' AND ope_2 ='0')AND(b>a))ELSE '0';

with unidades select

    sseg4 <= "1000000" WHEN "0000", -- Número 0
				 "1111001" WHEN "0001", -- Número 1
				 "0100100" WHEN "0010", -- Número 2
				 "0110000" WHEN "0011", -- Número 3
				 "0011001" WHEN "0100", -- Número 4
				 "0010010" WHEN "0101", -- Número 5
				 "0000010" WHEN "0110", -- Número 6
				 "1111000" WHEN "0111", -- Número 7
				 "0000000" WHEN "1000",	-- Número 8
				 "0010000" WHEN "1001", -- Número 9 
				 "0000110" WHEN OTHERS; -- Letra E por ser mayor a 9
	
with decenas select
    sseg3 <= "1000000" WHEN "0000",--0
				 "1111001" WHEN "0001",--1
				 "0100100" WHEN "0010",--2
				 "0110000" WHEN "0011",--3
				 "0011001" WHEN "0100",--4
				 "0010010" WHEN "0101",--5
				 "0000010" WHEN "0110",--6
				 "1111000" WHEN "0111",--7 
				 "0000000" WHEN "1000",--8
				 "0010000" WHEN "1001",--9
				 "1111111" WHEN "1010",--Nada 
				 "0111111" WHEN "1011", -- Signo negativo
				 "0000110" WHEN OTHERS; --E
 
END BEHAVIOUR;