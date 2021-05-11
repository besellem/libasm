%ifdef __LINUX__
	%define FT_LIST_PUSH_FRONT	ft_list_push_front
	%define MALLOC				malloc
%else
	%define FT_LIST_PUSH_FRONT	_ft_list_push_front
	%define MALLOC				_malloc
%endif

global	FT_LIST_PUSH_FRONT

extern	MALLOC

FT_LIST_PUSH_FRONT:
	push	rsp
	push	rdi				; push (t_list **begin_list)
	push	rsi				; push (void *data)

	; malloc the new t_lst
	mov		rdi, 16			; sizeof(t_list) == 16 bytes
	call	MALLOC
	pop		rsi				; get back our arguments
	pop		rdi				; get back our arguments
	cmp		rax, 0			; check if malloc succeeded
	jz		.return			; malloc failed

	mov		[rax], rsi		; ptr->data = data
	mov		r8, [rdi]		; r8 = *begin_list
	mov		[rax + 8], r8	; ptr->next = *begin_list
	mov		[rdi], rax		; *begin_list = ptr

.return:
	pop		rsp
	ret
