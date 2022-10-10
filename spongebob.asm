%include "/usr/local/share/csc314/asm_io.inc"

%define LETTUCE		1
%define	ONIONS		2
%define	TOMATOES	4
%define	PICKLES		8
%define	MUSTARD		16
%define	KETCHUP		32


segment .data

	request_code	db		"Krabby Patty code?: ",0
	patty_needs		db		"That Krabby Patty needs...",10,0
	needs_lettuce	db		"    - lettuce",10,0
	needs_onions	db		"    - onions",10,0
	needs_tomatoes	db  	"    - tomatoes",10,0
	needs_pickles	db		"    - pickles",10,0
	needs_mustard	db  	"    - mustard",10,0
	needs_ketchup	db  	"    - ketchup",10,0

segment .bss

	code 			resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	mov		eax, request_code
	call	print_string
	call	read_int
	mov		DWORD [code], eax
	mov		eax, patty_needs
	call	print_string

	lettuce:
	mov		eax, DWORD [code]
	and		eax, LETTUCE
	cmp		eax, 0
	je		onions

	mov		eax, needs_lettuce
	call	print_string

	onions:
	mov		eax, DWORD [code]
	and		eax, ONIONS
	cmp		eax, 0
	je		tomatoes

	mov		eax, needs_onions
	call	print_string

	tomatoes:
	mov		eax, DWORD [code]
	and		eax, TOMATOES
	cmp		eax, 0
	je		pickles

	mov		eax, needs_tomatoes
	call	print_string

	pickles:
	mov		eax, DWORD [code]
	and		eax, PICKLES
	cmp		eax, 0
	je		mustard

	mov		eax, needs_pickles
	call	print_string

	mustard:
	mov		eax, DWORD [code]
	and		eax, MUSTARD
	cmp		eax, 0
	je		ketchup

	mov		eax, needs_mustard
	call	print_string

	ketchup:
	mov		eax, DWORD [code]
	and		eax, KETCHUP
	cmp		eax, 0
	je		end

	mov		eax, needs_ketchup
	call	print_string

	end:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
