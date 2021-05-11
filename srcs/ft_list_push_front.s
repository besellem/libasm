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
	mov		rcx, rdi		; hold rdi (t_list **list)
	; push	rdi

	; malloc the new t_lst
	mov		rdi, 16			; sizeof(t_list) == 16 bytes
	call	MALLOC
	cmp		rax, 0			; check if malloc succeeded
	jz		.return
	mov		r8, rax			; r8 hold the ptr allocated


	mov		rcx, qword[rcx + 8]	;

	; mov		[r8 + 8], rcx	;
	; mov		[r8], rsi		;
	; mov		[rcx], r8


	; pop		rcx				; hold rdi
	; mov		esp, rcx		; hold *list
	; mov		rcx, qword byte[rcx]	;


	; mov		r8, rsi			; ptr->data = data
	; mov		[r8 + 8], rcx	; ptr->next = *list
	; mov		rcx, r8			; *list = ptr





	; push	rbp
	; mov	rbp, rsp
	; mov	qword [rbp - 8], rdi
	; mov	qword [rbp - 16], rsi
	; mov	rsi, qword [rbp - 8]
	; mov	rsi, qword [rsi]
	; mov	rdi, qword [rbp - 16]
	; mov	qword [rdi + 8], rsi
	; mov	rsi, qword [rbp - 16]
	; mov	rdi, qword [rbp - 8]
	; mov	qword [rdi], rsi
	; pop	rbp
	; leave
	; ret


.return:
	leave
	ret
