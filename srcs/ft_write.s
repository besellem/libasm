global	_ft_write
extern	___error

_ft_write:
	mov		eax, 0x2000004		; write's syscall number
	syscall
	ret
