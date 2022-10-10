%include "/usr/local/share/csc314/asm_io.inc"


segment .data


segment .bss

	code	resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		ebx, 8675309
	mov		DWORD [code], 63
	mov		eax, DWORD [code]

	call	print_int
	call	print_nl

	shl 	eax, 15
	call	print_int
	call	print_nl

	ror		eax, 17
	call	print_int
	call	print_nl

	xor		eax, ebx
	call	print_int
	call	print_nl

	call	print_nl
	call	print_nl

	;; xor secret code 69420

	mov		eax, -1065066526

	xor		eax, ebx
	call	print_int
	call	print_nl

	rol		eax, 17
	call	print_int
	call	print_nl

	shr		eax, 15
	call	print_int
	call	print_nl


;	mov		eax, 63			; 00111111
;	shl		eax, 1			; should be 01111110
;	call	print_int		; expecting 126
;	call	print_nl
;	shr		eax, 1			;
;	call	print_int		; expecting 63
;	call	print_nl
;
;	;; left then right seems like safe bet
;
;	mov		eax, 63
;	shr		eax, 1			; 00011111
;	call	print_int
;	call	print_nl
;	shl		eax, 1			; expecting loss of integrity
;	call	print_int
;	call	print_nl
;
;	;; no go on right then left
;
;	mov 	eax, 63
;	shl		eax, 2
;	call	print_int
;	call	print_nl
;	shr		eax, 2
;	call	print_int
;	call	print_nl
;
;	;; doing it twice seems to be fine
;
;	mov		eax, 63
;	shl		eax, 8
;	call	print_int
;	call	print_nl
;	shr		eax, 2
;	shr		eax, 6
;	call	print_int
;	call	print_nl
;
;	;; numbers greater than two are fine if moving left first to save integrity
;
;	mov		eax, 63
;	rol		eax, 3
;	call	print_int
;	call	print_nl
;	ror		eax, 3
;	call	print_int
;	call	print_nl
;	ror		eax, 7
;	call	print_int
;	call	print_nl
;	rol		eax, 4
;	rol		eax, 3
;	call	print_int
;	call	print_nl
;
;	;; rotating either way is fine
;
;	mov		eax, 63
;	mov		ebx, 800
;	xor		eax, ebx
;	call	print_int
;	call	print_nl
;	xor		ebx, eax
;	mov		eax, ebx
;	call	print_int
;	call	print_nl
;
	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret