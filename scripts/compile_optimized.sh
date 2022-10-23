#!/bin/bash
gcc ./main.c -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -S -o ./asm/main_opt.s
gcc ./printArray.c -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -S -o ./asm/printArray_opt.s
gcc ./readArray.c -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -S -o ./asm/readArray_opt.s
gcc ./fillArray.c -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -S -o ./asm/fillArray_opt.s

gcc asm/main_opt.s asm/fillArray_opt.s asm/printArray_opt.s asm/readArray_opt.s -o main