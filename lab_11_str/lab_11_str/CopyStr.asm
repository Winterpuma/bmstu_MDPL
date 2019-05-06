.386
.model flat, c

public CopyStr

.code

CopyStr:
	push ebp
	mov ebp, esp
	push edi
	mov esi, [ebp + 8]
	mov edi, [ebp + 12]
	mov ecx, [ebp + 16]
	mov eax, edi
	sub edi, esi
	cmp edi, 0
	jge edi_pos
	neg edi
edi_pos:
	cmp ecx, edi
	jge maybe_right_to_left
	jmp left_to_right
maybe_right_to_left:
	mov edi, eax
	cmp edi, esi
	jge right_to_left
	jmp left_to_right
right_to_left:
	dec ecx
	add edi, ecx
	add esi, ecx
	inc ecx
	mov bh, 0
	mov [edi + 1], bh	
	std
	rep movsb
	jmp done
left_to_right:
	mov edi, eax
	cld
	rep movsb
	mov [edi], cx; cx всегда 0
	jmp done
done:
	pop edi
	pop ebp
ret

end