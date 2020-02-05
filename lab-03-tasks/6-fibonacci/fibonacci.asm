%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ecx, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov eax, 1
    mov edx, 0
    sub ecx, 2
while:
    xchg edx, eax
    add eax, edx
    dec ecx
    cmp ecx, 0    
    jg while
    PRINT_STRING "f(7) = "
    PRINT_DEC 4, eax
    ret