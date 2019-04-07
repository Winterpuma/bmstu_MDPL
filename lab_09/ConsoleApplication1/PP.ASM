.386
.model FLAT, C

PUBLIC p1
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
END