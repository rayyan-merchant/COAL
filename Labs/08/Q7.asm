; Write a program to print weekday based on given number.

include irvine32.inc
.data
    prompt BYTE "Enter a number (1-7): ", 0
    invalid BYTE "Invalid number! Enter between 1 and 7.", 0
    weekdays BYTE "Monday",0,"Tuesday",0,"Wednesday",0,"Thursday",0,"Friday",0,"Saturday",0,"Sunday",0

.code
main PROC
    mov edx, offset prompt
    call writestring
    call readint              

    cmp eax, 1
    jl invalid_input     
    cmp eax, 7
    jg invalid_input      

    dec eax                 
    mov ecx, eax          

    mov esi, offset weekdays

find_weekday:
    cmp ecx, 0
    je print_weekday
    
  next_string:
        mov al, [esi]
        inc esi
        cmp al, 0
        jne next_string
    dec ecx
    jmp find_weekday

print_weekday:
    mov edx, esi
    call writestring
    jmp end_program

invalid_input:
    mov edx, offset invalid
    call writestring

end_program:
    exit
main ENDP
END main
