; Use cmp and jumps to find the first non-zero value in the given array:
;         intArr SWORD 0, 0, 0, 150, 120, 35, -12, 66, 4, 0


include irvine32.inc
.data
	intArr SWORD 0,0,0,150,120,35,-12,66,4,0
	msg1 BYTE "Non Zero Value found:  ", 0
	msg2 BYTE "No non zero values in array.", 0

.code
main PROC
	mov esi, offset intArr
	mov ecx, lengthof intArr
	
check_nums:
		mov ax, [esi]
		cmp ax, 0
		jg found
		add esi, 2
		loop check_nums
	jmp end_code

found:
		mov edx, offset msg1
		movsx eax, ax
		call writestring
		call writeint
	
 end_code:
  exit
main endp
end main
