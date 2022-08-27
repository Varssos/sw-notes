Positional parameters
=====================

Print 1. argument
~~~~~~~~~~~~~~~~~
.. code-block:: bash

    echo $1

Print total number of arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: bash

    echo $#

Print all arguments
~~~~~~~~~~~~~~~~~~~
.. code-block:: bash

    echo $*

Messing function arguments with script arguments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.. code-block:: bash

    function func {
        echo $1
    }

    echo $1 $2 $4
    func $2
    # Output of invoking: ./param.sh 1 2 3 4
    1 2 4
    2


Example:

.. code-block:: bash

    echo $1 $2 $4   # print 1. argument 2. etc..
    echo $#         # print the total number of arguments
    echo $*         # print all arguments
    # Output of invoking: ./param.sh 1 2 3 4
    1 2 4
    4
    1 2 3 4
