----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:37:21 11/01/2016 
-- Design Name: 
-- Module Name:    onebitALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity fulladder is
	port(A,B,Cin: in std_logic; Sum, Cout: out std_logic);
end fulladder;

architecture fulladder_str of fulladder is
	component xor2
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component and2
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component or2
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
signal S0, T0, T1, T2, U0: std_logic;
begin
XOR_1: xor2 port map(A, B, S0);
XOR_2: xor2 port map(S0, Cin, T0);
AND_1: and2 port map(Cin, S0, T1);
AND_2: and2 port map(A, B, T2);
OR_1: or2 port map(T1, T2, U0);
Sum<=T0;
Cout<=U0;
end fulladder_str;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity MUX is
	port(S0, S1, I0, I1, I2, I3: in std_logic; Q: out std_logic);
end MUX;


architecture MUX_str of MUX is
		component and3 is
				port (I0, I1, I2: in std_logic; O:out std_logic);
		end component;
		component or4 is
				port (I0, I1, I2, I3: in std_logic; O: out std_logic);
		end component;
		component inv is
				port (I: in std_logic; O: out std_logic);
		end component;
signal d0, d1, d2, d3, d4, d5, d6: std_logic;

Begin
A0: and3 port map (I0, d0, d1, d2);
A1: and3 port map (I1, d0, S1, d3);
A2: and3 port map (I2, S0, d1, d4);
A3: and3 port map (I3, S0, S1, d5);
INV0: inv port map (S0, d0);
INV1: inv port map (S1, d1);
OR0: or4 port map (d2, d3, d4, d5, d6);

Q<=d6;
end MUX_str;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity onebitALU is
	port(A, B, OP1, OP0: in std_logic; O: out std_logic);
end onebitALU;

architecture onebitALU_str of onebitALU is
	component and2
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component or2
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component inv
		port (I: in std_logic; O: out std_logic);
	end component;
	component fulladder
		port(A,B,Cin: in std_logic; Sum, Cout: out std_logic);
	end component;
	component MUX
		port(S0, S1, I0, I1, I2, I3: in std_logic; Q: out std_logic);
	end component;
signal S0, S1, S2, S3, COadd, COsubtract, notb: std_logic;
begin
myand1: and2 port map(A, B, S0);
myor1: or2 port map(A, B, S1);
fa1: fulladder port map(A, B, '0', S2, COadd);
myinv: inv port map(B, notb);
fa2: fulladder port map(A, notb, '1', S3, COsubtract);
myMux: MUX port map(OP1, OP0, S0, S1, S2, S3, O);

end onebitALU_str;




