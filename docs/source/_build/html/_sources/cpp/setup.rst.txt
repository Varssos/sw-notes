Setup environment
=================


Windows
~~~~~~~

1. `Install gcc/g++ <https://www.youtube.com/watch?v=8CNRX1Bk5sY>`_  
   
   `MinGW installer <https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbXRKOFZUSExuR1Y2dG9hZ2VuS05iMUZjRGVWZ3xBQ3Jtc0ttM2tFeWo0UTQyVlUzZzhoUzVfN0tkVE1nQTREdUdUVmVubzR0cTNydDdDSUhfZG9LRDNLTHhsRk9QWE9lY05pT0JkSEVsWGlQMEg0Q25wdVBSVnJBUjc2TzE5YkFaYlpLdkh2U2pSMXlUZG1DN3IwRQ&q=https%3A%2F%2Fosdn.net%2Fprojects%2Fmingw%2Freleases%2F&v=8CNRX1Bk5sY>`_ 

2. Add c++ extension to VS code
3. Prepare makefile like this

.. code-block:: bash

    CXX = g++

    TARGET = thread

    FLAGS = -g -Wall -std=c++17

    all: $(TARGET).cpp
        $(CXX) $(FLAGS) -o $(TARGET) $(TARGET).cpp

    clean: 
        rm thread.exe
