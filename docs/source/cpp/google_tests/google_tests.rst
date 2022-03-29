Google tests
============


Preview
~~~~~~~

`Google C++ tutorial playlist <https://www.youtube.com/watch?v=nbFXI9SDfbk&list=PL_dsdStdDXbo-zApdWB5XiF2aWpsqzV55&index=1>`_ 
Right now there is a good tutorial to learn basics of gtests

Tutorial analysis
~~~~~~~~~~~~~~~~~

.. toctree::
  :maxdepth: 3

  tutorial1/tutorial1
  tutorial2/tutorial2



Install on Linux system
~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: bash

    git clone https://github.com/google/googletest.git
    cd googletest
    mkdir build && cd build
    cmake .. -DBUILD_SHARED_LIBS=ON -DINSTALL_GTEST=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr
    make -j8
    sudo make install
    sudo ldconfig

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

  
