// 17 вариант, Крупнов Иван

// Сформировать массив B из элементов массива A, расположенных
// после последнего положительного элемента.

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int last_pos_index = 1;

    while ((last_pos_index < argc) && (atoi(argv[last_pos_index]) > 0)) {
        ++last_pos_index;
    }

    int b_size = argc - last_pos_index;
    int b[b_size];
    for (int i = 0, j = i + last_pos_index; i < b_size; ++i, ++j) {
        b[i] = atoi(argv[j]);
        printf("%i ", b[i]);
    }

    return 0;
}

// gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector
// -fno-exceptions ./main.c -S -o ./main_commented.s

// as --gstabs -o main.o main_commented.s

// gcc main.o -o main