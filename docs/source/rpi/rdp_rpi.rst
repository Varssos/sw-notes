RDP on RPI Bullseye
===================

.. warning:: **Black screen after setting up rdp?** You cannot login twice with the same account using xrdp on Raspberry PI OS Bullseye(Debian 11). So you have to disable autologin  or create another user. and remove from ``video`` and ``render`` groups

How to setup rdp on RPI?
~~~~~~~~~~~~~~~~~~~~~~~~

General description how to setup rdp on linux :ref:`RDP` 

Install xrdp::

    sudo apt update
    sudo apt install xrdp

Enable xrdp after reboot::

    sudo systemctl enable --now xrdp

Install ufw::

    sudo apt install ufw

Open a firewall port::

    sudo ufw allow from any to any port 3389 proto tcp

Remove user from video and render group::

    sudo gpasswd -d $USER video
    sudo gpasswd -d $USER render

And Disable auto login::

    sudo raspi-config

Then select ``System options`` -> ``Boot / Auto Login`` -> ``Desktop GUI, requiring user to login``