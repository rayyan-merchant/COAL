; Write a program to check whether a character is alphabet or not.

include irvine32.inc

.data
	prompt BYTE "Enter a character: ", 0
	msg1 BYTE "It is a character.", 0
	msg2 BYTE "It is not a character.", 0

.code
main PROC
	mov edx, offset prompt
	call writestring
	call readchar
	call writechar
	call crlf
	
  cmp al, 65
	jl not_an_alphabet
	
  cmp al, 95
	jle is_an_alphabet
	
  cmp al, 97
	jl not_an_alphabet
	
  cmp al, 122
	jg not_an_alphabet
	
  is_an_alphabet:
		mov edx, offset end1
		call writestring
		jmp end_code
	not_an_alphabet:
		mov edx, offset end2
		call writestring
	
  end_code:
	exit
main endp
end main
