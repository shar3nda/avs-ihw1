	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i"  # "%i" для scanf
	.text
	.global	readArray
readArray:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi  # int *a
	mov	DWORD PTR -28[rbp], esi  # int length
	mov	r13d, -1  # index = -1
	mov	r14d, 0  # last_pos_found = 0
	mov	r15d, 0  # i = 0
	jmp	.L2
.L5:
	mov	eax, r15d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax  # rsi = &a[i]
	lea	rax, .LC0[rip]  # rax = %i
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT  # scanf("%i", &a[i])
	cmp	r14d, 0  # if (!last_pos_found)
	jne	.L3
	mov	eax, r15d
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax  # if (a[i] > 0)
	jle	.L4
	mov	eax, r15d
	mov	r13d, eax  # index = i
	jmp	.L3
.L4:
	mov	r14d, 1  # last_pos_found = 1
.L3:
	add	r15d, 1  # ++i
.L2:
	mov	eax, r15d
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	mov	eax, r13d  # index
	leave
	ret  # return index
	.size	readArray, .-readArray
