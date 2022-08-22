SD card format
==============

If there is lack of some information check this nice `tutorial <https://openwrt.org/docs/guide-user/storage/usb-drives>`_ 

Steps:

1. Before start, refresh the list of available software packages

.. code-block:: bash

   opkg update

2. Install all packages

To handle filesystem::

    opkg install block-mount kmod-fs-ext4 e2fsprogs
    # Optionally:
    opkg install cfdisk
    # Handling usb:
    opkg install kmod-usb-core kmod-usb2 kmod-usb-storage


3. List your connected devices 

.. code-block:: bash

    opkg install usbutils
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

6. Format with EXT4 file system

.. code-block:: bash

    mkfs.ext4 /dev/sda1

7. Mount sd card

.. code-block:: bash

    mkdir /mnt/sdcard
    mount /dev/sda1 /mnt/sdcard

8. Set fstab for automount after reboot

.. code-block:: bash

    uci add fstab mount
    uci set fstab.@mount[-1]='mount'
    uci set fstab.@mount[-1].device='/dev/sda1'
    uci set fstab.@mount[-1].fstype='ext4'
    uci set fstab.@mount[-1].options='rw,noatime'
    uci set fstab.@mount[-1].target='/mnt/sdcard'
    uci set fstab.@mount[-1].enabled_fsck='1'
    uci set fstab.@mount[-1].enabled='1'

    uci commit