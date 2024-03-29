GoogleTests setup
=================

`C++ cmake gtest template project <https://github.com/Varssos/Cpp_CMake_GTest_Template>`_ 


Install CMake on Linux system
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    git clone https://github.com/google/googletest.git
    cd googletest
    mkdir build && cd build
    cmake .. -DBUILD_SHARED_LIBS=ON -DINSTALL_GTEST=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make -j8
    sudo make install
    sudo ldconfig

Install CMake on Windows OS
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Install google test on Windows
It should works as `here <https://www.youtube.com/watch?v=3zUqJEilhnM>`_ 
but on windows even with installed posix mingw packages, there was problem 
with <thread>. It had to be declared as <pthread.h> 

1. First install cmake like it is described here :ref:`Install cmake on Windows` 
2. Go to minGW location e.g. /C/minGW/ 
3. Execute below lines in minGW

::

    git clone https://github.com/google/googletest.git
    cd googletest
    mkdir build && cd build
    cmake -G "MinGW Makefiles" ..
    make -j4
    .... here is problem with threads etc. So I finally gave up and installed wsl2 on windows



Minimum example test code
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cpp

    #include <gtest/gtest.h>

    TEST(test_case, example_test)
    {
        EXPECT_EQ(2, 2);
    }

    int main(int argc, char **argv)
    {
        testing::InitGoogleTest(&argc, argv);
        return RUN_ALL_TESTS();
    }

CMake for minimum test code
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cmake

    cmake_minimum_required(VERSION 3.5)

    project(gtest LANGUAGES CXX)

    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)

    find_package(GTest REQUIRED)
    include_directories(${GTEST_INCLUDE_DIRS})

    set(BUILD_GMOCK ON)

    add_executable(gtest ./src/gtest.cpp)
    target_link_libraries(gtest ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES} gmock pthread)

  


CMake get gtest archive and install
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: cmake

    include(FetchContent)
    FetchContent_Declare(
        googletest
        URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
    )
    # For Windows: Prevent overriding the parent project's compiler/linker settings
    set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
    FetchContent_MakeAvailable(googletest)
