# ECE 475 4bit ALU
Authors: Rachel & Danya

Lab 6

The objective is to design both a 1-bit and a 4-bit ALU in VHDL using structural modeling.

Equipment Used:
Xilinx IDE, iSim, iMPACT
ML501 Xilinx board with Virtex-5 LX Xilinx chip

OpCode Chart for 1-bit and 4-bit ALU
                B-Invert  OP2 OP1 OP0
AND                 0      0   0   0   
OR                  0      0   0   1
ADD                 0      0   1   0
SUBTRACT            1      0   1   1
SetLessThan(SLT)    1      1   0   0
BranchOnEqual(BEQ)  1      1   0   1

For the 1-bit ALU design, we went with a 4:1 MUX, where only OP1 and OP0 were significant.
The 1-bit ALU cannot perform SLT or BEQ.
An 8:1 MUX had to be designed to use for the 4-bit ALU, to accomodate for the additional two instructions.

The AND and OR operations were built-in components of Xilinx that we used.
We had to design an adder to perform ADD and SUBTRACT. 
The adder was designed using the following logical functions:
Sum = A xor B xor C
Cout = (A*B)+(Cin*(A xor B))

the subtract functionality was designed using 2's Complement, such that A-B = A + (-B).
The B value would be made negative by inverting it and adding 1 to the rightmost bit.

To design the 4-bit ALU, we designed and tested an 8:1 MUX. 
The ALU has the following inputs:
A3-A0, B3-B0, OP2, OP1, OP0
The ALU has the following outputs:
O3-O0

We drew a schematic of the intended design, to label our internal signals before coding them.

For designing the "set if less than" (SLT) functionality, we used our subtractor (two's complement) and set the three 
leftmost bits for the output to zero, and the rightmost bit as the leftmost bit of the subtractor. 
This is because the leftmost bit, if 1, means the subtraction was negative, so it was less. 

For designing the BEQ functionality, we decided to set all of the bits if the values are equal. 
We used a subtractor and fed all of the outputs of the subtractor to a 4-bit OR gate. 
We then inverted that output. Basically, each bit output should be zero if the subtraction is done,
and the values are equal. We set the BEQ function by inverting that output. We set the two left 
possible opcodes to zero.

RTL schematics were generated for each structure designed: 4:1 MUX, 1-bit ALU, 8:1 MUX, 4-bit ALU.
Waveforms were generated to verify the intended functionality of each component.
The designs were implemented and tested on the development board.
