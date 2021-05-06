global	_ft_strdup

extern	_malloc
extern	_ft_strlen
extern	_ft_strcpy

_ft_strdup:
	push	rdi			; rdi pushed into the stack
	
	; rdi has already the right value (str). nothing to set
	call	_ft_strlen
	inc		rax			; increment the return of strlen to malloc(strlen(str) + 1)

	mov		rdi, rax	; set rdi (first argument) to strlen(str)
	call	_malloc
	cmp		rax, 0		; if malloc failed, rax will be NULL
	jz		error
	
	mov		rdi, rax	; else, we move the pointer malloced to rsi
	pop		rsi			; second argument of strcpy is set to str (from the stack)
	call	_ft_strcpy
	ret

error:
	ret					; rax is already set to (void *)0 by malloc
