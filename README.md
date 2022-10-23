# avs-ihw1

**Индивидуальное домашнее задание №1 по курсу Архитектуры вычислительных систем. Крупнов Иван, БПИ217, вариант 17**

## Задание
> Сформировать массив B из элементов массива A, расположенных после последнего положительного элемента.

## Структура проекта
* [asm](https://github.com/shar3nda/avs-ihw1/tree/main/asm) — код на ассемблере, полученный до и после оптимизаций (ручных и полученных через флаги компилятора).
* [asm_commented](https://github.com/shar3nda/avs-ihw1/tree/main/asm_commented) — прокомментирванный код на ассемблере без флагов оптимизации
* [scripts](https://github.com/shar3nda/avs-ihw1/tree/main/scripts) — скрипты для тестирования
    * [generate_tests.py](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/generate_tests.py) — утилита для генерации тестов на Python
    * [run_tests.sh](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/run_tests.sh) — bash-скрипт для прогона тестов. Использование: `run_tests.sh ./<executable_name>`
* [tests](https://github.com/shar3nda/avs-ihw1/tree/main/tests) — автоматически сгенерированные тесты для программы
* [main](https://github.com/shar3nda/avs-ihw1/blob/main/main) — исполняемый файл программы
* [main_opt](https://github.com/shar3nda/avs-ihw1/blob/main/main_opt) — исполняемый файл программы, скомпилированный с оптимизациями
* [tests_unoptimized](https://github.com/shar3nda/avs-ihw1/blob/main/tests_unoptimized.log) — логи тестирования неоптимизированного бинарника
* [tests_optimized](https://github.com/shar3nda/avs-ihw1/blob/main/tests_optimized.log) — логи тестирования оптимизированного бинарника

## Использование программы
* На первой строке вводится длина массива A.
* На второй строке через пробел вводятся все элементы массива A.
* На вывод поступают элементы массива B.