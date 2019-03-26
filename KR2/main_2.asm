EXTRN	SCAN : NEAR
EXTRN	UB : NEAR
EXTRN	UD : NEAR
EXTRN	UH : NEAR

SSTACK	SEGMENT PARA STACK 'STACK' ; 
		DB		64 DUP('STACK___')
SSTACK	ENDS

DSEG	SEGMENT PARA PUBLIC 'DATA'
		X		DW	10 ; default number, if nothing eentered
		ENTER		DB	'> $' ; signal that we should enter something, to the user: this symbols are on the screen
		NEW_LINE	DB	10, 13, '$'; 
DSEG	ENDS

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG, DS:DSEG, SS:SSTACK
BEGIN:
		MOV  AX, DSEG
		MOV  DS, AX
		
INPUT_NUMBER:
		CALL SCAN
		MOV X, AX
		PUSH X
		PUSH SI
		CALL UD
		
EXIT:
		MOV  AH, 4CH ; close programa
		XOR  AL, AL
		INT  21H
		
CSEG	ENDS
END BEGIN
