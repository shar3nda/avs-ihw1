	.intel_syntax noprefix
	.text
	.global	fillArray
fillArray:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi  # int *a
	mov	QWORD PTR -32[rbp], rsi  # int *b
	mov	DWORD PTR -36[rbp], edx  # int length
	mov	DWORD PTR -40[rbp], ecx  # int first_neg_ind
	mov	r15d, 0  # int i = 0
	jmp	.L2
.L3:
	mov	edx, DWORD PTR -40[rbp]
	mov	eax, r15d
	add	eax, edx
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx  # rax = a[first_neg_ind + i]
	mov	edx, r15d
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx    # rdx = b[i]
	mov	eax, DWORD PTR [rax] 
	mov	DWORD PTR [rdx], eax  # b[i] = a[first_neg_ind + i]
	add	r15d, 1  # ++i
.L2:
	mov	eax, r15d
	cmp	eax, DWORD PTR -36[rbp]  # i ? length
	jl	.L3  # if i < length continue
	nop
	nop
	pop	rbp
	ret
	.size	fillArray, .-fillArray
