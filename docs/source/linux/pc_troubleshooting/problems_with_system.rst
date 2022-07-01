Problems with system on Linux
=============================


Unable to run display screen manager on start on Linux Mint
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


1. Check current 
::

    sudo dpkg-reconfigure lightdm

2.  Install all necessary packages for cinnammon with lightdm 
::
 
    sudo apt install lightdm-settings slick-greeter

3.  You can verify ``/etc/lightdm/...``  like here.. 
4.  On start you should check if cinnamon is selected if ubuntu UI is presented like here