PUBLIC UHex
PUBLIC SHex

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
UHex	PROC NEAR
	RET
UHex	ENDP
		
SHex	PROC NEAR
	RET
SHex	ENDP
		
CSEG	ENDS
END