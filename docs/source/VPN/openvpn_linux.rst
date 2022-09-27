OpenVPN on Linux
================


Configure OpenVPN with GUI and config file
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Install OpenVPN::

    sudo apt-get install network-manager-openvpn-gnome

2. Open ``Network Settings``
3. Click ``+`` on the bottom to add next network interface
4. Add configuration file ``Import from file...``
5. In my case I only had to change ``Username`` and ``Password``
6. Turn on created interface
7. Finished



OpenVPN install in CLI from sources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Download latest version::

    https://openvpn.net/index.php/download/community-downloads.html

2. Build and install::

    tar -zxf openvpn-<version>.tar.gz
	cd openvpn-<version>
	./configure
	make
	make install

3. Connect to OpenVPN Server::

    openvpn --config <config_file>.ovpn

.. warning:: Using CLI I had problem with certificates specification. Instead of that I used a GUI tool described above

::

    2022-09-27 09:13:16 WARNING: No server certificate verification method has been enabled.  See http://openvpn.net/howto.html#mitm for more info.
    2022-09-27 09:13:18 ERROR: Cannot ioctl TUNSETIFF tun: Operation not permitted (errno=1)