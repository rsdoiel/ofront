NAME
====

ocat - dump Oberon text file to standard out

SYNOPSIS
========

ocat documentname \| filepath

DESCRIPTION
===========

ocat reads the specified Oberon text document, which is either stored in
the Oberon V4 binary format or as ASCII text, and displays its ASCII
text on the standard output device.

ENVIRONMENT
===========

OBERON

:   a colon-separated list of directories in which ocat searches for the
    text document unless an explicit file path is provided. If OBERON is
    not defined, files are only searched in the current working
    directory. The environment variable OBERON may be set e.g. under the
    bash shell by

\% export OBERON=.:Mylib:OberonLib

COPYRIGHT
=========

Copyright 1995 by Josef Templ.

Transferred to the Free BSD License in 2012.

AUTHORS
=======

Design and implementation of ocat is due to Josef Templ. Comments or
suggestions may be sent to Josef.Templ\@gmail.com.

Project ofront is hosted on https://github.com/jtempl/ofront.
