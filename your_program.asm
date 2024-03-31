section .data
    prompt db 'Press any key to exit...', 0

section .bss
    buffer resb 1  ; Буфер для ввода символа

section .text
    extern  _getch, _getche, _exit

global _start

 _start:
    ; Выводим приглашение к вводу
    mov rdi, prompt
    call  puts

    ; Ждем ввода символа
    call  _getch

    ; Завершаем программу
    mov eax, 0
    call  _exit

; Функция для вывода строки
 puts:
    push rdi
    call  printf
    add rsp, 8
    ret

; Системная функция _getch для ввода символа без вывода на экран
extern  _getch

; Системная функция _exit для завершения программы
extern  _exit

; Библиотечная функция printf для вывода строки
extern  printf
