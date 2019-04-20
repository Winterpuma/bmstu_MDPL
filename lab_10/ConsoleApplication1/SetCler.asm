;��������� ������������ � ������ Set1 ����
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;����������� ��������� ������� N ������� ������ S 
;� ����, ���� P=0, � �������,���� P �� ����� 0.
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
	DIV	EBX		;eax = eax/ebx + edx <=> N/32 + ������� -> EDX
	PUSH EDX
	
	
	MOV	EBX,4	;��� �������� � ������ ��� ����������� �����
	MUL	EBX		;eax = eax*ebx 
	
	MOV	EBX, [EBP+16] ;������ ������� �����
	ADD	EBX, EAX		 ;�������� �� ������ �����

	POP	EDX
	
	CMP	ECX, 0	;��� ������� � N-�� ���
	JE SET0
	
	BTS [EBX], EDX	;��������� 1 EBX[EDX] = 1
	JMP	ENDPROC
	
SET0:
	BTR	[EBX],EDX	;��������� 0 EBX[EDX] = 0

ENDPROC:
	POP	EBX
	MOV	ESP, EBP
	POP	EBP
	
	RET 12
SetCler ENDP
END
