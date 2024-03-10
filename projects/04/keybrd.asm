// i find myself more stuck with the keyboard part so ill solve that first

//write keyboard value to r0

//initialize R0 to 0
@0
D=A
@R0
M=D
(DISPLAY)
	//D gets [keyboard_base_addr]
	@KBD
	D=M
	//write to R0
	@R0
	M=D
	@DISPLAY
	0;JMP
