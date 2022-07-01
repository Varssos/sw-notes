Getting start with BuildRoot
============================

This short tutorial is based on `this article <https://www.digikey.com/en/maker/projects/intro-to-embedded-linux-part-1-buildroot/a73a56de62444610a2187cd9e681c3f2>`_ 

Install BuildRoot
~~~~~~~~~~~~~~~~~
::
    
    sudo apt update
    sudo apt upgrade
    sudo apt install -y git build-essential libncurses5-dev
    git clone git://git.buildroot.net/buildroot
    cd buildroot

Build Embedded Linux Image
~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Check configuration for your board (or create your own one)::

    ls configs
2. Set up the configuration for your board(e.g. stm32mp157a_dk1_defconfig)::

    make stm32mp157a_dk1_defconfig
3. Adjust kernel and default package options::

    make menuconfig
4. Build the image::

    make
5. Check output binary::

    ls -la output/images

Copy Image to SD Card
~~~~~~~~~~~~~~~~~~~~~

1. Insert SD card
2. List information about all available or the specified block devices::

    lsblk
3. If necessary, Unmount pre existing partitions e.g.::

    sudo umount /media/sgmustadio/boot
    sudo umount /media/sgmustadio/rootfs

4. Copy the .img file to the raw SD card( replace mmcblk2 with your sd card destination )::

    sudo dd if=/output/images/sdcard.img of=/dev/mmcblk2 bs=1M


Boot
~~~~

1. Connect serial to USB cable connected to destination device and type::

    dmesg | tail
2. Find out where USB converter is located e.g. /dev/ttyUSB0
3. Install serial terminal program. E.g. picocom::

    sudo apt install -y picocom

4. Add user to dialout group to avoid problem with permission denied instead of using each time sudo

    sudo usermod -a -G dialout $USER
    
5. Check user groups

    groups $USER adsfas


