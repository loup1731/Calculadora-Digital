LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
---------------------------------------------------------------------------------------------------
ENTITY Multiplicador IS
PORT( bit_a, bit_b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		carryin      : IN  std_logic;
		producto     : OUT std_logic_vector(7 DOWNTO 0);
		cout_multi   : OUT std_logic); 
END ENTITY Multiplicador;
---------------------------------------------------------------------------------------------------
ARCHITECTURE Multiplicador_1_bit OF Multiplicador IS
---------------------------------------------------------------------------------------------------
COMPONENT Suma_1bit 
PORT( a      : IN  STD_LOGIC;
	   b      : IN  STD_LOGIC;
		cin    : IN  STD_LOGIC;
		sum    : OUT STD_LOGIC; 
		cout   : OUT STD_LOGIC );
END COMPONENT;			
---------------------------------------------------------------------------------------------------
SIGNAL producto_1bit  : STD_LOGIC_VECTOR (14 DOWNTO 0);
SIGNAL carryout 		 : STD_LOGIC_VECTOR (10 DOWNTO 0); 
SIGNAL suma_productos : STD_LOGIC_VECTOR (5 DOWNTO 0);
---------------------------------------------------------------------------------------------------
BEGIN

producto(0)  <= bit_A(0) AND bit_B (0);

producto_1bit(0)  <= bit_a(1) AND bit_b (0);
producto_1bit(1)  <= bit_a(0) AND bit_b (1);
producto_1bit(2)  <= bit_a(2) AND bit_b (0);
producto_1bit(3)  <= bit_a(1) AND bit_b (1);
producto_1bit(4)  <= bit_a(3) AND bit_b (0);
producto_1bit(5)  <= bit_a(2) AND bit_b (1);
producto_1bit(6)  <= bit_a(3) AND bit_b (1);
producto_1bit(7)  <= bit_a(0) AND bit_b (2);
producto_1bit(8)  <= bit_a(1) AND bit_b (2);
producto_1bit(9)  <= bit_a(2) AND bit_b (2);
producto_1bit(10) <= bit_a(3) AND bit_b (2);
producto_1bit(11) <= bit_a(0) AND bit_b (3);
producto_1bit(12) <= bit_a(1) AND bit_b (3);
producto_1bit(13) <= bit_a(2) AND bit_b (3);
producto_1bit(14) <= bit_a(3) AND bit_b (3);

OPERACION0: Suma_1bit 
PORT MAP(a   	=> producto_1bit(1),
			b   	=> producto_1bit(0),
			cin 	=> '0',
			cout  => carryout(0),
			sum   => producto(1));
 ------------------
OPERACION1: Suma_1bit 
PORT MAP(a   	=> producto_1bit(3),
			b   	=> producto_1bit(2),
			cin 	=> carryout(0),
			cout  => carryout(1),
			sum   => suma_productos(0));
 -------------------
OPERACION2: Suma_1bit 
PORT MAP(a   	=> producto_1bit(5),
			b   	=> producto_1bit(4),
			cin 	=> carryout(1),
			cout  => carryout(2),
			sum   => suma_productos(1));
 ----------------------
OPERACION3: Suma_1bit 
PORT MAP(a   	=> producto_1bit(6),
			b   	=> '0',
			cin 	=> carryout(2),
			cout  => carryout(3),
			sum   => suma_productos(2));
 ----------------------
OPERACION4: Suma_1bit
PORT MAP(a   	=> producto_1bit(7),
			b   	=> suma_productos(0),
			cin 	=> '0',
			cout  => carryout(4),
			sum   => producto(2));
 ----------------------
OPERACION5: Suma_1bit 
PORT MAP(a   	=> producto_1bit(8),
			b   	=> suma_productos(1),
			cin 	=> carryout (4),
			cout  => carryout(5),
			sum   => suma_productos(3));
 ----------------------
OPERACION6: Suma_1bit 
PORT MAP(a	   => producto_1bit(9),
			b	   => suma_productos(2),
			cin 	=> carryout(5),
			cout  => carryout(6),
			sum   => suma_productos(4));
 ----------------------
OPERACION7: Suma_1bit 
PORT MAP(a	   => producto_1bit(10),
			b  	=> carryout(3),
			cin 	=> carryout(6),
			cout  => carryout(7),
			sum   => suma_productos(5));
 ---------------------
OPERACION8: Suma_1bit 
PORT MAP(a	   => producto_1bit(11),
			b	   => suma_productos(3),
			cin 	=> '0',
			cout  => carryout(8),
			sum   => producto(3));
 ---------------------
OPERACION9: Suma_1bit 
PORT MAP(a   	=> producto_1bit(12),
			b   	=> suma_productos(4),
			cin 	=> carryout(8),
			cout  => carryout(9),
			sum   => producto(4));
 ---------------------
OPERACION10: Suma_1bit 
PORT MAP(a   	=> producto_1bit(13),
			b   	=> suma_productos(5),
			cin 	=> carryout (9),
			cout  => carryout(10),
			sum   => producto(5));
 ---------------------
OPERACION11: Suma_1bit 
PORT MAP(a   	=> producto_1bit(14),
			b   	=> carryout(7),
			cin 	=> carryout(10), 
			cout  => producto(7),
			sum   => producto(6));
 
END Multiplicador_1_bit;