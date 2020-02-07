%include "io.inc"

section .data
   word_num1 dd 0xff543210
   word_num2 dd 0x00111111
   result_word resd 2
   big_num1 dd 0x11111111, 0x22222222, 0x33333333
   big_num2 dd 0xffffffff, 0x22222222, 0x33333333
   result_4word resd 4
   num_array1 dd 0x11111111, 0x22222222, 0x33333333, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   num_array2 dd 0xffffffff, 0x22922252, 0x33033338, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   result_array resd 12
   length dd 3

section .text
global main
main:
    push ebp
    mov ebp, esp

    ;TODO a, b, c: Implement the array sum starting with double word sum incrementally solving subsequent task b and c.
    mov eax, [word_num1]
    mov edx, [word_num2]
    add eax, edx
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    
    mov eax, [big_num1 + 8]
    mov edx, [big_num2 + 8]
    add eax, edx
    mov [result_4word + 12], eax
    jnc next
    mov edx, 1
    mov [result_4word + 8], edx

next:
    mov eax, [big_num1 + 4]
    mov edx, [big_num2 + 4]
    add eax, edx
    mov [result_4word + 8], eax
    jnc next2
    mov edx, 1
    mov [result_4word + 4], edx
    
next2:
    mov eax, [big_num1]
    mov edx, [big_num2]
    add eax, edx
    mov [result_4word + 4], eax
    jnc done
    mov edx, 1
    mov [result_4word], edx

done:
    NEWLINE    
    PRINT_STRING "0x"
    PRINT_HEX 4, [result_4word]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 4]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 8]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 12]
    PRINT_STRING " "
    
    NEWLINE
    NEWLINE
    PRINT_STRING "Sum array:"
    NEWLINE
    xor ecx, ecx
    
while:
    mov eax, [num_array1 + 8 + ecx * 4]
    mov edx, [num_array2 + 8 + ecx * 4]
    add eax, edx
    mov [result_4word + 12 + ecx * 4], eax
    jnc next3
    mov edx, 1
    mov [result_4word + 8 + ecx * 4], edx

next3:
    mov eax, [num_array1 + 4 + ecx * 4]
    mov edx, [num_array2 + 4 + ecx * 4]
    add eax, edx
    mov [result_4word + 8 + ecx * 4], eax
    jnc next4
    mov edx, 1
    mov [result_4word + 4 + ecx * 4], edx
    
next4:
    mov eax, [num_array1 + ecx * 4]
    mov edx, [num_array2 + ecx * 4]
    add eax, edx
    mov [result_4word + 4 + ecx * 4], eax
    jnc print
    mov edx, 1
    mov [result_4word + ecx * 4], edx

print:
    NEWLINE    
    PRINT_STRING "0x"
    PRINT_HEX 4, [result_4word + ecx * 4]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 4 + ecx * 4]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 8 + ecx * 4]
    PRINT_STRING " "
    PRINT_HEX 4, [result_4word + 12 + ecx * 4]
    PRINT_STRING " "
    inc ecx
    cmp ecx, [length]
    jl while

    leave
    ret
