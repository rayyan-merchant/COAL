INCLUDE Irvine32.inc

.data
arr BYTE 1, 2, 3, 4, 5  
msg1 BYTE "Reversed Array: ", 0

.code
main PROC
    mov ecx, (LENGTHOF arr) / 2  
    mov esi, 0 
    mov edi, LENGTHOF arr - 1  

L1:
    mov al, arr[esi] 
    mov bl, arr[edi]  
    mov arr[esi], bl  
    mov arr[edi], al 
    inc esi  
    dec edi  
    loop L1  

    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    mov ecx, LENGTHOF arr  
    mov esi, OFFSET arr  

L2:
    mov al, [esi] 
    call WriteDec  
    call Crlf
    inc esi 
    loop L2  

    exit
main ENDP
END main
