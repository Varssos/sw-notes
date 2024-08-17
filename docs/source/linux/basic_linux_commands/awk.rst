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

AWK - assign variable
~~~~~~~~~~~~~~~~~~~~~
::

    awk -v name=Jerry 'BEGIN { printf "Hello %s!\n", name}'
    # Hello Jerry!

AWK - dump program variables to default awkvars.out
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk --dump-variables -v name=Jerry 'BEGIN { printf "Hello %s!\n", name}'

AWK - print column with descripction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    # marks.txt
    1)  Amit    Physics  80
    2)  Rahul   Maths    90
    3)  Shyam   Biology  87
    4)  Kedar   English  85
    5)  Hari    History  89
    # cmd:
    awk '{printf "Name: %s, Subject: %s, score: %s\n", $2, $3, $4}' marks.txt


AWK - count lines which has 'a'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk '/a/ {++cnt} END {print "Count = ", cnt}' marks.txt

AWK - print line which has less than 23 characters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    awk 'length($0) < 23' marks.txt
    # or only 3rd column
    awk 'length($0) < 23 {print $3}' marks.txt