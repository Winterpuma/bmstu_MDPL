PUBLIC UDec
PUBLIC SDec

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
UDec	PROC NEAR
	RET
UDec	ENDP
		
SDec	PROC NEAR
	RET
SDec	ENDP
		
CSEG	ENDS
END