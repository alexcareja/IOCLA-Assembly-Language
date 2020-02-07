extern rand
extern time
extern srand
extern scanf
extern printf
extern puts


section .data
    uint_format    db "%zu", 0
    uint_format_newline    db "%zu", 10, 0
    msg    db "Insert number: ", 0
    is_smaller_string db "Numarul introdus este mai mic", 0
    is_larger_string db "Numarul introdus este mai mare", 0
    correct_string db "Corect", 0


section .bss
    num resd 1
    n resd 1


section .text


; TODO c: Create read_cmp() function.
read_cmp:
    push ebp
    mov ebp, esp
    push n
    push uint_format
    call scanf
    add esp, 8
    mov eax, [n]
    cmp eax, [num]
    je equal
    jl lower
    
    push is_larger_string
    call printf
    add esp, 4
    mov eax, 0
    jmp return
    
equal:
    push correct_string
    call printf
    add esp, 4
    mov eax, 1
    jmp return
    
lower:
    push is_smaller_string
    call printf
    add esp, 4
    mov eax, 0

return:
    leave
    ret



global main
main:
    push ebp
    mov ebp, esp


    ; TODO a: Call srand(time(0)) and then rand() and store return value modulo 100 in num.
    xor eax, eax
    push eax
    call time
    add esp, 4
    push eax
    call srand
    add esp, 4
    call rand
    
    mov edx, 0
    mov ecx, 100
    div ecx
    mov [num], edx


    ; Debug only: Print value of num to check it was properly initialized.
    push dword [num]
    push uint_format_newline
    call printf
    add esp, 8

    ; Comment this out when doing TODO b. Uncomment it when doing TODO c and d.
    jmp make_call
    
    ; TODO b: Read numbers from keyboard in an infinite loop.
    mov ecx, 9
    
while:
    push ecx
    push n
    push uint_format
    call scanf
    add esp, 8
    pop ecx
    push dword [n]
    dec ecx
    cmp ecx, 0
    jg while


make_call:
    
    ; TODO d:
infinite_loop:
    call read_cmp
    cmp eax, 1
    jne infinite_loop


    ; Return 0.
    xor eax, eax
    leave
    ret
