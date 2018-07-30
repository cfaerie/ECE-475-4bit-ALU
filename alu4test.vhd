--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:55:42 11/08/2016
-- Design Name:   
-- Module Name:   C:/Users/user/Desktop/ECE475Lab6/ECE475Lab6/alu4test.vhd
-- Project Name:  ECE475Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fourbitALU
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
 
ENTITY alu4test IS
END alu4test;
 
ARCHITECTURE behavior OF alu4test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourbitALU
    PORT(
         A3 : IN  std_logic;
         A2 : IN  std_logic;
         A1 : IN  std_logic;
         A0 : IN  std_logic;
         B3 : IN  std_logic;
         B2 : IN  std_logic;
         B1 : IN  std_logic;
         B0 : IN  std_logic;
         OP2 : IN  std_logic;
         OP1 : IN  std_logic;
         OP0 : IN  std_logic;
         O3 : OUT  std_logic;
         O2 : OUT  std_logic;
         O1 : OUT  std_logic;
         O0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A3 : std_logic := '0';
   signal A2 : std_logic := '0';
   signal A1 : std_logic := '0';
   signal A0 : std_logic := '0';
   signal B3 : std_logic := '0';
   signal B2 : std_logic := '0';
   signal B1 : std_logic := '0';
   signal B0 : std_logic := '0';
   signal OP2 : std_logic := '0';
   signal OP1 : std_logic := '0';
   signal OP0 : std_logic := '0';

 	--Outputs
   signal O3 : std_logic;
   signal O2 : std_logic;
   signal O1 : std_logic;
   signal O0 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourbitALU PORT MAP (
          A3 => A3,
          A2 => A2,
          A1 => A1,
          A0 => A0,
          B3 => B3,
          B2 => B2,
          B1 => B1,
          B0 => B0,
          OP2 => OP2,
          OP1 => OP1,
          OP0 => OP0,
          O3 => O3,
          O2 => O2,
          O1 => O1,
          O0 => O0
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 50 ns;	
		A3<='1';
		A2<='1';
		A1<='1';
		A0<='1';
		B3<='0';
		B2<='0';
		B1<='0';
		B0<='0';
		OP2<='0';
		OP1<='0';
		OP0<='0';
		wait for 50 ns;
		OP2<='0';
		OP1<='0';
		OP0<='1';
		wait for 50 ns;
		OP2<='0';
		OP1<='1';
		OP0<='0';
		wait for 50 ns;
		OP2<='0';
		OP1<='1';
		OP0<='1';
		wait for 50 ns;
		OP2<='1';
		OP1<='0';
		OP0<='0';
		wait for 50 ns;
		OP2<='1';
		OP1<='0';
		OP0<='1';
		wait for 50 ns;
		OP2<='1';
		OP1<='1';
		OP0<='0';
		wait for 50 ns;
		OP2<='1';
		OP1<='1';
		OP0<='1';
		wait for 50 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
