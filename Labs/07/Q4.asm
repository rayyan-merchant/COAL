INCLUDE Irvine32.inc
.data 
rows DWORD 5
star BYTE "*", 0
space BYTE " ", 0

.code
main PROC
    mov ecx, rows        
    mov ebx, 1           

outer:
    mov edx, rows
    sub edx, ebx        
    call printspaces  

    mov edx, ebx         
    call printstars    
    call Crlf         
    inc ebx
    cmp ebx, rows + 1    
    jl outer
    exit
main ENDP

printspaces PROC
    mov ecx, edx
ps_loop:
    cmp ecx, 0
    jle ps_end
    mov edx, OFFSET space
    call WriteString
    dec ecx
    jmp ps_loop
ps_end:
    ret
printspaces ENDP

printstars PROC
    mov ecx, edx
st_loop:
    cmp ecx, 0
    jle st_end
    mov edx, OFFSET star
    call WriteString
    dec ecx
    jmp st_loop
st_end:
    ret
printstars ENDP

END main
