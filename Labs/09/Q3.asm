INCLUDE Irvine32.inc

.code
main PROC
    mov ax, 0001h     
    mov bx, 1234h     

    mov cx, ax
    and cx, 1         

    shl cx, 15         

    and bx, 7FFFh      

    or bx, cx

    call Crlf
    movzx eax, bx
    call WriteHex     

    call Crlf
    exit
main ENDP
END main
