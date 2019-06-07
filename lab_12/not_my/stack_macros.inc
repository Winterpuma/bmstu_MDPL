push_r macro reg_list
	i = 0
	irp cur_item, <reg_list>
	    @CatStr(dumb%i) equ cur_item
		i = i + 1
	    push cur_item
	endm
endm

pop_r macro reg_list
    j = 0 ; убрать
	j = i
	repeat j
	    i = i - 1
	    pop @CatStr(dumb%i)
	endm
endm
