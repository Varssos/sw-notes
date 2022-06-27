Quick OpenWRT SDK start
=======================

More detailed tutorial is `here <https://openwrt.org/docs/guide-developer/helloworld/chapter1>`_ 

Download sdk
~~~~~~~~~~~~
::

    git clone https://git.openwrt.org/openwrt/openwrt.git source
    git checkout v21.02.3 # checkout to last release

Update and install feeds
~~~~~~~~~~~~~~~~~~~~~~~~
::

    ./scripts/feeds update -a
    ./scripts/feeds install -a

Run graphical configuration menu
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    make menuconfig

Run make to build your firmware
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    make