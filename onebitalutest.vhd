--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:04:36 11/01/2016
-- Design Name:   
-- Module Name:   C:/Temp/ECE475Lab6/onebitalutest.vhd
-- Project Name:  ECE475Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: onebitALU
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
 
ENTITY onebitalutest IS
END onebitalutest;
 
ARCHITECTURE behavior OF onebitalutest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT onebitALU
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         OP1 : IN  std_logic;
         OP0 : IN  std_logic;
         O : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal OP1 : std_logic := '0';
   signal OP0 : std_logic := '0';

 	--Outputs
   signal O : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: onebitALU PORT MAP (
          A => A,
          B => B,
          OP1 => OP1,
          OP0 => OP0,
          O => O
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		A<='0';
		B<='0';
		OP1<='0';
		OP0<='0';
		wait for 50 ns;
		
		A<='1';
		B<='1';
		OP1<='0';
		OP0<='0';
		wait for 50 ns;
		
		A<='1';
		B<='0';
		OP1<='0';
		OP0<='1';
		wait for 50 ns;
		
		A<='0';
		B<='0';
		OP1<='1';
		OP0<='0';
		wait for 50 ns;

		A<='1';
		B<='0';
		OP1<='1';
		OP0<='0';
		wait for 50 ns;
		
		A<='1';
		B<='0';
		OP1<='1';
		OP0<='1';
		wait for 50 ns;
		
		A<='1';
		B<='1';
		OP1<='1';
		OP0<='1';
		wait for 50 ns;
		
		
		
      -- insert stimulus here 

      wait;
   end process;

END;
