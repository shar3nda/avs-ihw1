	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i"
	.text
	.global	readArray
readArray:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	r13d, -1
	mov	r14d, 0
	mov	r15d, 0
	jmp	.L2
.L5:
	mov	eax, r15d
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	cmp	r14d, 0
	jne	.L3
	mov	eax, r15d
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax
	jle	.L4
	mov	eax, r15d
	mov	r13d, eax
	jmp	.L3
.L4:
	mov	r14d, 1
.L3:
	add	r15d, 1
.L2:
	mov	eax, r15d
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	mov	eax, r13d
	leave
	ret
	.size	readArray, .-readArray
