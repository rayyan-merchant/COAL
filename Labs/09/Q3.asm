INCLUDE Irvine32.inc

.data
    msg BYTE "Enter: ",0
.code

LocalSquare PROC
    enter 4,0

    mov edx, OFFSET msg
    call WriteString
    call ReadInt
    mov [ebp - 4], eax
    mul eax
    mov [ebp - 4], eax
    call WriteInt

    leave
    ret
LocalSquare ENDP

main PROC
    call LocalSquare

    exit
main ENDP
END main
