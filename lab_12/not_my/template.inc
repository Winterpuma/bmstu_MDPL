include stack_macros.inc

create_func macro type:req, name:req, parlist, reglist:=<edi,esi>
	name:
		push ebp
		mov ebp, esp ; + 4
		
		push_r <reglist>

		ifnb <parlist>
		    irp current, <parlist>
			    current equ [ebp]
			    add ebp, 4
		    endm
		endif
		
		mov ebp, esp ; + 4

		; ¬ставьте код сюда
		
		pop_r <reglist>

		ifidn <type>, <void>
			; eax не измен€ть
		endif
		ifidn <type>, <data>
			; в eax поместить возвращаемое значение
		endif
		ifidn <type>, <ptr>
			; в eax поместить указатель
		endif
		pop ebp
endm
