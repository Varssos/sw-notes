Bash arithmetics
================

Arithmetic expansion
~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    echo $(( 12 + 5 )) #: 17
    echo $(( 100 - 1 )) #: 99
    echo $(( 3 * 11 )) #: 33
    echo $(( 12 / 5 )) #: 2
    echo $(( 99 % 10 )) #: 9

Expr command
~~~~~~~~~~~~

.. code-block:: bash

    expr 2 + 2              #: 4
    expr 6 * 6              #: expr: syntax error
    expr 6 \* 6             #: 36
    expr 6 / 3              #: 2
    expr expr 1000 - 999    #: 1

Let command
~~~~~~~~~~~
::

    let a=2+2       # a=4
    let b=4*($a-1)  # a=12
    let c=($b**3)/2 # c=864
    let c++         # c=865
    let c--         # c=864

bc command
~~~~~~~~~~

bc command allow operations on numbers more than just on integers

.. code-block:: bash

    echo '8.5 / 2.3' | bc                           #: 3
    echo 'scale=2;8.5 / 2.3' | bc                   #: 3.69
    echo 'scale=30;8.5 / 2.3' | bc                  #: 3.695652173913043478260869565217
    squareroot=$( echo 'scale=50;sqrt(50)' | bc )   #: 7.07106781186547524400844362104849039284835937688474