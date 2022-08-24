Expect
======

Expect command or scripting language works with scripts that expect user inputs. It automates the task by providing inputs.

How to use expect you can check here:

.. toctree:: 
    :maxdepth: 2

    expect_use_cases

Install expect
~~~~~~~~~~~~~~
::

    sudo apt install expect

Example
~~~~~~~

que.sh:

.. code-block:: bash

    #!/bin/bash
    echo "Enter your name"
    read $REPLY
    echo "Enter your age"
    read $REPLY
    echo "Enter your salary"
    read $REPLY

Expect ans.exp:

.. code-block:: bash

    #!/usr/bin/expect -f
    set timeout -1
    spawn ./que.sh
    expect "Enter your name\r"
    send -- "I am Nikhil\r"
    expect "Enter your age\r"
    send -- "24\r"
    expect "Enter your salary\r"
    send -- "100k\r"
    expect eof

Run expect script::

    chmod +x ./ans.exp
    ./ans.exp
    # Output
        spawn ./que.sh
        Enter your name
        I am Nikhil
        Enter your age
        24
        Enter your salary
        100k

Autoexpect
~~~~~~~~~~

You can generate once a expect file which will behave every time. Just type::

    autoexpect ./que.sh  





