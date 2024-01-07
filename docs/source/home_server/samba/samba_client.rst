Samba client
============


How to connect to samba server from UI on Linux Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Click Super
2. Open ``Connect to``
3. Fill
    - Server: just your server ip
    - Type: Windows share
    - Folder: /md0
    - Domain name: WORKGROUP
    - User name: seba_nas
    - Password: <HERE_YOUR_PASSWORD>
4. Connect


How to mount samba disk from CLI on Ubuntu/Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
`How to Mount a SMB Share in Ubuntu <https://support.zadarastorage.com/hc/en-us/articles/213024986-How-to-Mount-a-SMB-Share-in-Ubuntu>`_
::

    sudo apt-get install cifs-utils
    sudo mkdir -p /mnt/seba_nas_shared_disk/
    sudo mount -t cifs //192.168.0.63/md0 /mnt/seba_nas_shared_disk -o username=seba_nas,password=<YOUR_PASSWORD>,domain=WORKGROUP
    sudo nano /etc/fstab

Fill with::

    //192.168.0.63/md0 /mnt/seba_nas_shared_disk cifs username=seba_nas,password=<password>,domain=WORKGROUP 0 0


How to umount samba disk from CLI on Ubuntu/Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    sudo umount /mnt/seba_nas_shared_disk
