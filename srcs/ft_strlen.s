global _ft_strlen

_ft_strlen:
	xor		rcx, rcx			; init rcx to 0

loop:
	cmp		byte [rdi + rcx], 0	; compare current char to '\0' => (str[i] == '\0')
	jz		finish				; go to the return part of the func if the cmp is true
	inc		rcx					; increment rcx
	jmp		loop				; while loop

finish:
	mov		rax, rcx			; mov the counter into rax
	ret							; rax is the returned value of the function
