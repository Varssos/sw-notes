Problems with system on Linux
=============================


Unable to run display screen manager on start on Linux Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1. Reconfigure lightdm
::

    sudo dpkg-reconfigure lightdm

2. Install all necessary packages for cinnammon with lightdm 
::
 
    sudo apt install lightdm-settings slick-greeter

1.  You can verify configs here: ``/etc/lightdm/...`` 
2.  If cinnamon is not installed, install like `here <https://tecadmin.net/install-cinnamon-on-ubuntu/>`_ 
3.  On start you should check if cinnamon is selected if ubuntu UI is presented like in link above