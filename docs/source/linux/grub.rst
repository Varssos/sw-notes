GRUB
====

GNU GRUB ( grand unified bootloader )

Choose linux kernel version
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Edit GRUB setup file::

    sudo nano /etc/default/grub
2. Set::

    GRUB_SAVEDDEFAULT=true
    GRUB_DEFAULT=saved  ## or: GRUB_DEFAULT="1>2" # where 2 is index on grub menu (starting from 0)
    GRUB_TIMEOUT_STYLE=menu
    GRUB_TIMEOUT=10
3. Update GRUB information for apply changes::

    sudo update-grub

4. reboot
5. Choose ``Advanced options for Ubuntu`` -> latest kernel version/desired version
6. Check current kernel version::

    uname -r