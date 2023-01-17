Santizers
=========

`Address sanitizers wikipedia <https://en.wikipedia.org/wiki/AddressSanitizer>`_ 

`HOWTO: Use Address Sanitizer <https://www.osc.edu/resources/getting_started/howto/howto_use_address_sanitizer>`_ 



Types of sanitizers
~~~~~~~~~~~~~~~~~~~

AddressSanitizer(ASan)
----------------------

https://github.com/google/sanitizers/wiki/AddressSanitizer

It finds:

- Use after free (dangling pointer dereference)
- Heap buffer overflow
- Stack buffer overflow
- Global buffer overflow
- Use after return
- Use after scope
- Initialization order bugs
- Memory leaks

Usage::

    g++ -o cpp_basics cpp_basics.cpp -g -fsanitize=address
    ./cpp_basics


LeakSanitizer
-------------

https://github.com/google/sanitizers/wiki/AddressSanitizerLeakSanitizer

Detects memory leaks

Usage::

    g++ -o cpp_basics cpp_basics.cpp -g -fsanitize=leak        

ThreadSanitizer(TSan)
---------------------

https://github.com/google/sanitizers/wiki/ThreadSanitizerCppManual

Detects data races and deadlocks for C++ and Go

Usage::

    g++ -o cpp_basics cpp_basics.cpp -g -fsanitize=thread  


MemorySanitizer(MSan)
---------------------

https://github.com/google/sanitizers/wiki/MemorySanitizer

Detects use of uninitialized memory

Usage ( did not see in gcc)::

    clang -fsanitize=memory -fPIE -pie -fno-omit-frame-pointer -g -O2 umr.cc


HWASAN - Hardware-assisted AddressSanitizer
-------------------------------------------

Usage ( did not see in gcc)::

    g++ -o cpp_basics cpp_basics.cpp -g -fsanitize=hwaddress


UndefinedBehaviourSanitizer(UBSan)
----------------------------------

Usage ( did not see in gcc)::

    g++ -o cpp_basics cpp_basics.cpp -g -fsanitize=undefined


Linux Kernel Sanitizers
-----------------------

https://github.com/google/kernel-sanitizers

- Kernel Address Sanitizer (KASAN)
- Kernel Concurrency Sanitizer (KCSAN)
- Kernel Electric-Fence  (KFENCE)
- Kernel Memory Sanitizer (KMSAN)
- Kernel Thread Sanitizer (KTSAN)