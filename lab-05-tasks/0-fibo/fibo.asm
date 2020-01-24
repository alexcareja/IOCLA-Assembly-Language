%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp
    xor eax, eax
    

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    ;       store the sum in eax
    ;       use loop instruction 

    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "

    xor eax, eax
    
    mov ecx, [N]
    mov eax, 0 ; aici memorez suma
    mov ebx, 1 ; fib1
    mov edx, 0 ; fib2 < fib1
whl:
    add eax, edx
    xchg ebx, edx
    add ebx, edx
    loop whl
    
    PRINT_UDEC 4, eax

    leave
	ret
