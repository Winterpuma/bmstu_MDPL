.386
.model FLAT, C

PUBLIC X_Y

.CODE
X_Y:
	PUSH EBP
	MOV  EBP, ESP
	ADD  EBP, 8
	
	MOV  EAX, [EBP]		; X
	MOV  EBX, [EBP + 4] ; Y
	MOV  ECX, [EBP + 8]	; L
	XOR  EDX, EDX
	
	COMP:
		BT   [EBX], EDX
		JNC  E_COMP
		
		BTR  [EAX], EDX
	
	E_COMP:
		inc  EDX
		cmp  EDX, 32
		JNE  RE_COMP
		
		XOR  EDX, EDX
		ADD  EAX, 4
		ADD  EBX, 4
	
	RE_COMP:
		LOOP COMP

EXIT:
	POP  EBP
	RET
END