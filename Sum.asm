section .data
    result_msg db "Result: ", 0
    newline db 0Dh, 0Ah, 0

section .text
    global Start

Start:
    ; Суммируем числа 3 и 5
    mov eax, 3
    add eax, 5

    ; Выводим сообщение "Result: "
    mov edx, len_result
    mov ecx, result_msg
    call print_string

    ; Выводим результат (значение из eax)
    mov edx, eax
    call print_value

    ; Выводим символ новой строки
    mov edx, 2
    mov ecx, newline
    call print_string

    ; Завершаем программу
    call exit_program

print_string:
    ; Вывод строки на консоль
    push edx
    push ecx
    mov edx, -1  ; Указываем, что нужно выводить всю строку
    mov ecx, esp
    mov ebx, -11 ; Получаем стандартный вывод (консоль)
    mov eax, 4   ; Системный вызов sys_write
    int 0x80
    pop ecx
    pop edx
    ret

print_value:
    ; Вывод значения на консоль
    push eax
    call print_string
    ret

exit_program:
    ; Завершаем программу
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    len_result equ $ - result_msg
