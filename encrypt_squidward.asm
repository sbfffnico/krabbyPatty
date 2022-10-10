%include "/usr/local/share/csc314/asm_io.inc"

%define KETCHUP		32
%define MUSTARD		16
%define PICKLES		8
%define TOMATOES	4
%define ONIONS		2
%define LETTUCE		1

segment .data

	lettuce_inq		db	"Lettuce? (y/n): ",0
	onions_inq		db	"Onions? (y/n): ",0
	tomatoes_inq	db	"Tomatoes (y/n): ",0
	pickles_inq		db	"Pickles (y/n): ",0
	mustard_inq		db	"Mustard? (y/n): ",0
	ketchup_inq		db	"Ketchup? (y/n): ",0
	krabby_patty	db	"Krabby Patty code is: ",0

segment .bss

	code	resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		DWORD [code], 0

	lettuce:
	mov		eax, lettuce_inq
	call	print_string
	call	read_char
	mov		ebx, eax
	call	read_char
	mov		eax, ebx

	cmp		eax, 121			; 121 is ascii 'y'
	jne		onions
	or		DWORD [code], LETTUCE

	onions:
	mov		eax, onions_inq
	call 	print_string
	call	read_char
	mov		ebx, eax
	call 	read_char
	mov		eax, ebx

	cmp		eax, 121
	jne		tomatoes
	or		DWORD [code], ONIONS

	tomatoes:
	mov		eax, tomatoes_inq
	call	print_string
	call	read_char
	mov		ebx, eax
	call	read_char
	mov		eax, ebx

	cmp 	eax, 121
	jne		pickles
	or		DWORD [code], TOMATOES

	pickles:
	mov		eax, pickles_inq
	call	print_string
	call	read_char
	mov		ebx, eax
	call	read_char
	mov		eax, ebx

	cmp		eax, 121
	jne		mustard
	or		DWORD [code], PICKLES

	mustard:
	mov		eax, mustard_inq
	call	print_string
	call	read_char
	mov		ebx, eax
	call	read_char
	mov		eax, ebx

	cmp		eax, 121
	jne		ketchup
	or		DWORD [code], MUSTARD

	ketchup:
	mov		eax, ketchup_inq
	call	print_string
	call	read_char
	mov		ebx, eax
	call	read_char
	mov		eax, ebx

	cmp		eax, 121
	jne		encrypt
	or		DWORD [code], KETCHUP

	encrypt:
	mov		ebx, 8675309		; secret code
	mov		eax, DWORD [code]
	shl		eax, 15
	ror		eax, 17
	xor		eax, ebx
	mov		DWORD [code], eax


	print_krabby_code:
	mov		eax, krabby_patty
	call	print_string
	mov		eax, DWORD [code]
	call	print_int
	call	print_nl


	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
