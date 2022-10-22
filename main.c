// 17 вариант, Крупнов Иван

// Сформировать массив B из элементов массива A, расположенных
// после последнего положительного элемента.

#include <stdio.h>

extern void printArray(int *b, int length);
extern void fillArray(int *a, int *b, int length, int first_neg_ind);
extern int readArray(int *a, int length);

int main() {
    int a_length = 0;
    scanf("%i", &a_length);
    int a[a_length];
    int last_pos_index = readArray(a, a_length);

    int b_length = a_length - last_pos_index - 1;
    int b[b_length];
    fillArray(a, b, b_length, last_pos_index + 1);

    printArray(b, b_length);
    return 0;
}

// gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main_commented.s

// as --gstabs -o main.o main_commented.s

// gcc main.o -o main