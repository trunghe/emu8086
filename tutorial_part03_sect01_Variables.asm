; 8086 assembler tutorial for beginners (part 3)

; Variables

; Variable is a memory location. For a programmer it is much easier
; to remember some value kept in a variable named "var1" than at
; the address 5A73:235B, especially when you have many variables.

; Our compiler supports two types of variables: BYTE and WORD.

;   +-------------------------------------------------------------+
;   |   Syntax for a variable declaration:                        |
;   |                                                             |
;   |   name DB value                                             |
;   |   name DW value                                             |
;   |                                                             |
;   |   DB - Define Byte                                          |
;   |   DW - Define Word                                          |
;   |                                                             |
;   |   name - can be any letter or digit combination, though it  |
;   |   should start with a letter. It's possible to declare      |
;   |   unnamed variables by not specifying the name (this        |
;   |   variable will have an address but no name).               |
;   |                                                             |
;   |   value - can be any numeric value in any supported         |
;   |   numbering system (hexadecimal, binary or decimal), or "?" |
;   |   symbol for variables that are not initialized.            |
;   +-------------------------------------------------------------+

; As you probably know from part 2 of this tutorial, MOV
; instruction is used to copy values from source to destination.
; Let's see another example with MOV instruction:

ORG 100h

MOV AL,var1
MOV BX,var2

RET ; stops the program and returns to operating system  

var1 DB 7
var2 DW 1234h

; When the compiler makes machine code, it automatically replaces
; all variable names with their offsets. By default segment is
; loaded in DS register (when COM files are loaded, the value of
; DS register is set to the same value as CS register - code
; segment).

; In memory list, the first row is an offset, the second row is a
; hexadecimal value, the third row is a decimal value, and the
; last row is an ASCII character value.

; Compiler is not case sensitive, so "VAR1" and "var1" refer to
; the same variable. 

; Recall from part 2: the value in a segment register (CS, DS, SS,
; ES) is called a segment, and the value in a general-purpose
; register (BX< SI, DI, BP) is called an offset.

; The offset of var1 is 0180h, and full address is 0B56:0180.

; The offset of var2 is 0190h, and full address is 0B56:0109, this
; variable is a WORD so it occupies 2 BYTES. It is assumed that
; low byte is stored at lower address, so 34h is located in front
; of 12h.

; ORG 100h is a compiler directive (it tells the compiler how to
; handle the source code). This directive is very important when
; you work with variables. It tells the compiler that the
; executable file will be loaded at the offset of 100h (256 bytes),
; so the compiler should calculate the correct address for all
; variables when it replaces the variable names with their offsets.
; Directives are never converted to any real machine code. Why is an
; executable loaded at offset of 100h? Operating system keeps some
; data about the program in the first 256 bytes of the CS (code
; segment), such as command line parameters and etc.

; This is true for COM files only. EXE files are loaded at offset of
; 0000, and generally use special segment for variables. Maybe
; we'll talk about EXE files later.
