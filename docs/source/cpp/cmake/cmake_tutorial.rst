CMake tutorial
==============

Cmake tutorial for beginers is `here <https://cmake.org/cmake/help/latest/guide/tutorial/index.html>`_ 
and on `youtube <https://www.youtube.com/watch?v=nlKcXPUJGwA&list=PLalVdRk2RC6o5GHu618ARWh0VO0bFlif4&index=1>`_ 


Base project
~~~~~~~~~~~~

PROJ_DIR contain:
- CMakeLists.txt
- source files ( here tutorial.cpp )
- build directory ( here: ./out/build/ ) 

CMakeLists.txt
--------------

.. code-block:: cmake


    cmake_minimum_required(VERSION 3.16.3)

    project(OLAS) # It set ${PROJECT_NAME} variable

    add_executable( ${PROJECT_NAME} tutorial.cpp ) # It makes an binary called ${PROJECT_NAME} and take source files 

tutorial.cpp
------------

.. code-block:: cpp

    #include <iostream>

    int main( int argc, char* argv[]  )
    {
        std::cout << "Hello" << std::endl;

        return 0;
    }

Commands::

    mkdir -p ./out/build
    cmake -S . -B ./out/build # in PROJ_DIR
    cd ./out/build
    make
    ./OLAS

