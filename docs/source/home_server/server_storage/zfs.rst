ZFS
===

`ZFS on Linux. Proxmox <https://pve.proxmox.com/wiki/ZFS_on_Linux>`_ 

In my case I have 2 disks /dev/sdb /dev/sdc. I want to make it as RAID1.


Check disks::

    lsblk
    sudo fdisk -l


Install ZFS
~~~~~~~~~~~
::

    sudo apt install -y zfsutils-linux


Create zfs pool
~~~~~~~~~~~~~~~
::

    sudo mkdir -p /mnt/nas_pool
    sudo zpool create -m /mnt/nas_pool nas_pool mirror /dev/sdb /dev/sdc


Check pool status
~~~~~~~~~~~~~~~~~
::

    sudo zpool status