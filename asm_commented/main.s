	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i"  # "%i" для scanf
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 104
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -56[rbp], rax
	xor	eax, eax
	mov	rax, rsp
	mov	rbx, rax
	mov	DWORD PTR -100[rbp], 0  # int a_length = 0
	lea	rax, -100[rbp]
	mov	rsi, rax  # rsi = a_length
	lea	rax, .LC0[rip]
	mov	rdi, rax  # rdi = "%i"
	mov	eax, 0
	call	__isoc99_scanf@PLT  # scanf("%i", &a_length)
	mov	eax, DWORD PTR -100[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -88[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -144[rbp], rdx
	mov	QWORD PTR -136[rbp], 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	ecx, 16
	mov	edx, 0
	div	rcx
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax  # int a[a_length];
	mov	edx, DWORD PTR -100[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	esi, edx  # rsi = a_length
	mov	rdi, rax  # rdi = a
	call	readArray@PLT
	mov	DWORD PTR -96[rbp], eax  # int last_pos_index = readArray(a, a_length)
	mov	eax, DWORD PTR -100[rbp]
	sub	eax, DWORD PTR -96[rbp]
	sub	eax, 1
	mov	DWORD PTR -92[rbp], eax  # int b_length = a_length - last_pos_index - 1
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -72[rbp], rdx
	movsx	rdx, eax
	mov	r14, rdx
	mov	r15d, 0
	movsx	rdx, eax
	mov	r12, rdx
	mov	r13d, 0
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	eax, 16
	sub	rax, 1
	add	rax, rdx
	mov	edi, 16
	mov	edx, 0
	div	rdi
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -64[rbp], rax  # int b[b_length]
	mov	eax, DWORD PTR -96[rbp]
	lea	ecx, 1[rax]  # last_pos_index + 1
	mov	edx, DWORD PTR -92[rbp]  # b_length
	mov	rsi, QWORD PTR -64[rbp]  # b
	mov	rax, QWORD PTR -80[rbp]
	mov	rdi, rax  # a
	call	fillArray@PLT  # fillArray(a, b, b_length, last_pos_index + 1)
	mov	edx, DWORD PTR -92[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx  # b_length
	mov	rdi, rax  # b
	call	printArray@PLT
	mov	eax, 0
	mov	rsp, rbx
	mov	rdx, QWORD PTR -56[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_def_cfa 7, 8
	ret  # return 0
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
