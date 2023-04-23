Hexdump
=======

`Geekfsforgeeks hexdump <https://www.geeksforgeeks.org/hexdump-command-in-linux-with-examples/>`_ 



Display file as hex array
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    hexdump -v -e '/1 "0x%02X, "' file_name.zip