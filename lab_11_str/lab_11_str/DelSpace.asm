.386
.model flat, c

public DelSpace

.code

DelSpace:
	push ebp
	mov ebp, esp
	push edi
	mov edi, [ebp + 8] ; str
	mov ebx, edi
	mov eax, 0
	mov ecx, 0
	mov cx, -1 ; FFFF
	mov al, ' ' ; our symbol to compare with

	cld ; CF = 0 go right direction
	repe scasb ; Ќайти байт не равный AL в блоке из ECX байт по адресу ES:EDI (while edi symbol != al symbol & ecx != 0)
	mov esi, edi 
	dec esi ; pointer to first meaningfull symbol

	mov al, 0 ; find end of string
	mov cx, -1
	repne scasb ; Ќайти байт равный AL в блоке из ECX байт по адресу ES:EDI
	neg cx ; 
	sub edi, 2 ; last non zero symbol

	mov al, ' '
	std ; left direction
	repe scasb ; Ќайти байт не равный AL в блоке из ECX байт по адресу ES:EDI
	mov ax, cx ; len of new string
	mov edi, ebx ; beginning of string

	cld ; right direction
	rep movsb ; «аписать по адресу ES:EDI блок из ECX байт, считываемый по адресу DS:ESI
	mov cx, 0
	mov [edi], cx ; set end of string

	pop edi
	pop ebp
	ret
end