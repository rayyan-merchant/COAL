include irvine32.inc

.data
	str1 byte "abcd", 0
	str2 byte "abc", 0
	msg1 byte "String1 is greater", 0
	msg2 byte "String2 is greater", 0
	msg3 byte "Both are equal", 0

.code
	main proc
		call isCompare

		exit
	main endp

	isCompare proc
		mov esi, offset str1
		mov edi, offset str2
		mov ecx, lengthof str1

		repe cmpsb
		ja op1
		jb op2
		mov edx, offset msg3
		jmp endd

		op1:
			mov edx, offset msg1
			jmp endd

		op2:
			mov edx, offset msg2

		endd:
			call writestring
			call crlf

		ret
	isCompare endp
end main
