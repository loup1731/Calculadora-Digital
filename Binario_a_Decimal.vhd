LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Binario_a_Decimal IS 
PORT ( resultado_f 	: IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		 BCD_numero    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY Binario_a_Decimal;
---------------------------------------------------------------------------------------------------
ARCHITECTURE BEHAVIOUR OF Binario_a_Decimal IS
---------------------------------------------------------------------------------------------------
----- Definimos una señal que nos mostrará el resultado en decimal, con sus unidades y decenas
BEGIN

----- Iniciamos el proceso de definir las unidades y lasdecenas en el resultado de la operación
convertidor_BCD: PROCESS(resultado_f)
----- Definimos un vector para guardar nuestra respuesta para luego poder verla en los siete segmentos de unidades y decenas
	VARIABLE Vector_Rta : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
		BEGIN
----- Inicializamos el vector de la respuesta en 0		
		Vector_Rta := (OTHERS => '0');
----- Colocamos el resultado de la operación en el vector de la respuesta		
		Vector_Rta(10 DOWNTO 3) := resultado_f;
----- Con el FOR, recorremos el vector de la respuesta para verificar las unidades y las decenas	
		FOR i IN 0 TO 4 LOOP 
----- Verificamos el valor de las unidades
			IF(Vector_Rta(11 DOWNTO 8) > 4) THEN
				Vector_Rta(11 DOWNTO 8) := Vector_Rta(11 DOWNTO 8) + 3;
			END IF;
----- Verificamos el valor de las decenas			
			IF(Vector_Rta(15 DOWNTO 12) > 4) THEN
				Vector_Rta(15 DOWNTO 12) := Vector_Rta(15 DOWNTO 12) + 3;
			END IF;
----- Ubicamos los resultados en el vector			
			Vector_Rta(15 DOWNTO 1) := Vector_Rta(14 DOWNTO 0); 
		END LOOP;		
----- Con las unidades y las decenas en el vector respuesta, las mostramos en los 7seg corresondientes
		BCD_numero <=  Vector_Rta(15 DOWNTO 8);
						   
END PROCESS;
END ARCHITECTURE BEHAVIOUR;