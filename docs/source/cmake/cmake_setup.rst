CMake environment setup
=======================


Install cmake on Windows
~~~~~~~~~~~~~~~~~~~~~~~~

1. Install cmake from `here <https://cmake.org/download/>`_ with ``Add CMake to the system PATH for all users``
2. Add to path installed cmake bin folder e.g. ``C:\Program Files\CMake\bin\``
3. If you are using a minGW, use MinGW Installation Manager to install ``mingw32-make-bin`` or ``mingw32-make``. For that case you should also add ``C:\MinGW\bin\`` to Path
4. You would be forced to use cmake like this ``cmake -G "MinGW Makefiles" ..``

Install cmake on Linux 
~~~~~~~~~~~~~~~~~~~~~~

1. Update and upgrade package repositories::

    sudo apt update && sudo apt upgrade -y

2. Install with APT repository::

    sudo apt install cmake

3. Check installed cmake version::

    cmake --version
    # Output:
    cmake version 3.16.3

    CMake suite maintained and supported by Kitware (kitware.com/cmake).