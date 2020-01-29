global runAssemblyCode

extern printf

section .data
    str: db "%d",10,13

section .text
runAssemblyCode:
    push ebp
    mov ebp, esp

    ; N
    sub esp, 4
    mov eax, [ebp+12]
    mov dword[esp], eax

    ; i
    sub esp, 4
    ; sum
    sub esp, 4
    mov dword[esp], 0
    ; int* a
    sub esp, 4
    mov eax, [ebp+8]
    mov [esp], eax

    mov eax, [ebp-4]
    mov dword[ebp-8], 0
    mov ebx, [ebp-16]
    xor ecx, ecx
    jmp L1

L2:
    lea edi, [ebx + 4*ecx]
    mov edx, [edi]
    add eax, edx
    add dword ecx, 1

L1:
    ; if i < N
    cmp ecx, eax
    jl L2

    mov esp, ebp
    pop ebp
    ret
