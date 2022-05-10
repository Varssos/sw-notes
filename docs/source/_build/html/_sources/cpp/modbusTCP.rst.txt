Modbus TCP
==========


Modbus TCP Simulator
~~~~~~~~~~~~~~~~~~~~

To start developing Modbus TCP client you can use `pyModbusTCP <https://pymodbustcp.readthedocs.io/en/stable/>`_ 
to set Modbus TCP server. Below are described few steps how to set it. Connection parameters are hardcoded in python script

#. Install python3 package ``sudo pip3 install pyModbusTCP``
#. Download simple modbusTCP server script :download:`modbusTCPserver.py`
#. Make file executable for user ``chmod +x modbusTCPserver.py``
#. ``./modbusTCPserver.py``

Libraries
~~~~~~~~~

For embedded development purposes `libmodbus <https://libmodbus.org/>`_ 
is good solution. 

* written in C
* LGPL license 
* available on many platforms like OpenWrt without any cross compiling
* if it is needed it can be easily compiled
* very popular and well documented


