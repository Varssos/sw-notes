Makefile
========

Nice, short tutorial to repeat knowledge about makefiles
`Practical makefiles, by example <http://nuclear.mutantstargoat.com/articles/make/>`_ 

.. note:: 
    1. typing `make` means: build the first rule in the makefile
    2. `@` is a built-in make variable containing the target of each rule
    3. `^` is another built-in variable containing all the dependencies of each rule
    4. `<` is a variable which contains only the first element of the dependencies
    5. `@` at the beginning of the recipe it will not print executed command
    6. If `obj = main.o game.o level.o ...` then to substitute longer names it is a must to use `$(obj)`. If we instead tried to use `$obj` then make would try to expand a variable named `o`, and then append the string `bj` to the result.
    7. `PROJDIR := $(realpath $(CURDIR)/..)` thanks to realpath we get `E:/Cpp/` instead of `E:/Cpp/build/..`

A simple makefile nosists of rules with the following shape:
::

    target … : prerequisites …
        recipe
        …
        …

    <this file> : <needs these files>
        <and is created by this command>

Imagine that in your project you have a main project folder in it Makefile and 2 folders: `inc` and `src`

Not elegant make
~~~~~~~~~~~~~~~~

.. code-block:: Makefile

    CXX = g++
    TARGET = thread
    FLAGS = -g -Wall -std=c++17
    INCLUDE = inc/


    all: thread.o connection.o device.o
        $(CXX) $(FLAGS) -o $(TARGET) $(TARGET).o connection.o device.o -I $(INCLUDE)

    thread.o: thread.cpp
        $(CXX) -c thread.cpp

    device.o: ./src/device.cpp
        $(CXX) -c ./src/device.cpp -I $(INCLUDE)

    connection.o: ./src/connection.cpp
        $(CXX) -c ./src/connection.cpp -I $(INCLUDE)

    clean: 
        rm thread.exe
        rm *.o

Simpler makefile
~~~~~~~~~~~~~~~~

.. code-block:: Makefile

    CXX = g++
    TARGET = thread
    FLAGS = -g -Wall -std=c++17
    INCLUDE = inc/

    all: thread.o connection.o device.o
        $(CXX) $(FLAGS) -o $(TARGET) $^ -I $(INCLUDE)

    thread.o: thread.cpp
        $(CXX) -c thread.cpp

    device.o: ./src/device.cpp
        $(CXX) -c ./src/device.cpp -I $(INCLUDE)

    connection.o: ./src/connection.cpp
        $(CXX) -c ./src/connection.cpp -I $(INCLUDE)

    clean: 
        rm -rf $(TARGET).exe
        rm -rf *.o

