MergerFS and SnapRaid
=====================
.. warning:: MergeGS and SnapRaid are beneficial if you have drives with different capacity. In my case I had with the same and had only 2 disk drives so you cant use like this below. On the last step ``snapraid sync`` it will fail like here

::

    Self test...
    You must have at least 2 'content' files in different disks.


It is base on:
`MergerFs + SnapRAID <https://www.youtube.com/watch?v=tX5MA-c6Qq4>`_ 



In my case I have 2 disks. I want to make it as RAID1 or RAID5

Generate partitions and format disks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
List available disks::

    lsblk

Create partitions. Make it for both disks::

    sudo fdisk /dev/sdb
    g
    n
    Y
    w

Install necessary tool to format::

    sudo apt-get update
    sudo apt-get install -y xfsprogs

Format both disks::

    sudo mkfs.xfs /dev/sdb1

Check if it is visible::

    lsblk
    blkid

Add to fstab ``/etc/fstab``::

    # Data drives
    UUID="000e0f42-6914-4606-849b-ad812cb21977"	/mnt/data1	xfs	defaults	0	2

    # Parity drive
    UUID="e5f1d86c-8624-4bf8-a7b4-9d97f68ce767"	/mnt/parity1	xfs	defaults	0	2

Create directories to mount::

    sudo mkdir -p /mnt/data1
    sudo mkdir -p /mnt/parity1



Setup mergerFS
~~~~~~~~~~~~~~
::

    sudo apt install -y fuse mergerfs

Add to fstab ``/etc/fstab``::

    # MergerFS
    /mnt/data*	/mnt/pool	fuse.mergerfs	defaults,allow_other,use_ino,hard_remove	0	0

Create directory to mount::

    sudo mkdir -p /mnt/pool

Mount all::

    sudo mount -a

Pool should be visible in ``df -h``::

    /mnt/data1      932G  6,6G  925G   1% /mnt/pool


SnapRaid
~~~~~~~~
Install::

    sudo apt install snapraid

Create snapraid config::

    sudo nano /etc/snapraid.conf

And fill with content::

    parity /mnt/parity1/snapraid.parity
    data d1 /mnt/data1/
    content /mnt/data1/.snapraid.content
    exclude /Backup/
    exclude /tmp
    exclude *.bak
    autosave 100

Then run snapraid::

    snapraid sync