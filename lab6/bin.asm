PUBLIC UBin
PUBLIC SBin

CSEG	SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CSEG
		
UBin	PROC NEAR
	RET
UBin	ENDP
		
SBin	PROC NEAR
	RET
SBin	ENDP
		
CSEG	ENDS
END