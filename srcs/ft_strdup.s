%ifdef __LINUX__
	%define FT_STRDUP	ft_strdup
	%define MALLOC		malloc
	%define FT_STRLEN	ft_strlen
	%define FT_STRCPY	ft_strcpy
%else
	%define FT_STRDUP	_ft_strdup
	%define MALLOC		_malloc
	%define FT_STRLEN	_ft_strlen
	%define FT_STRCPY	_ft_strcpy
%endif

global	FT_STRDUP

extern	MALLOC
extern	FT_STRLEN
extern	FT_STRCPY

FT_STRDUP:
	push	rdi			; rdi pushed into the stack
	
	; rdi has already the right value (str). nothing to set
	call	FT_STRLEN
	inc		rax			; increment the return of strlen to malloc(strlen(str) + 1)

	mov		rdi, rax	; set rdi (first argument) to strlen(str)
	call	MALLOC
	cmp		rax, 0		; if malloc failed, rax will be NULL
	jz		error
	
	mov		rdi, rax	; else, we move the pointer malloced to rsi
	pop		rsi			; second argument of strcpy is set to str (from the stack)
	call	FT_STRCPY
	ret

error:
	ret					; rax is already set to (void *)0 by malloc
