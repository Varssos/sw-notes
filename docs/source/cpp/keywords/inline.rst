Inline functions in C++
=======================

`More details about inline functions <https://www.geeksforgeeks.org/inline-functions-cpp/>`_ 

C++ provides inline fuctions to reduce the function call overhead. Inline function is a function that is expanded in line when it is called. When the inline function is called whole code of the inline function gets inserted or substituted at the point of inline function call. This substitution is performed by the C++ compiler at compile time. **Inline function may increase efficiency if it is small.** 

Syntax:
~~~~~~~

.. code-block:: cpp

    inline return-type function-name(parameters)
    {
        // function code
    }



Compiler may not perform inlining in such circumstances like:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. If a function contains a loop (for, while, do-while)
#. If a function contains static variables
#. If a function is recursive
#. If a function return type is other than void, and the return statement doesn't exist in function body
#. If a function contains switch or goto statement

.. warning:: Inlining is only a request to the compiler, not a command. Compiler can ignore the request for inlining

Inline function advantages:
~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Function call overhead doesn't occur.
#. Saves overhead to push/pop variables on the stack when function is called
#. Saves overhead of a return call from a function
#. It is able to specify compiler optimization for such inline functions


Inline functions disadvantages:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. The added variables from the inlined function consumes additional registers
#. If you use too many inline functions then the size of the binary executable file will be large, because of the duplication of code
#. Too much inlining can also reduce your instruction cache hit rate 
#. Inline function may increase compile time overhead 
#. Inline functions may not be useful for many embedded systems, beacuase in embedded systems code size is more important than speed