global _main
extern _printf
segment .data
message: db   065, 122, 065, 084, 0xA, 0
section .text
_main:
push message
call _printf
add esp, 4
ret