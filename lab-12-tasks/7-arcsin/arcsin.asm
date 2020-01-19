%include "io.inc"

extern printf

section .data
    valoare_sin dq 0.123
    max    dq   1.57079632679
    min    dq   0.0
    eroare dq   0.0005

    med    dq   0.0
    format db   "Unghi gasit: %.20f", 10, 0
    max_format db   "MAX: %.20f", 10, 0
    min_format db   "MIN: %.20f", 10, 0

    sin    dq   0.0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
repeat:
    ; med = (max + min) / 2
    push 2
    fld qword [max]
    fadd qword [min]
    fidiv dword [esp]
    fstp qword [med]
    add esp, 4
    
    ; TODO sin(med) - valoarea med este deja pe stiva
    fld qword [med]
    fsin

    ; TODO stocare rezultat in variabila sin
    
    fstp qword [sin]

    ; TODO comparatie cu valaorea cautata (valoare_sin)
    ; +
    ; TODO ajustare interval in functie de rezultatul comparatiei (min=med sau max=med)
    fld qword [sin]
    fld qword [valoare_sin]
    fcomip
    ja smaller
    fld qword [med]
    fstp qword [max]
    fstp ST0
    jmp after_smaller 
      
smaller:
    fld qword [med]
    fstp qword [min]
    fstp ST0
after_smaller:

    ; TODO verificare eroare (abs(valoare_sin-sin) < eroare)
    ; +
    ; TODO loop daca eroarea este mai mare decat cea maxima
    fld qword [sin]
    fsub qword [valoare_sin]
    fabs
    
    fld qword [eroare]
    fcomip
    ja done
    
    jmp repeat

    ; TODO afisare rezultat. Valoarea trebuie sa fie aproximativ 0.123312275
done:
    push dword[med + 4]
    push dword[med]
    push format
    call printf
    add esp, 12

    xor eax, eax
    ret
