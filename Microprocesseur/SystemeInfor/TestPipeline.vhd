--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:24:36 05/07/2020
-- Design Name:   
-- Module Name:   D:/Bureau/Cours INSA/SystemeInfor/TestPipeline.vhd
-- Project Name:  SystemeInfor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pipeline
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
 
ENTITY TestPipeline IS
END TestPipeline;
 
ARCHITECTURE behavior OF TestPipeline IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pipeline
    PORT(
         CLK : IN  std_logic;
         QA : out  STD_LOGIC_VECTOR (7 downto 0);
         QB : out  STD_LOGIC_VECTOR (7 downto 0);
			ADDR : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ADDR : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);
 

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pipeline PORT MAP (
          CLK => CLK,
          QA => QA,
			 QB => QB,
			 ADDR => ADDR
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     
	  ADDR <= x"00";
		wait for CLK_period * 15;
	  ADDR <=x"01";
		wait for CLK_period * 15 ;
	  ADDR <= x"02";
	  wait for CLK_period * 15 ;
	  ADDR <= x"03";
	  wait for CLK_period * 15 ;
	  ADDR <= x"04";
	  wait for CLK_period * 15 ;
	  ADDR <= x"05";
	  wait for CLK_period * 15 ;
	  ADDR <= x"06";
	  

      -- insert stimulus here 
		
	

		
		wait for CLK_period*10;
      wait;
   end process;

END;
