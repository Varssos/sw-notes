Usb linux
=========

How to restart any tty serial in linux cli
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Look for ``usb 1-7.2.3: FTDI USB Serial Device converter
now attached to ttyUSB1`` in ``sudo dmesg``

Where: 
    - ``1-7.2.3`` is physical usb address. Bus: 01 and Ports: 7.2.3. You can compare with: ``lsusb -tv``.  It should remain constant if you don't physically switch the USB port.
    - ``ttyUSB1`` usb port to which you want to connect  e.g. ``picocom -b 115200 /dev/ttyUSB1``

2. Disconnect usb port (Just insert the physical address
into the command below)
::

    echo "1-7.2.3" | sudo tee /sys/bus/usb/drivers/usb/unbind

1. Connect usb port
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

