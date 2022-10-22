	.file	"readArray.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i"
	.text
	.globl	readArray
	.type	readArray, @function
readArray:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi  # int *a
	mov	DWORD PTR -28[rbp], esi  # int length
	mov	DWORD PTR -12[rbp], -1  # index = -1
	mov	DWORD PTR -8[rbp], 0  # last_pos_found = 0
	mov	DWORD PTR -4[rbp], 0  # i = 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax  # rsi = &a[i]
	lea	rax, .LC0[rip]  # rax = %i
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT  # scanf("%i", &a[i])
	cmp	DWORD PTR -8[rbp], 0  # if (!last_pos_found)
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	test	eax, eax  # if (a[i] > 0)
	jle	.L4
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -12[rbp], eax  # index = i
	jmp	.L3
.L4:
	mov	DWORD PTR -8[rbp], 1  # last_pos_found = 1
.L3:
	add	DWORD PTR -4[rbp], 1  # ++i
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	mov	eax, DWORD PTR -12[rbp]  # index
	leave
	.cfi_def_cfa 7, 8
	ret  # return index
	.cfi_endproc
.LFE0:
	.size	readArray, .-readArray
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
