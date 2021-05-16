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
	; push	rsp
	; push	r8
	; push	r9

	mov		r8, rdi				; r8 = *begin_list
	mov		r9, rdi				; r9 = *begin_list

	; Check errors
	cmp		rdi, 0				; if (!begin_list)
	jz		.return
	cmp		qword [r8], 0		; if (!*begin_list)
	jz		.return
	cmp		qword [rsi], 0		; if (!(*cmp))
	jz		.return
	
	jmp		.inner_loop

.outer_loop:
	cmp		r8, 0					; while (ptr)
	jz		.return
	mov		r9, rdi					; r9 = *begin_list
	jmp		.inner_loop

.increment_ptr1:
	mov		r8, qword [r8 + 8]		; r8 = r8->next

.inner_loop:
	cmp		qword [r9 + 8], 0				; while (r9->next)
	jz		.outer_loop

	; mov		r9, qword [r9 + 8]
	; prepare call to (*cmp)()
	; push	rdi
	; mov		r10, rsi
	; push	rsi
	; mov		rdi, qword [r8]			; rdi = r8->data
	; mov		rsi, qword [r8 + 8]		; rsi = tmp
	; mov		rsi, qword [rsi + 8]	; rsi = r8->next->data
	
	; call (*cmp)()
	; call	r10
	; cmp		rax, 0;
	mov		r9, qword [r9 + 8]		; r9 = r9->next
	; jmp		.return
	; pop		rsi
	; pop		rdi
	; jg		.swap
	; jmp		.increment_ptr1
	; jmp		.inner_loop

.swap:
	;;;;;;;;;;;;;;;;;;;
	jmp		.inner_loop


; .increment_ptr1:
; 	mov		r8, qword [r8 + 8]		; r8 = r8->next
; 	jmp		.loop

; .increment_ptr2:
; 	mov		r9, qword [r9 + 8]		; r9 = r9->next
; 	jmp		.inner_loop

; .loop:
; 	cmp		[r8], 0					; while (r8->next)
; 	jz		return

; 	mov		r9, qword [rdi + 8]		; r9 = (*begin_list)->next
	
; 	call	_inner_loop

; 	push	rdi
; 	push	rsi

; 	mov		rdi, qword [r8]			; r8->data

; 	mov		rsi, qword [r8 + 8]		; tmp
; 	mov		rsi, qword [rsi + 8]	; r8->next->data

; 	pop		rsi
; 	mov		rax, rsi				; r8->next->data
; 	call	rax						; (*cmp)(r8->data, r8->next->data)
; 	pop		rdi
	
; 	cmp		rax, 0
; 	jl		.init_loop				; (*cmp)(r8->data, r8->next->data) < 0
; 	jge		.increment_ptr1
; 	; jmp		.loop


.return:
	; pop		r9
	; pop		r8
	; pop		rsp
	ret
