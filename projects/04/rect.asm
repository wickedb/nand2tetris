
//draw rectangle 

//D gets mem[0]
@R0
D=M
//variable n gets mem[0]
@n
M=D
//variable i gets value 0
@i
M=0
//D gets [screen_base_addr]
@SCREEN
D=A
//variable address gets screen_base_addr
@address
M=D
//label LOOP
(LOOP)
	//i<n check
	@i
	D=M
	@n
	D=D-M
	@END
	D;JGT
	//write value -1 to mem[address]
	@address
	A=M
	M=-1
	//increment i 
	@i
	M=M+1
	//increment addr by 32
	@32
	D=A //load constant 32
	@address
	M=D+M
	//continue loop
	@LOOP
	0;JMP
	
(END)
	@END
	0;JMP
	
	
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//fill screen

//variable i gets value 0
@i
M=0
//D gets [screen_base_addr]
@SCREEN
D=A
//variable screenAddr gets screen_base_addr
@screenAddr
M=D
//D gets [keyboard_base_addr]
@KBD
D=M
@FILL
D;JGT
@UNFILL
D;JEQ
//label FILL
(FILL)
	//condition here should be if key pressed
	//if not, then jump to unfill
	@KBD
	D=M
	@END
	D;JLT
	//write value -1 to mem[screenAddr]
	@SCREEN
	A=M
	M=-1
	//increment i 
	@i
	M=M+1
	//increment screenaddr
	@2
	D=A //load constant 
	@SCREEN
	M=D+M
	//continue loop
	@FILL
	0;JMP

(END)
	@END
	0;JMP
	
(UNFILL)
	//condition if key NOT pressed
	//if not, then jump to fill
	@keybrd
	D=M
	@FILL
	D;JNE
	//write value 0 to mem[screenAddr]
	@screenAddr
	A=M
	M=0
	//increment i 
	@i
	M=M+1
	//increment addr by 32
	@32
	D=A //load constant 32
	@screenAddr
	M=D+M
	//continue loop
	@UNFILL
	0;JMP
