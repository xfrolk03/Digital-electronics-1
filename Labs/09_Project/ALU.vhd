----------------------------------------------------------------------------------
-- Company: FEKT VUT v Brne
-- Engineer: Jan Frolka, Dominik Chrenčík
-- 
-- Create Date:    06:04:57 04/20/2020 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 	 ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity ALU is
   
    port (
	 
	 A     		: in   STD_LOGIC_VECTOR(3 downto 0);  
	 B     		: in   STD_LOGIC_VECTOR(3 downto 0);
    OP   		: in   STD_LOGIC_VECTOR(3 downto 0);
	 clk_i 		: in 	 STD_LOGIC;
	 srst_n_i	: in 	 STD_LOGIC;
	 
    ALU_Out	 	: out  STD_LOGIC_VECTOR(7 downto 0); --vrací výsledek
	 underflow_o: out  STD_LOGIC;
	 carry_o 	: out  STD_LOGIC
	 );
	 
end ALU; 

architecture Behavioral of ALU is

	signal inp_A, inp_B, RES : unsigned(3 downto 0) := (others => '0');
	signal MULT_RES : unsigned(7 downto 0) := (others => '0');
begin

	inp_A <= unsigned(A);
	inp_B <= unsigned(B);
	
   process(clk_i)
	begin
		if (rising_edge(clk_i)) then
			carry_o 		<= '0';
			underflow_o <= '0';
			MULT_RES <= (others => '0');
			RES <= (others => '0');
			
			if(srst_n_i = '0') then			--synchronni reset
				carry_o 		<= '0';
				underflow_o <= '0';
				MULT_RES <= (others => '0');
				RES <= (others => '0');
				ALU_Out <=(others => '0');
			else	
				case(OP)is	  
					when "0000" => 
						if((inp_A + inp_B) > "1111") then
							carry_o <= '1';
						end if;
						
						RES <= (inp_A + inp_B); 
				
					when "0001" => 
						if((inp_A - inp_B) < "0000") then
							underflow_o <= '1';              --signal podteceni
						end if;
						
						RES <= inp_A - inp_B;
				
					when "0010" => 
						if((inp_A + 1) > "1111") then
							carry_o <= '1';
						end if;
						
						RES <= inp_A + 1;
									
					when "0011" => 
						if((inp_A - 1) < "0000") then
							underflow_o <= '1';		--signal podteceni
						end if;
						
						RES <= inp_A - 1;
				
					when "0100" => 
						if((inp_B + 1) > "1111") then
							carry_o <= '1';
						end if;
						
						RES <= inp_B + 1;							
				
					when "0101" => 
					
						if((inp_A * inp_B) > "1111") then
							carry_o <= '1';
						end if;										--zobrazeni ve dvou cifrach??
						
						MULT_RES <= inp_A * inp_B;
						
					when "0110" => RES <= NOT inp_A ;
				
					when "0111" => RES <= NOT inp_B;
				
					when "1000" => RES <= inp_A AND inp_B;
				
					when "1001" => RES <= inp_A OR inp_B;
				
					when "1010" => RES <= inp_A XOR inp_B;
				
					when "1011" => RES <= inp_A NAND inp_B;
				
					when "1100" => RES <= inp_A NOR inp_B;
				
					when "1101" => RES <= inp_A XNOR inp_B;
				
					when "1110" => 
						if(inp_A > inp_B) then
						RES <= x"0" ;
						else
						RES <= x"1" ;
						end if;
				
					when "1111" => 
						if(inp_A = inp_B) then
							RES <= x"1" ;
						else
							RES<= x"0" ;
						end if;				
					when others => RES <= "0000" ;
				
				end case;			
			end if;
			
			if(op = "0101") then
				ALU_Out <= std_logic_vector(MULT_RES);
			else
				ALU_Out <= "0000" & std_logic_vector(RES); 
			end if;
			
		end if;
	end process;	
 
end architecture;
