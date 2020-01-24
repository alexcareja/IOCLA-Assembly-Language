%include "io.inc"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

source_length: resd 1
substr_length: dd 4

print_format: db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
    cld
    mov al, 0x00
    mov edi, source_text
    repne scasb
    
    ; TODO1: save the result in at address length
    sub edi, source_text
    dec edi
    mov [source_length], edi
    PRINT_UDEC 1, source_length
    NEWLINE
    
    mov al, 0x00
    mov edi, substring
    repne scasb
    
    ; TODO1: save the result in at address length
    sub edi, substring
    dec edi
    mov [substr_length], edi
    PRINT_UDEC 1, substr_length
    NEWLINE
    
    
    mov edi, substring
    mov esi, source_text
    mov eax, 0
    mov ecx, 1000 

while:
    repe cmpsb
    mov edi, substring
    mov edx, esi
    sub edx, source_text
    mov ebx, edx
    sub edx, eax
    mov eax, ebx
    dec edx
    cmp edx, 4
    je print
    mov edx, esi
    sub edx, source_text
    add edx, [substr_length]
    cmp edx, [source_length]
    jl while
    
    leave
    ret
    
    ; TODO: Print the start indices for all occurrences of the substring in source_text
    
print:
    mov edx, esi
    sub edx, source_text
    sub edx, [substr_length]
    PRINT_STRING print_format
    PRINT_DEC 4, edx
    NEWLINE
    add edx, [substr_length]
    add edx, [substr_length]
    cmp edx, [source_length]
    jl while
    
end:
    leave
    ret
