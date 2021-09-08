LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Mostrar_A_y_B_sseg IS 
PORT ( a_bin	 : IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
		 b_bin	 : IN	 STD_LOGIC_VECTOR(3 DOWNTO 0);
		 sseg1    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 sseg2    : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY Mostrar_A_y_B_sseg;
---------------------------------------------------------------------------------------------------
ARCHITECTURE BEHAVIOUR OF Mostrar_A_y_B_sseg IS 
---------------------------------------------------------------------------------------------------
BEGIN 
---- Con multiplexores mostramos el número ingresado en decimal en su respectivo 7seg
with a_bin select

    sseg1 <= "1000000" WHEN "0000", -- Número 0
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
with b_bin select

    sseg2 <= "1000000" WHEN "0000", -- Número 0
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
				 
END BEHAVIOUR;