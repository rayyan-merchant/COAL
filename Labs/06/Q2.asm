INCLUDE Irvine32.inc

.data
    newline BYTE 0Dh,0Ah,0  

.code
main PROC

    ; Pattern 1: 
    mov ecx, 4  
    call Crlf  
outer:
    mov edx, 4
inner:
    mov al, '1'
    call WriteChar
    dec edx
    jnz inner
    call Crlf
    loop outer



    ; Pattern 2:
    mov ecx, 4
    call Crlf  
outer:
    mov edx, ecx
inner:
    mov al, '1'
    call WriteChar
    dec edx
    jnz inner
    call Crlf
    loop outer




    ; Pattern 3
    mov ecx, 4
    call Crlf
outer:
    mov edx, ecx
inner:
    add dl, '0'
    mov al, dl
    call WriteChar
    sub dl, '0'
    dec edx
    jnz inner
    call Crlf
    loop outer



    ; Pattern 4
    mov ecx, 4
    call Crlf
outer:
    mov edx, 1
inner:
    add dl, '0'
    mov al, dl
    call WriteChar
    sub dl, '0'
    inc edx
    cmp edx, ecx
    jg exit
    jmp inner
exit:
    call Crlf
    loop outer

    exit
main ENDP
end main
