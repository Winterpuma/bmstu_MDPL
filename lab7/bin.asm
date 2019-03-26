PUBLIC UBin
PUBLIC SBin

DSEG	SEGMENT PARA PUBLIC 'DATA'
	NEWLINE	DB	10, 13, '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG
		
UBin	PROC NEAR
	PUSH BP
	MOV  BP, SP ; stack registers, SP - point on the top of the stack, so we configure stack here
		
	MOV  BX, [BP + 6] ; in BX put something that is in stack by the number six (there are SI, X, BP), BX = X
		
	MOV CX, 16 ; 16
		
; delete all zeros on the left in ub1 and ub2
UB_1:
	SHL BX, 1 ; bitwise left shift by 1 (* 2)
	JNC UB_2
	MOV DH, 1 ; remember 1
	JMP UB_4		

UB_2:
	LOOP UB_1
	INC CX
		
UB_3:
	MOV DH, 0 
	SHL BX, 1 ; bitwise left shift by 1
	JNC UB_4 ; no overflow, CF=0, if 0
	MOV DH, 1 ; DH = 1 ??, if 1
UB_4:
	MOV  DL, '0' ; DL = 30
	ADD  DL, DH ; DL = 30 + DH                  
			
	MOV  AH, 2 ; print DL
	INT  21h
			
	DEC  CX ; minus one digit  
	CMP CX, 0
	JA UB_3
 
UB_5:
        MOV  AH, 9
	MOV  DX, OFFSET NEWLINE
	INT  21H

	POP BP
	RET 4 ; delete x, si
UBin	ENDP
		
SBin	PROC NEAR
	PUSH BP
	MOV  BP, SP
		
	MOV  CX, [BP + 4] ; SI
	MOV  BX, [BP + 6] ; X
		
	CMP  CL, 0 ; CL - flag minus
	JE   SB_SKIP_NEG ; if CL == 0
		
	MOV  AH, 2 ; print minus before the num
	MOV  DL, '-'
	INT  21H
		
	NEG  BX ; make negative
		
SB_SKIP_NEG: ; if the number is positive
	PUSH BX
	PUSH CX
	
	CALL UBin ; call unsigned bin
		
	POP BP
	RET 4 ; delete x, si
SBin	ENDP
		
CSEG	ENDS
END