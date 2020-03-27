library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
--
end testbench;

architecture tb of testbench is

component traffic is
	port(
    clk			:	in std_logic;
    reset		:	in std_logic;	
    light		:	out std_logic_vector(5 downto 0)
);
end component;
    
signal s_clk    :	std_logic :='0';
signal s_reset  :	std_logic :='0';
    
signal s_light :	std_logic_vector(5 downto 0);
    
BEGIN    
    UUT: traffic port map(
    	clk 	=>	s_clk,
        reset 	=>	s_reset,
        
        light   =>	s_light
    );
    
   	Clk_gen: process	
  	begin
    	while Now < 6 uS loop
      		s_clk <= '0';
      		wait for 0.5 NS;
      		s_clk <= '1';
      		wait for 0.5 NS;
    	end loop;
    	wait;
  	end process Clk_gen;

    -- Stimulus process
    stim_proc: process
    begin
       wait until rising_edge(s_clk);	
       wait;
    
    end process;
end tb;
