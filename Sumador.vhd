LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Sumador IS
PORT( binario_a			: IN	STD_LOGIC_VECTOR(3 downto 0);
		binario_b			: IN	STD_LOGIC_VECTOR(3 downto 0);
	   resultado_suma		: OUT	STD_LOGIC_VECTOR(3 downto 0);
	   cout					: OUT	STD_LOGIC);
END Sumador;
---------------------------------------------------------------------------------------------------
ARCHITECTURE STRUCTURE OF Sumador IS
---------------------------------------------------------------------------------------------------
----- Utilizamos el adder de un bit para sumar cada bit del binario ingresado
COMPONENT Suma_1bit
	PORT( a, b, cin		: IN  STD_LOGIC;
	      sum, cout		: OUT STD_LOGIC );
END COMPONENT;
---------------------------------------------------------------------------------------------------
----- Declaramos los carry para la suma de los cuatro bits
SIGNAL c0, c1, c2, c3 : STD_LOGIC;
----- Iniciamos la suma de los cuatro bits delos binarios ingresados y los guardamos en el vector resultado junto a carry out
BEGIN

c0 <= '0';
sum0: Suma_1bit PORT MAP (binario_a(0), binario_b(0), c0, resultado_suma(0), c1);
sum1: Suma_1bit PORT MAP (binario_a(1), binario_b(1), c1, resultado_suma(1), c2);
sum2: Suma_1bit PORT MAP (binario_a(2), binario_b(2), c2, resultado_suma(2), c3);
sum3: Suma_1bit PORT MAP (binario_a(3), binario_b(3), c3, resultado_suma(3), cout);

END STRUCTURE;