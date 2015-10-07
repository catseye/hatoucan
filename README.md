hatoucan
--------

`hatoucan` is a tokenizer for Commodore BASIC 2.0 programs.  You give it a
text file, and it gives you a `.PRG` file, which can then be run on a
Commodore computer (either in an emulator such as VICE's `x64` or `xvic`,
or on a physical Commodore 64 or VIC-20, if transferred to an appropriate
physical storage medium first.)

There are several options available for tokenizing BASIC programs, notably
`petcat`, which is included with VICE.  Indeed, these are mostly more
efficient, and have better support for extensions, than `hatoucan`.  But,
they are mostly distributed under licenses I don't really like, such as
the GPL.  Thus, I wrote `hatoucan` to have a tokenizer which is completely
in the public domain — in fact it is covered by the Unlicense.  See the
file `UNLICENSE` in this directory for more information.

Usage is simple.  From this directory,

    script/hatoucan <source.txt >program.prg

Alternatively, put the `script` directory somewhere on your search path,
and the script can be invoked simply as `hatoucan`.

Note, it is not finished yet.  We'll have a test suite soon...
