Connect to L2TP VPN
===================

1. Install: ``nm-connection-editor``
2. Run: ``nm-connection-editor``
3. Click ``+`` on the bottom
4. Select ``Layer 2 Tunneling Protocol (L2TP)``
5. In ``VPN`` section set: ``Gateway``, ``User name``, ``Password``. Tick ``v`` ``Use L2TP ephemeral source port``
6. Click ``IPsec Settings``
7. Tick ``v`` ``Enable IPsec tunnel to L2TP host`` and pass ``Pre-shared key``
8. Apply, save and you should be able to connect to that vpn
