# avs-ihw1

**Индивидуальное домашнее задание №1 по курсу Архитектуры вычислительных систем. Крупнов Иван, БПИ217, вариант 17**

## Задание
> Сформировать массив B из элементов массива A, расположенных после последнего положительного элемента.

## Структура проекта
* [asm](https://github.com/shar3nda/avs-ihw1/tree/main/asm) — код на ассемблере, полученный до и после оптимизаций (ручных и полученных через флаги компилятора).
* [asm_commented](https://github.com/shar3nda/avs-ihw1/tree/main/asm_commented) — код на ассемблере без флагов оптимизации, в котором **прокомментированы переменные** и операции над ними
* [scripts](https://github.com/shar3nda/avs-ihw1/tree/main/scripts) — скрипты для тестирования
    * [generate_tests.py](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/generate_tests.py) — утилита для генерации тестов на Python
    * [run_tests.sh](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/run_tests.sh) — bash-скрипт для прогона тестов. Использование: `run_tests.sh ./<executable_name>`
* [tests](https://github.com/shar3nda/avs-ihw1/tree/main/tests) — автоматически сгенерированные тесты для программы
* [main](https://github.com/shar3nda/avs-ihw1/blob/main/main) — исполняемый файл программы
* [main_opt](https://github.com/shar3nda/avs-ihw1/blob/main/main_opt) — исполняемый файл программы, скомпилированный с оптимизациями
* [tests_unoptimized.log](https://github.com/shar3nda/avs-ihw1/blob/main/tests_unoptimized.log) — логи тестирования неоптимизированного бинарника
* [tests_optimized](https://github.com/shar3nda/avs-ihw1/blob/main/tests_optimized.log) — логи тестирования оптимизированного бинарника

# Задания на 4 балла

## Использование программы
* На первой строке вводится длина массива A.
* На второй строке через пробел вводятся все элементы массива A.
* На вывод поступают элементы массива B.

## Результаты тестирования
Логи тестирования находятся в файлах `tests_unoptimized.log` и `tests_optimized.log`. Чтобы самостоятельно провести тестирование, необходимо выполнить `./scripts/run_tests.sh ./main` или `./scripts/run_tests.sh ./main_opt`.

## Опции компиляции
Ассемблирование без оптимизаций:
```sh
gcc -masm=intel ./file.c -S -o ./file.s
```
Ассемблирование с оптимизациями:
```sh
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stock-protector \
    -fno-exception \
    ./file.c \
    -S -o ./asm/file_opt.s 
```
После ассемблирования файлов по отдельности программма компилируется в исполняемый файл:
```sh
gcc asm/main.s asm/fillArray.s asm/printArray.s asm/readArray.s -o main
```
С оптимизациями:
```sh
gcc asm/main_opt.s asm/fillArray_opt.s asm/printArray_opt.s asm/readArray_opt.s -o main_opt
```

## Оптимизация ассемблированных программ
Помимо ключей командной строки были проведены следующие ручные оптимизации:
* Убраны инструкции `cdqe` и `movsx rXX eXX`
* Удалены лишние строчки в начале и в конце:
    * `.file	"filename.c"`
    * `.type	funcname, @function`
    * `.ident	"GCC: (GNU) 12.2.0"`
	* `.section	.note.GNU-stack,"",@progbits`
* Убраны ненужные присваивания через регистр `rax`:
    * `mov	eax, DWORD PTR [rax]; mov	esi, eax` -> `mov	esi, DWORD PTR [rax]`
    * `lea	rax, .LC0[rip]; mov	rdi, rax` -> `lea	rdi, .LC0[rip]`

# Задания на 5 баллов