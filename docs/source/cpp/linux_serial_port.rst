Linux serial port configuration
===============================

Great article about this topic is here: `mbedded.ninja <https://blog.mbedded.ninja/programming/operating-systems/linux/linux-serial-ports-using-c-cpp/>`_ BTW this blog is awesome

`Here <https://tldp.org/HOWTO/Serial-Programming-HOWTO/>`_ is fine how to serial programming on linux

Checking tty* serial port details
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    stty -F /dev/ttyUSB0

Setting tty* communication parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
This will set the baud rate to 9600, 8 bits, 1 stop bit, no parity::

    stty -F /dev/ttyS0 9600 cs8 -cstopb -parenb


Creating virtual port on Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create 2 virtual ports::

    # Used in most cases!! (bidirectional)
    sudo  socat pty,raw,echo=0,link=/dev/ttyS50 pty,raw,echo=0,link=/dev/ttyS51

    # Unidirectional
    # -u     unidirectional mode (left to right)
    # -U     unidirectional mode (right to left)
    sudo  socat -u -u pty,raw,echo=0,link=/dev/ttyS50 pty,raw,echo=0,link=/dev/ttyS51 

Let's imagine that instead of ``/dev/ttyUSB0`` on which you read/write data from device you can set Application to read from ``/dev/ttyS50``.
You can simulate device on port ``/dev/ttyS51`` using python pyserial.

Change owner of created ports::

    sudo chown $USER:$USER /dev/ttyS50 # Write port
    sudo chown $USER:$USER /dev/ttyS51 # 
    

You can test it with echo::

    # First terminal
    echo "1123423" > /dev/ttyS50

    #Second terminal
    cat /dev/ttyS51

Here is write python code example for such case

.. code-block:: python

    #!/usr/bin/python3

    import serial, time

    ser = serial.Serial(port='/dev/ttyS50',\
                        baudrate=9600,\
                        parity=serial.PARITY_NONE,\
                        stopbits=serial.STOPBITS_ONE,\
                        bytesize=serial.EIGHTBITS )

    request = "02 02 03 20 00 01 b8 77"
    request_array = bytearray.fromhex(request)
    print(request_array)


    while 1:
        print("Writing...")
        ser.write(request_array)
        time.sleep(1)

Here is read python code example for such case

.. code-block:: python

    #!/usr/bin/python3

    from urllib import response
    import serial, time

    ser = serial.Serial(port='/dev/ttyS51',\
                        baudrate=9600,\
                        parity=serial.PARITY_NONE,\
                        stopbits=serial.STOPBITS_ONE,\
                        bytesize=serial.EIGHTBITS )

    while 1:
        print(set.read())


Linux serial port Overview
~~~~~~~~~~~~~~~~~~~~~~~~~~

This post will be something like summary of linked article. The main reason why I wrote this is to help me momorize it better and quickly get back to what was important. Only practical useage is described here for more just read linked article 

Preparation
~~~~~~~~~~~

To use termios in your C/C++ code you have to include following libraries

.. code-block:: c++

    // C library headers
    #include <stdio.h>
    #include <string.h>

    // Linux headers
    #include <fcntl.h> // Contains file controls like O_RDWR
    #include <errno.h> // Error integer and strerror() function
    #include <termios.h> // Contains POSIX terminal control definitions
    #include <unistd.h> // write(), read(), close()

**Hints:**

- If you have open ports and while running app disconnect usb port it will increment it like this: /dev/ttyUBS0 -> /dev/ttyUSB1
- Errno: "Permission denied". You should run app as sudo or add currect user to dialout group ``sudo adduser $USER dialout`` Log in and log is required



Open ports
~~~~~~~~~~

.. code-block:: c++

    int serial_port = open("/dev/ttyUSB0", O_RDWR);
    // or read only with non blocking mode int serial_port = open("/dev/ttyUSB0", O_RDONLY | O_NONBLOCK);

    // Check for errors
    if (serial_port < 0) {
        printf("Error %i from open: %s\n", errno, strerror(errno));
    }


Serial port configuration
~~~~~~~~~~~~~~~~~~~~~~~~~

**Important!** Instead of get functions, all other functions return 0 on success and -1 on failure and set errno to indicate the error

**Get USB configuration**

.. code-block:: c++

    struct termios tty;
    if(tcgetattr(serial_port, &tty) != 0) {
        printf("Error %i from tcgetattr: %s\n", errno, strerror(errno));
    }


**Baudrate**

.. code-block:: c++

    cfsetispeed(&tty, B9600);

**Parity**

.. code-block:: c++

    // none parity
    tty.c_cflag &= ~PARENB;

    // even parity
    tty.c_cflag |= PARENB;
    tty.c_cflag &= ~PARODD;
    
    // odd parity
    tty.c_cflag |= PARENB;
    tty.c_cflag |= PARODD;

**Number of bits per byte**

.. code-block:: c++

    tty.c_cflag &= ~CSIZE; // Clear all the size bits, then use one of the statements below
    tty.c_cflag |= CS5; // 5 bits per byte
    tty.c_cflag |= CS6; // 6 bits per byte
    tty.c_cflag |= CS7; // 7 bits per byte
    tty.c_cflag |= CS8; // 8 bits per byte (most common)

**Stop bits**

.. code-block:: c++

    tty.c_cflag &= ~CSTOPB; // Clear stop field, only one stop bit used in communication (most common)
    tty.c_cflag |= CSTOPB;  // Set stop field, two stop bits used in communication

**Save termios**

.. code-block:: c++

    if (tcsetattr(serial_port, TCSANOW, &tty) != 0) {
        printf("Error %i from tcsetattr: %s\n", errno, strerror(errno));
    }

Reading
~~~~~~~

Reading is done through the read() function

.. code-block:: c++

    // Allocate memory for read buffer, set size according to your needs
    char read_buf [256];

    // Read bytes. The behaviour of read() (e.g. does it block?,
    // how long does it block for?) depends on the configuration
    // settings above, specifically VMIN and VTIME
    int n = read(serial_port, &read_buf, sizeof(read_buf));



Closing port
~~~~~~~~~~~~

.. code-block:: c++

    close(serial_port);
