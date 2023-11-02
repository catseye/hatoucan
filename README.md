hatoucan
========

_Entry_ [@ catseye.tc](https://catseye.tc/node/hatoucan)
| _See also:_ [yucca](https://codeberg.org/catseye/yucca#yucca)
∘ [DiskSumo](https://catseye.tc/node/DiskSumo)

- - - -

`hatoucan` is a tokenizer for Commodore BASIC 2.0 programs.  You give it a
text file containing BASIC source code, and it gives you a `.PRG` file which
can be run on a Commodore computer (or emulator) such as the Commodore 64 or
VIC-20.

`hatoucan` is written in Python (runs under Python 2 or Python 3) and its
source code is in the [public domain](UNLICENSE).

Quick start
-----------

Usage is simple.  From this directory,

    script/hatoucan <source.txt >program.prg

Alternatively, put the `script` directory somewhere on your search path,
and the script can be invoked simply as `hatoucan`.  (An easy way to manage
this is to use [shelf][].)

There is one command-line option, `-l`, which allows the load address to
be specified in hexadecimal.  For example, to tokenize a program to load on
the unexpanded VIC-20:

    script/hatoucan -l 1001 <source.txt >program.prg

If no `-l` switch is given, the load address defaults to `$0801`, suitable
for the Commodore 64.

Why?
----

Given that there are several good options for tokenizing Commodore BASIC
programs already freely available, such as `petcat` which is included in
the [VICE][] distribution, why did I write this?

Well, any reasonable person would probably be wise to just use `petcat`.
But, I wanted a tool that could be included in [The Platform][] that would
be able to tokenize the Commodore BASIC programs that are part of
The Platform, namely:

*   the original implementation of [Bubble Escape][]
*   [DiskSumo][]
*   [Dungeons of Ekileugor][]
*   the binary-loader and front-panel simulator from [SITU-SOL][]

and none of the tokenizers I found appealed to me.  `petcat` in particular

*   is licensed under the GPL.  I prefer less parasitic licensing.
*   is bundled with VICE.  (If there is a standalone distribution, I was
    unable to find it.)  I would either need to extract it, or include
    all of VICE in The Platform.
*   has kind of weird command-line usage, if you ask me.
*   is written in C... which is fine, but things written in higher-level
    languages are more "hackable".
*   has support for all kinds of versions and extensions of Commodore
    BASIC.  Which is great, but I don't need all of those extras.

Plus the prospect of writing a tokenizer seemed easy enough, and that did
appeal to me.  After obtaining reference materials, it was basically
finished in a single day.

It also appealed to me to write it in a rather low-key style, without
using any of Python's "included batteries", including regular expressions.
This should make it easier to adapt to RPython or Skulpt, or to translate
to other languages, for instance Lua, if desired.

Of course, it is not very efficient, and only a subset of the `petcat`
special character codes such as `{wht}` are supported.  But it suits my
purposes.

Oh, also...
-----------

This was a great excuse to write a
[test suite for Commodore BASIC tokenization](tests/Commodore-BASIC-2.0.md).

The test suite is written in [Falderal] format.  As such, it is
implementation-agnostic — Falderal tests languages and protocols rather than
particular programs.

`hatoucan` was written in a TDD manner against this test suite, but the
tests in it also pass under `petcat`.  And, if you find or write
another Commodore BASIC tokenizer, you can use this same test suite to
test it — simply add an adapter for your implementation to the
`tests/appliances` directory and adjust `test.sh` to apply it.

[Bubble Escape]:          https://catseye.tc/node/Bubble_Escape
[DiskSumo]:               https://catseye.tc/node/DiskSumo
[Dungeons of Ekileugor]:  https://catseye.tc/node/Dungeons_of_Ekileugor
[Falderal]:               https://catseye.tc/node/Falderal
[SITU-SOL]:               https://catseye.tc/node/SITU-SOL
[shelf]:                  https://catseye.tc/node/shelf
[VICE]:                   https://vice-emu.sourceforge.io/
[The Platform]:           https://catseye.tc/node/The%20Platform
