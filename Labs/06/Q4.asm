INCLUDE Irvine32.inc

.data
source BYTE "Hello, Rayyan!", 0 
target BYTE SIZEOF source DUP(?) 

.code
main PROC
    mov esi, OFFSET source   
    mov edi, OFFSET target  

L1: 
    mov al, [esi]  
    mov [edi], al    
    inc esi          
    inc edi         
    cmp al, 0    
    jne L1          
    
    mov edx, OFFSET target
    call WriteString
    call Crlf
    exit
main ENDP
END main






