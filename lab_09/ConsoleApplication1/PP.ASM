.386
.model FLAT, C

PUBLIC p1
.CODE
p1:
	PUSH EBP
	MOV EBP, ESP
	MOV EAX, [EBP+8] ; get N value from stack
	MOV EBX, [EBP+12] ; get NF adress from stack
	MOV dword ptr [ebx], 6H  ; edit NF value by adress to 6
	MOV EAX, [EBX] ; get NF value from stack
	POP EBP
	
	RET
END