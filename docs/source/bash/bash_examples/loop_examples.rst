Loops examples
==============

For loop
~~~~~~~~

.. code-block:: bash

    for i in 1 2 3; do
        echo $i
    done

    # Or:

    for i in 1 2 3
    do
        echo $i
    done

For loop example
~~~~~~~~~~~~~~~~
items.txt::

    bash
    scripting
    tutorial

.. code-block:: bash

    for i in $( cat items.txt )
    do
        echo -n $i | wc -c
    done

    # Output:
    4
    9
    8

Print number of characters for all files and directories inside current working directory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    files=$(ls)
    for i in $files
    do
        echo "$i has $(printf $i | wc -c)"
    done

While loop
~~~~~~~~~~
.. code-block:: bash

    counter=0
    while [ $counter -lt 3 ]
    do 
        let counter+=1
        echo $counter
    done
    # Output:
    1
    2
    3

Unitl loop
~~~~~~~~~~
.. code-block:: bash

    counter=6
    until [ $counter -lt 3 ]
    do
        let counter-=1
        echo $counter
    done
    # Output:
    5
    4
    3
    2
