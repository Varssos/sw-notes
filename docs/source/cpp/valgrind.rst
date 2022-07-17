Valgrind
========

`Valgrind home page <https://valgrind.org/>`_ , `valgrind quick start <https://valgrind.org/docs/manual/quick-start.html>`_ 

Valgrind is an instrumentation framework for building dynamic analysis tools.


Install valgrind
~~~~~~~~~~~~~~~~
::

    sudo apt-get update
    sudo apt-get install valgrind

Prepare your program
~~~~~~~~~~~~~~~~~~~~

1. Compile with ``-g`` flag ( debug build type )
2. It is also good to turn off optimilizations. Just use ``-O0``. ``-O1`` and ``-O2`` are not recommended.


Run valgrind
~~~~~~~~~~~~

Normal run your program::

    myprog arg1 arg2

Use this command line::

    valgrind --leak-check=yes myprog arg1 arg2



