// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

// pseudo-code
// problem1: listen for keyboard input and do Something
// problem2: manipulate color of whole screen (according to lecture, screen=256r X 512c)
// every row, represented by 32 regs 
// to access row 3 = 32*3 = 96
// keybrd is a 16 bit reg, idle keybrd == 0
//

//should i also be keeping track of the previous state? 

//variable totalpixels = 256*32
@8192
D=A
@totalpixels
M=D
//variable i gets value 0
@i
M=0

(KEYBOARDLISTEN)
	//D gets [keyboard_base_addr]
	@KBD
	D=M
	//input!=0 check
	//@DARKEN
	//D;JGT
	//input==0 check
	@LIGHTEN
	D;JEQ
	//@KEYBOARDLISTEN
	//0;JMP

//label DARKEN
(DARKEN)
	//i<totalpixels check
	@totalpixels
	D=M
	@i
	D=D-M
	@KEYBOARDLISTEN
	D;JLE
	//write value -1 to mem[pixel] to darken
	@i
	D=M
	@SCREEN
	A=A+D
	M=-1
	//increment i 
	@i
	M=M+1
	//continue loop
	@KEYBOARDLISTEN
	0;JMP
	
//label LIGHTEN
(LIGHTEN)
	//write value 0 to mem[pixel] to lighten
	@i
	D=M
	@SCREEN
	A=A+D
	M=0
	//if i==0, go back to listening
	@i
	D=M
	@KEYBOARDLISTEN
	D;JLE
	//decrement i 
	@i
	M=M-1
	//continue loop
	@KEYBOARDLISTEN
	0;JMP
