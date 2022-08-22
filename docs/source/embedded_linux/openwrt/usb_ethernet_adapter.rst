USB Ethernet adapter
====================

If you want to add usb ethernet adapter/ usb internet card just go throw these steps:

1. Update remote repositories::

    opkg update

2. Connect device to usb port and check which driver should be installed::

    lsusb
    # Output:
    # Bus 001 Device 005: ID 0b95:772a ASIX Elec. Corp. AX88x72A
    # More details:
    lsusb -s 1:5 -v

3. List all available drivers::

    opkg list | grep kmod-usb-net

4. Install selected drivers::

    opkg install kmod-usb-net-asix 
    # In this case it was enough, if it is not try install exactly module:
    # opkg install kmod-usb-net-asix-ax88179 

5. Check ifname for interface in dmesg after installing kernel module::

    dmesg
    # There should be something like "eth2" etc. 

6. Configure network interface in ``/etc/config/network`` e.g.::

    config interface 'plc'
        option ifname 'eth2'
        option proto 'static'
        option netmask '255.255.255.0'
        option ipaddr '192.168.66.1'