MQTT details
============

`MQTT wikipedia <https://en.wikipedia.org/wiki/MQTT>`_ 

`MQTT essentials HiveMQ <https://www.hivemq.com/mqtt-essentials>`_ 

`MQTT in details on YT <https://www.youtube.com/watch?v=TSwgZn2FKUw&list=PLS1QulWo1RIbQWue3zzwEuV2pSASiDxvv&index=1>`_ 


MQTT stands for Message Queuing Telemetry Transport. It is a lightweight, publish-sibscribe, machine to machine network protocol for message queue/message queuing service.

- Perfect fir for constained devices with limited resources
- Minimal packet overhead
- Very lightweight and binary protocol
- Very easy to use
- It must run over a transport protocol that provides ordered, lossless bi-directional connections- typically **TCP/IP**


Overview
~~~~~~~~

- **MQTT broker** is a server that receives all messages from the clients and then routes the messages to the appropriate destination clients.
- **MQTT client** is any device (from a micro controler up to a fully-fledged server) that runs an MQTT library( e.g. libmosquito ) and connects to an MQTT broker over network
- **Topics** - when a publisher has a new item of data to distribute, it sends a control message with the data to the connected broker. The broker then distributes the information to any client that have subscribed to that topic. The publisher does not need to have any data on the number or locations of subscribers and subscribers, in turn, do not have to be configured with any data about the publishers.
- **QoS** - Quality of Service parameter which means:
   - **At most once** - the message is sent only once and the client and broker take no additional steps to acknowledge delivery ( fire and forget )
   - **At least once** - the message is re-tried by the sender multiple times until ackonwledgement is received ( acknowledged delivery )
   - **Exactly once** - the sender and receiver engage in a two-level handshake to ensure only one copy of the message is received ( assured delivery )
- 




MQTT advantages
~~~~~~~~~~~~~~~

- Eliminates vulnerable and insecure client connections, if configured to
- Can easily scale from a single device to thousands
- Manages and tracks all client connection states, including security credentials and certificates, if configured to
- Reduced network strain without compromising the security, if configured to ( cellular or satelite network )


Message types
~~~~~~~~~~~~~

Connect
-------

Waits for a connection to be established with the server and creates a link between the nodes

Disconnect
----------

Waits for the MQTT client to finish any work it must do, and for the TCP/IP session to disconnect

Publish
-------

Returns immediately to the application thread after passing the request to the MQTT client

MQTT 5.0 version
~~~~~~~~~~~~~~~~

Introduced in 2019. Include following major new features:

- Return codes which provide a reason for a failure
- Shared subscriptions: reduces the risk of load problems
- Message expiry
- Topic alias: The name of a topic can be replaced with a single number

