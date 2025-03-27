; Take an array of 10 numbers move word-type of data into another empty array using stack push and pop technique.


INCLUDE Irvine32.inc
.DATA
sourceArray WORD 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
destinationArray WORD 10 DUP(?)
.CODE
main PROC
mov esi, OFFSET sourceArray
mov edi, OFFSET destinationArray
mov ecx, 10
pushLoop:
mov ax, [esi]
push ax
add esi, 2
loop pushLoop
mov ecx, 10
popLoop:
pop ax
mov [edi], ax
add edi, 2
loop popLoop
CALL DUMPREGS
exit
main ENDP
END main
