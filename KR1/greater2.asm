; Programm will print out first element
; that is bigger than A[1]
; or nothing if A[1] is biggest

SSEG SEGMENT PARA STACK 'STACK'
	DB 64 DUP(0)
SSEG ENDS

DSEG SEGMENT PARA 'DATA'
	A	DB	"0202345361"
DSEG ENDS

CSEG SEGMENT PARA 'CODE'
	ASSUME CS:CSEG, DS:DSEG, SS:SSEG

START	PROC FAR
	MOV AX, DSEG
	MOV DS, AX

	MOV SI, 0 ; current index
	MOV CX, 9 ; size of array
	MOV BL, A[1]

M1:	MOV AL, A[SI]
	CMP AL, BL
	JA M2 ; AL > BL
	INC SI
	LOOP M1
	JMP M3 ; if second element is biggest

M2:	MOV AH, 2
	MOV DL, A[SI]
	INT 21H
M3:	MOV 	AH,4CH
	INT 	21H
START ENDP
CSEG ENDS

END START