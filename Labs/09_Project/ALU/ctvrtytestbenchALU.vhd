--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:49:46 04/30/2020
-- Design Name:   
-- Module Name:   /home/janfrolka/projekt/ctvrtytestbenchALU.vhd
-- Project Name:  projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ctvrtytestbenchALU IS
END ctvrtytestbenchALU;
 
ARCHITECTURE behavior OF ctvrtytestbenchALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         OP : IN  std_logic_vector(3 downto 0);
         clk_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         ALU_Out : OUT  std_logic_vector(7 downto 0);
         underflow_o : OUT  std_logic;
         carry_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal OP : std_logic_vector(3 downto 0) := (others => '0');
   signal clk_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';

 	--Outputs
   signal ALU_Out : std_logic_vector(7 downto 0);
   signal underflow_o : std_logic;
   signal carry_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          OP => OP,
          clk_i => clk_i,
          srst_n_i => srst_n_i,
          ALU_Out => ALU_Out,
          underflow_o => underflow_o,
          carry_o => carry_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		srst_n_i <= '0';
      wait for 100 ns;
		srst_n_i <= '1';

      wait for clk_i_period;
      -- insert stimulus here 
		
		A <= "1010";
		B <= "1111";
		OP <= "0101";		--nasobeni
		
		wait for 300 ns;
		
		OP <= "0000";		--scitani
		
		wait for 300 ns;
		
		OP <= "0001";		--odcitani
		
		wait for 300 ns;
		
		OP <= "0010";
		
		wait for 300 ns;
		
		OP <= "1000";
		
		wait for 300 ns;
		
		OP <= "1101";

      wait;
   end process;

END;
