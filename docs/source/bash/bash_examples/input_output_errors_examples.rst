Input, Output and Error Redirections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

stdout redirection
------------------
.. code-block:: bash

    ls -l > stdout.txt

stderr redirection
------------------
.. code-block:: bash

    ls -l 2> stderr.txt

stdout and stderr redirection
-----------------------------
.. code-block:: bash

    ls -l &> stdoutandstderr.txt

Redirect stderr to /dev/null
----------------------------
.. code-block:: bash

    tar -czf $output $input 2> /dev/null

Redirect text from file to stdin
--------------------------------
.. code-block:: bash

    echo "1234" test
    cat < test

Passing yes as an user input to command
---------------------------------------
`More details about automatic respond to command <https://askubuntu.com/questions/338857/automatically-enter-input-in-command-line>`_ 

.. code-block:: bash

    printf 'y' | mkfs.ext4 -L sd_card /dev/sda1
    # Or use built in `yes`` command
    yes | mkfs.ext4 -L sd_card /dev/sda1
