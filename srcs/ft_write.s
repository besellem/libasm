global	_ft_write

extern	__errno_location		; Linux errno
extern	___error				; macOS errno

_ft_write:
	; Check if Linux or macOS on compilation
	%ifdef __LINUX__
		mov		rax, 4			; write's syscall number (Linux)
	%else
		mov		rax, 0x2000004	; write's syscall number (others - macOS)
	%endif

	; The syscall has the same arguments as ft_write, no need to set them.
	syscall						; call (write in this case)
	cmp		rax, 0
	jl		error				; jump to error if syscall's return < 0
	ret

error:
	neg			rax				; errno is negative, reverse it
	mov			rcx, rax		; rcx used as tmp to hold rax's value
	
	%ifdef __LINUX__
		call		__errno_location	; call errno (Linux)
	%else
		call		___error			; call errno (others - macOS)
	%endif
	
	mov			rax, rax

	; mov		___error, rax		; mov rax to errno
	mov			rax, -1			; write return -1 in case of error
	ret
