--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:08:26 04/22/2020
-- Design Name:   
-- Module Name:   D:/Bureau/Cours INSA/SystemeInfor/TestUAL.vhd
-- Project Name:  SystemeInfor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: processeur
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
 
ENTITY TestUAL IS
END TestUAL;
 
ARCHITECTURE behavior OF TestUAL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT processeur
    PORT(
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   -- No clocks detected in port list. Replace clk below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
	signal clk: std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: processeur PORT MAP (
          Ctrl_Alu => Ctrl_Alu,
          A => A,
          B => B,
          S => S,
          N => N,
          O => O,
          Z => Z,
          C => C
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      A<= x"05";
		B<= x"10";
		Ctrl_Alu <= "001";
		
		wait for 100 ns;
		
		A<= x"05";
		B<= x"10";
		Ctrl_Alu <= "010";
		
		wait for 100 ns;
		
		A<= x"05";
		B<= x"10";
		Ctrl_Alu <= "011";
		
		wait for 100 ns;
		
		A<= x"10";
		B<= x"05";
		Ctrl_Alu <= "011";

      wait;
   end process;

END;
