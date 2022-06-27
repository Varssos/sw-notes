SSH server
==========

Nice tutorial how to configure ssh server on ubuntu is `here <https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/>`_ 


Install openssh-server
~~~~~~~~~~~~~~~~~~~~~~
::

    # Upgrade if needed
    sudo apt-get update
    sudo apt-get upgrade

    # Then install openssh-server
    sudo apt-get install openssh-server

Enable ssh service
~~~~~~~~~~~~~~~~~~
::

    sudo systemctl enable ssh

Start ssh service
~~~~~~~~~~~~~~~~~
::

    sudo systemctl start ssh

Verify ssh service
~~~~~~~~~~~~~~~~~~
::

    sudo systemctl status ssh

Unblock ports if needed
~~~~~~~~~~~~~~~~~~~~~~~
::

    sudo ufw allow ssh
    sudo ufw enable
    sudo ufw status


