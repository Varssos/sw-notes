Objdump
=======

`Objdump examples <https://www.thegeekstuff.com/2012/09/objdump-examples/>`_ 

`Geeksforgeeks objdump <https://www.geeksforgeeks.org/objdump-command-in-linux-with-examples/>`_ 

Objdump is a command-line program for displaying various information about object files on Unix-like operating system.

For instance, it can be used as a disassembler to view an executable in assembly form. It is part of the GNU Binutils for fine-grained control over executables and other binary data. Objdump uses the BFD library to read the contents of object files. 

Similar utilities:
    - Borland TDUMP
    - Microsoft DUMPBIN and readelf


Display the contents of the overall file header
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    objdump -f {binary_file_name}

Disassemble contents of executable sections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    objdump -d {binary_file_name}

Disassemble contents of all sections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    objdump -D {binary_file_name}

Display the contents of the section headers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    objdump -h {binary_file_name}

Display interesting section
~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is extremely useful when you know the section related to which the information is required. The option -j is used in this case::

    objdump -D {binary_file_name}