	.intel_syntax noprefix  # синтаксис Intel
	.text
	.section	.rodata  # начало секции rodata
.LC0:  # в .LC0 хранится "%i "
	.string	"%i "
	.text

	.global	main
main:
	push	rbp  # начало пролога, выделяем для main память на стеке
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 56  # конец пролога
	mov	DWORD PTR -84[rbp], edi  # argc
	mov	QWORD PTR -96[rbp], rsi  # argv - помещаем на стек
	mov	rax, rsp
	mov	rbx, rax
	mov	DWORD PTR -52[rbp], 1  # last_pos_index = 1
	jmp	.L2
.L4:
	add	DWORD PTR -52[rbp], 1  # ++last_pos_index
.L2:  # while ((last_pos_index < argc) && (atoi(argv[last_pos_index]) > 0))
	mov	eax, DWORD PTR -52[rbp]  # last_pos_index -> eax
	cmp	eax, DWORD PTR -84[rbp]  # last_pos_index ? argc
	jge	.L3  # если после cmp в регистре число >= 0 (то есть last_pos_index >= argc),
	         # выходим из цикла while
	mov	eax, DWORD PTR -52[rbp]  # записываем в eax значение last_pos_index
	cdqe  # eax DWORD -> rax QWORD (в rax теперь находится last_pos_index)
	lea	rdx, 0[0+rax*8]  # помещаем в rdx адрес last_pos_index эл-та стека
	mov	rax, QWORD PTR -96[rbp]  # помещаем в rax указатель на начало argv
	add	rax, rdx  # прибавляем rdx к rax (rax теперь адрес argv[last_pos_index])
	mov	rax, QWORD PTR [rax]  # в rax кладем элемент стека по адресу rax
	mov	rdi, rax  # в rdi (аргумент atoi) кладем argv[last_pos_index]
	call	atoi@PLT  # вызываем atoi от rdi
	test	eax, eax  # atoi вернул целое число в eax
	                  # проверяем, что оно больше нуля с помощью побитового И
	jg	.L4  # если результат больше нуля, переходим к .L4
.L3:
    # eax это b_size
	mov	eax, DWORD PTR -84[rbp]  # b_size = argc
	sub	eax, DWORD PTR -52[rbp]  # b_size -= last_pos_index
	mov	DWORD PTR -64[rbp], eax  # 
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
