#!/bin/bash
gcc -masm=intel ./main.c -S -o ./main.s
gcc -masm=intel ./printArray.c -S -o ./printArray.s
gcc -masm=intel ./readArray.c -S -o ./readArray.s
gcc -masm=intel ./fillArray.c -S -o ./fillArray.s

gcc main.s fillArray.s printArray.s readArray.s -o main