.386
.model flat, c

public CopyStr

.code

CopyStr:
	push ebp
	mov ebp, esp
	push edi

	mov esi, [ebp + 8] ; s1
	mov edi, [ebp + 12] ; s2
	mov ecx, [ebp + 16] ; len
	mov eax, edi

	sub edi, esi ; find which one is bigger
	cmp edi, 0
	jge edi_pos ; if edi is bigger then esi
	neg edi

edi_pos:
	cmp ecx, edi
	jge maybe_go_left ; if strings may overlap
	jmp go_right

maybe_go_left:
	mov edi, eax
	cmp edi, esi
	jge go_left ; if overlap
	jmp go_right

go_left:
	dec ecx
	add edi, ecx
	add esi, ecx
	inc ecx
	mov bh, 0
	mov [edi + 1], bh	
	std ; go left
	rep movsb ; Write to ES:EDI block of ECX bytes from DS:ESI
	jmp done

go_right:
	mov edi, eax
	cld ; go right
	rep movsb ; Write to ES:EDI block of ECX bytes from DS:ESI
	mov [edi], cx; cx is always 0
	jmp done

done:
	pop edi
	pop ebp
ret

end