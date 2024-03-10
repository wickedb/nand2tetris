// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the R2 in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768 (as per the project website)


//Pseudocode for 
//R0*R1 = R2
//Multiplication is a lot of adds
//Accumulate and add R0, R1 times
//for i < R1:
// 	mult=mult+R0

//D gets mem[0]
@R0
D=M
//variable var1 gets mem[0]
@var1
M=D
//D gets mem[1]
@R1
D=M
//variable var2 gets mem[1]
@var2
M=D
//variable R2 gets const 0
@0
D=M
@R2
M=D

//label LOOP
(LOOP)
	//i<var2 check
	@i
	D=M
	@var2
	D=D-M
	@END
	D;JGT
	//add R0 to R2 
	//D gets mem[0]
	@R0
	D=M
	//D gets R2 and add
	@R2
	D=D+M
	//store to R2
	@R2
	M=D
	//increment i 
	@i
	M=M+1
	//continue loop
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP
