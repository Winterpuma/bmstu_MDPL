.386
.model flat, c
.listall

include template.inc
public macro_main

.code
macro_main proc near
	create_func void, func, <x, y>, <esi, edi>
	ret
macro_main endp
end