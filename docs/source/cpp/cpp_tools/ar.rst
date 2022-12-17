ar
==

`ar geeksforgeeks <https://www.geeksforgeeks.org/ar-command-in-linux-with-examples/>`_ 

ar command is used to create, modify and extract the files from the archives. An archive is a collection of other files having a particular structure from which the individual files can be extracted. Individual files are termed as the members of the archive.


[ar] Replace existing or insert new files into the archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ar r libdevice.a device.o

[ar] Delete files from the archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ar d libdevice.a device.o

[ar] Display contents of the archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ar t libdevice.a

[ar] Print files found in the archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ar p libdevice.a

[ar] Extract files from the archive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ar x libdevice.a
    