Expect use cases
================

Main expect keywords
~~~~~~~~~~~~~~~~~~~~

.. list-table::
    :widths: 50 50
    :header-rows: 1

    * - Command
      - Function
    * - spawn
      - Creates a new process 
    * - send
      - Sends a reply to the program
    * - expect
      - Wait for output
    * - interact
      - Enables interacting with the program


On top you should include
~~~~~~~~~~~~~~~~~~~~~~~~~
::

    #!/usr/bin/expect

Setting timeout for reaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    set timeout -1

Set internal variable
~~~~~~~~~~~~~~~~~~~~~
::

    set PATH "/home/user/Documents/"

Set internal variable from argument
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    set FILE [lindex $argv 0] # It starts counting from 0

Get password
~~~~~~~~~~~~
::

    stty -echo
    send_user -- "Password: "
    expect_user -re "(.*)\n"
    send_user "\n"
    stty echo
    set PASS $expect_out(1,string)
    send -- "Password was captured\r"

Get text input from user
~~~~~~~~~~~~~~~~~~~~~~~~
::

    send_user "Enter device SN: "
    expect_user -re "(.*)\n"
    set DEVICE_SN $expect_out(1,string)
    send_user "Received SN: $DEVICE_SN\n"

Send file via SCP
~~~~~~~~~~~~~~~~~
::

    spawn scp $FILE $HOST:$PATH
    expect "$HOST's password:";
    send "$PASS\r"

Run script on remote server with 1 argument($FILE)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    spawn ssh -t $HOST '/home/user/script.sh' $FILE 
    expect "$HOST's password:";
    send "$PASS\r"

Hide spawn command in stdout
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In case when you invoke script or anything else with spawn you can hide it in stdout like here::

    log_user 0      # Disable logging to stdout
    spawn script.sh # Invoke script which shouldn't be visible
    log_user 1      # Enable logging to stdout

End expect file with
~~~~~~~~~~~~~~~~~~~~
::

    expect eof