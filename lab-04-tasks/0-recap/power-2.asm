%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

while:
    mov edx, eax
    and edx, ebx
    jz not_power
    PRINT_UDEC 4, ebx
    NEWLINE
    
not_power:
    shl ebx, 1
    cmp ebx, eax
    jl while
    ; TODO - print the powers of 2 that generate number stored in EAX

    leave
    ret
