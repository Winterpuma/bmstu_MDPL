SSEG SEGMENT PARA STACK 'STACK'
	DB 64 DUP(0)
SSEG ENDS

DSEG SEGMENT PARA 'DATA'
	;DATA
DSEG ENDS

CSEG SEGMENT PARA 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSEG

START	PROC FAR

	MOV CX, 5
SUMMATOR:
	ADD AX, 10
	LOOP SUMMATOR
		
	MOV AH, 4CH
	INT 21H
START ENDP
CSEG ENDS

END START