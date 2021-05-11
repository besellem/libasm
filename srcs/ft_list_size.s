%ifdef __LINUX__
	%define FT_LST_SIZE	ft_lst_size
%else
	%define FT_LST_SIZE	_ft_lst_size
%endif

global	FT_LST_SIZE

FT_LST_SIZE:
	xor		rcx, rcx
	mov		r8, rdi
	jmp		.loop

.loop:
	mov		r8, byte [r8 + 8]
	cmp		r8, 0
	jz		.return
	inc		rcx
	jmp		.loop

.return:
	mov		rax, rcx
	ret
