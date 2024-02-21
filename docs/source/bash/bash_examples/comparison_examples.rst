Numeric and String Comparisons
==============================


.. list-table::
    :widths: 50 50 50
    :header-rows: 1
    :stub-columns: 1

    * - Description
      - Numeric Comparison
      - String Comparison
    * - less than
      - -lt 
      - `<`
    * - greater than
      - -gt
      - `>`
    * - equal
      - -eq
      - `=`
    * - not equal
      - -ne
      - !=
    * - less or equal
      - -le
      - N/A
    * - greater or equal
      - -ge
      - N/A
    * - Shell comparison example
      - [ 100 -eq 50 ]; echo $?
      - ["GNU"="UNIX"]; echo $?

Comparing numbers
~~~~~~~~~~~~~~~~~

.. warning:: true = return 0
    
    false = return 1

.. code-block:: bash

    a=1
    b=2
    [ $a -lt $b ]
    echo $? # Output: 0 
    
    [ $a -gt $b ]
    echo $? # Output: 1

    [ $a -eq $b ]
    echo $? # Output: 1

    [ $a -ne $b ]
    echo $? # Output: 0

Comparing strings
~~~~~~~~~~~~~~~~~

.. code-block:: bash

    [ "apples" = "oranges" ]
    echo $? # Output: 1

    str1="apples"
    str2="oranges"
    [ $str1 = $str2 ]
    echo $? # Output: 1

