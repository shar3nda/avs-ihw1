# avs-ihw1

Домашнее задание №1 по курсу Архитектуры вычислительных систем.
Крупнов Иван, БПИ217, вариант 17

## Структура проекта
* [asm](https://github.com/shar3nda/avs-ihw1/tree/main/asm) --- код на ассемблере, полученный до и после оптимизаций (ручных и полученных через флаги компилятора).
* [asm_commented](https://github.com/shar3nda/avs-ihw1/tree/main/asm_commented) --- прокомментирванный код на ассемблере без флагов оптимизации
* [scripts](https://github.com/shar3nda/avs-ihw1/tree/main/scripts) --- скрипты для тестирования и компиляции
    * [compile.sh](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/compile.sh) --- ассемблирование и компиляция
    * [compile_optimized.sh](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/compile_optimized.sh) --- ассемблирование и компиляция с флагами оптимизации
    * [generate_tests.py](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/generate_tests.py) --- утилита для генерации тестов на Python
    * [run_tests.sh](https://github.com/shar3nda/avs-ihw1/blob/main/scripts/run_tests.sh) --- bash-скрипт для прогона тестов
* [tests](https://github.com/shar3nda/avs-ihw1/tree/main/tests) --- автоматически сгенерированные тесты для программы
* [main](https://github.com/shar3nda/avs-ihw1/blob/main/main) --- исполняемый файл программы