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

There is one command-line option, `-l`, which allows the load address to
be specified in hexadecimal.  For example, to tokenize a BASIC 2.0 program
to load on the unexpanded VIC-20 (loads at `$1001`):

    script/hatoucan -l 1001 <source.txt >program.prg

If no `-l` switch is given, the load address defaults to `$0801` (suitable
for the Commodore 64.)

A subset of `petcat`-isms, such as `{wht}`, are supported.  Not many, but
`hatoucan` is capable of tokenizing both the original BASIC version of
[Bubble Escape][], and [Dungeons of Ekileugor][].

[Bubble Escape]:          http://catseye.tc/node/Bubble_Escape
[Dungeons of Ekileugor]:  http://catseye.tc/node/Dungeons_of_Ekileugor
