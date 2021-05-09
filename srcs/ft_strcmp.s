%ifdef __LINUX__
	%define FT_STRCMP	ft_strcmp
%else
	%define FT_STRCMP	_ft_strcmp
%endif

global	FT_STRCMP

FT_STRCMP:
	xor		rax, rax		; set to 0
	xor		rcx, rcx		; set to 0

loop:
	mov		al, byte [rdi]	; hold current byte value of s1 in rax register (al is the lower byte)
	mov		cl, byte [rsi]	; hold current byte value of s2 in rcx register (cl is the lower byte)
	
	cmp		al, 0			; Compare *s1 with \0
	jz		return
	cmp		cl, 0			; Compare *s2 with \0
	jz		return
	cmp		al, cl			; Compare *s1 with *s2
	jnz		return

	inc		rdi				; increment s1 pointer (equivalent to s1++)
	inc		rsi				; increment s2 pointer (equivalent to s2++)

	jmp		loop			; call loop again

return:
	sub		rax, rcx		; subtract value contained into rcx from rax
	ret
