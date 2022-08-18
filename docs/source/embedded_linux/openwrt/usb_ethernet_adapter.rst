USB Ethernet adapter
====================

If you want to add usb ethernet adapter/ usb internet card just go throw these steps:

1. Update remote repositories::

    opkg update

2. Connect device to usb port and check which driver should be installed::

    lsusb
    # More details for e.g: Bus 001 Device 003: ID 0424:4050 Generic Ultra Fast Media Reader
    lsusb -s 1:3 -v

3. List all available drivers::

    opkg list | grep kmod-usb-net

4. Install selected drivers::

    opkg install kmod-usb-net-asix-ax88179 kmod-usb-net-asix

5. Check ifname for interface in dmesg after installing kernel module::

    dmesg
    # There should be something like "eth2" etc. 

6. Configure network interface in ``/etc/config/network`` e.g.::

    config interface 'plc'
        option ifname 'eth2'
        option proto 'static'
        option netmask '255.255.255.0'
        option ipaddr '192.168.66.1'