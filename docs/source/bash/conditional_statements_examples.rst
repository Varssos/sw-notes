Conditional Statements
======================

`Expressions used with if like [ -e FILE ] <https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html>`_ 

If statement
~~~~~~~~~~~~

.. code-block:: bash

    if TEST-COMMAND
    then
        STATEMENTS
    fi

If..else statement
~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    if TEST-COMMAND
    then
        STATEMENTS1
    else
        STATEMENTS2
    fi

If..elif..else statement
~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    if TEST-COMMAND1
    then
        STATEMENTS1
    elif TEST-COMMAND2
    then
        STATEMENTS2
    else
        STATEMENTS3
    fi

If..else example
~~~~~~~~~~~~~~~~

.. code-block:: bash

    num_a=400
    num_b=200

    if [ $num_a -lt $num_b ]
    then
        echo "$num_a is less than $num_b!"
    else
        echo "$num_a is greater than $num_b!"
    fi