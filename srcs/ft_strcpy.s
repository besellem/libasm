global	_ft_strcpy

_ft_strcpy:
	xor		rcx, rcx				; set rcx (index) to 0

loop:
	mov		al, byte [rsi + rcx]	; lower byte of rax used as tmp, holding src[i]
	cmp		al, 0					; while (src[i] != '\0')
	jz		return
	mov		byte [rdi + rcx], al	; copy al (which is src[i]) to dst[i]
	inc		rcx						; increment rcx
	jmp		loop

return:
	mov		byte [rdi + rcx], 0		; add \0 at the end of the string
	mov		rax, rdi				; mov dst pointer as return value
	ret
