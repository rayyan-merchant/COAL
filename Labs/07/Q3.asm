; Write a program having procedures are used to calculate the total sum of 2 arrays (each array
; having 5-elements). The sum of 1-array in 1st procedure and in 2nd procedure have sum of 2-
; array. And the 3rd procedure add the results of both.


INCLUDE Irvine32.inc
.data
array1 DWORD 10, 20, 30, 40, 50
array2 DWORD 5, 15, 25, 35, 45

sum1 DWORD ?
sum2 DWORD ?
totalSum DWORD ?

.code
main PROC
    call SumArray1

    call SumArray2

    call AddSums

    mov eax, totalSum
    call WriteString
    call Crlf
    mov eax, totalSum
    call WriteInt
    call Crlf
    exit
main ENDP


SumArray1 PROC
    mov ecx, LENGTHOF array1
    lea esi, array1
    xor eax, eax        

sum_loop1:
    add eax, [esi]
    add esi, 4
    loop sum_loop1

    mov sum1, eax
    ret
SumArray1 ENDP


SumArray2 PROC
    mov ecx, LENGTHOF array2
    lea esi, array2
    xor eax, eax       

sum_loop2:
    add eax, [esi]
    add esi, 4
    loop sum_loop2

    mov sum2, eax
    ret
SumArray2 ENDP


AddSums PROC
    mov eax, sum1
    add eax, sum2
    mov totalSum, eax
    ret
AddSums ENDP


END main
