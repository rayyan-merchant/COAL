INCLUDE Irvine32.inc
.data
arr DWORD 8, 5, 1, 2, 6  
size DWORD LENGTHOF arr  
msg1 BYTE "Sorted Array: ", 0

.code
main PROC
    mov ecx, size 
    dec ecx  
OuterLoop:
    mov esi, 0 
    mov ebx, size
    dec ebx  

InnerLoop:
    mov eax, arr[esi] 
    mov edx, arr[esi + TYPE DWORD]  
    cmp eax, edx  
    jbe NoSwap  

    mov arr[esi], edx
    mov arr[esi + TYPE DWORD], eax

NoSwap:
    add esi, TYPE DWORD  
    dec ebx
    jnz InnerLoop  

    loop OuterLoop  

    mov edx, OFFSET msg1
    call WriteString
    call Crlf
    mov ecx, size
    mov esi, 0

PrintLoop:
    mov eax, arr[esi]  
    call WriteInt  
    call Crlf
    add esi, TYPE DWORD  
    loop PrintLoop

    exit
main ENDP
END main
