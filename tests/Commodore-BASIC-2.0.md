Test Suite for Commodore BASIC 2.0 Tokenization
===============================================

This test suite is written in the format of Falderal 0.10.

    -> Tests for functionality "Tokenize Commodore BASIC 2.0 program"

Fundamentals of Tokenization
----------------------------

Rudimentary program.

    | 10 print
    = 010807080a0099000000

Untokenizable lowercase ASCII becomes single-case (uppercase) PETSCII.

    | 10 swish
    = 01080b080a005357495348000000

Uppercase ASCII becomes PETSCII graphic symbols.

    | 10 PRINT
    = 01080b080a00d0d2c9ced4000000

All extra spaces after line number are stripped.

    | 10     print
    = 010807080a0099000000

Any spaces before line number are stripped.

    |    10 print
    = 010807080a0099000000

Tokens can successively follow one another.

    | 10 printa$
    = 010809080a00994124000000

Tokens can successively follow one another, even if syntax error.

    | 10 printtofor
    = 010809080a0099a481000000

The number of spaces occurring between tokens is preserved.

    | 10 print to   for  to
    = 010810080a009920a4202020812020a4000000

Strings in PETSCII.

    | 10 print "hello"
    = 01080f080a0099202248454c4c4f22000000

Multiple program lines.

    | 10 a=7
    | 20 a=a*2
    | 30 goto 20
    = 010809080a0041b237001308140041b241ac32001c081e0089203230000000

Certain control sequences in curly braces are recognized.

    | 1390 print"{clr}{home}{down}{rght}{up}{left}"
    = 01080f086e0599229313111d919d22000000

    | 1390 print"{red}{cyn}{blu}{grn}{pur}{yel}{wht}"
    = 010810086e0599221c9f1f1e9c9e0522000000

    | 1390 print"{SHIFT-@}{CBM-+}"
    = 01080b086e059922baa622000000
