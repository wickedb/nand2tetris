// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the R2 in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768 (as per the project website)


//Pseudocode for R0*R1 = R2
//Multiplication is just a lot of adds
//Add and accumulate R0, R1 times
//for i < R1:
// 	mult=mult+R0

//initialize R2 to 0
@0
D=A
@R2
M=D
//initialize variable i to 0
@0
D=A
@i
M=D

//label LOOP
(LOOP)
	//1. i<=R1 check
	@i
	D=M
	@R1
	D=D-M
	@END
	D;JGE
	//2. add R0 to R2 
	//D gets R0
	@R0
	D=M
	//D gets R2 and add
	@R2
	D=D+M
	//store to R2
	@R2
	M=D
	//3. increment i 
	@i
	M=M+1
	//4. continue loop
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP
