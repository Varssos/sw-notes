Snap7 python server
===================

s7-server.py
~~~~~~~~~~~~

.. code-block:: python

    #!/usr/bin/python3
    import logging
    import snap7.server

    logging.basicConfig(format='%(asctime)s : %(levelname)s  -  %(message)s', level=logging.INFO)

    port = 2102

    print( f'Running snap7 server on port {port}' )

    try:
        snap7.server.mainloop(tcpport=port, init_standard_values=True)
    except KeyboardInterrupt:
        print( f'\nsnap7 server terminated by user' )

    print( f'Finished running snap7 server' )

Makefile which prepare everything before running script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: Makefile

    PYTHON_PATH=$(shell which python)
    PYTHON3_PATH=$(shell which python3)
    ifeq (, ${PYTHON3_PATH})
    ifeq (, ${PYTHON_PATH})
        $(error "Could not find python3")
    endif
        PYTHON=${PYTHON_PATH}
    else
    PYTHON=${PYTHON3_PATH}
    endif

    PYTHON_VERSION_FULL := $(wordlist 2,4,$(subst ., ,$(shell ${PYTHON} --version 2>&1)))
    PYTHON_VERSION_MAJOR := $(word 1,${PYTHON_VERSION_FULL})
    PYTHON_VERSION_MINOR := $(word 2,${PYTHON_VERSION_FULL})

    ifneq (3, ${PYTHON_VERSION_MAJOR})
    $(error "Could not find python3")
    endif

    ifeq ($(shell test $(PYTHON_VERSION_MAJOR) -ge 7; echo $$?),0)
    $(error "Need python >= 3.7 (found $(shell ${PYTHON} --version))")
    endif

    .PHONY: prepare

    prepare:
        @echo Detected python path: ${PYTHON}, installing
        @${PYTHON} -m pip install -r requirements.txt
        @echo "Redirecting port 102 -> 2102"
        @sudo sudo iptables -t nat -D OUTPUT -p tcp -d 127.0.0.1 --dport 102 -j REDIRECT --to-ports 2102 2> /dev/null || true
        @sudo sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 102 -j REDIRECT --to-ports 2102
        @chmod +x ./s7-server.py
        @echo Finished

    undo:
        @echo Removing rule
        @sudo sudo iptables -t nat -D OUTPUT -p tcp -d 127.0.0.1 --dport 102 -j REDIRECT --to-ports 2102 || true
        @echo Finished

    run:
        @${PYTHON} s7-server.py

requirements.txt
~~~~~~~~~~~~~~~~

.. code-block:: text

    python-snap7==1.2

README.md
~~~~~~~~~

S7 server folder content
~~~~~~~~~~~~~~~~~~~~~~~~
::

    s7-server
    ├── Makefile                # Makefile which install requirements and redirect ports
    ├── s7-server.py            # python s7 server code
    └── requirements.txt        # python requirements

S7-dependencies
~~~~~~~~~~~~~~~

- python3 >= 3.7
- python-snap7 = 1.2 (installation guid below)

Python >= 3.7 is required.

Automatic
---------
::

    make


This will install the required Python dependencies, as well as do a redirection of port `102` to `2102`, necessary to allow running the server without the sudo priviliges. For that purpose, sudo password will have to be provided.

Manual
------

If for any reason, automatic method could not be used (i.e. non-default python interpreter path must be specified), manual method may be used:

``{PYTHON}`` - Python >= 3.7 interpreter.

Execute the following commands:

.. code-block:: bash

    {PYTHON} -m pip install -r requirements.txt
    sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 102 -j REDIRECT --to-ports 2102

Running the s7-server
---------------------


Running server as `sudo` is *disadvised*.

Invoke:

- Run ``./s7-server.py`` directly.
- ``make run`` to use the same Python interpreter as was used by ``make`` installation.
- ``{PYTHON} s7-server.py`` to specify appropriate Python interpreter manually.

Cleanup
-------

Execute:

.. code-block:: bash

    make undo

In order to remove port redirection.

Usage
-----

The snap7 server will be exposed on localhost (``127.0.0.1``) on port ``2102``, rack 1, slot 1.


Data map
~~~~~~~~

.. raw:: html

    <details>
    <summary>Expandable list of all the data contained by the simulated PLC:</summary>
    <pre>

    __Boolean:__
    BYTE    BIT     VALUE
    0       0       True
    0       1       False
    0       2       True
    0       3       False
    0       4       True
    0       5       False
    0       6       True
    0       7       False

    ---
    __Small int:__
    BYTE    VALUE
    10      -128
    11      0
    12      100
    13      127

    ---
    __Unsigned small int:__
    BYTE    VALUE
    20      0
    21      255

    ---
    __Int:__
    BYTE    VALUE
    30      -32768
    32      -1234
    34      0
    36      1234
    38      32767

    ---
    __Double int:__
    BYTE    VALUE
    40      -2147483648
    44      -32768
    48      0
    52      32767
    56      2147483647

    ---
    __Real:__
    BYTE    VALUE
    60      -3.402823e38
    64      -3.402823e12
    68      -175494351e-38
    72      -1.175494351e-12
    76      0.0
    80      1.175494351e-38
    84      1.175494351e-12
    88      3.402823466e12
    92      3.402823466e38

    ---
    __String:__
    BYTE    VALUE
    100     254|37|the brown fox jumps over the lazy dog

    ---
    __Word:__
    BYTE    VALUE
    400     \x00\x00
    404     \x12\x34
    408     \xAB\xCD
    412     \xFF\xFF

    ---
    __Double Word:__
    BYTE    VALUE
    500     \x00\x00\x00\x00
    508     \x12\x34\x56\x78
    516     \x12\x34\xAB\xCD
    524     \xFF\xFF\xFF\xFF
    </code></pre>
    </details>

