Problems with system on Linux
=============================


Unable to run display screen manager on start on Linux Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1. Reconfigure lightdm::

    sudo dpkg-reconfigure lightdm

2. Install all necessary packages for cinnammon with lightdm ::
 
    sudo apt install lightdm-settings slick-greeter

3.  You can verify configs here: ``/etc/lightdm/...`` 
4.  If cinnamon is not installed, install like `here <https://tecadmin.net/install-cinnamon-on-ubuntu/>`_ 
5.  On start you should check if cinnamon is selected if ubuntu UI is presented like in link above


Wired interfaces not visible
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Solution::

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install netplan.io
    sudo netplan generate
    sudo netplan apply
    reboot


There was problem that in network manager there wasn't any wired connections. After ifconfig ``enp2s0f0`` up there was still problem.

I tried:

1. Update kernel version
2. Update driver for r8169 ethernet module


Sudo apt update public key not available
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Error::

    Err:16 http://ppa.launchpad.net/ansible/ansible/ubuntu focal InRelease                                       
    The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 93C4A3FD7BB9C367
    Err:20 http://lenovo.archive.canonical.com focal InRelease
    The following signatures couldn't be verified because the public key is not available: NO_PUBKEY D4D1EAED36962F69 NO_PUBKEY F9FDA6BED73CDC22

Solution::

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 93C4A3FD7BB9C367
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D4D1EAED36962F69
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys F9FDA6BED73CDC22
    sudo apt update 
    #and then there should be no problem


Black monitor on display connected to hdmi
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reason:
1. hdmi output is connected only to nvidia GPU on some laptops


Solution:
1. You have to install nvidia drivers
2. Switch to ``Nvidia (Performance Mode)``
3. You can update kernel
4. In some cases turning off ``secure boot`` in bios can help