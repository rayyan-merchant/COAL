; Write a program which displays the addition of three integers through a stack.

INCLUDE Irvine32.inc
.DATA
sum DWORD 0
msg1 BYTE "Enter first number: ", 0
msg2 BYTE "Enter second number: ", 0
msg3 BYTE "Enter third number: ", 0
msg4 BYTE "The sum is: ", 0
.CODE
main PROC
call Clrscr

mov edx, OFFSET msg1
call WriteString
call ReadInt
push eax

mov edx, OFFSET msg2
call WriteString
call ReadInt
push eax 

mov edx, OFFSET msg3
call WriteString
call ReadInt
push eax

pop eax 
pop ebx 
add eax, ebx
pop ecx
add eax, ecx

mov sum, eax
mov edx, OFFSET msg4
call WriteString
mov eax, sum
call WriteInt
call Crlf

exit
main ENDP
END main
