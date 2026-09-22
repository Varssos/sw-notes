.. warning::
    This page has been migrated to varssos-mkdocs (docs/vpn/vpn_problems.md). This copy is outdated and no longer maintained.

VPN problems
============

When connected to l2tp vpn some services are not available
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I changed internet supplier and I had problems with connecting to some domains.
**Solution:** Change ppp0 interface mtu from 1400 -> 1200

**Temporary**::

    sudo ifconfig ppp0 mtu 1200

**Permanent**

.. warning:: Permanent solution doesnt work for me


::

    sudo nano /etc/dhcp/dhclient.conf

Fill with::

    interface "ppp0" {
    default interface-mtu 1200;
    supersede interface-mtu 1200;
    }

Restart networking service::

    sudo service networking restart

Bring up the interface::

    sudo ifup ppp0

Check result::

    sudo ifconfig | grep mtu

