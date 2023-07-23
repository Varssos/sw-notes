sshfs
=====

`Setup sshfs - digital ocean <https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh>`_ 


Sshfs how to setup
~~~~~~~~~~~~~~~~~~

Install sshfs
-------------
::

    sudo apt update
    sudo apt install sshfs

Mounting the Remote Filesystem
------------------------------
::

    sudo mkdir /mnt/{folder_name}
    sudo sshfs -o allow_other,IdentityFile=/home/sw/.ssh/{PRIVATE_SSH_KEY} {REMOTE_USER}@{REMOTE_IP}:/home/{USER_NAME}/ /mnt/{folder_name}/'


Aliases to mount sshfs
----------------------
::

    alias mountNetworkDisk='sudo sshfs -o allow_other,IdentityFile=/home/sw/.ssh/{PRIVATE_SSH_KEY} {REMOTE_USER}@{REMOTE_IP}:/home/{USER_NAME}/ /mnt/{folder_name}/''
    alias umountNetworkDisk='sudo umount /mnt/{folder_name}'


