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

		; �������� ��� ����
		
		pop_r <reglist>

		ifidn <type>, <void>
			; eax �� ��������
		endif
		ifidn <type>, <data>
			; � eax ��������� ������������ ��������
		endif
		ifidn <type>, <ptr>
			; � eax ��������� ���������
		endif
		pop ebp
endm
