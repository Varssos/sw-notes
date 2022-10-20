std::string
===========


Strip terminator from ending
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    const std::string MESSAGE_ENDING{ "\x17\r\n>" };

    std::string StripTerminator( const std::string &aMsg )
    {
        std::string lResult;
        if( aMsg.length() >= MESSAGE_ENDING.length() &&
            std::string_view( aMsg.cend().base() - MESSAGE_ENDING.length(), MESSAGE_ENDING.length() ) == MESSAGE_ENDING )
        {
            lResult = aMsg.substr( 0, aMsg.size() - MESSAGE_ENDING.length() );
        }
        return lResult;
    }

    int main()
    {
        std::string lReceivedMessage { "N, 1097429\x17\r\n>" };

        lReceivedMessage = StripTerminator( lReceivedMessage );

        return 0;
    }

Verify if string contain substr/char
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    bool ContainComma( const std::string &aReceivedMessage )
    {
        if( aReceivedMessage.find(',') != std::string::npos )
        {
            return true;
        }

        return false;
    }