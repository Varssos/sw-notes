Pyserial
========

Install pyserial
~~~~~~~~~~~~~~~~

::

    python -m pip install pyserial


Modbus RTU simulator which read/write data on serial port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

    #!/usr/bin/python3

    import serial, time

    ser = serial.Serial(port='/dev/ttyS51',\
                        baudrate=9600,\
                        parity=serial.PARITY_NONE,\
                        stopbits=serial.STOPBITS_ONE,\
                        bytesize=serial.EIGHTBITS )

    response_running_1 = "02 02 01 01 60 0c"
    response_running_0 = "02 02 01 00 a1 cc"
    response_running_1_invalid_crc = "02 02 01 01 60 0d"
    response_running_0_invalid_crc = "02 02 01 00 a1 cd"

    def get_byte_array_from_string_frame( frame ):
        byte_array = bytearray.fromhex(frame)
        return byte_array


    print( get_byte_array_from_string_frame( response_running_0))


    while 1:
        red = ser.read()
        x = int.from_bytes(red, "big")
        # Expected request frame: [02][02][03][20][00][01][B8][77] 
        # wait if 0x20 (dec(32)) occur
        if x==32:
            print("Read")
            ser.write(get_byte_array_from_string_frame(response_running_0_invalid_crc))
            print("Writing")
