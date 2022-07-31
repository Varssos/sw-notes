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
    # -S indicate folder with sources
    # -B indicate 
    cd ./out/build
    make
    ./OLAS

Adding a Library
~~~~~~~~~~~~~~~~

For this tutorial we will put the library into a subdirectory called ``Adder``. This directory contains a header file ``adder.hpp``, a source file ``adder.cpp`` which contain ``add`` function and ``CMakeLists.txt`` which should contain::

    add_library(adder adder.cpp)

`add_library <https://cmake.org/cmake/help/latest/command/add_library.html>`_ 

To make use of the new library we will add an ``add_subdirectory()`` call in the top-level ``CMakeLists.txt`` file so that the library will get built. We add the new ibrary to the executable and add ``adder`` 

CMakeLists.txt::

    .. code-block:: cmake
        :caption: A cool

            cmake_minimum_required(VERSION 3.16.3)

            project(OLAS)

            add_subdirectory(Adder)

            add_executable( ${PROJECT_NAME} tutorial.cpp )

            target_link_libraries( ${PROJECT_NAME} adder )

            target_include_directories( ${PROJECT_NAME} PUBLIC 
                                                    "${PROJECT_SOURCE_DIR}/Adder" )
    



.. todo:: 
    1. Clean all not necessary data
    2. Divide into important sections and fill them