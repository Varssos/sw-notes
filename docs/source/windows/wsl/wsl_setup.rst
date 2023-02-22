WSL setup
=========


Mute wsl terminal
~~~~~~~~~~~~~~~~~

https://onelharrison.medium.com/how-to-mute-the-windows-terminal-bell-fee86af19ddb

Set default wsl startup location
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Open wsl
2.  ``ctrl + ,``
3. Set ``Starting directory``


Setup time synchronization in wsl
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://askubuntu.com/questions/1096930/sudo-apt-update-error-release-file-is-not-yet-valid

::

    sudo apt install ntp 
    sudo service ntp restart 

GUI apps in wsl
~~~~~~~~~~~~~~~
::

    https://learn.microsoft.com/en-us/windows/wsl/tutorials/gui-apps