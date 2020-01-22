%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ; pushing a string on the stack
    sub esp, 4
    mov dword[esp], 0
    sub esp, 4
    mov dword[esp], "mere"
    sub esp, 4
    mov dword[esp], "are "
    sub esp, 4
    mov dword[esp], "Ana "
    ;push 0
    ;push "mere"
    ;push "are "
    ;push "Ana "

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
while:
    PRINT_HEX 4, esp
    PRINT_STRING " : " 
    PRINT_DEC 1, [esp]
    NEWLINE
    inc esp
    cmp ebp, esp
    jg while
    
    ; TODO 3: print the string byte by byte
    NEWLINE
    NEWLINE
    push "mere"
    push "are "
    push "Ana "
    
while2:
    mov ecx, [esp]
    PRINT_CHAR cl
    inc esp
    cmp ebp, esp
    jg while2
    
    ; TODO 4: print the array element by element
    NEWLINE
    
    mov ecx, NUM
push_nums2:
    sub esp, 4
    mov [esp], ecx
    loop push_nums2
    
    mov ecx, NUM
while3:
    pop eax
    PRINT_DEC 4,eax
    loop while3
    


    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
