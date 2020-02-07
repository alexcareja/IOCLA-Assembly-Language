%include "io.inc"

extern fgets
extern stdin
extern printf

section .data
    n            dd 7
    format_str   dd "Number: %d", 13, 10, 0
    prime_format dd "isPrime: %d", 13, 10, 0

section .text
global main

;TODO b: Implement stringToNumber
stringToNumber:
    push ebp
    mov ebp, esp
    mov esi, [ebp + 8]
    mov cx, 10
    xor eax, eax
    
while:
    cmp byte [esi], 0
    je done_num
    mul cx
    movzx dx, byte [esi]
    sub dx, 48
    add ax, dx
    inc esi   
    jmp while
    
done_num:
    leave
    ret

;TODO c.: Add missing code bits
isPrime:
    push ebp
    mov ebp, esp
    mov ebx, [ebp+8]
    mov ecx, 2

while_not_prime:
    xor edx, edx
    mov eax, ebx
    div ecx
    cmp edx, 0
    je not_prime
    inc ecx
    cmp ecx, eax
    jle while_not_prime
    PRINT_STRING "ESTE PRIM"
    jmp done
    
not_prime:
    PRINT_STRING "NU ESTE PRIM"
    
done:
    leave
    ret



CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ;TODO a.: allocate space on stack and call fgets
    push dword [stdin]
    push dword 7
    push n
    call fgets
    add esp, 12
    

    ;TODO b.: call stringToNumber and print it using printf
    push n
    call stringToNumber
    add esp, 4
    push eax
    push format_str
    call printf
    add esp, 4
    pop eax
    NEWLINE
    ;TODO c.: call isPrime and print result
    push eax
    call isPrime
    add esp, 4

    leave
    ret
