$mod186
NAME EG0_COMP
; CG2007		Microprocessor Systems
; Sem 2			AY2011-2012
;
; Author:       Mr. Niu Tianfang
; Address:      Department of Electrical Engineering 
;               National University of Singapore
;               4 Engineering Dr 3
;               Singapore 117576. 
; Date:         Jan 2012
;
; This file contains proprietory information and cannot be copied 
; or distributed without prior permission from the author.
; --------------------------------------------------------------------


;IO Setup for 80C188 
	UMCR    EQU    0FFA0H ; Upper Memory Control Register
	LMCR    EQU    0FFA2H ; Lower Memory control Register         
	PCSBA   EQU    0FFA4H ; Peripheral Chip Select Base Address
	MPCS    EQU    0FFA8H ; MMCS and PCS Alter Control Register
	
	
; STACK SEGMENT
STACK_SEG		SEGMENT

	
STACK_SEG		ENDS
	
	
; DATA SEGMENT
DATA_SEG        SEGMENT 


DATA_SEG        ENDS


; RESET SEGMENT
Reset_Seg   SEGMENT

    MOV DX, UMCR
    MOV AX, 03E07H
    OUT DX, AX
	JMP far PTR start
	
Reset_Seg  ends


; MESSAGE SEGMENT
MESSAGE_SEG     SEGMENT


MESSAGE_SEG     ENDS


;CODE SEGMENT
CODE_SEG        SEGMENT
       
PUBLIC	START

ASSUME  CS:CODE_SEG, DS:DATA_SEG, SS:STACK_SEG

START:

; Initialize MPCS to MAP peripheral to IO address
	MOV DX, MPCS
	MOV AX, 0083H
	OUT DX, AX

; PCSBA initial, set the parallel port start from 00H
	MOV DX, PCSBA
	MOV AX, 0003H ; Peripheral starting address 00H no READY, No Waits
	OUT DX, AX

; Initialize LMCS 
    MOV DX, LMCR
    MOV AX, 01C4H  ; Starting address 1FFFH, 8K, No waits, last shoud be 5H for 1 waits      
    OUT DX, AX

	; YOUR CODE HERE ...
	; GOOD LUCK!
	
CODE_SEG        ENDS
END