LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.all;
USE ieee.NUMERIC_STD.all;
---------------------------------------------------------------------------------------------------
ENTITY PROYECTO_CALCULADORA IS
----- Declaramos las entradas y salidas para la calculadora
PORT ( A			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		 B			: IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
		 OPE_1	: IN	STD_LOGIC;
		 OPE_2	: IN	STD_LOGIC;
		 SSEG1   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SSEG2   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SSEG3   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		 SSEG4   : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END ENTITY PROYECTO_CALCULADORA;
---------------------------------------------------------------------------------------------------
ARCHITECTURE GateLevel OF PROYECTO_CALCULADORA IS
----- Declaramos las señales que nos permiten interactuar con las funciones de la calculadora 
SIGNAL RTA_SUM		  		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RTA_RES	     		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RTA_RES_A2    	: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RTA_MULTI    		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL COUT_SUM 	  		: STD_LOGIC;
SIGNAL COUT_RES 	  		: STD_LOGIC;
SIGNAL COUT_RES_A2 	  	: STD_LOGIC;
SIGNAL V_SUMA   	  		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL V_RESTA   	  		: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL V_RESTA_A2  	  	: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL CIN_MULTI    		: STD_LOGIC;
SIGNAL COUT_MULTI   		: STD_LOGIC;
SIGNAL RESULTADO_FINAL  : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DECENAS      		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL UNIDADES     		: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL BCD_NUMERO : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL RESULTADO_BCD : STD_LOGIC_VECTOR(7 DOWNTO 0);
---------------------------------------------------------------------------------------------------
BEGIN 
----- Función para mostar los binarios A y B en decimal en el 7seg
A_B_SSEG: ENTITY work.Mostrar_A_y_B_sseg
	PORT MAP( a_bin	=> A,
             b_bin	=> B,
		       sseg1	=> SSEG1,   
		       sseg2	=> SSEG2); 
----- Función para sumar los dos números ingresados 
SUMA: ENTITY work.Sumador 
	PORT MAP( binario_a 			=> A, 
	          binario_b 			=> B, 
	          resultado_suma	=> RTA_SUM,		
	          cout 	  			=> COUT_SUM);
	V_SUMA <= "000" & (COUT_SUM) & (RTA_SUM);
----- Función para restar los dos números ingresados
 RESTA: ENTITY work.Restador 
	PORT MAP( binario_a 			  => A, 
	          binario_b 			  => B, 
	          resultado_resta    => RTA_RES,		
	          cout 	  			  => COUT_RES);
	V_RESTA <= "000" & (COUT_RES) & (RTA_RES);
RESTA_A2: ENTITY work.Restador_A2 
	PORT MAP( binario_a 			 => A, 
	          binario_b 			 => B, 
	          resultado_resta_A2=> RTA_RES_A2,		
	          cout_A2 	  		 => COUT_RES_A2); 
	V_RESTA_A2 <= "000" & (COUT_RES_A2) & (RTA_RES_A2);
	
----- Función para multiplicar los dos números ingresados
MULTUPLICACION: ENTITY work.Multiplicador
	PORT MAP (bit_a => A,
		       bit_b => B,
		       carryin => CIN_MULTI,   
		       producto  => RTA_MULTI,  
		       cout_multi  => COUT_MULTI);
----- Función para seleccionar que resultado se mostrará en los 7seg
	RESULTADO_FINAL <= V_SUMA 	   WHEN ope_1 = '1' AND ope_2 = '1' ELSE 
							 V_RESTA    WHEN ((ope_1 = '1' AND ope_2 = '0') AND (A > B)) ELSE
							 V_RESTA_A2 WHEN ((ope_1 = '1' AND ope_2 = '0') AND (A < B)) ELSE
							 RTA_MULTI  WHEN ope_1 = '0';		  
----- Función para pasar de Binario a Decimal la respuesta obtenida
BCD: ENTITY work.Binario_a_Decimal
	PORT MAP (
				  resultado_f => RESULTADO_FINAL,
				  BCD_numero  => BCD_NUMERO); 
				 RESULTADO_BCD <= "11111111" WHEN ((a > "1001") OR (b >"1001")) ELSE
				                  BCD_NUMERO(7 DOWNTO 0);
				  ----- Definimos los rangos en los cuales estaran las decenas y las unidades
				 UNIDADES <= "0000" WHEN ((A=B) AND ((OPE_1='1') AND (OPE_2='0'))AND ((A < "1010") AND (B <"1010"))) ELSE 
				             RESULTADO_BCD(3 DOWNTO 0); 
				
				DECENAS <= "1011" WHEN (((A < "1010")OR (B<"1010" )) AND (A < B)AND ((OPE_1='1') AND (OPE_2='0'))) ELSE
							  "0000" WHEN ((A=B) AND ((OPE_1='1') AND (OPE_2='0')) AND ((A < "1010") AND (B <"1010"))) ELSE
							  RESULTADO_BCD(7 DOWNTO 4);
----------------------------------
Resultado: ENTITY work.Mostrar_Resultado
	PORT MAP(a			=> A, 
		      b			=> B,
            unidades =>UNIDADES,
		      decenas	=>DECENAS,
		      ope_1	   =>OPE_1,
		      ope_2	   =>OPE_2,
		      sseg3    =>SSEG3,
		      sseg4    =>SSEG4);
		   
END ARCHITECTURE GateLevel;