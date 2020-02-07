%include "io.inc"

section .data
    ; TODO a: Define arr1, arr2 and res arrays.
    arr1 dd 1, 20, 99, 12, 8, 43, 3, 10, 11, 92
    arr2 dd 0, 9, 3, 4, 22, 1, 4, 4, 4, 200
    num dd 10

section .bss
    res resd 10

section .text
global main

main:
    push ebp
    mov ebp, esp


    ; TODO b: Compute res[0] and res[n-1].
    mov eax, [arr1]
    mov edx, [arr2 + 36]
    add eax, edx
    mov [res], eax
    
    mov eax, [arr1 + 36]
    mov edx, [arr2]
    add eax, edx
    mov [res + 36], eax

    ; List first and last item in each array.
    PRINT_UDEC 4, [arr1]
    NEWLINE
    PRINT_UDEC 4, [arr2]
    NEWLINE
    PRINT_UDEC 4, [res]
    NEWLINE

    PRINT_UDEC 4, [arr1+36]
    NEWLINE
    PRINT_UDEC 4, [arr2+36]
    NEWLINE
    PRINT_UDEC 4, [res+36]
    NEWLINE


    ; TODO d: Compute cross sums in res[i].
    mov ebx, [num]
    dec ebx
    xor ecx, ecx
    
while:
    mov eax, [arr1 + ecx * 4]
    mov edx, [arr2 + ebx * 4]
    add eax, edx
    mov [res + ecx * 4], eax
    inc ecx
    dec ebx
    cmp ecx, [num]
    jl while


    ; TODO c: List arrays.
    xor ecx, ecx
    
while_print:
    mov eax, [arr1 + ecx * 4]
    PRINT_DEC 4, eax
    PRINT_STRING " "
    mov eax, [arr2 + ecx * 4]
    PRINT_DEC 4, eax
    PRINT_STRING " "
    mov eax, [res + ecx * 4]
    PRINT_DEC 4, eax
    PRINT_STRING " "
    NEWLINE
    inc ecx
    cmp ecx, [num]
    jl while_print

    ; Return 0.    
    xor eax, eax
    leave
    ret