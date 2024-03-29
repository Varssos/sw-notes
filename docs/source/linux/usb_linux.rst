Usb linux
=========

How to restart any tty serial in linux cli
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Look for physical usb address e.g. ``usb 1-7.2.3`` in ``sudo dmesg`` in ``usb 1-7.2.3: FTDI USB Serial Device converter
now attached to ttyUSB1``

Where: 
    - ``1-7.2.3`` is physical usb address. Bus: 01 and Ports: 7.2.3. You can compare with: ``lsusb -tv``.  It should remain constant if you don't physically switch the USB port.
    - ``ttyUSB1`` usb port to which you want to connect  e.g. ``picocom -b 115200 /dev/ttyUSB1``

Or use this command::

    udevadm info --query=path --name=/dev/ttyUSB1 | awk -F'/' '{print $(NF-4)}'

You can add alias::

    alias getphysicalttyusbaddress='getphysicalttyUSBaddress_fun() { udevadm info --query=path --name=/dev/ttyUSB"$1" | awk -F/ "{print \$(NF-4)}"; }; getphysicalttyUSBaddress_fun'

Usage::

    getphysicalttyusbaddress 1

2. Disconnect usb port (Just insert the physical address
into the command below)
::

    echo "1-7.2.3" | sudo tee /sys/bus/usb/drivers/usb/unbind

3. Connect usb port
::

    echo "1-7.2.3" | sudo tee /sys/bus/usb/drivers/usb/bind

4. You can add aliases to ``~/.bashrc``
::

    alias disconnectusb='echo "1-7.2.3" | sudo tee /sys/bus/usb/drivers/usb/unbind'
    alias connectusb='echo "1-7.2.3" | sudo tee /sys/bus/usb/drivers/usb/bind'

[[deprecated]] Disconnect usb device on linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. List connected usb devices
::

    lsusb -tv

Output::

   /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
        ID 1d6b:0003 Linux Foundation 3.0 root hub
    /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
        ID 1d6b:0002 Linux Foundation 2.0 root hub
        |__ Port 2: Dev 6, If 0, Class=Vendor Specific Class, Driver=ftdi_sio, 12M
            ID 0403:6001 Future Technology Devices International, Ltd FT232 Serial (UART) IC

2. Go to directory ``/sys/bus/usb/drivers/usb``
::

    Bus 01 means here usb1
    Bus 02 means here usb2
    ...

3. Check symbolic links for ``usb1 ...`` and ``1-2 ...``
::

    tree -L 1

4. Identify device e.g. ``Ltd FT232 Serial (UART) IC``

For this device it is:

- Bus 03 -> ``/sys/bus/usb/drivers/usb/usb3``
- Bus 03.Port 1: Port 2 -> ``/sys/bus/usb/drivers/usb/1-2``


5. Disconnect usb device
::

    echo "1-2" | sudo tee /sys/bus/usb/drivers/usb/unbind

6. Check if disconnected
::

    ls /dev/ttyUSB*

7. If you want to connect again type
::

    echo "1-2" | sudo tee /sys/bus/usb/drivers/usb/bind


Gather information about usb device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Get complete path to usb device
-------------------------------
::

    udevadm info --query=path --name=/dev/ttyUSB1 2>/dev/null
    # Output:
    /devices/pci0000:00/0000:00:02.1/0000:06:00.0/0000:07:0c.0/0000:0d:00.0/usb1/1-7/1-7.2/1-7.2.3/1-7.2.3:1.0/ttyUSB1/tty/ttyUSB1

Lets assume that variable ``path`` has output of above command

Get usb device properties
-------------------------
::

    udevadm info --query=property --name=/dev/ttyUSB1
    # Or
    udevadm info --query=property --path="$path"
    # Output:
    ...
    ID_VENDOR_ID=0403
    ID_MODEL_ID=6001
    ...

Get ttyUSB* physical usb port
-----------------------------
::

    udevadm info --query=path --name=/dev/ttyUSB1 | awk -F'/' '{print $(NF-4)}'
    # Output:
    1-7.2.3

Create const symbolic link to usb device
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Get Vendor ID(ID_VENDOR_ID), Product ID(ID_MODEL_ID) and usb physical address
::

    udevadm info --query=path --name=/dev/ttyUSB1
    udevadm info --query=path --name=/dev/ttyUSB1 | awk -F'/' '{print $(NF-4)}'

2. Create file ``/etc/udev/rules.d/99-usb-serial.rules``
::

    SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", KERNELS=="1-7.2.3", SYMLINK+="qnx_serial"

3. Reload udevadm rules
::

    sudo udevadm control --reload-rules

4. After connecting this device, not only ``/dev/ttyUSB1`` should be visible but also ``/dev/qnx_serial`` as symbolic link
