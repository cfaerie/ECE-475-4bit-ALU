----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:05:19 11/08/2016 
-- Design Name: 
-- Module Name:    mux8x1 - Behavioral 
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


entity MUX8to1 is
	port(S2, S1, S0, I7, I6, I5, I4, I3, I2, I1, I0: in std_logic;
		O: out std_logic);
end MUX8to1;


architecture MUX8to1_str of MUX8to1 is
		component and4 is
				port (I0, I1, I2, I3: in std_logic; O:out std_logic);
		end component;
		component or4 is
				port (I0, I1, I2, I3: in std_logic; O: out std_logic);
		end component;
		component inv is
				port (I: in std_logic; O: out std_logic);
		end component;
signal IS0,IS1,IS2,or0, or1, orOut, andOut0, andOut1, andOut2, andOut3, andOut4, andOut5, andOut6, andOut7: std_logic;

Begin
A_0: and4 port map (I0,IS2,IS1,IS0,andOut0);
A_1: and4 port map (I1, IS2,IS1,S0,andOut1);
A2: and4 port map (I2,IS2,S1,IS0,andOut2);
A3: and4 port map (I3,IS2,S1,S0,andOut3);
A4: and4 port map (I4,S2,IS1,IS0,andOut4);
A5: and4 port map (I5,S2,IS1,S0,andOut5);
A6: and4 port map (I6,S2,S1,IS0,andOut6);
A7: and4 port map (I7,S2,S1,S0,andOut7);

INV0: inv port map (S0, IS0);
INV1: inv port map (S1, IS1);
INV2: inv port map (S2,IS2);

OR_0: or4 port map (andOut0,andOut1,andOut2,andOut3,or0);
OR_1: or4 port map (andOut4,andOut5,andOut6,andOut7,or1);
OR_2: or4 port map (or1,or0,'0','0',orOut);

O<=orOut;
end MUX8to1_str;





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity fourbitALU is
	port(A3, A2, A1, A0, B3, B2, B1, B0: in std_logic; --4 bit inputs
	OP2, OP1, OP0: in std_logic;--3 bit opcode input
	O3, O2, O1, O0: out std_logic);--4 bit output
end fourbitALU;


architecture fourbitALU_str of fourbitALU is
	component and2 is
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component or2 is
		port (I0, I1: in std_logic; O: out std_logic);
	end component;
	component or4 is
		port (I0, I1, I2, I3: in std_logic; O: out std_logic);
	end component;
	component inv is
		port (I: in std_logic; O: out std_logic);
	end component;
	component fulladder is
		port(A,B,Cin: in std_logic; Sum, Cout: out std_logic);
	end component;
	component MUX8to1 is
		port(S2, S1, S0, I7, I6, I5, I4, I3, I2, I1, I0: in std_logic;
		O: out std_logic);
	end component;


signal ADDCout0,ADDCout1,ADDCout2,ADDCout3, SUBCout0,SUBCout1,SUBCout2,SUBCout3,BEQCout0,BEQCout1,BEQCout2,BEQCout3,SLTCout0,SLTCout1,SLTCout2,SLTCout3: std_logic; 
signal notb0,notb1, notb2, notb3, beqOr, beqNot: std_logic;
signal mux0in0,mux0in1,mux0in2,mux0in3,mux0in4,mux0in5: std_logic;
signal mux1in0,mux1in1,mux1in2,mux1in3,mux1in4,mux1in5: std_logic;
signal mux2in0,mux2in1,mux2in2,mux2in3,mux2in4,mux2in5: std_logic;
signal mux3in0,mux3in1,mux3in2,mux3in3,mux3in4,mux3in5: std_logic;--opcode

Begin
--port(A, B: std_logic_vector(4 downto 0); --4 bit inputs
-- OP: in std_logic_vector (2 downto 0);--3 bit opcode input
-- O: out std_logic_vector (4 downto 0);--4 bit output


--4 AND gates, 1 per bit
myAnd0: and2 port map(A0,B0,mux0in0);
myAnd1: and2 port map(A1,B1,mux1in0);
myAnd2: and2 port map(A2,B2,mux2in0);
myAnd3: and2 port map(A3,B3,mux3in0);


--8 OR gates
myOr0: or2 port map(A0,B0,mux0in1);
myOr1: or2 port map(A1,B1,mux1in1);
myOr2: or2 port map(A2,B2,mux2in1);
myOr3: or2 port map(A3,B3,mux3in1);


--ADD, 1 full adder per bit
--port(A,B,Cin: in std_logic; Sum, Cout: out std_logic);
aFA0: fulladder port map(A0,B0,'0',mux0in2,ADDCout0);
aFA1: fulladder port map(A1,B1,ADDCout0,mux1in2,ADDCout1);
aFA2: fulladder port map(A2,B2,ADDCout1,mux2in2,ADDCout2);
aFA3: fulladder port map(A3,B3,ADDCout2,mux3in2,ADDCout3);


--SUB, 1 full adder per bit
sFA0: fulladder port map(A0,notb0,'1',mux0in3,SUBCout0);
sFA1: fulladder port map(A1,notb1,SUBCout0,mux1in3,SUBCout1);
sFA2: fulladder port map(A2,notb2,SUBCout1,mux2in3,SUBCout2);
sFA3: fulladder port map(A3,notb3,SUBCout2,mux3in3,SUBCout3);

--SLT
--SUB, 1 full adder per bit
sltFA0: fulladder port map(A0,notb0,'1',mux0in4,SLTCout0);
sltFA1: fulladder port map(A1,notb1,SLTCout0,mux1in4,SLTCout1);
sltFA2: fulladder port map(A2,notb2,SLTCout1,mux2in4,SLTCout2);
sltFA3: fulladder port map(A3,notb3,SLTCout2,mux3in4,SLTCout3);




--BEQ
--SUB, 1 full adder per bit
bFA0: fulladder port map(A0,notb0,'1',mux0in5,BEQCout0);
bFA1: fulladder port map(A1,notb1,BEQCout0,mux1in5,BEQCout1);
bFA2: fulladder port map(A2,notb2,BEQCout1,mux2in5,BEQCout2);
bFA3: fulladder port map(A3,notb3,BEQCout2,mux3in5,BEQCout3);
myOR4: or4 port map(mux0in5, mux1in5, mux2in5, mux3in5, beqOr);
myinv: inv port map(beqOr, beqNot);



--Creating notb
myinv0: inv port map(B0, notb0);
myinv1: inv port map(B1, notb1);
myinv2: inv port map(B2, notb2);
myinv3: inv port map(B3, notb3);


--Multiplexing outputs, 1 mux per bit
--port(S: in std_logic_vector (2 downto 0);--3 bit select lines
		--I: in std_logic_vector (7 downto 0);--8 bit input
		--O: out std_logic);


Mux8_0: MUX8to1 port map(OP2, OP1, OP0, '0', '0', beqNot,mux3in4,mux0in3,mux0in2,mux0in1,mux0in0,O0);
Mux8_1: MUX8to1 port map(OP2, OP1, OP0,'0', '0', beqNot,'0',mux1in3,mux1in2,mux1in1,mux1in0,O1);
Mux8_2: MUX8to1 port map(OP2, OP1, OP0,'0', '0', beqNot,'0',mux2in3,mux2in2,mux2in1,mux2in0,O2);
Mux8_3: MUX8to1 port map(OP2, OP1, OP0,'0', '0', beqNot,'0',mux3in3,mux3in2,mux3in1,mux3in0,O3);


end fourbitALU_str;

