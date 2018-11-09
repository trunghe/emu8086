; Arrays

; Arrays can be seen as chains of variables. A text string is an
; example of a byte array, each character is presented as an ASCII
; code value (0..255).

; Here are some array initialization examples:

a DB 48h, 65h, 6Ch, 6Ch, 6Fh, 00h
b DB 'Hello', 0

; b is an exact copy of the array a. When the compiler sees a string
; inside quotes ('Hello') it automatically converts it to a sequence 
; of bytes (48h, 65h, 6Ch, 6Ch, 6Fh, 00h).

; You can access the value of any element in an array using square
; brackets, for example:

MOV AL, a[3]

; You can also use any of the memory index registers BX, SI, DI, BP.
; For example:

MOV SI, 3
MOV AL, a[SI]

; If you need to declare a large array you can use DUP operator.
; The syntax for DUP:

;   number DUP (value(s))

; number - number of duplicates to make (any constant value).
; value - expression that DUP will duplicate.

; for example:
c DB 5 DUP(9)
; is an alternative way of declaring:
c DB 9, 9, 9, 9, 9

; One more example:
d DB 5 DUP(1, 2)
; is an alternative way of declaring:
d DB 1, 2, 1, 2, 1, 2, 1, 2, 1, 2

; Of course, you can use DW instead of DB if it's required to keep
; values larger than 255, or smaller than -128. DW cannot be used
; declare strings.
