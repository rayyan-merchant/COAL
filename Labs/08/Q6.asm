; Write a program for bubble sort on this array.
;       arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20

include irvine32.inc

.data
	arr WORD 10, 4, 7, 14, 299, 156, 3, 19, 29, 300, 20
	prompt BYTE "Sorted array: ", 0
	curr_num WORD 0
	outer_count WORD 0

.code
main PROC
	mov esi, offset arr
	mov ecx, lengthof arr - 1
	
  outer_loop:
		mov ax, [esi]
		mov curr_num, esi
		dec ecx
		mov outer_count, ecx
		add esi, 2
		
    inner_loop:
			cmp ax, [esi]
			jl swap
			add esi, 2
			loop inner_loop
			
      swap:
				mov dx, [esi]
				mov [esi], ax
				mov [esi-2], dx
			loop inner_loop
		
    mov esi, curr_num
		mov ecx, outer_count
		loop outer_loop
	
  mov esi, offset arr
	mov ecx, lengthof arr
	mov edx, offset prompt
	call writestring
	
  print_loop:
		mov eax, [esi]
		add esi, 2
		call writedec
		loop print_loop
	
  end_code:
    exit
main endp
end main
