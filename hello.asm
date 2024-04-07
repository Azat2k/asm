section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; Выводим строку "Hello, World!" на консоль
    mov     eax, 4          ; Системный вызов для вывода
    mov     ebx, 1          ; Дескриптор файла (stdout)
    mov     ecx, hello      ; Указатель на строку
    mov     edx, 13         ; Длина строки
    int     0x80            ; Вызов ядра

    ; Выходим из программы
    mov     eax, 1          ; Системный вызов для выхода
    xor     ebx, ebx        ; Код возврата 0
    int     0x80            ; Вызов ядра