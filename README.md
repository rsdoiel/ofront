Ofront
======

Ofront is an Oberon-2 to C translator written in Oberon-2.
It supports both ANSI and K&R style C and supports cross
translation to arbitrary target platforms. Ofront includes
a runtime system including an automatic garbage collector
for Linux, the Oberon V4 system, and a set of command-line
tools.

Download Ofront 1.4 for Linux/i386 or Raspbian from

    https://www.software-templ.com/shareware.html.

Programs
--------

The Ofront tools are self hosting meaning you need a working
version to recompile them. The compiled versions provided
at [software-templ.com](https://www.software-templ.com/shareware.html)
are comprised of 

[oberon](oberon.md)
: A V4 Oberon environment for Linux and X11

[ocat](ocat.md)
: A program that will read a V4 formatted Text file 
  and write it as plain text to standard out

[ocl](ocl.md)
: The Ofront compiler which wraps `Ofront`, and your system C compiler 
  and linker to produce compiled programs and shared libraries.

[ofront](ofront.md)
: Ofront translate Oberon-2 into C for compilation with your system's C
  compiler.

[showdef](showdef.md)
: This will read a symbol file and display a human readable description


Source Code
-----------

NOTE: See [INSTALL](INSTALL.md) for details on installing 
Ofront 1.4 and compiling Ofront from scratch.

The directory structure of the project ofront is as follows:

**fonts**

A set of bitmap fonts for the Oberon system.
This directory is not required for building ofront.

**man1**

A set of section 1 manual pages.
This directory is not required for building ofront.

**V4**

A set of example modules and resource files for the
original Oberon V4 system.  This directory is not
required for building ofront.

**V4_ofront**

The files that are required for building ofront.

**V4_ofront/share**

A set of source files not specific for any
particular ofront version.

**V4_ofront/linux386**

The set of files specifically adapted for the
linux-386 version of ofront.  This includes
adapted low level modules as well as the 
'makefile' and the parameter file 'Ofront.par'.

**V4_ofront/raspbian**

The set of files specifically adapted for the
raspbian version of ofront. This includes adapted
low level modules as well as the 'makefile' and
the parameter file 'Ofront.par'.  This version
is in many aspects similar to linux386.  One
difference is the added module WiringPi, which
provides an interface to the popular
libwiringPi.so for the Raspberry Pi.

LICENSE
-------

Joseph Templ released Ofront under a FreeBSD style
license in 2012. See [LICENSE](LICENSE) for details.

