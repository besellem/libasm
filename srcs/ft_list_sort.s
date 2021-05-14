%ifdef __LINUX__
	%define FT_LIST_SORT	ft_list_sort
	%define MALLOC				malloc
%else
	%define FT_LIST_SORT	_ft_list_sort
	%define MALLOC				_malloc
%endif

global	FT_LIST_SORT

extern	MALLOC

; void	ft_list_sort(t_list **begin_list, int (*cmp)())
FT_LIST_SORT:
	push	rsp
	push	r8

	mov		r8, [rdi]				; r8 = *begin_list

	; Check errors
	cmp		qword [rdi], 0			; if (!begin_list)
	jz		return
	cmp		qword [r8], 0			; if (!*begin_list)
	jz		return
	cmp		qword [rsi], 0			; if (!(*cmp))
	jz		return

.init_loop:
	jmp		.loop

.increment_ptr1:
	mov		r8, qword [r8 + 8]		; r8 = r8->next
	jmp		.loop

.increment_ptr2:
	mov		r9, qword [r9 + 8]		; r9 = r9->next
	jmp		.inner_loop

.loop:
	cmp		[r8], 0					; while (r8->next)
	jz		return

	mov		r9, qword [rdi + 8]		; r9 = (*begin_list)->next
	
	call	_inner_loop

	push	rdi
	push	rsi

	mov		rdi, qword [r8]			; r8->data

	mov		rsi, qword [r8 + 8]		; tmp
	mov		rsi, qword [rsi + 8]	; r8->next->data

	pop		rsi
	mov		rax, rsi				; r8->next->data
	call	rax						; (*cmp)(r8->data, r8->next->data)
	pop		rdi
	
	cmp		rax, 0
	jl		.init_loop				; (*cmp)(r8->data, r8->next->data) < 0
	jge		.increment_ptr1
	; jmp		.loop


return:
	pop		r8
	pop		rsp
	ret


; _inner_loop:
	
