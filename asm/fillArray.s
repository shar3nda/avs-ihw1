	.file	"fillArray.c"
	.intel_syntax noprefix
	.text
	.globl	fillArray
	.type	fillArray, @function
fillArray:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi  # int *a
	mov	QWORD PTR -32[rbp], rsi  # int *b
	mov	DWORD PTR -36[rbp], edx  # int length
	mov	DWORD PTR -40[rbp], ecx  # int first_neg_ind
	mov	DWORD PTR -4[rbp], 0 # i = 0
	jmp	.L2
.L3:
	mov	edx, DWORD PTR -40[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx  # rax = *a + first_neg_ind + i
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]
	mov	rdx, QWORD PTR -32[rbp]
	add	rdx, rcx  # rdx = *b + i
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR [rdx], eax  # b[i] = a[first_neg_ind + i]
	add	DWORD PTR -4[rbp], 1  # ++i
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -36[rbp]  # i ? length
	jl	.L3  # if i < length continue
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	fillArray, .-fillArray
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
