library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity traffic is
	port (clk		:	in STD_LOGIC;	
          reset		:	in STD_LOGIC;	
     	  light 	:	out STD_LOGIC_VECTOR(5 downto 0) 
	);
end traffic;
architecture traffic of traffic is	    
	type state_type is (RG, RO, RR1, GR, OR1, RR2);

	signal state	: 	state_type;
    signal count	: 	unsigned(3 downto 0);
    constant SEC5	: 	unsigned(3 downto 0) := "1111";
    constant SEC1	: 	unsigned(3 downto 0) := "0011";
    
begin
    process (clk, reset)
    begin
		if reset 	=	'1' then
        	state  <=	RG;
            count  <=	X"0";
            
        elsif rising_edge(clk) then
        	
            case state is
            	when RG => 
                	if count < SEC5 then
                    	state <= RG;
                        count <= count + x"1";
                    else 
                    	state <= RO;
                        count <= X"0";
                    end if;
                when RO => 
                	if count < SEC1 then
                    	state <= RO;
                        count <= count + "0001";
                    else 
                    	state <= RR1;
                        count <= X"0";
                    end if;
                when RR1 => 
                	if count < SEC1 then
                    	state <= RR1;
                        count <= count +"0001";
                    else 
                    	state <= GR;
                        count <= X"0";
                    end if;
               when GR => 
                	if count < SEC5 then
                    	state <= GR;
                        count <= count + "0001";
                    else 
                    	state <= OR1;
                        count <= X"0";
                    end if;
               when OR1 => 
                	if count < SEC1 then
                    	state <= OR1;
                        count <= count + X"1";
                    else 
                    	state <= RR2;
                        count <= X"0";
                    end if;
               when RR2 => 
                	if count < SEC1 then
                    	state <= RR2;
                        count <= count + "0001";
                    else 
                    	state <= RG;
                        count <= X"0";
                    end if;
       			when others => state <= RG;
             end case;
         end if;
    end process;
    
    C2: process(state)
    	begin
   			case state is 
            	when RG 	=> light <= "100001";
                when RO 	=> light <= "100010";
                when RR1    => light <= "100100";
                when GR 	=> light <= "001100";
                when OR1 	=> light <= "010100";
                when RR2    => light <= "100100";
                when others => light <= "100001";
            end case;
    end process;
    
end traffic;
