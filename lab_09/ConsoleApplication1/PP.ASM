.386
.model FLAT, C

PUBLIC p1
PUBLIC factorial_loop
PUBLIC factorial_stack
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

factorial_stack: ;take n and multiply nf by n in stack
	PUSH EBP
	MOV EBP, ESP ; ESP - stack pointer

	;MOV EAX, [EBP+8] ; get N value from stack
	MOV EBX, [EBP+12] ; get NF adress from stack
	MOV ECX, [EBP+8] ; N
	CMP ECX, 1
	JE M1
	DEC ECX
	PUSH EBX ; NF
	PUSH ECX
	CALL factorial_stack
	
	;ADD ESP, 8
	;MOV ECX, [EBP+8]
	;MUL ECX
	;JMP M2
M1:
	MOV EAX, 1
M2:
	POP ESP

	;POP EBP
	RET

	;POP EBX ; NF
	;POP EAX ; N
	
	;MOV CX, [EBX] ; NF value
	;XCHG EAX, ECX ; N in ECX
	;MUL CX ; multiply AX and N, result in AX 
	;MOV dword ptr [EBX], EAX ; edit NF value by adress to result
	;DEC ECX
	;JZ finish
	;PUSH ECX ; N
	;PUSH EBX ; NF
	;CALL factorial_stack
;finish:
	;RET
	
END
