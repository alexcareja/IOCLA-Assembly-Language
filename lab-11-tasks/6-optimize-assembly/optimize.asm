global runAssemblyCode

extern printf

section .data
    str: db "%d",10,13

section .text
runAssemblyCode:
    push ebp
    mov ebp, esp
    sub esp, 4
    mov edx, [ebp+12]
    mov ebx, [ebp+8]
    xor eax, eax
    xor ecx, ecx

L2:
    cmp ecx, edx
    jge L1
    lea edi, [ebx + 4*ecx]
    mov esi, [edi]
    add eax, esi
    inc ecx
    jmp L2

L1:
    mov esp, ebp
    pop ebp
    ret
