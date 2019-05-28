.386
.model FLAT,C

PUBLIC DlinaStroki

.CODE

PROLOG MACRO LIST 
	PUSH EBP		
	MOV EBP,ESP	
    IRP A,<LIST>
    IFIDN <A>,<F>
      PUSHF
    ELSE
      PUSH A
    ENDIF
  ENDM
ENDM

EPILOG MACRO LIST 		
	
    IRP A,<LIST>
    IFIDN <A>,<F>
      POPF
    ELSE
      POP A
    ENDIF
  ENDM
  MOV ESP,EBP
  POP EBP
ENDM

DlinaStroki PROC

	PROLOG<EDI,F>
	
	MOV EDI,[EBP+8] ; Заносим адрес строки S, со смещение 12 (начало слова)
	
	XOR EAX,EAX		; обнуление EAX ДЛЯ ПОИСКА 0
	MOV ECX,-1		; ffffffff
	REPNE SCASB
	NOT ECX			
	DEC ECX
	MOV EAX,ECX

	EPILOG<F,EDI>

	RET 
DlinaStroki ENDP
END