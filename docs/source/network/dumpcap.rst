Dumpcap
=======

How to list available interfaces
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    dumpcap -D

Basic capture on interface
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    dumpcap -i enp2s0f0 -w /tmp/capture.pcap
    dumpcap -i 1 -w /tmp/capture.pcap # 1 is the number of interface from dumpcap -D

Dumpcap with ringbuffer
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    dumpcap -i enp2s0f0 -w /tmp/capture.pcap -b filesize:1000000 -b files:10   # size is in kB, in that case 1GB, 10 files

