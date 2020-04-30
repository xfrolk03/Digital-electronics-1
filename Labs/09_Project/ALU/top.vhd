----------------------------------------------------------------------------------
-- Company: FEKT VUT v Brne
-- Engineer: Jan Frolka, Dominik Chrenčík
-- 
-- Create Date:    15:16:57 04/20/2020 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 	 ALU
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
port(

	inp_A 		: in std_logic_vector(3 downto 0);
	inp_B 		: in std_logic_vector(3 downto 0);
	choose_operation: in std_logic_vector(3 downto 0);
    
   clk_i      		: in std_logic;
	BTN0 		: IN std_logic;   			-- reset
	 
	disp_seg_o 	: out std_logic_vector(6 downto 0);
	underflow_o 	: out std_logic;
	carry_o	  	: out std_logic
	);
end top;

architecture Behavioral of top is

	-- CLOCK ENABLE
	component clock_enable is
	generic (
		g_NPERIOD : std_logic_vector(15 downto 0) := x"0004"
	);
	port (
		clk_i          : in  std_logic;
		srst_n_i       : in  std_logic; -- Synchronous reset (active low)
		clock_enable_o : out std_logic
	);
	end component;

	-- HEX_TO_7SEG
	component hex_to_7seg is
   port(
		hex_i		: in  std_logic_vector(3 downto 0);
     		seg_o		: out std_logic_vector(6 downto 0)
	);
	end component;

	-- ALU
	component ALU is
   port (
	 	A     		: in   STD_LOGIC_VECTOR(3 downto 0);  
		B     		: in   STD_LOGIC_VECTOR(3 downto 0);
		OP   		: in   STD_LOGIC_VECTOR(3 downto 0);
		clk_i 		: in 	 STD_LOGIC;
		srst_n_i	: in 	 STD_LOGIC;
	 
		ALU_Out	 	: out  STD_LOGIC_VECTOR(7 downto 0); 
		underflow_o  	: out  STD_LOGIC;
		carry_o 	: out  STD_LOGIC
	);	 
	end component;

	signal display_value	: std_logic_vector(7 downto 0) := (others => '0'); 				
	signal alu_clk		: std_logic := '0';

begin

	seven_seg: hex_to_7seg
	port map(
		hex_i => display_value(3 downto 0),
		seg_o => disp_seg_o	
	);
	
	enabler: clock_enable
	port map(
		clk_i => clk_i,
		srst_n_i => BTN0,
		clock_enable_o => alu_clk
	);
	
	arithmetic: ALU
	port map(
		A => inp_A,
		B => inp_B,
		OP => choose_operation,
		clk_i => alu_clk,
		srst_n_i => BTN0,
		ALU_Out => display_value,
		underflow_o => underflow_o,
		carry_o => carry_o		
	);

end Behavioral;
