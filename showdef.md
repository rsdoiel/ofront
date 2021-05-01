NAME
====

showdef - show interface definition of an Oberon module

SYNOPSIS
========

showdef modulename

DESCRIPTION
===========

showdef decodes the symbol file \<M\>.sym of the specified module \<M\>
and displays the interface definition in a human-readable form on the
standard output device.

ENVIRONMENT
===========

OBERON

:   a colon-separated list of directories in which showdef searches for
    symbol files. If OBERON is not defined, files are only searched in
    the current working directory. Note that shell specific characters
    such as \"\~\" are not supported by showdef. The environment
    variable OBERON may be set e.g. under the bash shell by

\% export OBERON=.:Mylib:OberonLib

COPYRIGHT
=========

Copyright 1995 by Josef Templ.

Transferred to the Free BSD License in 2012.

AUTHORS
=======

Design and implementation of showdef is due to Josef Templ. Comments or
suggestions may be sent to Josef.Templ\@gmail.com.

Project ofront is hosted on https://github.com/jtempl/ofront.
