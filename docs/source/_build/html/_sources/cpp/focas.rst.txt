Focas
=====

FOCAS means Fanuc Open CNC API Specification. 
There are FOCAS1/2, version 1 and 2.

- FOCAS1 : Library for CNC other than FS300i/310i/320i
- FOCAS2 : Library for FS300i/310i/320i


Connection type
~~~~~~~~~~~~~~~

- High Speed Serial Bus (HSSB) ( from what I know it is used only with FOCAS )
- Ethernets

Applicable CNCs
~~~~~~~~~~~~~~~

List of applicable CNCs can be fine `here <https://www.inventcom.net/fanuc-focas-library/general/fwlib32>`_ in section ``Applicable CNCs``

.. important:: 1. Focas library is precompiled. For linux devices there is only available 32 bit version which produce following problems:
    
    - ``short`` is in fact ``int16_t`` instead of ``int32_t``


FOCAS library installing on x86 Linux OS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Download library
----------------
::

    git clone https://github.com/strangesast/fwlib.git

Get to correct directory
------------------------
::

    cd ./fwlib/Linux

Copy shared library to system directory
---------------------------------------
::

    sudo cp libfwlib32-linux-x64.so.1.0.5 /usr/local/lib/libfwlib32.so.1.0.5

Create a symbolic link
----------------------
::

    sudo ln -s /usr/local/lib/libfwlib32.so.1.0.5 /usr/local/lib/libfwlib32.so

Update headers and libraries installed in system
------------------------------------------------
::

    sudo ldconfig



