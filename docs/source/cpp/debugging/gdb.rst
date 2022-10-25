GDB
===

How to run GDB
~~~~~~~~~~~~~~

Compile binary with ``-g`` flag

::

    gdb ./prog
    # or
    gdb --tui ./prog

    gdb --silent --tui ./prog

    


GDB commands
~~~~~~~~~~~~

- ``start`` start
- ``q`` quit from gdb mode
- ``next`` or ``n`` next command
- ``list`` list code near executed commands
- ``b 37`` - breakpoint on line 37
- ``continue`` or ``c`` continue to next breakpoint
- ``layout asm`` list code in asm in TUI mode
- ``br helper`` print breakpoints  // not sure
- ``del 2`` delete br 2
- ``refresh`` refresh gdb layout
- ``info locals`` print info about local variables
- ``print p`` print variable ``p``
- ``print/x p`` print in hex
- ``print *p`` print what indicate pointer ``p``. If p=nullptr it can print: ``Cannot access memory at address 0x0``
- ``backtrace`` or ``bt`` print a callstack
- ``whatis o1`` o1 is a structure. It will print  ``type = object``
- ``focus src`` focus on code and you can move up and down with arrows
- ``focus cmd`` focus on commands window
- ``ptype o1`` print fields of object
- ``watch i`` everytime when i has changed it will print old and new ``i`` value
- ``target record-full`` it enables to ``reverse-next``
- ``reverse-next`` you go te previous line
- ``reverse-step`` you go te previous line


.. important:: You shouldn't give client debug binary/build. Only release build!!!
    Hackers can see extra information. 
