Basics
======

Create script with shebang
--------------------------
.. code-block:: bash

    echo "#!"$(which bash) > script.sh
    # script.sh contain: #!/usr/bin/bash

Declare string variable
-----------------------
.. code-block:: bash

    greeting="Welcome"


Retrieve output of command to variable
--------------------------------------
.. code-block:: bash

    user=$(whoami)

Passing variable into another variable/echo
-------------------------------------------
.. code-block:: bash

    echo "$greeting back $user!"

Aritmetic operations
--------------------
.. code-block:: bash

    a=2
    b=4
    echo $[$a + $b]

Parameter expanstion
--------------------
It is used when you want to concatenate string ``${parameter}``

.. code-block:: bash

    user=$(whoami)
    output=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz