Pi-hole
=======

How to install Pi-hole
~~~~~~~~~~~~~~~~~~~~~~
`Pi-hole basic install <https://docs.pi-hole.net/main/basic-install/>`_

::

    curl -sSL https://install.pi-hole.net | bash

How to install unbound
~~~~~~~~~~~~~~~~~~~~~~

`Unbound tutorial <https://docs.pi-hole.net/guides/dns/unbound/>`_


1. Install unbound::

    sudo apt install unbound

2. Edit unboud config ``/etc/unbound/unbound.conf.d/pi-hole.conf`` and fill what is in tutorial
3. Restart unbound service::

    sudo service unbound restart
    dig pi-hole.net @127.0.0.1 -p 5335

4. Go to pihole admin panel -> Settings -> DNS -> untick and create custom DNS with ``127.0.0.1#5335``
5. Maybe you have to ``Permit all origins``