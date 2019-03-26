PUBLIC UDec
PUBLIC SDec

DSEG	SEGMENT PARA PUBLIC 'DATA'
	NEWLINE	DB	10, 13, '$'
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
UDec	PROC NEAR
	PUSH BP
	MOV	 BP, SP 
	MOV	 AX, [BP + 6] ; AX = X
		
UD_1:
        XOR CX, CX ; clean CX
        MOV BX, 10 ; BASIS OF THE SYSTEM OF CALCULATION
UD_2:
        XOR DX, DX ; clean DX
        DIV BX ; divisible AX, divider BX, private AX, balance DX (AX = BX * AX + DX)
        ADD DX, '0' ; DX = 30
        PUSH DX
        INC CX ; get length
        CMP AX, 0 ; AH = AL = 0 - all the number passed by
        JNE UD_2 ; ZF=0 (so if AX != 0)

        MOV AH, 2 ;  print DL
UD_3:
        POP DX ; CX = length of the number
        INT 21H
        LOOP UD_3
		 
	MOV  AH, 9
	MOV  DX, OFFSET NEWLINE
	INT  21H
		
	POP BP
	RET 4 ; delete x, si
UDec	ENDP
		
SDec	PROC NEAR
	PUSH BP
	MOV  BP, SP
		
	MOV  CX, [BP + 4] ; X ?
	MOV  BX, [BP + 6] ; SI ?
		
	CMP  CL, 0
	JE   SD_SKIP_NEG
		
	MOV  AH, 2
	MOV  DL, '-'
	INT  21H
		
	NEG  BX
		
SD_SKIP_NEG:
	PUSH  BX
	PUSH  CX
		
	CALL  UDec
		
	POP BP
	RET 4 ; delete x, si
SDec	ENDP
		
CSEG	ENDS
END