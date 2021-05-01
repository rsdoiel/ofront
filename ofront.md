NAME
====

ofront - Oberon-2 to C Translator

SYNOPSIS (EBNF)
===============

command = \"ofront\" options {path options}.

options = \[\"-\" {option} \].

option = \"m\" \| \"s\" \| \"e\" \| \"i\" \| \"r\" \| \"x\" \| \"a\" \|
\"p\" \|\"t\".

DESCRIPTION
===========

ofront is a tool that translates Oberon-2 programs into semantically
equivalent C programs. Full error analysis is performed on the Oberon
input program and in case of no errors, up to three files are generated
as output:

1\. an Oberon symbol file (suffix .sym)

2\. a C header file (suffix .h)

3\. a C body file (suffix .c).

The C header and body files follow widely used C programming
conventions. Ofront is also capable of generating main programs by
translating the body of a module into a C main function (see option -m).
In this case only the body file is generated. Ofront does not invoke the
C compiler or linkage editor. This may be done in separate shell scripts
or make files and is inherently dependent on the C compiler and linkage
editor being used. Ofront accepts an arbitrary number of input file
parameters. Every file is expected to contain one Oberon module. Oberon
source files typically (but not necessarily) have the file name
extension .Mod. Options affecting the translation process may be
specified immediately after the command name or after a file name. The
former apply to all files, the latter only to the preceeding one; thus,
the order in which file names and options are specified is important.
Specifying an option twice has no additional effect. Note that options
must not contain whitespace.

OPTIONS
=======

-m

:   generate a main module (default off)

This option signals Ofront that the module body should be translated
into a C main function, which is the entry point of an application.
Every application consists of exactly one main module. Modules which are
intended for a library should never be compiled with option m.

-s

:   allow changing the symbol file (default off)

The interface of an Oberon module is represented in a compact and
efficient form in the module\'s symbol file (suffix .sym). Changing the
symbol file of a module therefore means changing the interface of the
module. An example of such a change is to insert, rename or delete an
exported type, variable or procedure. Those clients, which depend on the
changed feature have to be adapted to the new interface and recompiled.
Note that, unlike earlier Modula-2 or Oberon-2 compilers, only those
clients of the module that depend on the changed feature(s) need to be
recompiled, not all modules which import the changed service module. The
new fine-grained interface checking supports the evolution of software
over time much better than its coarse grained predecessor. To avoid
unintended interface changes, this option is turned off by default.

-e

:   allow extending the module interface (default off)

This option is similar to s but restricts interface changes to
extensions. For example, it is possible to export additional global
variables or procedures if option e is specified. Renaming or deleting a
procedure or variable is not allowed. To avoid unintended interface
extensions, this option is turned off by default.

-i

:   include header and body prefix files (default off)

Specifying this option enables the inclusion of C code that is prepended
to the generated header and body files. For a module M, the header and
body prefix files are expected to be named M.h0 and M.c0 respectively.
Non-existing prefix files are silently ignored.

-r

:   check value ranges (default off)

Specifying this option turns on value range checking such as checking if
SHORT of a LONGINT variable is in the INTEGER value range. Since this
option is not related to memory integrity, it is turned off by default.

-x

:   check array indices (default on)

Specifying this option turns off array index bounds checking. Since
index checks are inlined and consist only of a single unsigned compare,
they are very fast and it is normally not necessary to turn them off in
order to get good performance. Furthermore, optimizers can remove index
checks in many places without giving up security.

-a

:   check assertions (default on)

Specifying this option turns off run-time checking of ASSERT statements.
Use this option only in carefully tested production code when utmost
efficiency is required. An unchecked assertion is nothing but a comment.

-p

:   pointer initialization (default on)

Specifying this option turns off automatic pointer initialization. Note
that Oberon does not specify the value of local pointer variables before
they are assigned a value. Even with pointer initialization, it is not
correct to make assumptions about the initial value of a pointer. In
particular, it is not allowed to assume that they are set to NIL.
Pointer initialization is a technique to ensure memory integrity even in
case of erroneous programs and/or to detect uninitialized pointers as
soon as possible.

-t

:   check type guards (default on)

Specifying this option turns off run-time type guard checking. Since
type guard checks are very efficient anyway and undetected type guard
failures can easily destroy memory integrity, we recommend using this
option only in very rare cases such as low-level modules where every
machine cycle counts.

EXAMPLE
=======

\% ofront -sr M1.Mod M2.Mod M3.Mod -m

translates three modules with generation of new symbol files being
allowed (option s), range checking switched on (option r) and treating
module M3 as a main program.

ENVIRONMENT
===========

OBERON

:   a colon-separated list of directories in which ofront searches for
    input files. If OBERON is not defined, files are only searched in
    the current working directory. Note that shell specific characters
    like \"\~\" are not supported by ofront. The environment variable
    OBERON may be set e.g. under the bash shell by

\% export OBERON=.:Mylib:OberonLib

FILES
=====

temporary files

:   ofront allocates temporary files prefixed with \'.tmp.\' and the
    process id in the current working directory. If the ofront process
    terminates abnormally, temporary files may survive and should be
    explicitly deleted by the user. Do not delete .tmp.\* files while
    ofront is using them.

DOCUMENTATION
=============

For more details about ofront please refer to the Ofront User Guide,
which is provided as Oberon text file (OfrontUser.Text).

COPYRIGHT
=========

Copyright 1995 by Josef Templ.

Transferred to the Free BSD License in 2012.

AUTHORS
=======

Design and implementation of ofront is due to Josef Templ. Comments or
suggestions may be sent to Josef.Templ\@gmail.com. ofront has been based
in part on Regis Crelier\'s PhD thesis and Stefan Gehring\'s diploma
thesis, both at ETH Zurich, Institute for Computer Systems.

Project ofront is hosted on https://github.com/jtempl/ofront.
