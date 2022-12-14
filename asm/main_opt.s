	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i"  # "%i" для scanf
	.text
	.global	main
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 88
	mov	rbx, rsp
	mov	DWORD PTR -92[rbp], 0  # int a_length = 0
	lea	rsi, -92[rbp]  # rsi = a_length
	lea	rdi, .LC0[rip]  # rdi = "%i"
	mov	eax, 0
	call	__isoc99_scanf@PLT  # scanf("%i", &a_length)
	mov	eax, DWORD PTR -92[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -56[rbp], rdx
	movsx	rdx, eax
	mov	QWORD PTR -112[rbp], rdx
	mov	QWORD PTR -104[rbp], 0
	movsx	rdx, eax
	mov	QWORD PTR -128[rbp], rdx
	mov	QWORD PTR -120[rbp], 0
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
	mov	QWORD PTR -64[rbp], rax  # int a[a_length];
	mov	edx, DWORD PTR -92[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	esi, edx  # esi = a_length
	mov	rdi, rax  # rdi = a
	call	readArray@PLT  # readArray(a, a_length)
	mov	DWORD PTR -68[rbp], eax  # int last_pos_index = readArray(a, a_length)
	mov	eax, DWORD PTR -92[rbp]  # b_length = a_length
	sub	eax, DWORD PTR -68[rbp]  # b_length -= last_pos_index
	sub	eax, 1  # b_length -= 1;
	mov	DWORD PTR -72[rbp], eax  # b_length
	mov	eax, DWORD PTR -72[rbp]
	movsx	rdx, eax
	sub	rdx, 1
	mov	QWORD PTR -80[rbp], rdx
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
	mov	QWORD PTR -88[rbp], rax  # int b[b_length]
	mov	eax, DWORD PTR -68[rbp]  # eax = last_pos_index
	lea	ecx, 1[rax]  # ecx = last_pos_index + 1
	mov	edx, DWORD PTR -72[rbp]  # edx = b_length
	mov	rsi, QWORD PTR -88[rbp]  # rsi = b
	mov	rdi, QWORD PTR -64[rbp]  # rdi = a
	call	fillArray@PLT  # fillArray(a, b, b_length, last_pos_index + 1)
	mov	esi, DWORD PTR -72[rbp]  # esi = b_length
	mov	rdi, QWORD PTR -88[rbp]  # rdi = b
	call	printArray@PLT  # printArray(b, b_length)
	mov	eax, 0  # 0 для return 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret  # return 0
	.size	main, .-main
