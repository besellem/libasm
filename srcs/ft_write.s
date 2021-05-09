%ifdef __LINUX__
	%define SCALL		1
	%define FT_WRITE	ft_write
	%define ERR			__errno_location
%else
	%define SCALL		0x2000004
	%define FT_WRITE	_ft_write
	%define ERR			___error
%endif

global	FT_WRITE
extern	ERR

FT_WRITE:
	; Check if Linux or macOS at compilation
	mov			rax, SCALL				; write's syscall number
	syscall								; call (write in this case)

	%ifdef __LINUX__
		cmp		rax, 0
		jl		error					; jump to error if syscall's return < 0
	%else
		jc		error					; if carry flag (on macOS)
	%endif

	ret

error:
	%ifdef __LINUX__
		neg			rax					; errno is negative, reverse it
	%endif
	
	mov			rdi, rax				; rdi is used as tmp for holding the errno value before rax is changed by the call of errno function
	call		ERR						; call errno
	mov			[rax], rdi

	mov			rax, -1					; write return -1 in case of error
	ret
