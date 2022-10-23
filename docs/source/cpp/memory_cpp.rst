Memory in C++
=============

`Gynvael about process memory <https://www.youtube.com/watch?v=MM4hDpzFUcA&t=9223s>`_ 

Old C/C++ memory segments/sections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- code
- globals
- heap
- stack

.. important:: 1. When stack collide with heap. It is stack clash
    2. Each thread has its own stack and it is limited depend on platform ( Linux to nearly 8MB, Windows to 2MB )
    3. ``const`` keyword only indicate that it should/can be put in .rodata section
    4. ``tls`` - thread local storage. In C++ ``thread_local`` keyword for global variable




New C/C++ memory segments/sections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

- .text (code)
- .data ( globals )
- .bss ( globals not initialized )
- .rodata ( read only data, const variables and strings )


.. code-block:: cpp

    #include <iostream>

    int a = 0x12345678; // -> .data
    const unsigned int b = 0xabababab; // -> .rodata

    int main() 
    {   
        puts("hello world!"); // "hello world!" - > .rodata

        return 0;
    }

1. It this case a global array as a result makes binary +64MB::

    int a[16* 1024 * 1024 ] = 0x12345678 // -> .data


2. In this case it doesn't increase binary size like before. E.g 17kB::

    int a[16* 1024 * 1024 ]; // -> .bss

3. In this case it will increase a little bit. e.g 33kB, but not 65MB. This additional +16kB is due to initilized first value of array

.. code-block:: cpp

    #include <cstdio>

    int main()
    {
        static int b[0x1000] = {0x12345678};
    }
