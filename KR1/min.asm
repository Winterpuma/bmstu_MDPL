; Programm will find min symbol in array
; Output it and it's index

SSEG SEGMENT PARA STACK 'STACK'
	DB 64 DUP(0)
SSEG ENDS

DSEG SEGMENT PARA 'DATA'
	A	DB	"3423531945"
DSEG ENDS

CSEG SEGMENT PARA 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSEG

START	PROC FAR
	MOV AX, DSEG
	MOV DS, AX

	MOV SI, 1 ; current index
	MOV DI, 0 ; index of min element
	MOV CX, 9 ; array size

M2:	MOV AL, A[DI]
	CMP A[SI], AL
	JB M3 ; A[SI] < AL
	JA M4 ; A[SI] > AL
M3:	MOV DI, SI
M4:	INC SI
	LOOP M2

	; output min symbol
	MOV AH, 2
	; ADD A[DI], '0' if elements in A are splited by comma
	MOV DL, A[DI] 
	INT 21H

	MOV DL, 20H ; space
	INT 21H

	; output index of min symbol
	MOV DX, DI
	ADD DL, '0'
	INT 21H

	MOV AH,4CH
	INT 21H
START ENDP
CSEG ENDS

END START