Test Suite for Commodore BASIC 2.0 Tokenization
===============================================

This test suite is written in the format of Falderal 0.10.

    -> Tests for functionality "Tokenize Commodore BASIC 2.0 program"

Fundamentals of Tokenization
----------------------------

Rudimentary program.

    | 10 print
    = 010807080a0099000000

All extra spaces after line number are stripped.

    | 10     print
    = 010807080a0099000000

Strings in PETSCII.

    | 10 print "hello"
    = 01080f080a0099202248454c4c4f22000000
