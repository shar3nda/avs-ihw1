	.file	"printArray.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%i "  # "%i " для printf
	.text
	.globl	printArray
	.type	printArray, @function
printArray:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi  # int *b
	mov	DWORD PTR -28[rbp], esi  # int length
	mov	DWORD PTR -4[rbp], 0  # i = 0
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]  # eax = b[i]
	mov	esi, eax
	lea	rax, .LC0[rip]  # rax = "%i "
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT  # printf("%i ", b[i])
	add	DWORD PTR -4[rbp], 1  # ++i
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L3  # if i < length continue
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	printArray, .-printArray
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
