#!/bin/bash
gcc -masm=intel ./main.c -S -o ./asm/main.s
gcc -masm=intel ./printArray.c -S -o ./asm/printArray.s
gcc -masm=intel ./readArray.c -S -o ./asm/readArray.s
gcc -masm=intel ./fillArray.c -S -o ./asm/fillArray.s

gcc asm/main.s asm/fillArray.s asm/printArray.s asm/readArray.s -o main