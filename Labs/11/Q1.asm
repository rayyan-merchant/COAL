include irvine32.inc

.data
	str1 byte '127&j~3#^&*#*#45^', 0
	msg1 byte "Character found at index: ", 0
	msg2 byte "Character not found: ", 0

.code
	main proc
		push '#'
		call scanString

		exit
	main endp

	scanString proc,
		char: byte

		mov ecx, lengthof str1
		mov edi, offset str1
		mov al, char

		cld
		repne scasb
		je found

		mov edx, offset msg2
		call writestring
		call crlf
		jmp endd

		found:
		
		dec edi
		mov edx, offset msg1
		call writestring
		mov eax, edi
		; sub eax, type str1
		call writedec
		call crlf

		endd:

		ret
	scanString endp
end main
