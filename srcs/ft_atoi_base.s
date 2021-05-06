global	_ft_atoi_base

extern	_ft_strlen

_ft_atoi_base:
	mov		r8, rdi			; r8 is str
	mov		r9, rsi			; r9 is the base
	xor		r10, r10		; r10 will be the base's length

check_base:

	; ft_strlen(base)
	mov		rdi, r9
	call	_ft_strlen
	mov		r10, rax
	
	; if (base_length <= 1) return (0);
	cmp		r10, 1
	jle		error

	xor		rcx, rcx		; set rcx to 0
	jmp		base_loop

base_loop:
	mov		cl, byte [r9 + rcx]
	
	; while (base[i] != '\0')
	cmp		cl, 0
	jz		spaces			; if no errors in the base, jump to the next step

	; if (base[i] == '+')
	cmp		cl, 43
	je		error

	; if (base[i] == '-')
	cmp		cl, 45
	je		error


	;;;;;;;;;;;;;;;;;;;;;;;
	; Checker les doublons
	;;;;;;;;;;;;;;;;;;;;;;;


	inc		rcx
	jmp		base_loop


spaces:
	; while (base[i] != '\0')
	cmp		byte [r8], 0
	jz		error

	; check is_space(*str)
	jmp		is_space


is_space:
	; if (str[i] == ' ' || (str[i] >= '\t' && str[i] <= '\r'))
	cmp		r8, 32
	inc		r8
	je		spaces

	cmp		r8, 9
	inc		r8
	je		spaces

	cmp		r8, 10
	inc		r8
	je		spaces

	cmp		r8, 11
	inc		r8
	je		spaces

	cmp		r8, 12
	inc		r8
	je		spaces

	cmp		r8, 13
	inc		r8
	je		spaces
	
	jmp		error	; else return (0);


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; last time here
is_charset:
	cmp		r8, 48
	inc		r8
	je		process_loop

process_loop:


error:
	; return (0)
	mov		rax, 0
	ret

return:
	ret
