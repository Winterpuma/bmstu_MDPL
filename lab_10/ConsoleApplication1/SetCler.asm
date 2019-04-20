;Составить подпрограмму с именем Set1 типа
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;выполняющую установку разряда N битовой строки S 
;в ноль, если P=0, в единицу,если P не равен 0.
.386
.model FLAT,C
PUBLIC SetCler 

.CODE
SetCler PROC
	PUSH EBP
	MOV	EBP, ESP
	PUSH EBX

	MOV	EDX,0
	MOV	ECX, [EBP+8]		;P
	MOV	EAX, [EBP+12]	;N
	
	MOV	EBX, 32
	DIV	EBX		;eax = eax/ebx + edx <=> N/32 + остаток -> EDX
	PUSH EDX
	
	
	MOV	EBX,4	;шаг смещения в байтах для определения слова
	MUL	EBX		;eax = eax*ebx 
	
	MOV	EBX, [EBP+16] ;начало первого слова
	ADD	EBX, EAX		 ;смещение на нужное слово

	POP	EDX
	
	CMP	ECX, 0	;что ставить в N-ый бит
	JE SET0
	
	BTS [EBX], EDX	;установка 1 EBX[EDX] = 1
	JMP	ENDPROC
	
SET0:
	BTR	[EBX],EDX	;установка 0 EBX[EDX] = 0

ENDPROC:
	POP	EBX
	MOV	ESP, EBP
	POP	EBP
	
	RET 12
SetCler ENDP
END
