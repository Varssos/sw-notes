NTP
===

`NTP OpenWrt <https://openwrt.org/docs/guide-user/services/ntp/client-server>`_ 

`NTP OpenWrt configuration <https://openwrt.org/docs/guide-user/advanced/ntp_configuration>`_ 

NTP stands for Network Time Protocol. By default, works on UDP 123 port. Provides time synchronization based on a network of reference clocks located around the world.


NTP client configuration
~~~~~~~~~~~~~~~~~~~~~~~~
::

    cat /etc/config/system
    #or
    uci show system

Default configuration::

    config timeserver 'ntp'
	option enabled '1'
	option enable_server '0'
	list server 'XYZ.com'

Set NTP server addresses
~~~~~~~~~~~~~~~~~~~~~~~~
::

    uci -q delete system.ntp.server
    uci add_list system.ntp.server="0.fr.pool.ntp.org"
    uci add_list system.ntp.server="1.fr.pool.ntp.org"
    uci add_list system.ntp.server="2.fr.pool.ntp.org"
    uci add_list system.ntp.server="3.fr.pool.ntp.org"
    uci commit system
    /etc/init.d/sysntpd restart

Sometimes if you have problem with DNS and can't resolve address to IP address you should consider put here IP addresses