; Write a function that asks the user for a number n and prints the sum of the numbers 1 to n

INCLUDE Irvine32.inc
.data
prompt BYTE "Enter a number: ", 0
sumMsg BYTE "The sum from 1 to n is: ", 0
n DWORD ?
sum DWORD ?

.code
main PROC
    mov edx, OFFSET prompt
    call WriteString
    call ReadInt
    mov n, eax         

    call SumToN

    mov edx, OFFSET sumMsg
    call WriteString
    mov eax, sum
    call WriteInt
    call Crlf
    exit
main ENDP


SumToN PROC
    mov ecx, n
    xor eax, eax        
sum_loop:
    add eax, ecx
    loop sum_loop       

    mov sum, eax
    ret
SumToN ENDP

END main
