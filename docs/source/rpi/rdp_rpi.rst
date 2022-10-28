RDP on RPI Bullseye
===================

Black screen after setting up rdp?

You cannot login twice with the same account using xrdp on Raspberry PI OS Bullseye(Debian 11). So you have to disable autologin  or create another user. and remove from ``video`` and ``render`` groups

Just type::

    sudo gpasswd -d pi video
    sudo gpasswd -d pi render

And Disable auto login::

    sudo raspi-conofig

Then select ``System options`` -> ``Boot / Auto Login`` -> ``Desktop GUI, requiring user to login``