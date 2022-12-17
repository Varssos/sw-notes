Include Guards
==============

In C++ to avoid multiple declarations class etc with #include "header_file.hpp" are used:

1. Include guards
2. #pragma once


Include guard
~~~~~~~~~~~~~

::

    header.h
    #ifndef HEADER_H_
    #define HEADER_H_
    // declarations
    #endif

    foo.c
    #ifndef HEADER_H_
    #include "header.h"
    #endif

1. `Redundant Include Guards <http://wiki.c2.com/?RedundantIncludeGuards>`_
2. It is always supported

Pragma once
~~~~~~~~~~~

1. Well supported across compilers, but not part of standard
2. The preprocessor may be a little faster with it
3. More simple to understand exact intent, so less prone to make mistakes