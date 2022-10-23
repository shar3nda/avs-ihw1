	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i "
	.text
	.global	printArray
printArray:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	r15d, 0
	jmp	.L2
.L3:
	mov	eax, r15d
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	esi, DWORD PTR [rax]
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	add	r15d, 1
.L2:
	mov	eax, r15d
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3
	nop
	nop
	leave
	ret
	.size	printArray, .-printArray
