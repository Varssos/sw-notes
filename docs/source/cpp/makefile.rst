Makefile tips, knowledge in a nuthsell
======================================

All knowledge about GNU Makefile `link <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>`_ 

Nice, short tutorial to repeat knowledge about makefiles
`Practical makefiles, by example <http://nuclear.mutantstargoat.com/articles/make/>`_ 

`Cool, more complex makefile example  <https://riptutorial.com/makefile/example/21376/building-from-different-source-folders-to-different-target-folders>`_ 

.. note:: 
    1. typing ``make`` means: build the first rule in the makefile
    2. To write prerequisities, recipes in multiple lines ``\`` on the end of line is used
    3. ``@`` is a built-in make variable containing the target of each rule
    4. ``^`` is another built-in variable containing all the dependencies of each rule
    5. ``<`` is a variable which contains only the first element of the dependencies
    6. ``@`` at the beginning of the recipe it will not print executed command
    7. If ``obj = main.o game.o level.o ...`` then to substitute longer names it is a must to use ``$(obj)``. If we instead tried to use ``$obj`` then make would try to expand a variable named ``o``, and then append the string ``bj`` to the result.
    8. ``PROJDIR := $(realpath $(CURDIR)/..)`` thanks to realpath we get ``E:/Cpp/`` instead of ``E:/Cpp/build/..``
    9. ``DIRS_PATH = $(wildcard $(SOURCEDIR)/*/)`` gets all absolute path of all folders inside ``SOURCEDIR``
    10. ``DIRS  = $(foreach dir,  $(DIRS_PATH), $(shell basename $(dir)) )`` gets basename of folders from path in ``DIRS_PATH``


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

