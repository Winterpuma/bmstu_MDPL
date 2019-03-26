PUBLIC UHex
PUBLIC SHex

DSEG	SEGMENT PARA PUBLIC 'DATA'
	NEWLINE	DB	10, 13, '$'
        SYMBOLS DB '0123456789ABCDEF'
        NUMBER  DB ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '$' 
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG
		
UHex	PROC NEAR
PUSH BP
        PUSH SI
	MOV  BP, SP

        MOV DX, [BP + 8] ; DX = X
		MOV SI, 16 ; maximum digit
        MOV CL, 4 ; length of bitwise shift

LOOP_H:
	MOV AX, 15 ; maximum value 15 = F
	AND AX, DX ; mask with X, in AX we have last num of the X
            
        DEC SI 
        MOV BX, OFFSET SYMBOLS ; table of correspondence - list of all symbols
        MOV AL, AL ; initial value - last num of X
        XLAT ; AL = [BX][AL], AL = SYMBOLS[AL]
		
        MOV BX, OFFSET NUMBER 
        MOV [BX + SI], AL ; SI - index, AL - num, put num num in NUMBER
           
	SHR DX, CL ; DX = X, CL = 4, delete last num
	JNE  LOOP_H
            
        MOV DX, OFFSET NUMBER ; print dx
        ADD DX, SI ; SI = 16 - num_length, we do it not to print zeros
        MOV AH, 9
        INT 21H
            
	MOV AH, 9 ; print newline
	MOV DX, OFFSET NEWLINE
	INT 21H
		
	POP SI
	POP BP
	RET 4 ; delete X, SI
UHex	ENDP
		
SHex	PROC NEAR
	PUSH BP
	MOV  BP, SP
		
	MOV  CX, [BP + 4]
	MOV  BX, [BP + 6]
		
	CMP  CL, 0
	JE   SH_SKIP_NEG
		
	MOV  AH, 2
	MOV  DL, '-'
	INT  21H
		
	NEG  BX
		
SH_SKIP_NEG:
	PUSH  BX
	PUSH  CX
		
	CALL  UHex
		
	POP BP
	RET 4 ; delete x, si
SHex	ENDP
		
CSEG	ENDS
END