awk
===

Interesting links:

`tutorialspoint awk <https://www.tutorialspoint.com/awk/index.htm>`_ 
`linuxhandbook <https://linuxhandbook.com/awk-command-tutorial/>`_ 

AWK - print at program start-up
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk 'BEGIN {print "Hello world!"}'

AWK - print line which starts with a Zosia word, comma separated
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk '/^Zosia/ { print "Hello " $0; }' FS=,  input.txt

AWK - print at the end of the program
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk 'END { print "END" }' input.txt

AWK - combine BEGIN, process text and END
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk 'BEGIN { print "Begin to process text" } /^Zosia / { print "Hello " $0; } END { print "END" } ' FS=,  input.txt

