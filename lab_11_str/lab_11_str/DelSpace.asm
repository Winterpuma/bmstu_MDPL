.386
.model flat, c

public DelSpace

.code

DelSpace:
	push ebp
	mov ebp, esp
	push edi
	mov edi, [ebp + 8]
	mov ebx, edi
	mov eax, 0
	mov ecx, 0
	mov cx, -1
	mov al, ' '
	cld
	repe scasb
	mov esi, edi
	dec esi
	mov al, 0
	mov cx, -1
	repne scasb
	neg cx
	sub edi, 2; после scasb уходит на 2 символа больше, чем надо
	mov al, ' '
	std
	repe scasb
	mov ax, cx
	mov edi, ebx
	cld
	rep movsb
	mov cx, 0
	mov [edi], cx
	pop edi
	pop ebp
	ret
end