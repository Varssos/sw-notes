Network configuration
=====================

General
~~~~~~~

Network configuration on OpenWRT can be changed in GUI with LUCI, by uci commands or changing raw config files in /etc/config/network and /etc/config/wireless

Default configuration to work as a dhcp client
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/config/network/
--------------------

::

    config interface 'loopback'
        option device 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

    config globals 'globals'
        option ula_prefix 'fdf4:38e8:c283::/48'

    config device
        option name 'br-lan'
        option type 'bridge'
        list ports 'eth1'

    config interface 'lan'
        option device 'br-lan'
        option proto 'static'
        option netmask '255.255.255.0'
        option ip6assign '60'
        option ipaddr '192.168.22.1'
        option auto '0'

    config interface 'wan'
        option device 'eth0'
        option proto 'dhcp'
        option metric '5'

    config interface 'wan6'
        option device 'eth0'
        option proto 'dhcpv6'

    config interface '3g'
        option proto '3g'
        option metric '15'
        option device '/dev/ttyUSB1'
        option service 'gprs'
        option apn 'internet'
        option auto '0'

    config interface 'wwan'
        option proto 'dhcp'
        option metric '10'

/etc/config/wireless/
---------------------

::

    config wifi-device 'radio0'
        option type 'mac80211'
        option path 'platform/ahb/18100000.wmac'
        option band '2g'
        option htmode 'HT20'
        option disabled '1'
        option channel 'auto'

    config wifi-iface 'client'
        option device 'radio0'
        option network 'wwan'
        option mode 'sta'
        option encryption 'psk2'
        option ssid 'ssid'
        option key 'passwd'
        option disabled '1'

    config wifi-iface 'ap'
        option device 'radio0'
        option network 'lan'
        option mode 'ap'
        option encryption 'psk2'
        option ssid 'XXXXX'
        option key 'YYYYYY'
        option disabled '1'

Static address configuration on eth0  
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**/etc/config/network**::

    config interface 'wan'
        option device 'eth0'
        option proto 'static'
        option netmask '255.255.255.0'
        option ipaddr '192.168.2.194'
        option gateway '192.168.2.1'
        option metric '5'

**UCI commands**::

    uci set network.wan.proto='static'
    uci set network.wan.netmask='255.255.255.0'
    uci set network.wan.ipaddr='192.168.2.194'
    uci set network.wan.gateway='192.168.2.1'
    uci set network.wan.metric='5'
    uci commit
    /etc/init.d/network restart

Configuration to connect WAN via wifi and set a dhcp server and LAN on ethernet port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/config/network
-------------------

::

    config interface 'loopback'
        option device 'lo'
        option proto 'static'
        option ipaddr '127.0.0.1'
        option netmask '255.0.0.0'

    config globals 'globals'
        option ula_prefix 'fdb8:4ae9:c3e8::/48'

    config device
            option name 'br-lan'
            option type 'bridge'
            list ports 'eth0'

    config interface 'lan'
        option device 'br-lan'
        option proto 'static'
        option netmask '255.255.255.0'
        option ip6assign '60'
        option ipaddr '192.168.22.1'
        option auto '1'

    config interface 'wan'
        option device 'eth1'
        option proto 'dhcp'
        option metric '5'

    config interface 'wan6'
        option device 'eth1'
        option proto 'dhcpv6'

    config interface '3g'
        option proto '3g'
        option metric '15'
        option device '/dev/ttyUSB1'
        option service 'gprs'
        option apn 'internet'
        option auto '0'

    config interface 'wwan'
        option proto 'dhcp'
        option metric '10'

/etc/config/wireless/.
----------------------

::

    config wifi-device 'radio0'
        option type 'mac80211'
        option path 'platform/ahb/18100000.wmac'
        option band '2g'
        option htmode 'HT20'
        option disabled '0'
        option channel 'auto'

    config wifi-iface 'client'
        option device 'radio0'
        option network 'wwan'
        option mode 'sta'
        option encryption 'psk2'
        option ssid 'XXXX'
        option key 'YYYYY'

    config wifi-iface 'ap'
        option device 'radio0'
        option network 'lan'
        option mode 'ap'
        option encryption 'psk2'
        option ssid 'iot-gateway'
        option key 'GoodPasswd!'
        option disabled '1'


Setting AP on OpenWRT
~~~~~~~~~~~~~~~~~~~~~

1. change config /etc/config/wireless like it is above
2. Use uci command 
3. Set it in LUCI GUI interface


UCI to set network device on ethernet port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    uci add_list firewall.cfg03dc81.network='wwan'
    uci set network.lan.auto='1'
    uci set network.@device[0].ports='eth0'
    uci set network.wan.device='eth1'
    uci set netowrk.wan6.device='eth1'

