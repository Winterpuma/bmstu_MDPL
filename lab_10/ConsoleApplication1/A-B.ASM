;��������� ������������ � ������ A_B ����
;   Procedure (var A: LONGWORD; const B:LONGWORD; L:LONGWORD)
;����������� ��������� ������� ����� A:=A \ B ����� L. 
.386
.model FLAT,C
PUBLIC A_B

.CODE
A_B PROC
	
  	; ����������
	PUSH EBP		; ���������� �������� ���������� ������� 
	MOV EBP,ESP		; ���������� ������� ������� � ����� 
	PUSH EBX		; ��������� �������

	MOV ESI,[EBP+16] ; ������ A	
	MOV EBX,[EBP+12] ; ������ B
	MOV EAX,[EBP+8] ; ����� ������

	MOV ECX, 32
	DIV  ECX ; �������� ���-�� � �������� (������� ��� EAX = 1. �� ������� - ��)
	AND EAX, 15d ; ne kostil))))
	MOV ECX, EAX	
	CMP EDX, 0
	JE MAIN_LOOP
	INC ECX


MAIN_LOOP:
	MOV EAX,[ESI] ; ������ A
	MOV EDX,[EBX] ; ������ B

	NOT EDX  ; ������ B
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