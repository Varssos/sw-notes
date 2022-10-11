Termios
=======

Termios contains POSIX terminal control definitions

`Termios manual <https://man7.org/linux/man-pages/man3/termios.3.html>`_

`Termios description in polish <https://students.mimuw.edu.pl/SO/LabLinux/STRUKTURY/WEJSCIE-WYJSCIE/termios.html>`_ 


Printing in terminal character after each input character
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <stdio.h>
    #include <ctype.h>
    #include <termios.h>
    #include <unistd.h>


    int main()
    {
        int c;

        termios old_settings, new_settings;
        tcgetattr( STDIN_FILENO, &old_settings );
        new_settings = old_settings;
        new_settings.c_lflag &= ( ~ICANON );
        tcsetattr( STDIN_FILENO, TCSANOW, &new_settings );

        while( (c = getc(stdin)) != EOF )
        {
            if( isalpha(c) )
            {
                putc( '@', stdout );
                continue;
            }
            if( isdigit(c))
            {
                putc( '#', stdout );
                continue;
            }
            putc( '.', stdout );
        }

        return 0;
    }

Turn off echo in termios
~~~~~~~~~~~~~~~~~~~~~~~~

You can replace line from above with::

    new_settings.c_lflag &= ( ~ICANON & ~ECHO );


Example with trying to get password for sudo as it is done in Linux
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <iostream>
    #include <stdio.h>
    #include <ctype.h>
    #include <termios.h>
    #include <unistd.h>

    int main()
    {
        int c;

        termios old_settings, new_settings;
        tcgetattr( STDIN_FILENO, &old_settings );
        new_settings = old_settings;
        new_settings.c_lflag &= ( ~ICANON & ~ECHO );
        tcsetattr( STDIN_FILENO, TCSANOW, &new_settings );

        std::cout << "[sudo] password for user: ";

        std::string lPassword {};

        while( (c = getc(stdin)) != EOF )
        {
            if( c == '\n' )
            {
                break;
            }
            lPassword += c;
            putc( '*', stdout );
        }

        std::cout <<"\nPassword: " << lPassword << '\n';

        return 0;
    }
