7/19/2017

Latest released version of wgrib2 (2.0.6c) and the latest
version of cygwin. Hopefully this will fix the problems
with running under Windows Server 2013.

7/13/2017

I have had no complaints about this version.  So I plan to 
update this 64-bit version and stop updating the 32-bit
Windows version.  The 32-bit version is limited to 2GB
files and that is just painful.  

If you are still using a 32-bit Windows system, you can
get updated wgrib2 executables by recompiling the code
using the free cygwin compilers.  People have used other
compilers but I am cheap and lazy.  Cygwin is free and
I have been using it for years. 

12/1/2016 version was compiled using cygwin 2.6.0-1.
"At least Windows Vista or Windows Server 2008 are required."

12/1/2016

This directory contains wgrib2 v2.0.5 compiled using cygwin_x64.
This version of wgrib2 should work on 64-bit versions of Windows
Vista and later.  The big advantage of this 64-bit version is
that it handles 2GB+ files.

Installation Instructions:

   copy *.dll and wgrib2.exe to a directory on your Windows PATH.
   Use a shell such as the cygwin bash or Windows command propmt to run wgrib2.


Options used to compile:

 OpenMP is enabled
 IPOLATES (new_grid) is enabled

 AEC compression is turned off
 g2clib is turned off
 mysql is turned off

The standard makefile/source was used.

Note: the AEC library failed the check part of the compile.
If the wget package were installed, it should pass.  This problem
should be fixed in the wgrib2 v2.0.6.

Comments about using other Windows C compilers.

   Most 64-bit Windows C compilers define "long int" to be 32-bits long.  
The problem is that wgrib2 uses fseek(..) to do random access of
a file.  Fseek uses a "long int" to define the offset. This limits
file size to 2GB on most Windows C compilers.  There is an fseeko(..) 
which can do random access to 64-bit integers (off_t).  However, fseeko(..) is 
POSIX standard which is often not supported by Windows C compilers.
Even C99 support has been slow in the Windows world.

   The cygwin_x64 gcc compiler defines "long int" to be 64 bits long, supports
C99 and POSIX.  It just works.
