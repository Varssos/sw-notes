Modbus
======

:download:`Theoretical information about modbus <./modbus_theoretical_info.pdf>` 

Example request/response
~~~~~~~~~~~~~~~~~~~~~~~~
::

    Request: read single discrete input, address: 0x322
    [01][02][03][22][00][01][19][84]

    [01] - Slave ID in hex
    [02] - Function code in hex ( read discrete input )
    [03][22] - Address of discrete input in hex ( 0x320)
    [00][01] - The total number of discrete input requested in hex (1)
    [19][84] - The CRC ( cyclic redundancy check ) for error checking

    Waiting for a confirmation...

    Response:
    <01><02><01><00><A1><88>

    <01> - Slave ID in hex
    <02> - Function code in hex ( read discrete input )
    <01> - The number of data bytes to follow in hex
    <00> - Read value ( last bit is desired value )
    <A1><88> - The CRC


C/C++ Modbus Libraries
~~~~~~~~~~~~~~~~~~~~~~

For embedded development purposes `libmodbus <https://libmodbus.org/>`_ 
is good solution. 

* written in C
* LGPL license 
* available on many platforms like OpenWrt without any cross compiling
* if it is needed it can be easily compiled
* very popular and well documented

Python modbus library
~~~~~~~~~~~~~~~~~~~~~

`PyModbus <https://pymodbus.readthedocs.io/en/latest/readme.html>`_ 
which require python3 >= 3.8

Install
-------
::

    pip install -U pymodbus
    # or
    pip3 install -U pymodbus

Modbus RTU preparation
----------------------

Prepare virtual serial ports::

    sudo  socat pty,raw,echo=0,link=/dev/ttyS50 pty,raw,echo=0,link=/dev/ttyS51

Until socat command will be running, these ports will be visible. So in next terminal window you should change owner of created serial ports::
    
    sudo chown $USER:$USER /dev/ttyS50
    sudo chown $USER:$USER /dev/ttyS51

Modbus RTU
----------

.. code-block:: python

    #!/usr/bin/python3

    import logging
    from pymodbus.version import version
    from pymodbus.server.sync import StartSerialServer
    from pymodbus.device import ModbusDeviceIdentification
    from pymodbus.datastore import ModbusSequentialDataBlock

    # from pymodbus.datastore import ModbusSparseDataBlock
    from pymodbus.datastore import ModbusSlaveContext, ModbusServerContext

    from pymodbus.transaction import ModbusRtuFramer, ModbusBinaryFramer

    # --------------------------------------------------------------------------- #
    # configure the service logging
    # --------------------------------------------------------------------------- #
    FORMAT = (
        "%(asctime)-15s %(threadName)-15s"
        " %(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s"
    )
    logging.basicConfig(format=FORMAT)
    log = logging.getLogger()
    log.setLevel(logging.ERROR)


    def run_server():

        store = ModbusSlaveContext(
            co=ModbusSequentialDataBlock(0, [0, 1] ),
            di=ModbusSequentialDataBlock(0, [0, 1] ),
            hr=ModbusSequentialDataBlock(0, [ 0xfb2e, # -1234
            0xffff, 0x2bcf, # -54321
            0xffff, 0xffff, 0x7fff, 0xffff, # -2147483649
            0x0000, 0x0000, 0x8000, 0x0001, # 2147483649
            0x2bcf, 0xffff, # -54321
            0xffff, 0x7fff, 0xffff, 0xffff, # -2147483649
            0x0001, 0x8000, 0x0000, 0x0000, # 2147483649
            0xbf9d, 0xf3b6, # -1.234
            0x3f9d, 0xf3b6, # 1.234
            0, 0, # 0 
            0xf3b6, 0xbf9d, # -1.234
            0xf3b6, 0x3f9d, # 1.234
            0, 0, # 0
            0xbff3, 0xbe76, 0xc8b4, 0x3958, # -1.234
            0x3ff3, 0xbe76, 0xc8b4, 0x3958, # 1.234
            0, 0, 0, 0, # 0
            0x3958, 0xc8b4, 0xbe76, 0xbff3, # -1.234
            0x3958, 0xc8b4, 0xbe76, 0x3ff3, # 1.234
            0, 0, 0, 0, # 0
            ] ),
            ir=ModbusSequentialDataBlock(0, [ 0xfb2e, # -1234
            0xffff, 0x2bcf, # -54321
            0xffff, 0xffff, 0x7fff, 0xffff, # -2147483649
            0x0000, 0x0000, 0x8000, 0x0001, # 2147483649
            0x2bcf, 0xffff, # -54321
            0xffff, 0x7fff, 0xffff, 0xffff, # -2147483649
            0x0001, 0x8000, 0x0000, 0x0000, # 2147483649
            0xbf9d, 0xf3b6, # -1.234
            0x3f9d, 0xf3b6, # 1.234
            0, 0, # 0 
            0xf3b6, 0xbf9d, # -1.234
            0xf3b6, 0x3f9d, # 1.234
            0, 0, # 0
            0xbff3, 0xbe76, 0xc8b4, 0x3958, # -1.234
            0x3ff3, 0xbe76, 0xc8b4, 0x3958, # 1.234
            0, 0, 0, 0, # 0
            0x3958, 0xc8b4, 0xbe76, 0xbff3, # -1.234
            0x3958, 0xc8b4, 0xbe76, 0x3ff3, # 1.234
            0, 0, 0, 0, # 0
            ]),
            zero_mode=True
        )

        context = ModbusServerContext(slaves=store, single=True)

        StartSerialServer(context, framer=ModbusRtuFramer,
                        port="/dev/ttyS51", timeout=.005, baudrate=9600)

    if __name__ == "__main__":
        run_server()

Modbus TCP
----------

.. code-block:: python
    
    #!/usr/bin/python3

    import logging

    from pymodbus.version import version

    from pymodbus.server.sync import StartTcpServer
    from pymodbus.device import ModbusDeviceIdentification
    from pymodbus.datastore import ModbusSequentialDataBlock

    # from pymodbus.datastore import ModbusSparseDataBlock
    from pymodbus.datastore import ModbusSlaveContext, ModbusServerContext

    FORMAT = (
        "%(asctime)-15s %(threadName)-15s"
        " %(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s"
    )
    logging.basicConfig(format=FORMAT)
    log = logging.getLogger()
    log.setLevel(logging.ERROR)


    def run_server():

        store = ModbusSlaveContext(
            co=ModbusSequentialDataBlock(0, [0, 1] ),
            di=ModbusSequentialDataBlock(0, [0, 1] ),
            hr=ModbusSequentialDataBlock(0, [ 0xfb2e, # -1234
            0xffff, 0x2bcf, # -54321
            0xffff, 0xffff, 0x7fff, 0xffff, # -2147483649
            0x0000, 0x0000, 0x8000, 0x0001, # 2147483649
            0x2bcf, 0xffff, # -54321
            0xffff, 0x7fff, 0xffff, 0xffff, # -2147483649
            0x0001, 0x8000, 0x0000, 0x0000, # 2147483649
            0xbf9d, 0xf3b6, # -1.234
            0x3f9d, 0xf3b6, # 1.234
            0, 0, # 0 
            0xf3b6, 0xbf9d, # -1.234
            0xf3b6, 0x3f9d, # 1.234
            0, 0, # 0
            0xbff3, 0xbe76, 0xc8b4, 0x3958, # -1.234
            0x3ff3, 0xbe76, 0xc8b4, 0x3958, # 1.234
            0, 0, 0, 0, # 0
            0x3958, 0xc8b4, 0xbe76, 0xbff3, # -1.234
            0x3958, 0xc8b4, 0xbe76, 0x3ff3, # 1.234
            0, 0, 0, 0, # 0
            ] ),
            ir=ModbusSequentialDataBlock(0, [ 0xfb2e, # -1234
            0xffff, 0x2bcf, # -54321
            0xffff, 0xffff, 0x7fff, 0xffff, # -2147483649
            0x0000, 0x0000, 0x8000, 0x0001, # 2147483649
            0x2bcf, 0xffff, # -54321
            0xffff, 0x7fff, 0xffff, 0xffff, # -2147483649
            0x0001, 0x8000, 0x0000, 0x0000, # 2147483649
            0xbf9d, 0xf3b6, # -1.234
            0x3f9d, 0xf3b6, # 1.234
            0, 0, # 0 
            0xf3b6, 0xbf9d, # -1.234
            0xf3b6, 0x3f9d, # 1.234
            0, 0, # 0
            0xbff3, 0xbe76, 0xc8b4, 0x3958, # -1.234
            0x3ff3, 0xbe76, 0xc8b4, 0x3958, # 1.234
            0, 0, 0, 0, # 0
            0x3958, 0xc8b4, 0xbe76, 0xbff3, # -1.234
            0x3958, 0xc8b4, 0xbe76, 0x3ff3, # 1.234
            0, 0, 0, 0, # 0
            ]),
            zero_mode=True
        )

        context = ModbusServerContext(slaves=store, single=True)

        StartTcpServer(context,  address=("127.0.0.1", 1502))


    if __name__ == "__main__":
        run_server()