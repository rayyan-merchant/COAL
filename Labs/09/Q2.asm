INCLUDE Irvine32.inc

.data
    msg1 BYTE "Value in AX: ", 0
    msg2 BYTE "Expanded EAX: ", 0
    msg3 BYTE "Shifted EAX (SHL 1): ", 0
    msg4 BYTE "Rotated EAX Left (ROL 1): ", 0

.code
main PROC
    mov ax, -128           

    mov edx, OFFSET msg1
    call WriteString
    movzx eax, ax
    call WriteInt
    call Crlf

    cwde                  

    mov edx, OFFSET msg2
    call WriteString
    call WriteInt
    call Crlf

    shl eax, 1
    mov edx, OFFSET msg3
    call WriteString
    call WriteInt
    call Crlf

    rol eax, 1
    mov edx, OFFSET msg4
    call WriteString
    call WriteInt
    call Crlf

    exit
main ENDP
END main
