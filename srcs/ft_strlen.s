global	_ft_strlen

_ft_strlen:
	xor		rax, rax			; init rax to 0

loop:
	cmp		byte [rdi + rax], 0	; compare current char to '\0' => (str[i] == '\0')
	jz		return				; go to the return part of the func if ZF (zero flag) == 1 
	inc		rax					; increment rax
	jmp		loop				; while loop

return:
	ret							; rax is the returned value of the function and it is already set since we used it as an index counter
