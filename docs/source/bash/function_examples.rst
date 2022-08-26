Functions
=========

Base syntax
-----------

.. code-block:: bash

    #!/usr/bin/bash

    function user_details {
        echo "User Name: $(whoami)"
        echo "Home Directory: $HOME"

    }

    user_details

Function arguments
------------------

.. code-block:: bash

    function your_name {
        echo "Your name is: $1"
    }

    your_name Chad

.. important:: ``$0`` in function means file name

Function which counts files in the current path
-----------------------------------------------

.. code-block:: bash

    function total_files {
            find $1 -type f | wc -l
    }

    echo -n "Files in the current path:"
    total_files .
