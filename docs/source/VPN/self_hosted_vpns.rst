Self hosted VPNs
================

Checking if you are behind CGNAT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you want to host vpn server on your machine on NAS, terminal, RPI or something.
You should check if you are behind CGNAT

1. Check you public IP here::

    https://icanhazip.com/
    https://whoer.net/

2. Run this::

    traceroute <YOUR_PUBLIC_IP_FROM_LINKS_ABOVE>

3. If you have only one line ip address you have public ip, you there are more than one line, you are behind cgnat.
Check this: https://youtube.com/clip/UgkxZjoywwUU2flc08SP0wPflY58NFgRtVaR?si=d0t86Ca6LQvkvehv
I had something like::

    traceroute to 89.z.y.x (89.z.y.x), 64 hops max
    1   192.168.0.1  2,251ms  1,878ms  2,151ms
    2   84.x.x.x  10,060ms  9,206ms  9,937ms

Which meant that I am not able to port forward and be able to connect from internet to my host machines.
In my case tools like:

- duckdns.org
- wireguard
- probably openvpn

doesnt make sense. I decided to use Tailscale. Which is very easy to setup, based on wireguard.
