	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 56
	mov	DWORD PTR -84[rbp], edi
	mov	QWORD PTR -96[rbp], rsi
	mov	rax, rsp
	mov	rbx, rax
	mov	DWORD PTR -52[rbp], 1
	jmp	.L2
.L4:
	add	DWORD PTR -52[rbp], 1
.L2:
	mov	eax, DWORD PTR -52[rbp]
	cmp	eax, DWORD PTR -84[rbp]
	jge	.L3
	mov	eax, DWORD PTR -52[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	test	eax, eax
	jg	.L4
.L3:
	mov	eax, DWORD PTR -84[rbp]
	sub	eax, DWORD PTR -52[rbp]
	mov	DWORD PTR -64[rbp], eax
	mov	eax, DWORD PTR -64[rbp]
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
	mov	esi, 16
	mov	edx, 0
	div	rsi
	imul	rax, rax, 16
	sub	rsp, rax
	mov	rax, rsp
	add	rax, 3
	shr	rax, 2
	sal	rax, 2
	mov	QWORD PTR -80[rbp], rax
	mov	DWORD PTR -56[rbp], 0
	mov	edx, DWORD PTR -56[rbp]
	mov	eax, DWORD PTR -52[rbp]
	add	eax, edx
	mov	DWORD PTR -60[rbp], eax
	jmp	.L5
.L6:
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -96[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	rdx, QWORD PTR -80[rbp]
	mov	ecx, DWORD PTR -56[rbp]
	movsx	rcx, ecx
	mov	DWORD PTR [rdx+rcx*4], eax
	mov	rax, QWORD PTR -80[rbp]
	mov	edx, DWORD PTR -56[rbp]
	movsx	rdx, edx
	mov	eax, DWORD PTR [rax+rdx*4]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -56[rbp], 1
	add	DWORD PTR -60[rbp], 1
.L5:
	mov	eax, DWORD PTR -56[rbp]
	cmp	eax, DWORD PTR -64[rbp]
	jl	.L6
	mov	eax, 0
	mov	rsp, rbx
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
