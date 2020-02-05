%include "io.inc"

section .data
    myString: db "Hello, World!",0

section .text
global CMAIN
CMAIN:
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 1
compare:
    cmp ecx, ebx
    jge print                   ; TODO1: eax > ebx?
    PRINT_STRING "Goodbye, World!"
    ret
print:
    PRINT_STRING myString
    NEWLINE
    dec ecx
    jmp compare
                               ; TODO2.2: afisati "Hello, World!" de N ori
                               ; TODO2.1: afisati "Goodbye, World!"

    ret
