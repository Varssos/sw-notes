GDB on OpenWrt
==============

Remote debugging of OpenWrt packages running on target machine, using gdb on host machine.

Prepare the target OpenWrt
~~~~~~~~~~~~~~~~~~~~~~~~~~

Installation
------------

Target needs to have installed gdbserver.
This can be done via ``opkg update`` & ``opkg install gdbserver`` commands.

( If this method is unavailable to you, it is also possible to compile gdbserver using sdk and install it manually. For that purpose, make sure to go to menuconfig (in SDK) and select Development ---> gdbserver. )

Running server
--------------

Run following command on target OpenWrt::

    gdbserver :<PORT> <executable>

i.e.::

    gdbserver :9000 iotnucleus

Prepare the host
~~~~~~~~~~~~~~~~

Make sure gdb is available on host.

Locate Makefile files for packages you want to debug (i.e. ./package/feeds/{your_destination}).
For each of them, under "Build/Configure" set flag ``-DCMAKE_BUILD_TYPE`` to "Debug" to disable stripping of debugging symbols.

.. note:: 
    The package on target system can be stripped - gdb will grab symbol tables from locally provided files on host machine.


Start debugging
~~~~~~~~~~~~~~~

To connect to target gdbserver execute in sdk root folder ```scripts/remote-gdb``` providing arguments: <ip>:<port> of target and path to unstripped executable from which to obtain symbol tables, i.e. for x86::

    scripts/remote-gdb 192.168.1.42:9000 build_dir/target-x86_64_musl/iotnucleus-core-0.1.0/install/bin/iotnucleus

Keep in mind executables contained within .ipk packages are always stripped regardless of build configuration.

Stop debug
~~~~~~~~~~

To stop ``gdbserver`` on target invoke on hosts ``remote-gdb`` session command::

    monitor exit


NOTES
~~~~~

On target often you need to manually setup traffic rules for custom port in ``/etc/config/firewall`` file - e.g.::

    config rule
        option name 'gdbserver'
        option src 'wan'
        option dest_port '9000'
        option target 'ACCEPT'