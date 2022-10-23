	.intel_syntax noprefix
	.text
	.global	fillArray
fillArray:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi  # a
	mov	QWORD PTR -32[rbp], rsi  # b
	mov	DWORD PTR -36[rbp], edx  # length
	mov	DWORD PTR -40[rbp], ecx  # first_neg_ind
	mov	DWORD PTR -4[rbp], 0  # i
	jmp	.L2
.L3:
	mov	edx, DWORD PTR -40[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -4[rbp]
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]
	jl	.L3
	nop
	nop
	pop	rbp
	ret
	.size	fillArray, .-fillArray
