%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_UDEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_UDEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    or eax, ebx
    PRINT_UDEC 4, eax ; afiseaza reuniunea 
    NEWLINE

    ; TODO2: adaugarea unui element in multime
    mov edx, 64
    or eax, edx
    PRINT_UDEC 4, eax ; afiseaza prima multime
    NEWLINE

    ; TODO3: intersectia a doua multimi
    mov ecx, eax
    and ecx, ebx
    PRINT_UDEC 4, ecx ; afiseaza intersectia
    NEWLINE

    ; TODO4: complementul unei multimi
    mov ecx, eax
    not ecx
    PRINT_UDEC 4, ecx ; afiseaza complementul
    NEWLINE

    ; TODO5: eliminarea unui element
    mov ecx, eax
    sub ecx, 64
    and eax, ecx
    PRINT_UDEC 4, eax ; afiseaza eliminarea elementului
    NEWLINE

    ; TODO6: diferenta de multimi EAX-EBX
    and ebx, eax
    sub eax, ebx
    PRINT_UDEC 4, eax ; afiseaza diferenta
    NEWLINE

    xor eax, eax
    ret
