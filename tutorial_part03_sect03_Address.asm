; Getting the Address of a Variable

; There is LEA (Load Effective Address) instruction and alternative
; OFFSET operator. Both OFFSET and LEA can be used to get the offset
; address of the variable.

; LEA is more powerful because it also allows you to get the address
; of an indexed variable. Getting the address of the variable can be
; very useful in some situations, for example when you need to pass
; parameters to a procedure.

; REMINDER:
; In order to tell the compiler the data type, these prefixes should
; be used:

; BYTE PTR - for byte.
; WORD PTR - for word (two bytes).

; For example:

;;BYTE PTR[BX]    ; byte access

; or

;;WORD PTR[BX]    ; word access

; Assembler supports shorter prefixes as well:

; b. - for BYTE PTR
; w. - for WORD PTR

; In certain cases the assembler can calculate the data type
; automatically.
; END REMINDER

; Here is the first example:

ORG 100h

MOV AL, var1    ; check value of var1 by moving it to AL.

LEA BX, var1    ; get address of var1 in BX.

MOV BYTE PTR [BX], 44h  ; modify the contents of var1.

MOV AL, var1    ; check value of var1 by moving it to AL.

RET

var1 DB 22h

END    
