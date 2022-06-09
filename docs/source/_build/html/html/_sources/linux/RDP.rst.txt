RDP
===

Remote Desktop Protocol is a priprietary protocol developed by Microsoft which provides a user with a graphical interface to connect
to another computer over a network connection. It works on Windows, Linux ( for example Remmina ), Unix macOS, iOS, Android. By default the server listens on TCP port 3389 and UDP port 3389

`Wiki <https://en.wikipedia.org/wiki/Remote_Desktop_Protocol>`_ 


RDP server on Linux
~~~~~~~~~~~~~~~~~~~

`Set RDP tutorial <https://linuxconfig.org/ubuntu-20-04-remote-desktop-access-from-windows-10>`_ 

Steps to set Remote Dektop on Ubuntu 20.04::

    # Install xrdp
    sudo apt install xrdp
    # Enable xrdp after reboot and imediately
    sudo systemctl enable --now xrdp
    # Open a firewall port
    sudo ufw allow from ant to any port 3389 proto tcp

After that you should be able to connect with this device via RDP

RDP client on Linux
~~~~~~~~~~~~~~~~~~~

To connect to RDP server you can use remmina program

1. Click ``+`` sign on the left top, which is ``New connection profile``
2. Fill all required data like it is on the picture:

.. image:: ./Remmina_profile.png
