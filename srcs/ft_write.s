global	_ft_write

extern	__errno_location				; Linux errno
extern	___error						; macOS errno

_ft_write:
	; Check if Linux or macOS at compilation
	%ifdef __LINUX__
		mov		rax, 1					; write's syscall number (Linux)
	%else
		mov		rax, 0x2000004			; write's syscall number (others - macOS)
	%endif

	syscall								; call (write in this case)
	cmp		rax, 0
	jl		error						; jump to error if syscall's return < 0
	ret

error:
	neg			rax						; errno is negative, reverse it
	mov			rcx, rax				; rcx used as tmp to hold rax's value
	
	mov			rdi, rax
	%ifdef __LINUX__
		call		__errno_location	; call errno (Linux)
	%else
		call		___error			; call errno (others - macOS)
	%endif
	
	mov			[rax], rdi

	mov			rax, -1					; write return -1 in case of error
	ret
