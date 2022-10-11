ZeroMQ
======

.. warning:: Pay attention on disconnect. Try socket disconnect and avoid context close when you want to reconnect again


The most important cppzmq content:
    - zmq::context_t
    - zmq::socket_t
    - zmq::message_t

Messages
~~~~~~~~

You can declare message passing ``std::string``::

    std::string aMsg {"Hello"};
    zmq::message_t lMsg {aMsg };


Context
~~~~~~~

You can create a context and after that pass it in socket initialization::

    zmq::context_t iContext;
    
    iSocket = zmq::socket_t{ iContext, zmq::socket_type::stream };

Socket
~~~~~~

`Socket types <http://api.zeromq.org/master:zmq-socket>`_ 
    - ZMQ_CLIENT
    - ZMQ_SERVER
    - ZMQ_RADIO
    - ZMQ_DISH
    - ZMQ_PUB
    - ZMQ_SUB
    - ZMQ_XPUB
    - ZMQ_XSUB
    - ZMQ_PUSH
    - ZMQ_PULL
    - ZMQ_PAIR
    - ZMQ_STREAM ( used to send and receive TCP data from a non ZMQ peer )
    - ZMQ_REQ
    - ZMQ_REP
    - ZMQ_DEALER
    - ZMQ_ROUTER

::

    // Socket init
    iSocket = zmq::socket_t{ iContext, zmq::socket_type::stream };

    // Connection
    iSocket.connect( "tcp://127.0.0.1:4001" );


ZMQ TCP Example
~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <thread>
    #include <chrono>
    #include <zmq.hpp>

    class ZMQConnection
    {
    public:
        zmq::context_t iContext;
        zmq::socket_t iSocket;

        std::string iSocketID;
    

        void InitSocket();
        void Connect();
        void Send( const std::string &aMsg );
        std::string Receive();
        void Disconnect();

    };

    void ZMQConnection::InitSocket()
    {
        iSocket = zmq::socket_t{ iContext, zmq::socket_type::stream };
        iSocket.setsockopt( ZMQ_LINGER, 0 );
        iSocket.setsockopt( ZMQ_IMMEDIATE, 1 ); // do not queue sent messages to incomplete connections
        iSocket.setsockopt( ZMQ_SNDTIMEO, 100 );
        iSocket.setsockopt( ZMQ_RCVTIMEO, 100 );
    }

    void ZMQConnection::Connect()
    {
        iSocket.connect( "tcp://127.0.0.1:4001" );
        // iSocket.connect( "tcp://10.0.0.211:4001" );
        if( Receive().empty() && not iSocketID.empty())
        {
            std::cout << "Successful connected to server\n";
        }else
        {
            std::cout << "Failed to connect to server\n";
        }

    }

    void ZMQConnection::Send( const std::string &aMsg )
    {
        zmq::message_t lIdentity { iSocketID };
        zmq::message_t lMsg {aMsg };

        iSocket.send( lIdentity, zmq::send_flags::sndmore );
        iSocket.send( lMsg, zmq::send_flags::none );
    }

    std::string ZMQConnection::Receive()
    {
        zmq::message_t lMsgBuff;

        auto lResult = iSocket.recv(lMsgBuff, zmq::recv_flags::none); // socket id
        if( not lResult.has_value() ) { std::cout << "Failed to receive socket id\n"; return{}; }
        iSocketID = lMsgBuff.to_string();

        lResult = iSocket.recv(lMsgBuff, zmq::recv_flags::none); //actual message

        return lMsgBuff.to_string();
    }

    void ZMQConnection::Disconnect()
    {
        iContext.close();
    }


    int main()
    {
        std::string lMessage {"Hello"};

        ZMQConnection zmq;

        zmq.InitSocket();
        zmq.Connect();

        while( 1 )
        {
            zmq.Send( lMessage + "\r\n");
            std::cout << "Received message: `" << zmq.Receive() << "`\n";
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }

        zmq.Disconnect();

        return 0;
    }

