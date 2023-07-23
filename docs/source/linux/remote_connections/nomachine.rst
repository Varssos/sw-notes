NoMachine
=========

Install NoMachine
~~~~~~~~~~~~~~~~~
::

    cd ~/Downloads
    curl https://download.nomachine.com/download/8.7/Linux/nomachine_8.7.1_1_amd64.deb --output nomachine_8.7.1_1_amd64.deb
    sudo dpkg -i nomachine_8.7.1_1_amd64.deb

Check NoMachine process
~~~~~~~~~~~~~~~~~~~~~~~
::

    systemctl status nxserver

Uninstall NoMachine
~~~~~~~~~~~~~~~~~~~
::

    systemctl stop nxserver
    systemctl disable nxserver
    sudo dpkg -r nomachine
    sudo dpkg --purge nomachine
