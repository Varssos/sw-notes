usb linux
=========

Disconnect usb device on linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

