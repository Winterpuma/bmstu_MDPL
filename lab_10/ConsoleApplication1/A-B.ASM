;—оставить подпрограмму с именем A_B типа
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;выполн€ющую вычитание битовых строк A:=A \ B длины L. 
.386
.model FLAT,C
PUBLIC A_B

.CODE
A_B PROC
	
  	; соглашение
	PUSH EBP		; сохранение значение предыдущей функции 
	MOV EBP,ESP		; записываем текущую позицию в стеке 
	PUSH EBX		; сохран€ем прежние

	MOV ESI,[EBP+16] ; строка A	
	MOV EBX,[EBP+12] ; строка B
	MOV EAX,[EBP+8] ; длина строки

	MOV ECX, 32
	DIV  ECX ; странное что-то с делением (старший бит EAX = 1. €к фиксить - хз)
	MOV ECX, EAX	
	CMP EDX, 0
	JE MAIN_LOOP
	INC ECX


MAIN_LOOP:
	MOV EAX,[ESI] ; строка A
	MOV EDX,[EBX] ; строка B

	NOT EDX  ; строка B
	AND EAX, EDX; toA

	MOV [ESI], EAX

	ADD ESI, 4
	ADD EBX, 4

	LOOP MAIN_LOOP


	POP EBX
	MOV ESP,EBP
	POP EBP
	RET 12
A_B ENDP
END
