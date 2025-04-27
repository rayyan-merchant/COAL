; Write a program for sequential search. Take an input from the user and find if it occurs in the following array:
;            arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20

include irvine32.inc

.data
	arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
	num WORD ?
	prompt BYTE "Enter a number: ", 0
	msg1 BYTE "Found.", 0
	msg2 BYTE "Not Found", 0

.code
main PROC
	mov edx, offset prompt
	call writestring
	call readint
	mov ecx, lengthof arr
	mov esi, offset arr
	
  search_loop:
		movzx ebx, word ptr [esi] 
		cmp ax, bx
		je found
		add esi, 2
		loop search_loop
	
  mov edx, offset msg2
	call writestring
	jmp end_code
	
  found:
		mov edx, offset msg1
		call writestring
	
  end_code:
    exit
main endp
end main
