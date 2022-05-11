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
