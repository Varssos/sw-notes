SD card format
==============

If there is lack of some information check this nice `tutorial <https://openwrt.org/docs/guide-user/storage/usb-drives>`_ 

Steps:

1. Before start, refresh the list of available software packages

.. code-block:: bash

   opkg update

2. Install all utils if you want to verify usb drivers

.. code-block:: bash

    opkg install kmod-usb-storage
    opkg install kmod-usb-storage-uas
    opkg install usbutils

3. List your connected devices 

.. code-block:: bash

    lsusb -t

4. Check current file system 

.. code-block:: bash

    df -Th

5. If card exist /dev/sda*/ e.g. /dev/sda1/ try to unmount:

.. code-block:: bash

    umount /dev/sda1

Otherwise check which one is it

.. code-block:: bash

    ls -l /dev/sd*

6. Before format partition, install needed packages

.. code-block:: bash

    opkg install e2fsprogs
    opkg install kmod-fs-ext4

7. Format with EXT4 file system

.. code-block:: bash

    mkfs.ext4 /dev/sda1

8. Mount sd card

.. code-block:: bash

    mount /dev/sda1 /mnt/sdcard