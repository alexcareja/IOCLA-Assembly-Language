%include "io.inc"

section .data

%define ARRAY_LEN 7

    input dd 122, 184, 199, 242, 263, 845, 911
    output times ARRAY_LEN dd 0

section .text
global CMAIN
CMAIN:

    ; TODO push the elements of the array on the stack
    push ebp
    mov ebp, esp
    mov ecx, 7
    mov ebx, input
while:
    ;PRINT_DEC 4, [ebx]
    push dword [ebx]
    add ebx, 4
    loop while
    
    ; TODO retrieve the elements (pop) from the stack into the output array
    mov ecx, 7
    mov ebx, input
    mov edx, 0
while2:
    pop ebx
    mov [output + 4 * edx], ebx
    inc edx
    add ebx, 4
    loop while2

    PRINT_STRING "Reversed array:"
    NEWLINE
    xor ecx, ecx
print_array:
    PRINT_UDEC 4, [output + 4 * ecx]
    NEWLINE
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
