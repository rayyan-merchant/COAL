; Write a program that takes four input integers from the user. Then compare and display a message whether these integers are equal or not.

include irvine32.inc
.data
nums DWORD 4 DUP(?)
prompt BYTE "Enter a number: ", 0
msg1 BYTE "Nums are equal", 0
msg2 BYTE "Nums aren't equal", 0

.code
main PROC
  mov ecx, 0
  mov ebx, 4
  mov edx, offset prompt
  mov esi, offset nums

input_loop:
    call writestring
    call readint
    mov [esi], eax
		add esi, 4
    inc ecx
    cmp ecx, ebx
    jl input_loop

    mov esi, offset nums
    mov eax, [esi]     
    mov ecx, 3      
    add esi, 4    
compare_loop:
    cmp eax, [esi]
    jne not_equal
    add esi, 4
    loop compare_loop

    mov edx, offset msg1
    call writestring
    jmp end_code

not_equal:
    mov edx, offset msg2
    call writestring

end_code:
    exit
main ENDP
END main
