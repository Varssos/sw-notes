Build errors
============

Used but never defined
~~~~~~~~~~~~~~~~~~~~~~

``std::string GetStringFromRapidJsonValueWithThrow(const Value&, const string&)’ used but never defined``

Solutions:

1. Remove ``static`` keyword if they are divided into many files. ``You've declared the function to be static. This means that it is only visible within the current compilation unit.``

2. Clean build ``cmake --clean build`` Cmake can be not curious about existing new ``*.cpp`` and ``*.hpp`` files 

Declared multiple times
~~~~~~~~~~~~~~~~~~~~~~~

``E:/Cpp/Makefile_learning/inc/connection/connection.hpp:2:7: error: redefinition of 'class IConnection'``

Solutions:
1. Check out if header files have on the top ``#pragma once``

Undefined reference to ...
~~~~~~~~~~~~~~~~~~~~~~~~~~

Solution:

1. Check all headers order

Undefined reference to ... Due to template functions/classes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

e.g::

    c:/mingw/bin/../lib/gcc/mingw32/9.2.0/../../../../mingw32/bin/ld.exe: E:/Cpp/Makefile_learning/src/main/main.cpp:12: undefined reference to `Manager<Device>::~Manager()'

`Stackoverflow problem description <https://stackoverflow.com/questions/8752837/undefined-reference-to-template-class-constructor>`_ 

Quick solutions:

1. Declare template functions in header files
2. Put at the end of ``*.cpp`` file, explicitly instantiate the template ``template class Manager<Device>;``

**Examples**

1. Manger.hpp::

    template <class T>
    class ModbusManager
    {
    }

Manager.cpp should have accurate declaration on the bottom of file::

    template class ModbusManager<ModbusTCPDevice>;

2. Config.hpp::

    template <class T> 
    std::vector<T> InitializeModbusDevices( const std::string& aEntry );

Config.cpp should have accurate declaration on the bottom of file::

    template std::vector<ModbusTCPDevice> ModbusConfig::InitializeModbusDevices( const std::string& );



Passing ‘const ...’ as ‘...’ argument of ‘...’ discards qualifiers"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
::

    ModbusDeviceRegisters
    {
    public:
        bool operator==( const ModbusDeviceRegisters& rhs)
    }

Invoking::

    ModbusDeviceRegisters lTestModbusDeviceRegister, lExpectedModbusDeviceRegister;
    ASSERT_EQUAL( lTestModbusDeviceRegister, lExpectedModbusDeviceRegister )

Solution:

1. Set returning const ``bool operator==( const ModbusDeviceRegisters& rhs) const``
2. If you have ability to change invoking function and if you want to edit object/variable you can also remove everywhere const modifier
