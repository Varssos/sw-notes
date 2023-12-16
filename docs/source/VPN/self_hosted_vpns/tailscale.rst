Tailscale
=========

I based on that tutorial to setup my vpn:
`Overcome CGNAT (Carrier-grade NAT) with Tailscale <https://www.youtube.com/watch?v=Sb6eVdF-neA>`_


How to install tailscale
~~~~~~~~~~~~~~~~~~~~~~~~
::

    curl -fsSL https://tailscale.com/install.sh | sh
    sudo tailscale up --advertise-exit-node --advertise-routes=<YOUR_LOCAL_BROADCAST_IP>/24
    # e.g.
    sudo tailscale up --advertise-exit-node --advertise-routes=192.168.0.0/24

Then you should see link like here::

    To authenticate, visit:

        https://login.tailscale.com/a/xxxxxxxx

    Success.

Open this link and login with common account e.g. google account


If you set this on both machine you should see in ``Machines`` tab your device ip addresses and you should be able to ping in both directions::

    ping 100.x.y.z

How to turn on and turn off tailscale vpn
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    sudo tailscale up
    sudo tailscale down


Tailscale on Android
~~~~~~~~~~~~~~~~~~~~

You can download tailscale app from google play and login to your common account.
