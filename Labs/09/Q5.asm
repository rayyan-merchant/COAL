INCLUDE Irvine32.inc

.data
    num1Low  DWORD 0xFFFFFFFF     
    num1High DWORD 0x00000001     

    num2Low  DWORD 2              
    num2High DWORD 0x00000000    

.code
Extended_Add PROC
    push ebp
    mov ebp, esp
    pushad

    mov esi, [ebp + 8]  
    mov edi, [ebp + 12]  

    mov eax, [esi]       
    mov ebx, [edi]     
    add eax, ebx         
    mov ecx, 0
    adc ecx, 0           

    mov edx, [esi + 4]  
    mov ebx, [edi + 4]  
    add edx, ebx        
    add edx, ecx         

    popad
    pop ebp
    ret 8
Extended_Add ENDP

main PROC
   
    push OFFSET num2Low
    push OFFSET num1Low
    call Extended_Add

    call Crlf
    call WriteHex        
    call Crlf
    mov eax, edx       
    call WriteHex
    call Crlf

    exit
main ENDP
END main
