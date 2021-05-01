Installation
============

Joseph Templ distributes Ofront in two forms. A compiled versions
for Linux i386 and one for Raspberry Pi OS (ARMv7, R-Pi 2,3 and 4)
as wells in in source code form.

Source code is found at 

    https://github.com/jtempl/ofront

You can find information about the compiled versions at

    http://www.software-templ.com/shareware.html

This page also includes instructions for how to install the compiled
versions.  The link for the Linux i386 compiled version is 

    http://www.software-templ.com/shareware/ofront-1.4_linux-386-3.2.tar.gz

The link for the Raspberry Pi OS version is

    http://www.software-templ.com/shareware/ofront-1.4_raspbian-Pi3.tar.gz

The basics are download the `.tar.gz` files specific to the platform
you want. Untar and gunzip the files into the directory where you want
to host Ofront. Add the Ofront binary directories to your path.

Here's an example for installing command line programs on Linux i386.
In this example I've installed the tools in my home directory.

```
    cd
    curl -O http://www.software-templ.com/shareware/ofront-1.4_linux-386-3.2.tar.gz
    tar zxvf ofront-1.4_linux-386-3.2.tar.gz
    echo "# Ofront setup" >>"$HOME/.profile"
    echo "export PATH='$(pwd)/ofront_1.4/bin:$PATH'" >>"$HOME/.profile"
```

You should now be able to use the `ofront`, `ocat`, `ocl` and `showdef` command
line programs on your next login. If you want to run the V4 Oberon environment
then you need to do a little more setup.  Out of the box V4 Oberon uses Oberon
bitmap fonts to render the display. This is **very** slow to render on my machines.
In the man page for Oberon Joseph Templ explains how to configure V4 to use
the X11 versions of the Oberon fonts. This is necessary to have a useful system.
The X11 versions of the fonts can be found in `ofront_1.4/fonts`. They are the
files with the `.bdf` extensions.  To make those visible to X11 and there by
visible to the V4 environment we need to add those to our X11 font path.
We do that with the `xset` command.

```
    xset +fp $HOME/ofront_1.4/fonts
```

You can add this to your `.profile` login script with

```
    echo "set +fp $HOME/ofront_v1.4/fonts" >>"$HOME/.profile"
```

If you want to run the V4 Oberon development
environment you can do the following.

```
    cd $HOME/ofront_1.4
    ./oberon.bash
```

I found the fonts too small to read by default so use

```
    ./oberon.bash -f ./V4/Big.Map
```

Of course you can modify your copy of `oberon.bash` to
implement your preferred setup.

Now that you have a working Ofront installation you can
move on it compile the system from scratch.


Compiling for source
--------------------

The Ofront compiler and tools are self compiling. That means
you need an existing functioning version in order to compile
the GitHub repository version for your systems. Once you
have a working Ofront installed you can follow the following
steps to make your own custom compiled versions.

1. Install dependent libraries needed for your system
2. Clone the GitHub repository
3. Then change to the directory with the makefile you need and run `make`
4. Copy the resulting command line programs to your "bin" directory (I
   assume you have one in `$HOME/bin`)

On my i386 Debian machine I did this following

```
    sudo apt install build-essential libx11-dev git
    git clone https://github.com/jtempl/ofront
    cd ofront/V4_ofront/linux386
    make
    cp -pv ofront $HOME/bin
    cp -pv ocat $HOME/bin
    cp -pv ocl $HOME/bin
    cp -pv showdef $HOME/bin
```

At this point you should have the minimum tooling to compile and
release custom versions of Ofront.

To run the V4 development environment you launch the provided
`oberon.bash` script. Since I installed Ofront in my home
directory that would look like

```
    cd
    ./ofront/V4_ofront/linux386/oberon.bash
```

NOTE: If you haven't setup your X11 font path already you need
to do so before running `oberon.bash`.

If you want to run with larger fonts.

```
    ./ofront/V4_ofront/linux386/oberon.bash \
        -f ./ofront/V4/Big.Map
```

