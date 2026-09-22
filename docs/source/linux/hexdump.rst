.. warning::
    This page has been migrated to varssos-mkdocs (docs/linux/hexdump.md). This copy is outdated and no longer maintained.

Hexdump
=======

`Geekfsforgeeks hexdump <https://www.geeksforgeeks.org/hexdump-command-in-linux-with-examples/>`_ 



Display file as hex array
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    hexdump -v -e '/1 "0x%02X, "' file_name.zip