.386
.model FLAT, C

PUBLIC COUNT

.CODE
COUNT:
	PUSH EBP
	MOV  EBP, ESP
	ADD  EBP, 8
	
	MOV  EBX, [EBP]			 ; X
	MOV  ECX, [EBP + 4]		 ; L
	
    XOR  EAX, EAX
    XOR  edx, edx
	
	COMP:
		BT   [EBX], EDX
	    JNC  ZERO
		INC  EAX
	ZERO:
		INC  EDX
		
	E_COMP:
		LOOP COMP

	POP  EBP		
	RET
END
