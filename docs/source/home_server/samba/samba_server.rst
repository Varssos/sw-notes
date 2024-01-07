Samba server
============

This tutorial is based on `Install and Configure Samba on Ubuntu <https://ubuntu.com/tutorials/install-and-configure-samba#1-overview>`_ 


Install Samba server
~~~~~~~~~~~~~~~~~~~~
::

    sudo apt update
    sudo apt install samba

Edit Samba config file
----------------------
::

    sudo nano /etc/samba/smb.conf

Fill with::

   [md0]
     comment = Samba on Ubuntu
     path = /mnt/md0
     read only = no
     browsable = yes
     public = yes
     writable = yes


Set up Samba password for out user account
------------------------------------------
::

    sudo smbpasswd -a $USER


Restart Samba service and check status
--------------------------------------
::

    sudo service smbd restart
    sudo service smbd status


Remove samba server
~~~~~~~~~~~~~~~~~~~
::

    sudo apt-get autoremove samba samba-common -y
    sudo apt-get purge samba samba-common -y



