%ifdef __LINUX__
	%define FT_LIST_SIZE	ft_list_size
%else
	%define FT_LIST_SIZE	_ft_list_size
%endif

global	FT_LIST_SIZE

FT_LIST_SIZE:
	xor		rcx, rcx			; init rcx to 0
	mov		r8, rdi				; r8 hold `lst'
	jmp		.loop

.loop:
	cmp		r8, 0				; lst->next != NULL
	jz		.return
	mov		r8, qword [r8 + 8]	; lst = lst->next
	inc		rcx
	jmp		.loop

.return:
	mov		rax, rcx
	ret
