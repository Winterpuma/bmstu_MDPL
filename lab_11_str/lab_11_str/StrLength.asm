.386
.model flat, c

public StrLength

.code

StrLength:
	push ebp
	mov ebp, esp
	push edi
	mov edi, [ebp + 8]
	mov al, 0
	cld
	mov ecx, -1
	repne scasb
	neg ecx
	sub ecx, 2
	mov eax, ecx
	pop edi
	pop ebp
	ret
end