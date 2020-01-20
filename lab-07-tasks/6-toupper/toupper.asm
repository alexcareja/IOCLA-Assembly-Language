%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abc33de1fgh%42ijASDZF", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    
copy_one_byte:
    mov bl, byte [eax]
    cmp bl, 0
    je done
    cmp bl, 0x61
    jl not_needed
    cmp bl, 0x7A
    jg not_needed
    sub bl, 0x20
    mov byte [eax], bl
not_needed:
    inc eax
    jmp copy_one_byte
    ; TODO
done:
    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
