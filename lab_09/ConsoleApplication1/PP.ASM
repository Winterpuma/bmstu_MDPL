.386
.model FLAT, C

PUBLIC p1
PUBLIC factorial_loop
PUBLIC factorial_stack
PUBLIC factorial_registers
.CODE
p1:
	PUSH EBP

	MOV EBP, ESP ; ESP - stack pointer
	MOV EAX, [EBP+8] ; get N value from stack
	MOV EBX, [EBP+12] ; get NF adress from stack
	MOV dword ptr [EBX], 720d ; edit NF value by adress to 720
	MOV EAX, [EBX] ; get new NF value 
	POP EBP
	RET


factorial_loop:
	PUSH EBP
	MOV EBP, ESP ; ESP - stack pointer
	MOV ECX, [EBP+8] ; get N value from stack
	MOV EAX, 1H

LOOP1:
	MUL ECX ; result of multiplication in EAX
	LOOP LOOP1

	MOV EBX, [EBP+12] ; get NF adress from stack
	MOV dword ptr [EBX], EAX ; edit NF value by adress to result
	POP EBP
	RET
	

factorial_registers:
	PUSH EBP
	MOV	EBP, ESP
	MOV EAX, 1
	MOV	ECX, [EBP + 8] ; N
	MOV	EBX, [EBP + 12] ; NF adress

	CMP ECX, 1 ; if got 1 or 0 
	JBE finish

	CALL reg_loop
finish:
	MOV	DWORD PTR [EBX], EAX
	POP EBP
	RET

reg_loop:
	CMP ECX, 1
	JBE reg_exit

	MUL ECX
	DEC ECX
	CALL reg_loop

reg_exit:
	RET


factorial_stack:
	PUSH EBP
	MOV	EBP, ESP
	MOV	ECX, [EBP + 8] ; N
	MOV	EBX, [EBP + 12] ; NF adress

	CMP	ECX, 1
	JBE ret_1
		
	DEC ECX

	PUSH EBX ; NF adress
	PUSH ECX ; N - 1
	CALL factorial_stack
	ADD	ESP, 8 ; edit stack pointer 

	INC	ECX
	MOV	EAX, DWORD PTR [EBX]
	MUL	ECX

	MOV	DWORD PTR [EBX], EAX
	JMP	exit

ret_1:	
	MOV	DWORD PTR [EBX], 1

exit:
	POP	EBP
	RET	
	
END
