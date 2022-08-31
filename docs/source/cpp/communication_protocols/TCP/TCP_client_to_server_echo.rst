TCP client to server echo
=========================

TCP server echo C++
~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    // Server side C/C++ program to demonstrate Socket programming
    #include <iostream>
    #include <netinet/in.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <string>
    #include <sys/socket.h>
    #include <thread>
    #include <unistd.h>

    const uint16_t Port = 4001;

    int main( int argc, char const *argv[] )
    {
        int server_fd, socket_fd, opt = 1;
        struct sockaddr_in address;
        int addrlen = sizeof( address );
        char buffer[ 1024 ] = { 0 };

        // Creating socket file descriptor
        if( ( server_fd = socket( AF_INET, SOCK_STREAM, 0 ) ) == 0 )
        {
            perror( "socket failed" );
            exit( EXIT_FAILURE );
        }

        // Forcefully attaching socket to the port 8080
        if( setsockopt( server_fd, SOL_SOCKET, SO_REUSEADDR | SO_REUSEPORT, &opt, sizeof( opt ) ) )
        {
            perror( "setsockopt" );
            exit( EXIT_FAILURE );
        }
        address.sin_family = AF_INET;
        address.sin_addr.s_addr = INADDR_ANY;
        address.sin_port = htons( Port );

        // Forcefully attaching socket to the port 8080
        if( bind( server_fd, ( struct sockaddr * ) &address, sizeof( address ) ) < 0 )
        {
            perror( "bind failed" );
            exit( EXIT_FAILURE );
        }
        if( listen( server_fd, 3 ) < 0 )
        {
            perror( "listen" );
            exit( EXIT_FAILURE );
        }
        if( ( socket_fd = accept( server_fd, ( struct sockaddr * ) &address, ( socklen_t * ) &addrlen ) ) < 0 )
        {
            perror( "accept" );
            exit( EXIT_FAILURE );
        }

        std::string lResponse = "HERE_RESPONSE_MESSAGE";

        while( 1 )
        {
            memset( buffer, 0, sizeof( buffer ) );
            int lReadRet{};
            lReadRet = read( socket_fd, buffer, 1024 );

            // Read return number of chars, if it return -1 there is a error, if 0 EOF wchich could mean that client has disconnected
            if( lReadRet != 0 )
            {
                std::cout << "Received: " << buffer << std::endl;
                std::cout << "Sending: " << lResponse << std::endl;
                send( socket_fd, lResponse.c_str(), lResponse.length(), 0 );
            }
        }

        return 0;
    }

TCP client echo C++
~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    // Client side C/C++ program to demonstrate Socket programming
    #include <arpa/inet.h>
    #include <iostream>
    #include <string>
    #include <sys/socket.h>
    #include <thread>
    #include <unistd.h>

    const std::string IP = "127.0.0.1";
    // const std::string IP = "192.168.127.254";
    const uint16_t Port = 4001;

    int main( int argc, char const *argv[] )
    {
        int socket_fd = 0;
        
        struct sockaddr_in serv_addr;
        char buffer[ 1024 ] = { 0 };
        if( ( socket_fd = socket( AF_INET, SOCK_STREAM, 0 ) ) < 0 )
        {
            printf( "\n Socket creation error \n" );
            return -1;
        }

        serv_addr.sin_family = AF_INET;
        serv_addr.sin_port = htons( Port );

        // Convert IPv4 and IPv6 addresses from text to binary form
        if( inet_pton( AF_INET, IP.c_str(), &serv_addr.sin_addr ) <= 0 )
        {
            printf( "\nInvalid address/ Address not supported \n" );
            return -1;
        }

        if( connect( socket_fd, ( struct sockaddr * ) &serv_addr, sizeof( serv_addr ) ) < 0 )
        {
            printf( "\nConnection Failed \n" );
            return -1;
        }

        std::string lRequestMessage;

        while( 1 )
        {
            std::cout << "Request: ";
            std::cin >> lRequestMessage;
            send( socket_fd, lRequestMessage.c_str(), lRequestMessage.length(), 0 );

            int lReadRet;
            lReadRet = read( socket_fd, buffer, 1024 );
            if( lReadRet != 0 )
            {
                std::string lResponse = buffer;
                std::cout << "Received: " << lResponse << std::endl;
            }
        }

        return 0;
    }