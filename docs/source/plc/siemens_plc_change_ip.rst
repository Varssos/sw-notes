Changing  Siemens PLC address
=============================

At start there is Siemens PLC with IP: ``192.168.0.30`` directly connected to PC with address ``192.168.0.100``. There is no problem with establishing connection to PLC.

There are presented steps how to change IP of PLC:

1. Set a static IP of PC in the same subnet as it was on start (you can add new profile)

.. image:: ./static_ip_config_linux.png
   
2. Establish connection with PLC from ethernet adapter with wired connection

.. image:: ./wired_adapter.png


3. Set all network config as it is on image below, change IP to desired one( in this case 192.168.50.100) and download to device

.. image:: ./plc_network_config.png

4. After uploading etc you should get desired IP address
5. You can go back to previous network profile on your PC 
6. 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