NAME
====

oberon - the Oberon operating environment

SYNOPSIS
========

oberon \[-f fontmapfile\] \[-u displayunit\] \[-d display\] \[-g
geometry\] \[-c\]

DESCRIPTION
===========

oberon starts the Oberon operating environment, which may be used as an
integrated Ofront development system. Oberon requires an X-Windows
server, a three button mouse and a postscript printing device. The
Oberon process may be terminated by executing (i.e., by clicking with
the middle mouse button on) the command System.Quit (after removing the
leading !) within the Oberon environment or by sending a QUIT signal (3)
to the Oberon process. Oberon supports the DISPLAY environment variable
and the -display and -geometry options as usual for X clients. For
speeding up character display, Oberon fonts can be converted to X11
fonts. The Oberon tool InstallXFonts.Tool gives further information
about this conversion, however, it is not a Unix or X-Windows tutorial.
If you are not familiar with Unix or X-Windows, ask your system
administrator to help in installing the fonts.

Special keys used by Oberon and their meanings are:

key meaning

\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--

F1 set \* marker

F2 alias to Escape

F3 Break character

F4 init colors

F6..F10 (+Shift, +Ctrl, +Ctrl-Shift)

characters beyond 127.

Ctrl-a, o, u, A, O, U, s german Umlaute and double s

Ctrl-L redraw all viewers

\* On older SUN OpenWindows configurations remove the line xmodmap -e
\'keysym F1 = Help\' from your .xinitrc file in order to make F1
available to Oberon. An alternative that avoids changing the .xinitrc
file is to use the command xmodmap -e \'keycode 12 = F1\' to use the F1
key.

Keyboard interrupts may be generated by sending the Oberon process a
SIGINT signal either by typing Ctrl-C on the controlling terminal or, if
there is no controling terminal, by sending the signal using the kill -2
command.

OPTIONS
=======

-f fontmapfile

:   defines that font names should be mapped according to fontmapfile.
    If option -f is not specified, no font mapping is performed. The
    main purpose of this option is to map fonts to bigger ones on
    displays with very small or unsharp pixels such as color monitors or
    for video projection. The files Big.Map and Medium.Map are provided
    as examples for enlarging fonts. See option -u for the effect of
    using Big.Map or Medium.Map on the display unit size. If font
    mapping is performed, the result of printing documents will not be
    exact. Therefore, if you want to get high quality printing results,
    don\'t use this option.

-u displayunit

:   defines the size of a display unit (pixel) in world coordinates,
    where one millimeter equals 36000. The default display unit is
    10000, which is adequate for displays with about 90 dots per inch.
    If option -f Big.Map ist used, the default changes to 8000, for
    Medium.Map to 9000. displayunit must be a positive integer number
    smaller than 32768.

-d display

:   specifies the display server as usual for X clients.

-g geometry

:   specifies the window geometry as usual for X clients.

-c

:   requests as many colors as possible from the window manager. If not
    specified, Oberon requests 16 colors.

ENVIRONMENT
===========

OBERON

:   a colon-separated list of directories in which Oberon searches for
    files. If OBERON is not defined, files are only searched in the
    current working directory. Note that shell specific characters like
    \"\~\" are not supported by Oberon. The environment variable OBERON
    may be set e.g. under the C-shell by

\% setenv OBERON .:Mylib:OberonLib

LD\_LIBRARY\_PATH, LIBPATH, SHLIB\_PATH, etc.

:   a colon-separated list of directories in which the dynamic linker
    searches for shared object libraries. The lookup strategies between
    different Unix versions differ slightly. The name of the environment
    variable to be used for library lookup is also platform specific.
    SunOS and Linux use LD\_LIBRARY\_PATH, AIX uses LIBPATH, and HP-UX
    uses SHLIB\_PATH.

OberonStartup

:   This optional module is loaded upon startup of oberon in order to
    allow for automating user specific settings. It requires dynamic
    module loading being available, which is for example the case under
    Linux. The distribution does not contain binaries for this module
    but provides a template module in source form.

FILES
=====

temporary files

:   Oberon allocates temporary files prefixed with \'.tmp.\' and removes
    them when terminated with System.Quit. If the Oberon process is
    abnormally terminated (e.g. by a kill signal (9)), the .tmp.\* files
    may survive and should be explicitly deleted by the user. Do not
    delete .tmp.\* files while Oberon is using them.

Oberon.Printfile.ps

:   Oberon allocates a file \'Oberon.Printfile.ps\' when printing
    documents. If the name of the printer is \"none\", this file will
    not be sent to the printer and contains the generated postscript
    output; otherwise it will be sent and deleted afterwards.

DOCUMENTATION
=============

Oberon contains basic online documentation to enable first-time users to
get started. In particular it contains the Oberon text files
OberonGuide.Text, OfrontUser.Text and the Edit.Guide.Text. For serious
work we recommend the following books published by Addison-Wesley and
Springer Verlag.

N. Wirth and M. Reiser: \"Programming in Oberon. Steps beyond Pascal and
Modula-2.\" Addison Wesley, 1992, ISBN 0-201-56543-9. Textbook for the
Oberon programming language (German edition will be available in Sept.
94).

M. Reiser: \"The Oberon System. User Guide and Programmer\'s Manual.\"
Addison Wesley, 1991, ISBN 0-201-54422-9. User manual for the
programming environment and reference for the standard module library.

N. Wirth and J. Gutknecht: \"Project Oberon. The Design of an Operating
System and Compiler.\" Addison Wesley, 1992, ISBN 0-201-54428-8.
Contains program listings with explanations for the whole Oberon system,
including the compiler for NS32000. The source code is also available in
electronic form via anonymous ftp from neptune.inf.ethz.ch
/Oberon/Sources/ProjectOberon.tar.Z.

H. Moessenboeck: \"Object-Oriented Programming in Oberon-2.\" Springer
Verlag, 1993 (also available in German). An introduction to
object-oriented programming using Oberon-2 as a teaching language.

An Oberon-FAQ (frequently asked questions) list is available via
anonymous ftp from rtfm.mit.edu /pub/usenet/news.answers/Oberon-FAQ.

The Internet newsgroup comp.lang.oberon is also sometimes a valuable
source of information and the preferred forum for Oberon related
discussions. A mail gateway to this newsgroup exists via a mailing list
called oberon-news\@inf.ethz.ch managed by listproc\@inf.ethz.ch. Send a
mail with the keyword \'help\' in the body

To: listproc\@inf.ethz.ch

help

to get more information about the available services.

COPYRIGHT
=========

Copyright 1995 by Institute for Computer Systems, ETH Zurich. See
\'Welcome.Text\' for a full statement of rights and permissions.

AUTHORS
=======

Design and implementation of the original Oberon system is due to Prof.
Niklaus Wirth and Prof. Juerg Gutknecht from the Institute for Computer
Systems, ETH Zurich. The implementation of Oberon based on ofront is due
to Josef Templ. Comments or suggestions may be sent to
Josef.Templ\@gmail.com.

Project ofront is hosted on https://github.com/jtempl/ofront.