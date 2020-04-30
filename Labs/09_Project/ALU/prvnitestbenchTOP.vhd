--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:37:49 04/30/2020
-- Design Name:   
-- Module Name:   /home/janfrolka/projekt/prvnitestbenchTOP.vhd
-- Project Name:  projekt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY prvnitestbenchTOP IS
END prvnitestbenchTOP;
 
ARCHITECTURE behavior OF prvnitestbenchTOP IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         inp_A : IN  std_logic_vector(3 downto 0);
         inp_B : IN  std_logic_vector(3 downto 0);
         choose_operation : IN  std_logic_vector(3 downto 0);
         clk_i : IN  std_logic;
         BTN0 : IN  std_logic;
         disp_seg_o : OUT  std_logic_vector(6 downto 0);
         underflow_o : OUT  std_logic;
         carry_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inp_A : std_logic_vector(3 downto 0) := (others => '0');
   signal inp_B : std_logic_vector(3 downto 0) := (others => '0');
   signal choose_operation : std_logic_vector(3 downto 0) := (others => '0');
   signal clk_i : std_logic := '0';
   signal BTN0 : std_logic := '0';

 	--Outputs
   signal disp_seg_o : std_logic_vector(6 downto 0);
   signal underflow_o : std_logic;
   signal carry_o : std_logic;

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          inp_A => inp_A,
          inp_B => inp_B,
          choose_operation => choose_operation,
          clk_i => clk_i,
          BTN0 => BTN0,
          disp_seg_o => disp_seg_o,
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
      wait for 100 ns;	

      wait for clk_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
