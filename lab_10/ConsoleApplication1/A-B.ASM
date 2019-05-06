;—оставить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполн€ющую вычитание битовых строк A:=A \ B длины L. 
.386
.model FLAT,C
PUBLIC A_B

.CODE
A_B PROC

	PUSH EBP		 
	MOV EBP,ESP		 
	PUSH EBX		

	MOV ESI,[EBP+16] ; строка A	
	MOV EBX,[EBP+12] ; строка B
	MOV EAX,[EBP+8] ; длина строки

	XOR EDX, EDX

	MOV ECX, 32
	DIV  ECX
	MOV ECX, EAX


MAIN_LOOP:
	MOV EAX,[ESI] ; строка A
	MOV EDX,[EBX] ; строка B

	NOT EDX  ; строка B
	AND EAX, EDX

	MOV [ESI], EAX

	ADD ESI, 4
	ADD EBX, 4

	LOOP MAIN_LOOP


	POP EBX
	MOV ESP,EBP
	POP EBP
	RET 12

A_B ENDP

AVB PROC

	PUSH EBP
	MOV EBP, ESP
	PUSH EBX

	MOV ESI, [EBP + 16]; строка A
	MOV EBX, [EBP + 12]; строка B
	MOV EAX, [EBP + 8]; длина строки

	XOR EDX, EDX

	MOV ECX, 32
	DIV  ECX
	MOV ECX, EAX


MAIN_LOOP :
	MOV EAX, [ESI]; строка A
	MOV EDX, [EBX]; строка B

	OR EAX, EDX

	MOV[ESI], EAX

	ADD ESI, 4
	ADD EBX, 4

	LOOP MAIN_LOOP


	POP EBX
	MOV ESP, EBP
	POP EBP
	RET 12
AVB ENDP
END
