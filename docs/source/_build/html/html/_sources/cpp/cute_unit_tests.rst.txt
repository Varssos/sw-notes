CUTE
====

Project tree
~~~~~~~~~~~~

::

    ├── src
    ├── inc
    ├── ...
    ├── tests
    |   ├── inc
    |   │   ├── INCLUDES.hpp ─────────────── File in which tests header files are included. Used not to clutter TESTS.hpp
    |   │   ├── template_test_class 
    |   │   │   └── TemplateTestClass.hpp ── Example test class header.
    |   │   └── TESTS.hpp ────────────────── File containing tests.
    |   └── src
    |       ├── template_test_class 
    |       │   └── TemplateTestClass.cpp ── Example test class source file.
    |       └── test.cpp ─────────────────── File containing main test engine.
    └── tests.cmake ──────────── File containing rules of building tests for CMake


test.cpp::

    #include "TESTS.hpp"

    using namespace X::Tests;

    int main(int argc, char const *argv[]) 
    {
        AggregateTests();
        RunTests( argc, argv );
    }

TESTS.hpp::

    #pragma once

    #include "INCLUDES.hpp"

    using namespace X::Tests;

    void AggregateTests()
    {
        AddTests( suite_ModbusConnection(), "ModbusConnection Tests" );

    }

INLCUDES.hpp::

    #pragma once

    #include "modbus_connection/ModbusConnectionTest.hpp"

ModbusConnectionTest.hpp::

    #pragma once

    #include "cute/cute_suite.h"

    namespace X::Tests
    {
        void test_ModbusConnect();

        cute::suite suite_ModbusConnection();
    }

ModbusConnectionTest.cpp::

    #include "modbus_connection/ModbusConnectionTest.hpp"
    #include "modbus_connection/ModbusConnection.hpp"


    #include "cute/cute.h"


    //using namespace ... for developing apps

    namespace X::Tests
    {
        void test_ModbusConnect()
        {
            ASSERT_EQUAL( true, false);
        }

        cute::suite suite_ModbusConnection()
        {
            cute::suite lSuite;
            lSuite.push_back( CUTE( test_ModbusConnect ) );
            

            return lSuite;
        }
    }
    


